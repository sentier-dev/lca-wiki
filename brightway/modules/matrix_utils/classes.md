---
title: matrix_utils classes and functions
type: module-page
summary: MappedMatrix, the mappers and the indexers of matrix_utils 0.9.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-matrix-utils, matrix-utils-docs]
related: [README.md, commands.md, gotchas.md]
---

# matrix_utils classes and functions

The names below are the public namespace of the installed version 0.9, read with
`dir(matrix_utils)` on 2026-09-21. Every constructor takes keyword arguments only
(source: matrix-utils-docs).

## The classes

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `MappedMatrix` | class | One sparse matrix built from one or more datapackages. | `MappedMatrix(packages=[dp], matrix="technosphere_matrix")` |
| `MappedMatrixDict` | class | Several matrices built together, sharing row and column mappers. | `MappedMatrixDict(packages={...}, matrix=..., row_mapper=...)` |
| `SparseMatrixDict` | class | A plain mapping of label to sparse matrix, the result type of the above. | returned, not constructed |
| `ArrayMapper` | class | Maps an array of integer ids to indices ascending from zero, and reapplies that mapping to other arrays. | `ArrayMapper(array=ids)` |
| `ResourceGroup` | class | One datapackage resource group: its data, indices, flip, rescale, masks, parameters and samples. | created by `MappedMatrix` |
| `RandomIndexer` | class | Draws a random column each iteration; takes an optional seed. | via `MappedMatrix` |
| `SequentialIndexer` | class | Walks the columns in order. | via `MappedMatrix` |
| `CombinatorialIndexer` | class | Every combination of columns across several packages. | via `MappedMatrix` |
| `Proxy` | class | Access to one dimension of a combinatorial indexer. | internal |

## `MappedMatrix` arguments

All keyword only (source: matrix-utils-docs):

| Argument | Default | What it does |
|---|---|---|
| `packages` | required | The instantiated `bw_processing` datapackages to read. File paths are not accepted. |
| `matrix` | required | The matrix label to filter resource groups by; it must match the packages' own label. |
| `use_vectors` | `True` | Include vector resources. |
| `use_arrays` | `True` | Include array resources. A resource group provides one or the other, not both. |
| `use_distributions` | `False` | Sample from the uncertainty distributions instead of using the static values. |
| `row_mapper`, `col_mapper` | `None` | Reuse a mapping so several matrices share dimensions. |
| `seed_override` | `None` | Override the datapackage's random seed; ignored for combinatorial packages. |
| `custom_filter`, `identifier` | `None` | Restrict which rows of a group are used, and name the matrix. |

## What a MappedMatrix gives you

`matrix` is the scipy sparse matrix. Methods, read from the installed 0.9:
`rebuild_matrix`, `iterate_indexers`, `reset_indexers`, `add_indexers`, `add_mappers`,
`map_indices`, `indexers`, `indexers_by_type`, `indexers_are_unique`, `local_indexers`,
`group`, `n_elements_dropped`, and the `input_*` accessors that expose the concatenated
data, flip, rescale, indices, uncertainty and provenance vectors of every included group.

A `ResourceGroup` gives you `calculate`, `apply_masks`, `build_mask`, `map_indices`,
`add_indexer`, `add_mapper`, `add_combinatorial_indexer`, `is_vector`, `is_array`,
`is_interface`, `has_distributions`, `has_flip`, `has_rescale`, `has_params`,
`has_param_labels`, `has_reference`, and the current values of those vectors.

## Notes

- `MappedMatrix` is iterable: `next(mm)` draws new samples from every stochastic group and
  rebuilds `mm.matrix` (source: matrix-utils-docs).
- `n_elements_dropped` is worth checking: elements whose row or column is not in the
  mapper are dropped, which is how a mismatched pair of datapackages produces a matrix
  that is silently too small.
- The API deliberately does not resemble the old `bw2calc` matrix functions; the README
  says most ideas become easier and a few become more complicated
  (source: matrix-utils-docs).
