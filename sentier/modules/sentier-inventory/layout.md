---
title: sentier-inventory layout
type: module-page
summary: "The repository tree: eleven sector folders, four schema files, one validator."
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-inventory-repo]
---

# sentier-inventory layout

The whole repository, as of commit `6fced18` dated 2026-09-17. It is small: the data is
the repository. (source: sentier-inventory-repo)

```
data/                         the inventory, one folder per sector
  README.md                   the folder convention and why sectors, not sources
  01-agriculture/             rank 1, highest resolution precedence
  02-electricity/
  03-chemicals/
  04-transport/
  05-energy/
  06-waste/
  07-construction/
  08-materials/
  09-electronics/
  10-building-services/
  99-obsolete/                legacy link targets kept so older references resolve
schema/                       the data contract the importers validate against
  README.md                   how the plain-YAML column definitions work
  common.yaml                 shared enumerations: flow direction, flow type, process type
  process.yaml                the columns of processes.parquet, primary key process_id
  exchange.yaml               the columns of exchanges.parquet, joined on process_id
  metadata.schema.json        JSON Schema for a sector's metadata.json
scripts/validate.py           the CI validator, self-contained, no repository imports
.github/workflows/ci.yml      runs the validator on every pull request and branch push
LICENSE                       MIT
README.md                     what the repository is, how to read and validate it
```

Every sector folder has exactly the same three files:

```
data/<NN>-<sector>/
  processes.parquet           one row per process
  exchanges.parquet           one row per exchange, technosphere and biosphere
  metadata.json               sector, title, rank, schema_version, row_counts, provenance
```

## Key files

- `schema/process.yaml` and `schema/exchange.yaml` are the contract. They are read by
  the validator here and by the importers before they open a delivery pull request, so
  a column added on one side without the other fails.
- `schema/common.yaml` holds the three enumerations. A value outside them fails
  validation, which is how a mis-typed direction or flow type is caught.
- `data/<NN>-<sector>/metadata.json` is the only place the numeric rank, the declared
  row counts and the source citation live.
- `scripts/validate.py` imports nothing from the repository and depends only on
  jsonschema, pyyaml and pyarrow, so it can be run from a bare checkout.

## Naming

The folder name is `<NN>-<sector>`, with `<sector>` a lower-kebab identifier and `<NN>`
the rank. The rank orders the folders and decides precedence when records overlap: lower
wins. The rank prefix is not part of the sector id stored inside the data. A background
database that exists only as a link target, such as ecoinvent, is not a sector and gets
no folder; it is resolved through [../sentier-mappings/](../sentier-mappings/).
