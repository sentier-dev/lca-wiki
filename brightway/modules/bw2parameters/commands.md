---
title: bw2parameters commands
type: module-page
summary: Evaluating a parameter set, both standalone and through bw2data.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw2parameters, bw2parameters-docs, brightway-cheatsheet]
related: [classes.md, gotchas.md, ../bw2data/commands.md]
---

# bw2parameters commands

`bw2parameters` 1.1.0 installs no shell command: its distribution declares an empty
entry-point list, checked with `importlib.metadata` on 2026-09-21.

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw2parameters` has no console script. | n/a |

## Notebook entry points

### Standalone

```python
from bw2parameters import ParameterSet

ps = ParameterSet({
    'width': {'amount': 3},
    'area': {'formula': 'width * 4'},
})
ps.get_order()      # ['width', 'area']
ps.evaluate()       # {'width': 3, 'area': 12}
```

| Call | What it does |
|---|---|
| `ParameterSet(params, global_params=None)` | Build the set; `global_params` are names visible but not evaluated here. |
| `ps.basic_validation()` | Check that every parameter is usable before evaluating. |
| `ps.get_references()` | Which names each formula depends on. |
| `ps.get_order()` | The dependency order; raises on a cycle. |
| `ps.evaluate()` | Name to value. |
| `ps.evaluate_and_set_amount_field()` | The same, writing results back into each parameter's `amount`. |
| `ps.evaluate_monte_carlo(iterations=1000)` | Repeated evaluation from the parameters' distributions; the default is 1 000 iterations, read from the installed 1.1.0. |

### With units

```python
from bw2parameters import PintParameterSet

PintParameterSet({
    'length': {'amount': 2, 'unit': 'meter'},
    'area': {'formula': 'length * 3 meter'},
}).evaluate()
```

| Call | What it does |
|---|---|
| `PintParameterSet(params)` | A set whose arithmetic carries units. |
| `PintInterpreter()` | The unit-aware interpreter, usable directly. |
| `PintWrapper` | The shared unit registry. |

### Renaming

| Call | What it does |
|---|---|
| `mangle_formula('2 * x', 'grp')` | Prefixes free variables, leaving built-ins and `context` names alone. |
| `prefix_parameter_dict(dct, 'grp_')` | Prefixes keys and updates formulas together. |
| `substitute_in_formulas(dct, {'old': 'new'})` | Applies a rename map to every formula. |

### Through bw2data

In a Brightway project you normally do not touch `ParameterSet` directly. The parameters
live in the project and `bw2data` evaluates them (source: brightway-cheatsheet):

| Call | What it does |
|---|---|
| `bd.parameters.new_project_parameters(data)` | Project-wide parameters. |
| `bd.parameters.new_database_parameters(data, '<db>')` | Parameters for one database. |
| `bd.parameters.new_activity_parameters(data, '<group>')` | Parameters for a group of activities. |
| `bd.parameters.add_exchanges_to_group('<group>', activity)` | Let the group's formulas drive that activity's edge amounts. |
| `bd.parameters.recalculate()` | Re-evaluate everything and write the new amounts. |

See [../bw2data/commands.md](../bw2data/commands.md).
