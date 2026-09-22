---
title: bw2data layout
type: module-page
summary: How the bw2data package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw2data, bw2data-docs]
related: [README.md, classes.md]
---

# bw2data layout

The tree below is the installed package of version 4.7, walked on disk on 2026-09-21. The
repository adds tests, documentation and packaging files around it (source: bw2data-docs).

```
bw2data/
├── __init__.py              re-exports the public names: projects, Database, Method, get_node, ...
├── project.py               ProjectManager: switch, copy, rename, delete, migrate a project
├── configuration.py         the Config object and the labels used for node and edge types
├── meta.py                  the registries: databases, methods, geomapping, preferences, calculation_setups
├── database.py              the Database() dispatcher that returns the right backend class
├── data_store.py            DataStore and ProcessedDataStore, the base of everything storable
├── ia_data_store.py         the impact assessment flavour of that base class
├── method.py                Method, the impact category store
├── weighting_normalization.py  Weighting and Normalization stores
├── parameters.py            project, database and activity parameters, and their groups
├── proxies.py               the dictionary-like wrappers user code holds
├── sqlite.py                the peewee database wrapper and the substitutable JSON field
├── snowflake_ids.py         collision-resistant integer ids for new objects
├── revisions.py             revision objects for every signalled change, the 4.x change log
├── signals.py               the blinker signals the revision layer listens to
├── serialization.py         the JSON-backed serialised dictionaries the registries use
├── compat.py                prepare_lca_inputs, get_multilca_data_objs, the bridge to bw2calc
├── search/                  the full-text index: indices.py, schema.py, search.py
├── backends/
│   ├── base.py              SQLiteBackend: the default database implementation
│   ├── proxies.py           Activity and Exchange
│   ├── schema.py            the peewee models ActivityDataset and ExchangeDataset
│   ├── typos.py             the field-name checks that catch a misspelled key
│   ├── utils.py             dictionary and key helpers
│   ├── wurst_extraction.py  extract_brightway_databases, for the wurst format
│   └── iotable/             backend.py and proxies.py: the input-output table backend
├── updates.py               Updates, including the reprocess-everything migration
├── utils.py                 get_node, get_activity, get_id and friends
├── validate.py              the voluptuous schemas for database and method data
├── errors.py                the exception types
├── logs.py                  structlog configuration
├── filesystem.py            safe filenames and the project directory layout
├── fatomic.py               atomic file writes
├── query.py                 the older query and filter API
├── string_distance.py       fuzzy matching used by search and typo checks
├── subclass_mapping.py      backend label to class: sqlite, iotable
└── tests.py                 the pytest fixtures the package exports for downstream tests
```

## Key files

- `project.py`: everything about where data lives; read it before touching the data
  directory.
- `backends/base.py` and `backends/proxies.py`, the common case: a SQLite-backed database
  and the `Activity` and `Exchange` objects you hold in a notebook.
- `compat.py`: the seam between the data layer and the calculation layer; it is what
  makes `bd.prepare_lca_inputs(...)` and `bc.LCA(...)` fit together.
- `revisions.py` and `signals.py`, new in the 4.x line. Every change to a signalled
  object can be recorded as a revision, which is what makes project synchronisation
  possible.
- `subclass_mapping.py`: the list of backends the installed version knows: `sqlite` and
  `iotable` in 4.7, with `multifunctional` added by the package of that name (checked by
  reading `DATABASE_BACKEND_MAPPING` in the installed 4.7).
