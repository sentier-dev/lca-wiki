---
title: sentier-methods schema contracts and validator
type: module-page
summary: "The public surface of a data-only repository: the method table, the factor table, the optional normalisation table and what the validator guarantees."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-methods-repo]
---

# sentier-methods schema contracts and validator

No Python package, so no classes. What a consumer depends on is the shape of the three
tables and the guarantees the validator enforces. Read from the repository at commit
`8d0f504`. (source: sentier-methods-repo)

## The method table

`methods.parquet`, one row per method and impact category, primary key `method_id`. The
identifier is `<datasource>:<impact_category>`, for example `ef-3.1:climate-change`.

| Column | Type | Required | What it holds |
|---|---|---|---|
| `method_id` | string | yes | the primary key, `<datasource>:<impact_category>` |
| `method_name` | string | yes | the method as its publisher names it |
| `impact_category` | string | yes | the impact category |
| `indicator` | string | no | the indicator within the category |
| `unit` | string | yes | the reference unit of the category |
| `methodology` | string | no | the framework or family the method belongs to |
| `source` | string | no | a citation or URL |
| `valid_from` | date | no | date from which the method is valid |
| `datasource` | string | yes | lower-kebab datasource identifier, without the rank prefix |

## The characterisation factor table

`characterization-factors.parquet`, one row per factor, joined to the method table on
`method_id`.

| Column | Type | Required | What it holds |
|---|---|---|---|
| `method_id` | string | yes | foreign key to the method table |
| `impact_category` | string | yes | denormalised, so a factor can be joined straight to flows |
| `flow` | string | yes | the elementary flow the factor applies to |
| `flow_name` | string | yes | human-readable flow name |
| `flow_context` | string | no | compartment and sub-compartment |
| `factor_value` | double | yes | the factor itself |
| `unit` | string | yes | the unit of the factor |
| `location` | string | no | set on a regionalised factor, null otherwise |

## The normalisation and weighting table

`normalization-weighting.parquet` is optional. It carries `method_id`,
`impact_category`, and the nullable `normalization` and `weighting` doubles, one row per
impact category.

## The datasource metadata

`metadata.json` is validated against `schema/metadata.schema.json` and carries the
datasource identifier, the title, the publisher, the version, a licence string, the date
retrieved, a source URL, the rank, the schema version and the row counts. A scaffold
folder with metadata alone and no parquet is valid, which is how a new datasource is
opened.

## What the validator guarantees

`scripts/validate.py` walks every `data/<NN>-<datasource>/` folder and checks:

| Check | What it means for a consumer |
|---|---|
| metadata validates against its JSON Schema | every folder declares its provenance and rank |
| required columns present | the required columns never need an existence check |
| dtypes compatible with the contract, leniently | a date may be a real date or an ISO string |
| primary key uniqueness | `method_id` is a key in `methods.parquet` |
| foreign key integrity | every factor's `method_id` exists in the method table |
| empty scaffolds validate | a metadata-only folder is a declared intention, not an error |

The script exits non-zero if any datasource has errors, listing them per folder.

## Notes

- The contract is plain YAML. LinkML is used only in
  [../sentier-vocab/](../sentier-vocab/).
- The validator does not check that every declared row count matches the file, and it
  does not check the normalisation table against the set of impact categories. Treat the
  counts in metadata as documentation rather than as a validated invariant.
- Nothing here characterises anything. Turning factors plus an inventory into a score is
  the job of the loader in [../sentier-brightway/](../sentier-brightway/) or of a tool
  the practitioner already uses.
