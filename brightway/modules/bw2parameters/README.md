---
title: bw2parameters
type: module
summary: "Parameterised exchanges, formulas and parameter groups."
audience: [P1, P2]
updated: 2026-09-22
sources: [pypi-bw2parameters, bw2parameters-docs, brightway-ecosystem, pypi-bw2data, pypi-bw2io]
related: [layout.md, classes.md, commands.md, datasets.md, gotchas.md, status.md]
---

# bw2parameters

`bw2parameters` stores, validates and calculates with parameters: named values and
formulas that refer to each other. Its README says it was designed to work with Brightway
but is generic enough for other uses (source: bw2parameters-docs), and the ecosystem page
lists it as a supporting library (source: brightway-ecosystem).

It is the engine under `bw2data`'s project, database and activity parameters. When you
write `2 * Deep_Thought + 16` in an exchange amount, this package works out what
`Deep_Thought` is, in which order to evaluate, and what the number becomes.

**Version documented:** 1.1.0 · **obtained from:** the PyPI JSON API for the newest
release, and `bw2parameters.__version__` in a local virtual environment that has 1.1.0
installed, where it is the tuple `(1, 1, 0)` rather than a string · **as of:** 2026-09-21

## Install

```bash
pip install bw2parameters==1.1.0
```

It arrives automatically with `bw2data` and `bw2io` (source: pypi-bw2data, pypi-bw2io).

## What it does

The README's own example, unchanged (source: bw2parameters-docs):

```python
from bw2parameters import ParameterSet

parameters = {
    'Deep_Thought': {'amount': 42},
    'East_River_Creature': {'formula': '2 * Deep_Thought + 16'},
    'Elders_of_Krikkit': {'formula': 'sqrt(East_River_Creature)'},
}
ParameterSet(parameters).evaluate()
# {'Deep_Thought': 42, 'East_River_Creature': 100, 'Elders_of_Krikkit': 10.0}
```

- **Works out the order.** `get_order()` sorts the parameters so that nothing is evaluated
  before what it refers to.
- **Evaluates safely.** Formulas are parsed with `asteval`, a restricted interpreter, not
  with `eval`.
- **Handles units.** `PintParameterSet` and `PintInterpreter` carry `pint` units through
  the arithmetic.
- **Renames without breaking formulas.** `mangle_formula`, `prefix_parameter_dict` and
  `substitute_in_formulas` rewrite variable names inside formula strings, which is how
  `bw2data` keeps project, database and activity parameter namespaces apart.
- **Propagates uncertainty.** `evaluate_monte_carlo()` evaluates the set repeatedly from
  the parameters' distributions.

## Datasets

`bw2parameters` ships no data. Walking the installed 1.1.0 on 2026-09-21 found seven
Python modules and nothing else. The parameters themselves live in the `bw2data` project
database; see [../bw2data/datasets.md](../bw2data/datasets.md) and
[datasets.md](datasets.md).

## Pages

- [layout.md](layout.md): the package tree, one line per module
- [classes.md](classes.md): `ParameterSet`, the interpreters and the mangling helpers
- [commands.md](commands.md): evaluating a parameter set, from Python and from bw2data
- [datasets.md](datasets.md): why there is no data here
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): release cadence, maintainers, open work
- [api/](api/README.md): the generated API reference, one file per submodule, stamped
  with version and date
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `bw2parameters`
1.1.0: 7 markdown files, one per public submodule, each stamped with the package
version, the date and the command that produced it. It was produced by running
pydoc-markdown 4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in
the repository regenerates it. Signatures and docstrings live there; the names worth
knowing first are in [classes.md](classes.md).
