---
title: bw2parameters classes and functions
type: module-page
summary: ParameterSet, the interpreters and the formula helpers of bw2parameters 1.1.0.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2parameters, bw2parameters-docs]
related: [README.md, commands.md, gotchas.md]
---

# bw2parameters classes and functions

The names below are the public namespace of the installed version 1.1.0, read with
`dir(bw2parameters)` on 2026-09-21.

## The classes

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `ParameterSet` | class | A dictionary of named parameters, some with `amount`, some with `formula`, evaluated in dependency order. | `ParameterSet(params).evaluate()` |
| `PintParameterSet` | class | The same with `pint` units carried through the arithmetic. | `PintParameterSet(params).evaluate()` |
| `Interpreter` | class | An `asteval` interpreter restricted to mathematical expressions; evaluates one formula against a symbol table. | `ParameterSet.get_interpreter()` |
| `PintInterpreter` | class | The unit-aware interpreter. | via `PintParameterSet` |
| `PintWrapper` | singleton | The lazily created `pint` unit registry and the conversion helpers. | `PintWrapper.string_preprocessor(...)` |
| `FormulaSubstitutor` | callable class | Rewrites symbol names in formulas from a substitution dictionary. | `FormulaSubstitutor({'a': 'b'})(formula)` |
| `MissingName` | exception | A formula refers to a variable that is not defined. | raised on evaluation |

## Functions

| Name | What it is for |
|---|---|
| `mangle_formula(string, prefix, context=None)` | Adds a prefix to every variable in a formula, except names in `context` or built into Python, `math` or `numpy`. |
| `prefix_parameter_dict(dct, prefix)` | Prefixes every key of a parameter dictionary and updates the formulas to match, keeping the original name under `original`. |
| `substitute_in_formulas(dct, substitutions)` | Applies a substitution dictionary to every formula. Modifies in place and returns the dictionary. |
| `get_version_tuple()` | The version, as a tuple. |

## What a ParameterSet gives you

Methods, read from the installed 1.1.0:

| Method | What it does |
|---|---|
| `evaluate()` | Returns a dictionary of name to value, in dependency order. |
| `evaluate_and_set_amount_field()` | The same, but writes each result back into the parameter's `amount`. |
| `evaluate_monte_carlo(iterations)` | Evaluates repeatedly, drawing from the parameters' uncertainty distributions. |
| `get_order()` | The evaluation order; raises when the references form a cycle. |
| `get_references()` | Which parameters each formula refers to. |
| `basic_validation()` | Checks that every parameter has an amount or a formula, and that names are usable. |
| `get_interpreter()` | The interpreter instance, with the global parameters loaded. |

## Notes

- A parameter is a dictionary, not an object: `{'amount': 42}` or
  `{'formula': '2 * x + 16'}`, optionally with `stats_arrays` uncertainty fields beside
  them.
- `global_params` is the second constructor argument, and is how `bw2data` makes project
  parameters visible inside a database parameter group.
- Formulas are strings evaluated by `asteval`, so Python syntax works but the available
  names are restricted. That restriction is the security boundary: parameters usually
  come from a spreadsheet someone else wrote.
