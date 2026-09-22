---
title: bw2parameters layout
type: module-page
summary: How the bw2parameters package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw2parameters, bw2parameters-docs]
related: [README.md, classes.md]
---

# bw2parameters layout

The tree below is the installed package of version 1.1.0, walked on disk on 2026-09-21.
Seven modules, no data, no subpackages.

```
bw2parameters/
├── __init__.py       re-exports ParameterSet, the interpreters, the mangling helpers and get_version_tuple
├── parameter_set.py  ParameterSet and PintParameterSet: ordering, validation, evaluation
├── interpreter.py    Interpreter and PintInterpreter, the asteval wrappers that evaluate one formula
├── pint.py           PintWrapper, the lazily loaded unit registry and its helpers
├── mangling.py       mangle_formula, prefix_parameter_dict, substitute_in_formulas, FormulaSubstitutor
├── utils.py          small helpers, including the version tuple
└── errors.py         MissingName and the other exception types
```

## Key files

- `parameter_set.py`: the class users touch. `get_order()` is the interesting part: it
  builds the dependency order from the references found in each formula.
- `interpreter.py`: the boundary with `asteval`. Anything about which functions a formula
  may call is decided here, which matters because formulas come from user data.
- `mangling.py`: how one namespace of parameters is renamed into another without
  rewriting the formulas by hand; `bw2data` uses it for group prefixes.
