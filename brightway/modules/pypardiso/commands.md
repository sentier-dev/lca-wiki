---
title: pypardiso commands
type: module-page
summary: pypardiso has no command line; it is imported, and often not called directly.
audience: [P1]
updated: 2026-09-22
sources: [pypi-pypardiso, pypardiso-repo, bw-timex-docs]
---

# pypardiso commands

pypardiso 0.4.7 installs **no console script**. The wheel published on PyPI contains no
`entry_points.txt`, checked by reading the wheel's metadata directly
(source: pypi-pypardiso).

| Command | What it does | Key options |
|---|---|---|
| none | pypardiso is a numerical library | not applicable |

For most Brightway users there is nothing to call at all: installing the package is the
whole interaction, because `bw2calc` picks it up automatically.

## Installation commands

| Command | What it does |
|---|---|
| `pip install pypardiso` | install from PyPI, pulling MKL, numpy and scipy |
| `conda install -c conda-forge pypardiso` | the conda route (source: pypardiso-repo) |
| `conda create -n timex -c conda-forge -c cmutel -c diepers bw_timex pypardiso` | the bw_timex conda command, which has to name pypardiso explicitly (source: bw-timex-docs) |

## Checking that it is being used

The most common question is whether it took effect. Two checks:

```python
import pypardiso
import importlib.metadata as md

md.version("pypardiso")
md.version("mkl")
```

and, negatively, the absence of the `bw2calc` warning. On x64 hardware without
pypardiso installed, importing `bw2calc` prints a warning saying that installing it
could give much faster calculations; once it is installed, that warning stops.

## Notebook entry points

```python
import numpy as np
import scipy.sparse as sp
import pypardiso

x = pypardiso.spsolve(A, b)          # drop-in replacement for scipy's spsolve
solve = pypardiso.factorized(A)      # reuse one factorisation for many vectors
```

Controlling the solver directly:

```python
from pypardiso import PyPardisoSolver

solver = PyPardisoSolver(mtype=11, phase=13)
solver.set_statistical_info_on()
solver.factorize(A)
x = solver.solve(A, b)
solver.remove_stored_factorization()
solver.free_memory()
```

## Where it is called from

Inside Brightway you rarely call it. `bw2calc` uses it in place of the SciPy solver when
it can import it, which is what makes an LCA faster without any change to your code.
See [../bw2calc/README.md](../bw2calc/README.md).
