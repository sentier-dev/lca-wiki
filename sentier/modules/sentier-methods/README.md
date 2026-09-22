---
title: sentier-methods
type: module
summary: "The impact assessment side of the platform: method tables and characterisation factors as parquet, one folder per datasource."
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-methods-repo]
related: [../sentier-inventory/README.md, ../sentier-mappings/README.md, ../../roadmap.md]
---

# sentier-methods

sentier-methods is a data repository. It holds life cycle impact assessment methods as
two joined parquet tables per datasource: one row per method and impact category, and
one row per characterisation factor keyed by elementary flow. Optional normalisation and
weighting sets use the same key. There is no package, no fetching and no calculation
code; the only code is the validator that continuous integration runs. Data arrives as
pull requests from the importers, and the flows the factors are keyed by are linked to
inventory flows through the mapping repository. (source: sentier-methods-repo)

**Version documented:** schema version `0.1.0`, as declared in each datasource's
`metadata.json` · **obtained from:** a clone of
`github.com/sentier-dev/sentier-methods` at commit `8d0f504`, dated 2026-09-17 ·
**as of:** 2026-09-21.

## Install

Nothing to install. Clone the repository and read the parquet directly:

```bash
git clone https://github.com/sentier-dev/sentier-methods.git
```

```bash
uv run --with pyarrow python -c "import pyarrow.parquet as pq; print(pq.read_table('data/01-ef-3.1/methods.parquet').num_rows)"
```

To register the same methods in a Brightway project, use
[../sentier-brightway/](../sentier-brightway/), which fetches this repository at a
pinned commit. (source: sentier-methods-repo)

## What it does

1. **Carries the methods, organised by datasource.** One numbered folder per method
   package, the number setting resolution precedence. See [datasets.md](datasets.md).
2. **Contracts the columns.** Plain YAML per parquet table plus a JSON Schema for the
   datasource metadata, which the importers read before delivering. See
   [classes.md](classes.md).
3. **Validates on every pull request.** Metadata, required columns, dtypes, primary key
   uniqueness and foreign key integrity. See [commands.md](commands.md).

## Datasets

Three datasources are declared. One is populated; two are scaffolds that carry metadata
and no factors yet. Broad descriptors only, and no factor values anywhere on these
pages.

| Rank | Datasource | Publisher | State |
|---|---|---|---|
| 01 | Environmental Footprint 3.1 | European Commission | 25 impact categories, 319,393 characterisation factors |
| 02 | IPCC 2021 | IPCC | scaffold: metadata only |
| 03 | ReCiPe 2016 | RIVM | scaffold: metadata only |

Method identifiers are `<datasource>:<impact_category>`, for example
`ef-3.1:climate-change`. Licence: MIT for the repository; each datasource's metadata
records the licence its publisher states, and the EF 3.1 folder points at the European
Commission's legal notice. The detail is in [datasets.md](datasets.md).
(source: sentier-methods-repo)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): the schema contracts and the validator, since there is no package
- [commands.md](commands.md): every runnable entry point
- [datasets.md](datasets.md): the methods this repository ships
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

`api/` is absent: there is no package to document.
