---
title: bw2parameters datasets
type: module-page
summary: bw2parameters ships no data; the parameters live in the project that uses it.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2parameters, bw2parameters-docs]
related: [README.md, ../bw2data/datasets.md]
---

# bw2parameters datasets

## Nothing is shipped

`bw2parameters` 1.1.0 contains seven Python modules and nothing else: no data directory,
no unit tables of its own, no network access. Walked on disk on 2026-09-21. The unit
handling comes from `pint`, which brings its own registry
(source: pypi-bw2parameters).

## What it reads

### Parameter dictionaries

- **Provenance:** your own model. In a Brightway project they are rows in the project
  database, written by `bd.parameters`; standalone they are whatever dictionary you pass.
- **Schema:** name to dictionary, each holding `amount` or `formula`, optionally a `unit`
  and optionally `stats_arrays` uncertainty fields.
- **Vocabulary:** the parameter names are yours, restricted to what the interpreter treats
  as a valid symbol.
- **Source branch:** none. Parameters describe your model, not a published database; see
  [../bw2data/datasets.md](../bw2data/datasets.md) for where they are stored.

### What it writes

Nothing to disk. `evaluate()` returns a dictionary;
`evaluate_and_set_amount_field()` mutates the parameter dictionaries you gave it. Writing
results into a project is `bw2data`'s job.
