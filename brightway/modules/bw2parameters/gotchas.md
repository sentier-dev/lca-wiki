---
title: bw2parameters gotchas
type: module-page
summary: What surprises people about bw2parameters 1.1.0, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2parameters, bw2parameters-docs, brightway-cheatsheet]
related: [classes.md, commands.md, status.md]
---

# bw2parameters gotchas

- **`__version__` is a tuple, not a string.** `bw2parameters.__version__` is
  `(1, 1, 0)` in the installed release (checked on 2026-09-21), so
  `__version__.startswith("1.")` raises. Use `importlib.metadata.version` when you need a
  string.

- **The release is old and that is fine.** 1.1.0 dates from 2023-04-18
  (source: pypi-bw2parameters). A quiet package is not an abandoned one here: the API is
  small and the callers are stable.

- **The package summary on PyPI is wrong.** It reads "Contains all the python boilerplate
  you need to create a Brightway ecosystem package", left over from a project template
  (source: pypi-bw2parameters). The README describes what the package actually does.

- **A cycle is an error, not a warning.** `get_order()` raises when two formulas refer to
  each other. Fix the model; there is no partial evaluation.

- **`MissingName` means a free variable.** A formula referring to a name that is neither a
  parameter nor a global parameter fails at evaluation. In a project this usually means
  the parameter is in another group; pass it as a global parameter or add it to the
  group.

- **Formulas are restricted Python.** `asteval` allows mathematics and the `math` and
  `numpy` names, not imports or attribute access on arbitrary objects. Treat that
  restriction as deliberate: formulas often come from spreadsheets written by someone
  else.

- **`evaluate_and_set_amount_field()` mutates your dictionary.** So does
  `substitute_in_formulas`. Copy first if you need the original.

- **Units are opt-in.** `ParameterSet` ignores a `unit` field; only `PintParameterSet` and
  `PintInterpreter` do anything with it.

- **In a project, parameters do not apply themselves.** After changing them you must call
  `bd.parameters.recalculate()`, and after that the affected databases have to be
  processed again before a calculation sees the new amounts
  (source: brightway-cheatsheet).
