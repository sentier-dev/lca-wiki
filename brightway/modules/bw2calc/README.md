---
title: bw2calc
type: module
summary: "Brightway's calculation engine: builds the matrices and solves the system."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2calc, bw2calc-docs, brightway-cheatsheet, brightway-faq-versions, brightway-installation]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw2calc

`bw2calc` is the calculation engine of the Brightway framework. It takes datapackages,
asks `matrix_utils` to build the technosphere, biosphere and characterisation matrices
from them, solves the linear system, and gives you an inventory, a characterised
inventory and a score. Its own README says the emphasis is on speed of solving those
systems, whether for a single calculation, a graph traversal or Monte Carlo
(source: bw2calc-docs).

It knows nothing about SQLite, projects or databases. Everything it needs arrives as
datapackages, which is why a 2.5 calculation can run without a project on disk
(source: brightway-faq-versions).

**Version documented:** 2.5.0 · **obtained from:** the PyPI JSON API for the newest
release, and `bw2calc.__version__` in a local virtual environment that has 2.5.0
installed · **as of:** 2026-09-21

## Install

```bash
pip install bw2calc==2.5.0
```

On x64 hardware add `pypardiso` for a much faster solver; on Apple Silicon add
`scikit-umfpack` instead (source: brightway-installation). Importing `bw2calc` on x64
without `pypardiso` prints a warning saying so, which is how you find out.

## What it does

- **One functional unit, one impact category:** the `LCA` class, `lci()`, `lcia()`,
  `score`. See [classes.md](classes.md) and [commands.md](commands.md).
- **Many functional units and a structure of impact categories, normalisations and
  weightings:** `MultiLCA` with a `MethodConfig`.
- **Uncertainty:** the same classes with `use_distributions=True` or `use_arrays=True`,
  iterated with `next(lca)`.
- **Alternative solvers:** dense, least squares, iterative, GMRES with a Jacobi
  preconditioner, and a caching variant, for systems the default solver handles badly.

## Datasets

`bw2calc` ships no data. It contains code only: walking the installed 2.5.0 package on
2026-09-21 found no data directory. Everything it reads arrives at call time as
datapackages produced by [../bw2data/](../bw2data/) or written by hand with
[../bw_processing/](../bw_processing/). See [datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): the LCA classes and what each is for
- [commands.md](commands.md): the calls you actually type
- [datasets.md](datasets.md): why there is no data here
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw2calc` 2.5.0: 21
markdown files, one per public submodule, each stamped with the package version, the
date and the command that produced it. It was produced by running pydoc-markdown 4.8.2
by hand on 2026-09-22 in a throwaway environment, and nothing in the repository
regenerates it. Signatures and docstrings live there; the names worth knowing first are
in [classes.md](classes.md).
