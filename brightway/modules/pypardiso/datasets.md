---
title: pypardiso datasets
type: module-page
summary: pypardiso ships no data; it ships three Python modules and a dependency on MKL.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-pypardiso, pypardiso-repo]
---

# pypardiso datasets

## None

pypardiso 0.4.7 ships no data files. The installed package is `__init__.py`,
`pardiso_wrapper.py` and `scipy_aliases.py`, checked by listing the installed package
(source: pypi-pypardiso). There is no bundled database, flow list, nomenclature or
impact assessment method, and there could not be: the package knows nothing about LCA.

## What it depends on instead

The one heavy thing pypardiso brings is not data but a library: the Intel oneAPI Math
Kernel Library, declared as the `mkl` dependency with the 2024.0 release excluded
(source: pypi-pypardiso). MKL is what actually performs the factorisation, and it is
the reason the package is platform limited.

| Dependency | Why |
|---|---|
| `mkl`, not 2024.0 | the PARDISO implementation itself |
| `numpy` | array handling for the right-hand side and the solution |
| `scipy` | sparse matrix formats, CSR and CSC |

The verified environment for this page had MKL 2026.1.0 on x86-64 Linux, in which a
ten by ten sparse solve returned a residual at machine precision on 2026-09-21.

## What it reads and writes

Nothing on disk. Input is a sparse matrix and a right-hand side in memory; output is
the solution array. The only persistent state is inside the solver object: a cached
factorisation, bounded by `size_limit_storage`, and the MKL `iparm` configuration
array. Both are cleared with `remove_stored_factorization` and `free_memory`.

- **Provenance of the numbers:** whatever matrix you passed in. In a Brightway context
  that is a technosphere or biosphere matrix built by `matrix_utils` from datapackages;
  see [../matrix_utils/README.md](../matrix_utils/README.md).
- **Source branch:** not applicable.
