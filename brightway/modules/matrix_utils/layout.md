---
title: matrix_utils layout
type: module-page
summary: How the matrix_utils package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-matrix-utils, matrix-utils-docs]
related: [README.md, classes.md]
---

# matrix_utils layout

The tree below is the installed package of version 0.9, walked on disk on 2026-09-21. It
is a small package: eight modules and no data.

```
matrix_utils/
├── __init__.py            re-exports MappedMatrix, MappedMatrixDict, ArrayMapper, ResourceGroup and the indexers
├── mapped_matrix.py       MappedMatrix: the main class, one matrix from one or more datapackages
├── mapped_matrix_dict.py  MappedMatrixDict and SparseMatrixDict: several matrices sharing one mapping
├── resource_group.py      ResourceGroup: one contribution to one matrix, with its masks and samples
├── array_mapper.py        ArrayMapper: arbitrary integer ids to dense indices, with a sparse fallback
├── indexers.py            RandomIndexer, SequentialIndexer, CombinatorialIndexer and the Proxy around them
├── aggregation.py         summing duplicate coordinates before insertion
├── utils.py               filtering and shape helpers
└── errors.py              the exception types
```

## Key files

- `mapped_matrix.py`: the class everything else exists to serve. Read its constructor
  arguments before anything else: `packages`, `matrix`, `use_vectors`, `use_arrays`,
  `use_distributions`, `row_mapper`, `col_mapper`, `seed_override`
  (source: matrix-utils-docs).
- `array_mapper.py`: the mapping that makes two matrices share dimensions; passing the
  same mapper as `row_mapper` to the technosphere and biosphere matrices is what keeps
  their indices aligned.
- `resource_group.py`: where the `flip`, `rescale`, mask and sampling logic lives, one
  resource group at a time.
- `indexers.py`: which sample is drawn next: random with an optional seed, sequential,
  or combinatorial across several packages.
