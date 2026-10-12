---
title: sentier-inventory
type: module
summary: "The platform's life cycle inventory: processes and exchanges as parquet, one folder per source release with the sector as a column, a schema contract and a CI validator."
audience: [P1, P2]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
related: [../../../bafu/README.md, ../sentier-mappings/README.md, ../../roadmap.md]
---

# sentier-inventory

sentier-inventory is a data repository, not a package. It holds standardised life cycle
inventory: one row per process and one row per exchange, stored as parquet, organised
into one folder per published release of one datasource, with the sector of every
process held as a column. There is no Python package and no loader; the only code in
the repository is the validator that continuous integration runs on every pull request.
Data arrives as pull requests from the importers, is read by the loader that installs it
into an LCA tool, and its cross-source flow identifiers are resolved through the mapping
repository. (source: sentier-inventory-repo)

**Version documented:** schema version `0.3.0`, as declared in the source folder's
`metadata.json` · **obtained from:** a clone of
`github.com/sentier-dev/sentier-inventory` at commit `cf54f55`, dated 2026-10-12, the
head of branch `feat/source-folders` proposed as pull request #5 and not yet merged ·
**as of:** 2026-10-12. (source: sentier-inventory-pr-5)

## Install

Nothing to install. Clone the repository and read the parquet directly:

```bash
git clone https://github.com/sentier-dev/sentier-inventory.git
```

```bash
uv run --with pandas,pyarrow python -c "import pandas as pd; print(pd.read_parquet('data/bafu-2026-v1/processes.parquet'))"
```

To install the same data into a Brightway project instead of reading it by hand, use
[../sentier-brightway/](../sentier-brightway/), which fetches this repository at a
pinned commit. (source: sentier-inventory-repo)

## What it does

1. **Carries the inventory, organised by source.** One folder per published release of
   one datasource, `data/<source>-<source_version>/`, today only `data/bafu-2026-v1/`.
   Every process row carries `source`, `source_version` and `sector`, so a consumer picks
   a folder by its metadata and filters rows by sector. There is no rank and no
   precedence between folders. See [datasets.md](datasets.md).
2. **Contracts the columns.** Plain YAML per parquet table, plus a JSON Schema for the
   per-source metadata file. See [classes.md](classes.md).
3. **Validates on every pull request.** One self-contained script checks columns, types,
   enumerations, declared row counts, primary key uniqueness, the exchange to process
   foreign key, one source and one version per folder equal to the metadata and to the
   folder name, and the declared sectors against the column. See
   [commands.md](commands.md).

## Datasets

The repository ships one dataset today: the Swiss federal life cycle inventory database
as the platform harmonises it, in one source folder. Broad descriptors only; the detail
is in [datasets.md](datasets.md).

| What | Shape | Scale |
|---|---|---|
| Processes | `data/<source>-<source_version>/processes.parquet`, one row per process, its sector in a column | 11,947 rows |
| Exchanges | `data/<source>-<source_version>/exchanges.parquet`, one row per technosphere or biosphere edge | 420,063 rows |
| Source metadata | `data/<source>-<source_version>/metadata.json` | source, source version, title, publisher, licence, citation, schema version, sectors present, row counts |
| Schema contract | `schema/*.yaml` and `schema/metadata.schema.json` | four files |

Provenance: the one folder's metadata names its source, the life cycle inventory
database of the Swiss federal administration, BAFU:2026, release v1. The database itself
is documented on its own branch, [../../../bafu/](../../../bafu/); this repository
documents only what the platform does with it. Licence: MIT for the repository, with the
publisher's terms of use and the citation requirement of the source database carried in
the source metadata. (source: sentier-inventory-pr-5)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): the schema contracts and the validator, since there is no package
- [commands.md](commands.md): every runnable entry point
- [datasets.md](datasets.md): the data this repository ships
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

`api/` is absent: there is no package to document.
