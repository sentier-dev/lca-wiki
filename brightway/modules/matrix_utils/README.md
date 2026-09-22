---
title: matrix_utils
type: module
summary: "Builds and rebuilds sparse matrices from datapackages."
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-matrix-utils, matrix-utils-docs, brightway-faq-versions]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# matrix_utils

`matrix_utils` turns datapackages into sparse matrices, and rebuilds them when new samples
are drawn. Its README explains why it exists: matrix building used to live in the
calculation library, and the new capabilities in `bw_processing` made it complicated
enough to deserve its own package (source: matrix-utils-docs). That split, together with
`bw_processing` itself, is what the 2.5 generation is
(source: brightway-faq-versions).

It is a low-level library. Most people meet it only through `bw2calc`, which creates
`MappedMatrix` objects on their behalf.

**Version documented:** 0.9 · **obtained from:** the PyPI JSON API for the newest release,
and `matrix_utils.__version__` in a local virtual environment that has 0.9 installed ·
**as of:** 2026-09-21

## Install

```bash
pip install matrix-utils==0.9
```

The distribution is `matrix-utils`; the import name is `matrix_utils`. Version 0.9
requires `bw_processing >= 1.6` (source: pypi-matrix-utils), so the two move together.

## What it does

- **Builds one matrix from several datapackages.** `MappedMatrix(packages=[...],
  matrix="technosphere_matrix")` filters each package for resource groups that name that
  matrix and inserts them in order (source: matrix-utils-docs).
- **Maps ids to indices.** `ArrayMapper` turns the arbitrary integer ids in a datapackage
  into dense row and column numbers, and can be shared between matrices so their
  dimensions line up.
- **Rebuilds on iteration.** `next(mm)` draws new samples from every stochastic resource
  group and rebuilds the matrix, which is how Monte Carlo works one level up.
- **Handles groups that interact.** Several resource groups can write to one matrix,
  adding to or replacing each other's values.

## Datasets

`matrix_utils` ships no data. Walking the installed 0.9 on 2026-09-21 found code only, and
the package has no network access. Everything it reads is a datapackage handed to it at
call time. See [datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): `MappedMatrix`, the mappers and the indexers
- [commands.md](commands.md): building a matrix from Python
- [datasets.md](datasets.md): why there is no data here
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `matrix_utils` 0.9:
9 markdown files, one per public submodule, each stamped with the package version, the
date and the command that produced it. It was produced by running pydoc-markdown 4.8.2
by hand on 2026-09-22 in a throwaway environment, and nothing in the repository
regenerates it. Signatures and docstrings live there; the names worth knowing first are
in [classes.md](classes.md).
