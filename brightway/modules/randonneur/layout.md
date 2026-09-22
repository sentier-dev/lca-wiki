---
title: randonneur layout
type: module-page
summary: How the randonneur package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-randonneur, randonneur-repo]
---

# randonneur layout

The installed package tree of randonneur 0.7.2, one line per file, as read from the
wheel installed from PyPI (source: pypi-randonneur). The repository adds the usual
tests, documentation and packaging files around this tree (source: randonneur-repo).

```
randonneur/
├── __init__.py                  the public surface, re-exported through __all__
├── config.py                    MigrationConfig, the options object every call takes
├── constants.py                 MappingConstants: label mappings per serialisation
├── datapackage.py               Datapackage, the in-memory transformation file
├── edges.py                     migrate_edges and migrate_edges_with_stored_data
├── edge_functions.py            the per-verb implementations for edges
├── nodes.py                     migrate_nodes and migrate_nodes_with_stored_data
├── node_functions.py            the per-verb implementations for nodes
├── generic_transformation.py    the shared matching loop both entry points use
├── errors.py                    the exception types
├── licenses.py                  the SPDX licence list used when validating a file
├── templates.py                 Excel template creation and reading
├── utils.py                     matching helpers and the excluded-attribute list
└── validation.py                schema checks on a transformation file
```

## Key files

- `__init__.py` defines `__all__`, so what is listed there is the supported surface and
  everything else is internal.
- `config.py` is worth reading before anything else: `MigrationConfig` is the only way
  to change matching behaviour, and its defaults decide what a call actually does.
- `constants.py` holds `MappingConstants`. If you are writing a transformation file for
  ecospold2, ILCD or SimaPro CSV data, the label mapping you need is probably already
  there.
- `edges.py` and `nodes.py` are thin: both delegate to `generic_transformation.py`,
  which is where the matching loop lives. Read that file to understand why a
  transformation did or did not apply.
- `licenses.py` is large because it embeds the SPDX licence list; it carries no
  inventory data.
- `templates.py` is the spreadsheet path: it writes an Excel workbook with a `Matching`
  worksheet and reads it back as a `Datapackage`.

## What is not here

No transformation data. The registry of migration files is a separate package,
`randonneur_data`, documented in [datasets.md](datasets.md) (source: randonneur-repo).
