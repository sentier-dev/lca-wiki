---
title: bw2analyzer datasets
type: module-page
summary: bw2analyzer ships no data; it reads a solved calculation and the active project.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2analyzer, bw2analyzer-docs]
related: [README.md, ../bw2calc/datasets.md]
---

# bw2analyzer datasets

## Nothing is shipped

`bw2analyzer` 0.11.8 contains twelve Python modules and nothing else: no data directory,
no bundled classification tables. Walked on disk on 2026-09-21.

## What it reads

### A solved LCA object

- **Provenance:** produced by `bw2calc`; `lci()` and, for anything involving a score,
  `lcia()` must have been called first.
- **Schema:** the sparse result matrices and the `dicts` index mappings of the
  calculation object. See [../bw2calc/datasets.md](../bw2calc/datasets.md).

### The active project

- **Provenance:** `bw2data`. The annotated outputs look node names up in the project, so
  the project that produced the calculation must still be the current one.
- **Schema:** nodes, edges and their fields, including whatever tag field you pass to
  `traverse_tagged_databases` and the classifications
  `compare_activities_by_grouped_leaves` groups by.
- **Vocabulary:** the product classification of the imported database, for example the
  CPC codes an ecoinvent import carries. That vocabulary belongs to the source database,
  not to this package.

### What it writes

Nothing, unless you ask: the print functions take a `file_obj`, and
`SerializedLCAReport` in `report.py` can save a summary. Everything else returns arrays,
lists or dataframes.
