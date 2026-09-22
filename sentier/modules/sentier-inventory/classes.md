---
title: sentier-inventory schema contracts and validator
type: module-page
summary: "The public surface of a data-only repository: three table contracts, one metadata schema, one validation script."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-inventory-repo]
---

# sentier-inventory schema contracts and validator

There is no Python package here, so there are no classes to document. What a consumer
depends on is the shape of the tables and the guarantees the validator enforces. Read
from the repository at commit `6fced18`. (source: sentier-inventory-repo)

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
| `technology` | string | no | free text |
| `valid_from` | date | no | date from which the record is valid |
| `comment` | string | no | free text |

## The exchange table

`exchanges.parquet`, one row per exchange, joined to the process table on `process_id`.

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

## The sector metadata

`metadata.json` is validated against `schema/metadata.schema.json`. It requires
`sector`, `title`, `rank` and `schema_version`, and in practice also carries
`description`, which holds the provenance line, and `row_counts`, one integer per
parquet file. Additional properties are allowed.

## What the validator guarantees

`scripts/validate.py` walks every `data/<NN>-<sector>/` folder and fails the build on
any of the following:

| Check | What it means for a consumer |
|---|---|
| metadata validates against its JSON Schema | every folder has a sector id, a title, a rank and a schema version |
| declared `row_counts` match the parquet | the counts in metadata can be trusted without opening the file |
| no unknown columns | a reader can rely on the contract being the whole column list |
| required columns present and non-null | the required columns never need a null check |
| column types match the contract | an all-null optional column passes whatever its physical type, so type-check an optional column yourself |
| enumeration columns hold only allowed values | direction, flow type and process type are safe to switch on |
| `process_id` unique per folder | the primary key is a key, within one folder |
| every exchange `process_id` resolves in the same folder | no dangling exchanges, and no cross-folder joins are needed |

The validator exits non-zero and lists every violation it found rather than stopping at
the first one.

## Notes

- Uniqueness and referential integrity are checked **per folder**, not across the
  repository. Nothing in the contract promises that a process identifier is unique
  across sectors, although the rank rule implies a conflict resolves in favour of the
  lower-numbered folder.
- Optional columns may be absent from the file entirely. Read defensively.
- The contract is plain YAML on purpose. LinkML is used only in
  [../sentier-vocab/](../sentier-vocab/); the data-layer repositories describe columns
  directly.
