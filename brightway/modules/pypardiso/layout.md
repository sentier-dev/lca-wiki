---
title: pypardiso layout
type: module-page
summary: How the pypardiso package is organised; it is three files.
audience: [P2, P3]
updated: 2026-09-22
sources: [pypi-pypardiso, pypardiso-repo, pypi-bw-timex]
---

# pypardiso layout

The installed package tree of pypardiso 0.4.7, read from the installed package
(source: pypi-pypardiso).

```
pypardiso/
├── __init__.py          the public surface: PyPardisoSolver, spsolve, factorized, ps
├── pardiso_wrapper.py   PyPardisoSolver: the ctypes call into MKL, and the state around it
└── scipy_aliases.py     spsolve and factorized, mimicking their SciPy counterparts
```

The repository adds `pyproject.toml`, `tests/`, `LICENSE.txt`, `README.md` and the CI
workflow (source: pypardiso-repo).

## Key files

- `pardiso_wrapper.py` is the package. It holds `PyPardisoSolver`, which owns the MKL
  handle, the `iparm` configuration array, the matrix type and the phase, and the
  cache of stored factorisations bounded by `size_limit_storage`.
- `scipy_aliases.py` is a thin layer: `spsolve` and `factorized` with SciPy's
  signatures, both defaulting to the module-level solver instance.
- `__init__.py` exports the four names and creates `ps`, a single shared
  `PyPardisoSolver`. That shared instance is why two calls in the same process reuse a
  factorisation, and why solver state set in one place is visible in another. See
  [gotchas.md](gotchas.md).

## Where it sits

Nothing in pypardiso knows about LCA. It is picked up by `bw2calc`, which uses it in
place of the SciPy solver when it is importable; `bw2calc` issues a warning at import
on x64 hardware when it is not. Packages further up, such as `bw_timex`, depend on it
conditionally by platform (source: pypi-bw-timex). See
[../bw2calc/README.md](../bw2calc/README.md).
