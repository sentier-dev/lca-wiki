---
title: bw2calc layout
type: module-page
summary: How the bw2calc package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw2calc, bw2calc-docs]
related: [README.md, classes.md]
---

# bw2calc layout

The tree below is the installed package of version 2.5.0, walked on disk on 2026-09-21.

```
bw2calc/
├── __init__.py                   re-exports the LCA classes and the solver flags PYPARDISO and UMFPACK
├── lca_base.py                   the shared machinery: loading datapackages, building matrices, iteration
├── lca.py                        LCA, the single functional unit case
├── multi_lca.py                  MultiLCA, many functional units and a structure of impact categories
├── method_config.py              MethodConfig, the pydantic model relating categories, normalisation and weighting
├── dictionary_manager.py         the dicts attribute: activity, product and biosphere index mappings
├── dense_lca.py                  DenseLCA, solving with numpy instead of a sparse solver
├── least_squares.py              LeastSquaresLCA, for overdetermined systems
├── iterative_lca.py              IterativeLCA, conjugate-gradient style solvers
├── jacobi_gmres_lca.py           JacobiGMRESLCA, GMRES with a diagonal preconditioner
├── caching_lca.py                CachingLCA, caches supply vectors between calls
├── partitioned_lca.py            PartitionedMonteCarloLCA, static background solved once
├── fast_scores.py                FastScoresOnlyMultiLCA, chunked scores when only numbers are wanted
├── fast_supply_arrays.py         supply-array shortcuts used by the fast paths
├── single_value_diagonal_matrix.py  a diagonal matrix with one repeated value
├── restricted_sparse_matrix_dict.py  the mapping of label to sparse matrix used by MultiLCA
├── result_cache.py               caching of results across iterations
├── grid.py                       helpers for gridded or batched calculations
├── utils.py                      consistent naming, wrapping and loading helpers
├── log_utils.py                  logging configuration
└── errors.py                     the exception types, including the outside-technosphere errors
```

## Key files

- `lca_base.py`: read this first. `LCA` and `MultiLCA` are thin layers over it, and the
  matrix building, the iteration protocol and the datapackage handling all live here.
- `lca.py`: the class almost everyone uses.
- `method_config.py`: the only place that says how impact categories, normalisations and
  weightings relate; a `MultiLCA` is configured through it.
- `dictionary_manager.py`: the `lca.dicts` attribute, which is how you go from a node to
  a matrix row or column and back.
- `__init__.py`: sets `PYPARDISO` and `UMFPACK` booleans at import time and warns when
  neither fast solver is available on x64 hardware.
