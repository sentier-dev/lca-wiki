---
title: flowmapper layout
type: module-page
summary: How the flowmapper package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-flowmapper, flowmapper-repo]
---

# flowmapper layout

The installed package tree of flowmapper 0.4, read from the wheel installed from PyPI
(source: pypi-flowmapper).

```
flowmapper/
├── __init__.py            the public surface: Flow, Flowmap, the field types, flowmapper()
├── main.py                the flowmapper() driver function and OutputFormat
├── cli.py                 the Typer application behind the `flowmapper` console script
├── flow.py                Flow: one elementary flow in the core ontology
├── flowmap.py             Flowmap: the crosswalk, its statistics and its exporters
├── match.py               the matching strategy functions and the default rule order
├── cas.py                 CASField: CAS numbers that compare equal whatever the padding
├── context.py             ContextField: hierarchical compartments
├── unit.py                UnitField: units, backed by Pint
├── string_field.py        StringField: names with a normalised comparison
├── string_list.py         StringList: synonym lists
├── transformation_mapping.py   applying randonneur transformations before matching
├── constants.py           shared constants
├── errors.py              the exception types
├── utils.py               loading, writing and reporting helpers
├── extraction/            readers that produce flow lists from real files
│   ├── ecospold2.py
│   ├── simapro_csv.py
│   └── simapro_ecospold1.py
├── data/                  bundled reference data, see datasets.md
└── manual_matching/       curated match material and prepared results
```

## Key files

- `match.py` is the heart of it. Each matching strategy is a function that takes a
  source flow and a target flow and returns a boolean; `match_rules` is the default
  ordered list. Read this file before writing a custom rule.
- `flowmap.py` is where matching results become output: `statistics`, `to_glad` and
  `to_randonneur` all live here, as do the unmatched-flow accessors.
- `cas.py`, `context.py`, `unit.py`, `string_field.py` and `string_list.py` define the
  comparison semantics. They exist so a rule can write `a == b` and get the intended
  meaning rather than a string comparison.
- `extraction/` is the bridge from real files to the core ontology. Its three
  extractors are exposed on the command line as the `extract-` subcommands.
- `data/` and `manual_matching/` are data, not code; they are covered in
  [datasets.md](datasets.md).
