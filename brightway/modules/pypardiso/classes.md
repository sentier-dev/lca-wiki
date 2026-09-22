---
title: pypardiso classes and functions
type: module-page
summary: "Four public names: spsolve, factorized, PyPardisoSolver and the shared instance."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-pypardiso, pypardiso-repo]
---

# pypardiso classes and functions

Hand-written companion to the generated `api/` folder. Names, signatures and method
lists were read by importing pypardiso 0.4.7 and inspecting `__all__` and the class
(source: pypi-pypardiso); the intent follows the repository README
(source: pypardiso-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `spsolve` | function | Solve `Ax = b` for a sparse `A`, mimicking `scipy.sparse.linalg.spsolve` | `pypardiso.spsolve(A, b)` |
| `factorized` | function | Return a solver callable for a fixed `A`, mimicking `scipy.sparse.linalg.factorized` | `solve = pypardiso.factorized(A)` |
| `PyPardisoSolver` | class | The solver itself, with direct control of matrix type, phase and MKL options | `PyPardisoSolver(mtype=11, phase=13)` |
| `ps` | object | A module-level `PyPardisoSolver` instance, used as the default by the two functions | `pypardiso.ps` |

## Signatures

```python
spsolve(A, b, factorize=True, squeeze=True, solver=ps, *args, **kwargs)
factorized(A, solver=ps, *args, **kwargs)
PyPardisoSolver(mtype=11, phase=13, size_limit_storage=5e7)
```

`A` is a square sparse matrix in CSR or CSC format; `b` is a vector or a matrix. The
default `mtype` of 11 is a real, non-symmetric matrix, which is what a technosphere
matrix is; `phase` 13 is analysis, factorisation and solve in one call.
`size_limit_storage` bounds how large a matrix may be before its factorisation is
dropped rather than stored.

## PyPardisoSolver methods

| Method | What it does |
|---|---|
| `solve(A, b)` | solve the system |
| `factorize(A)` | factorise without solving, so later solves reuse the work |
| `set_matrix_type(mtype)` | change the matrix type |
| `set_phase(phase)` | change the PARDISO phase |
| `set_iparm(i, value)` | set one entry of the MKL `iparm` configuration array |
| `get_iparm(i)`, `get_iparms()` | read one entry, or all of them |
| `set_statistical_info_on()` / `_off()` | turn MKL's statistical output on or off |
| `remove_stored_factorization()` | drop the cached factorisation |
| `free_memory(everything=False)` | release MKL memory |

## Typical calls

The drop-in case, which is all most people need:

```python
import numpy as np
import scipy.sparse as sp
import pypardiso

A = sp.rand(1000, 1000, density=0.01, format="csr") + sp.eye(1000, format="csr")
b = np.random.rand(1000)
x = pypardiso.spsolve(A, b)
```

Solving many right-hand sides against the same matrix:

```python
solve = pypardiso.factorized(A)
x1 = solve(b1)
x2 = solve(b2)
```

Using a solver of your own instead of the shared one:

```python
from pypardiso import PyPardisoSolver

solver = PyPardisoSolver()
solver.factorize(A)
x = solver.solve(A, b)
solver.free_memory()
```

## Notes

- Complex numbers are not supported. For those, or for the separate PARDISO 7 project,
  the README points at the Julia binding instead (source: pypardiso-repo).
- The functions default to the shared `ps` instance, so factorisations and solver
  settings are shared across a process unless you pass your own `solver=`.
- A verified run: a ten by ten sparse solve against MKL 2026.1.0 on x86-64 Linux
  returned a residual at machine precision on 2026-09-21.
