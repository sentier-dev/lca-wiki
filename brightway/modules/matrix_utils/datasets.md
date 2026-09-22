---
title: matrix_utils datasets
type: module-page
summary: matrix_utils ships no data; it reads datapackages handed to it.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-matrix-utils, matrix-utils-docs]
related: [README.md, ../bw_processing/datasets.md]
---

# matrix_utils datasets

## Nothing is shipped

`matrix_utils` 0.9 contains code only: eight modules, no data directory, no network
access. Walked on disk on 2026-09-21.

## What it reads

### Datapackages

- **Version:** the `bw_processing` format; 0.9 requires `bw_processing >= 1.6`
  (source: pypi-matrix-utils).
- **Provenance:** written by `bw2data` when a database or impact category is processed, or
  built directly with `bw_processing`.
- **Schema:** resource groups, each with a data vector or array, an indices array, and
  optionally flip, rescale, uncertainty and parameter arrays. See
  [../bw_processing/datasets.md](../bw_processing/datasets.md).
- **Constraint:** the packages must already be instantiated. `MappedMatrix` does not
  accept file paths or filesystem objects (source: matrix-utils-docs).

### What it writes

Nothing to disk. The result is a scipy sparse matrix in memory, rebuilt in place on each
iteration.
