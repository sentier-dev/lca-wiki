---
title: sentier-inventory layout
type: module-page
summary: "The repository tree: one source folder, four schema files, one validator."
audience: [P2, P3]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
---

# sentier-inventory layout

The whole repository, as of commit `cf54f55` dated 2026-10-12, the head of pull request
#5 (branch `feat/source-folders`, not yet merged). It is small: the data is the
repository. (source: sentier-inventory-pr-5)

```
data/                         the inventory, one folder per published release of one datasource
  README.md                   the folder convention, the source id convention, why sources and not sectors
  bafu-2026-v1/               BAFU:2026 v1, the only source folder today
schema/                       the data contract the importers validate against
  README.md                   how the plain-YAML column definitions work
  common.yaml                 shared enumerations: flow direction, flow type, process type, sector
  process.yaml                the columns of processes.parquet, primary key process_id
  exchange.yaml               the columns of exchanges.parquet, joined on process_id
  metadata.schema.json        JSON Schema for a source folder's metadata.json
scripts/validate.py           the CI validator, self-contained, no repository imports
.github/workflows/ci.yml      runs the validator on every pull request and branch push
LICENSE                       MIT
README.md                     what the repository is, how to read and validate it
```

Every source folder has exactly the same three files:

```
data/<source>-<source_version>/
  processes.parquet           one row per process, its sector in the sector column
  exchanges.parquet           one row per exchange, technosphere and biosphere
  metadata.json               source, source_version, title, publisher, license, citation,
                              source_url, provenance, retrieved, schema_version, sectors, row_counts
```

## Key files

- `schema/process.yaml` and `schema/exchange.yaml` are the contract. They are read by
  the validator here and by the importers before they open a delivery pull request, so
  a column added on one side without the other fails.
- `schema/common.yaml` holds the four enumerations, `sector` among them. A value outside
  them fails validation, which is how a mis-typed direction, flow type or sector is
  caught. Adding a sector is a schema pull request, as for the other enumerations.
- `data/<source>-<source_version>/metadata.json` is the only place the publisher, the
  licence terms, the required citation, the declared row counts and the list of sectors
  present live. The validator pins it to the parquet: one `source` and one
  `source_version` per folder, equal to the metadata and to the folder name, and the
  distinct `sector` values equal to `sectors`.
- `scripts/validate.py` imports nothing from the repository and depends only on
  jsonschema, pyyaml and pyarrow, so it can be run from a bare checkout.

## Naming

The folder name is `<source>-<source_version>`. `<source>` is the lower-kebab
datasource id `<publisher>-<edition>` (`bafu-2026`), the same slug as the vocabulary's
Source IRI and the mapping repository's pair-folder prefix; `<source_version>` is the
publisher's release (`v1`), never part of the id, so a re-release does not rename the
database a consumer's project depends on. A folder holds exactly one source and one
version. A delivery from the importers replaces the folder whole, sources never share a
file, and nothing is ever merged. A re-release is a new folder, and the pull request that
adds it removes the old one unless both are meant to be served. There is no rank prefix
and no precedence between folders: a consumer picks a source explicitly. A background
database that exists only as a link target, such as ecoinvent, is not a source here and
gets no folder; it is resolved through [../sentier-mappings/](../sentier-mappings/).
(source: sentier-inventory-pr-5)

Until 2026-10-12 the same rows lived in eleven sector folders, `data/<NN>-<sector>/`,
ranked by a numeric prefix. That layout was dropped because sector parquet from several
sources did not stack: a delivery copied its sector file over the existing one, so the
first delivery of a second source into an existing sector folder would have erased the
rows already there. The sector moved into a column of the process table, and the older
"by sector, not by source" rule now applies to the vocabulary repository only.
(source: sentier-inventory-pr-5)
