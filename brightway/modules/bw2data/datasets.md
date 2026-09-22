---
title: bw2data datasets
type: module-page
summary: What bw2data writes to disk, and why it ships no data of its own.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2data, brightway-glossary, brightway-faq-data, brightway-cheatsheet]
related: [README.md, ../bw2io/datasets.md]
---

# bw2data datasets

## Nothing is shipped

`bw2data` 4.7 contains code only. Walking the installed package on 2026-09-21 found no
data directory, no elementary flow list and no impact assessment method: the only
non-code files are packaging metadata. A fresh install therefore gives you an empty data
directory (source: pypi-bw2data).

The starter data comes from elsewhere:

- elementary flows and impact categories arrive with a project archive installed by
  `bw2io`, or with a database import (source: brightway-cheatsheet); see
  [../bw2io/datasets.md](../bw2io/datasets.md);
- inventory data arrives from the database branch it came from:
  [../../../ecoinvent/](../../../ecoinvent/), [../../../bafu/](../../../bafu/),
  [../../../sentier/](../../../sentier/).

## What it writes

### The project directory

- **Version:** the layout of bw2data 4.x; each project carries a `25` flag once migrated.
- **Provenance:** created by `bw2data` itself the first time a project is used.
- **Schema:** a SQLite file holding the node, edge and parameter tables; JSON files for
  the registries (`databases.json`, `methods.json` and friends); a `processed` directory
  of datapackages; a logs directory. The location is platform-specific and reported by
  `bd.projects.dir` (source: brightway-faq-data).
- **Vocabulary:** the node and edge type strings in `bd.labels`, which decide what counts
  as a production, technosphere or biosphere edge.

### Datapackages

- **Version:** the `bw_processing` format of the installed version; 4.7 requires
  `bw_processing >= 0.9.5` (source: pypi-bw2data).
- **Provenance:** written by `.process()` on any database, impact category, normalisation
  or weighting, from the rows currently in SQLite.
- **Schema:** numpy arrays with `row` and `col` index fields plus a metadata file, as
  described in [../bw_processing/](../bw_processing/).
- **Methods:** none of its own; the factors it writes are the ones you imported.

### The search index

- **Provenance:** built by `bw2data` from the nodes of a database when the database is
  made searchable.
- **Schema:** a full-text index under the project directory, queried by `db.search(...)`.

## What this means for licensing

Because `bw2data` ships nothing, a project directory contains exactly the data you put in
it, under the licence that data came with. A project holding a licensed database must be
treated as licensed data: see [../../../ecoinvent/](../../../ecoinvent/) for what may and
may not be shared.
