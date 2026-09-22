---
title: pypardiso status
type: module-page
summary: "Where pypardiso stands on 2026-09-21: stable, small, maintained slowly."
audience: [P2]
updated: 2026-09-21
sources: [pypi-pypardiso, pypardiso-repo]
---

# pypardiso status

## Release

- **Latest version:** 0.4.7, uploaded 2025-11-02 (source: pypi-pypardiso).
- **Stable or pre-release:** stable. The 0.4 series runs from 0.4.0 in October 2021 to
  0.4.7, all final releases (source: pypi-pypardiso).
- **Cadence:** slow and steady. Roughly one release a year, with a twenty month gap
  between 0.4.6 and 0.4.7 (source: pypi-pypardiso).
- **Author:** Adrian Haas; the repository is `haasad/PyPardiso`
  (source: pypi-pypardiso, pypardiso-repo).
- **Licence:** BSD 3-Clause, copyright Adrian Haas and ETH Zurich
  (source: pypardiso-repo).
- **Python:** 3.8 and newer (source: pypi-pypardiso).
- **Dependencies:** mkl excluding 2024.0, numpy and scipy
  (source: pypi-pypardiso).
- **Channels:** PyPI and conda-forge (source: pypardiso-repo).

## Works today

- `spsolve` and `factorized` as drop-in replacements for their SciPy counterparts.
- Direct use of `PyPardisoSolver` with control over matrix type, phase, the MKL `iparm`
  array and statistical output.
- Factorisation reuse, bounded by a configurable storage limit, with explicit methods
  to drop it and to free MKL memory.
- Verified here: a sparse solve on x86-64 Linux against MKL 2026.1.0 returned a
  residual at machine precision on 2026-09-21.

## In flight

- Nothing announced. This is a thin, finished binding; its changes track MKL and
  packaging rather than features.

## Missing

- macOS support, which is a property of MKL rather than of this package
  (source: pypardiso-repo).
- Complex number support (source: pypardiso-repo).
- Anything beyond PARDISO from MKL: the separate PARDISO 7 project is not wrapped here
  (source: pypardiso-repo).

## What to use instead, where it does not run

| Platform | Alternative |
|---|---|
| macOS, Apple silicon or Intel | `scikit-umfpack`, as the README recommends (source: pypardiso-repo) |
| anywhere, no MKL wanted | SciPy's own `spsolve`, which is what `bw2calc` falls back to |

## Where help is welcome

Nothing here needs LCA-specific work. What is worth documenting in this wiki is the
platform decision it forces on a Brightway environment; see
[../bw_timex/gotchas.md](../bw_timex/gotchas.md). For anything larger, see the branch
roadmap at [../../roadmap.md](../../roadmap.md).
