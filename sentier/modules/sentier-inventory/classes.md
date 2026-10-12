---
title: sentier-inventory schema contracts and validator
type: module-page
summary: "The public surface of a data-only repository: two table contracts, one metadata schema, one validation script."
audience: [P1, P3]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
---

# sentier-inventory schema contracts and validator

There is no Python package here, so there are no classes to document. What a consumer
depends on is the shape of the tables and the guarantees the validator enforces. Read
from the repository at commit `cf54f55`, schema version `0.3.0`, the head of pull
request #5 (not yet merged). (source: sentier-inventory-pr-5)

## The process table

`processes.parquet`, one row per process, primary key `process_id`. The reference flow
is described inline on the process row; the exchanges live in the other table.

| Column | Type | Required | What it holds |
|---|---|---|---|
| `process_id` | string | yes | stable inventory identifier, unique within the folder |
| `name` | string | yes | process name |
| `reference_product` | string | yes | the product produced; the technosphere match key, so link by reference product rather than by process name |
| `reference_unit` | string | yes | unit of the reference flow |
| `reference_amount` | double | yes | amount of the reference flow, usually one |
| `location` | string | yes | geography code |
| `process_type` | enumeration | yes | `unit`, `system` or `lci_result` |
| `sector` | enumeration | yes | the sector the process belongs to, one of the eleven values in `schema/common.yaml`; replaces the former folder level |
| `source` | string | yes | datasource id, lower-kebab `<publisher>-<edition>` such as `bafu-2026`; one value per folder, equal to the metadata |
| `source_version` | string | yes | the publisher's release of that datasource, such as `v1`; one value per folder, equal to the metadata |
| `technology` | string | no | free text |
| `valid_from` | date | no | date from which the record is valid |
| `comment` | string | no | free text |

The `sector` enumeration holds `agriculture`, `electricity`, `chemicals`, `transport`,
`energy`, `waste`, `construction`, `materials`, `electronics`, `building-services` and
`obsolete`. The map from a publisher's own categories onto these values lives with the
importers, not here. (source: sentier-inventory-pr-5)

## The exchange table

`exchanges.parquet`, one row per exchange, joined to the process table on `process_id`.
Provenance is on the parent process row, not repeated here.

| Column | Type | Required | What it holds |
|---|---|---|---|
| `process_id` | string | yes | foreign key to the process table |
| `flow` | string | yes | flow identifier: a product code for a technosphere edge, an elementary-flow identifier for a biosphere edge |
| `flow_name` | string | yes | human-readable flow name |
| `flow_type` | enumeration | yes | `production`, `technosphere` or `biosphere` |
| `direction` | enumeration | yes | `input` or `output` |
| `amount` | double | yes | the quantified amount |
| `unit` | string | yes | unit of the amount |
| `location` | string | no | exchange-level geography, for technosphere links |
| `uncertainty_type` | int | no | Brightway uncertainty distribution code, nullable |
| `loc`, `scale`, `minimum`, `maximum` | double | no | uncertainty parameters, nullable |

## The source metadata

`metadata.json` describes one source folder and is validated against
`schema/metadata.schema.json`. It requires `source`, `source_version`, `title`,
`publisher`, `license`, `citation`, `schema_version`, `sectors` and `row_counts`, and
may carry `source_url`, `provenance` (the vocabulary's Source IRI of the datasource)
and `retrieved`. `license` is the licence name, URL or terms-of-use summary as the
publisher states it; `citation` is the sentence the publisher requires; `sectors` is the
sorted list of distinct `sector` values present; `row_counts` holds one integer per
parquet file. Additional properties are allowed. The former `sector`, `rank`,
`sources` and `description` keys are gone. (source: sentier-inventory-pr-5)

## What the validator guarantees

`scripts/validate.py` walks every `data/<source>-<source_version>/` folder that holds a
`metadata.json` and fails the build on any of the following:

| Check | What it means for a consumer |
|---|---|
| metadata validates against its JSON Schema | every folder names its source, version, publisher, licence and citation |
| declared `row_counts` match the parquet | the counts in metadata can be trusted without opening the file |
| no unknown columns | a reader can rely on the contract being the whole column list |
| required columns present and non-null | the required columns never need a null check |
| column types match the contract | an all-null optional column passes whatever its physical type, so type-check an optional column yourself |
| enumeration columns hold only allowed values | direction, flow type, process type and sector are safe to switch on |
| `process_id` unique per folder | the primary key is a key, within one folder |
| every exchange `process_id` resolves in the same folder | no dangling exchanges, and no cross-folder joins are needed |
| one `source` and one `source_version` per folder, equal to the metadata, and the folder named `<source>-<source_version>` | a folder is one release of one source, and the folder name, the metadata and every row agree |
| distinct `sector` values equal `sectors`, in both directions | a consumer can pick a folder by its metadata alone and know which sectors it will find |

The validator exits non-zero and lists every violation it found rather than stopping at
the first one.

## Notes

- Uniqueness and referential integrity are checked **per folder**, not across the
  repository. Since every folder holds exactly one source and sources never share a
  file, nothing in the contract needs to say what happens when two folders overlap: a
  consumer reads one folder, and links across sources go through
  [../sentier-mappings/](../sentier-mappings/).
- `source` is redundant with the folder name on purpose: a parquet file read outside the
  repository still knows where it came from, and the loader in
  [../sentier-brightway/](../sentier-brightway/) filters on it as a consistency guard.
- Optional columns may be absent from the file entirely. Read defensively.
- The contract is plain YAML on purpose. LinkML is used only in
  [../sentier-vocab/](../sentier-vocab/); the data-layer repositories describe columns
  directly.
