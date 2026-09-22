---
title: sentier-inventory
type: module
summary: "The platform's life cycle inventory: processes and exchanges as parquet, one folder per sector, with a schema contract and a CI validator."
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-inventory-repo]
related: [../../../bafu/README.md, ../sentier-mappings/README.md, ../../roadmap.md]
---

# sentier-inventory

sentier-inventory is a data repository, not a package. It holds standardised life cycle
inventory: one row per process and one row per exchange, stored as parquet, organised
into numbered sector folders. There is no Python package and no loader; the only code in
the repository is the validator that continuous integration runs on every pull request.
Data arrives as pull requests from the importers, is read by the loader that installs it
into an LCA tool, and its cross-source flow identifiers are resolved through the mapping
repository. (source: sentier-inventory-repo)

**Version documented:** schema version `0.1.0`, as declared in every sector's
`metadata.json` · **obtained from:** a clone of
`github.com/sentier-dev/sentier-inventory` at commit `6fced18`, dated 2026-09-17 ·
**as of:** 2026-09-21.

## Install

Nothing to install. Clone the repository and read the parquet directly:

```bash
git clone https://github.com/sentier-dev/sentier-inventory.git
```

```bash
uv run --with pandas,pyarrow python -c "import pandas as pd; print(pd.read_parquet('data/01-agriculture/processes.parquet'))"
```

To install the same data into a Brightway project instead of reading it by hand, use
[../sentier-brightway/](../sentier-brightway/), which fetches this repository at a
pinned commit. (source: sentier-inventory-repo)

## What it does

1. **Carries the inventory, organised by sector.** Eleven folders, ranked by a numeric
   prefix that also sets resolution precedence. See [datasets.md](datasets.md).
2. **Contracts the columns.** Plain YAML per parquet table, plus a JSON Schema for the
   per-sector metadata file. See [classes.md](classes.md).
3. **Validates on every pull request.** One self-contained script checks columns, types,
   enumerations, declared row counts, primary key uniqueness and the exchange to process
   foreign key. See [commands.md](commands.md).

## Datasets

The repository ships one dataset today: the Swiss federal life cycle inventory database
as the platform harmonises it, spread across eleven sector folders. Broad descriptors
only; the detail is in [datasets.md](datasets.md).

| What | Shape | Scale |
|---|---|---|
| Processes | `data/<NN>-<sector>/processes.parquet`, one row per process | 11,947 rows in total |
| Exchanges | `data/<NN>-<sector>/exchanges.parquet`, one row per technosphere or biosphere edge | about 420,000 rows in total |
| Sector metadata | `data/<NN>-<sector>/metadata.json` | sector id, title, rank, schema version, row counts and the provenance line |
| Schema contract | `schema/*.yaml` and `schema/metadata.schema.json` | four files |

Provenance: every sector's metadata names the same source, the life cycle inventory
database of the Swiss federal administration, BAFU:2026. The database itself is
documented on its own branch, [../../../bafu/](../../../bafu/); this repository
documents only what the platform does with it. Licence: MIT for the repository, with the
citation requirement of the source database carried in the sector metadata.
(source: sentier-inventory-repo)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): the schema contracts and the validator, since there is no package
- [commands.md](commands.md): every runnable entry point
- [datasets.md](datasets.md): the data this repository ships
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

`api/` is absent: there is no package to document.
