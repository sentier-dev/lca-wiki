---
title: bw2data classes and functions
type: module-page
summary: The public surface of bw2data 4.7, in the order a user meets it.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2data, brightway-cheatsheet, brightway-glossary]
related: [README.md, commands.md, gotchas.md]
---

# bw2data classes and functions

Hand-written companion to the generated `api/` folder. The names below are the public
namespace of the installed version 4.7, read with `dir(bw2data)` on 2026-09-21; the
one-liners come from the objects' own docstrings and from the cheat sheet
(source: brightway-cheatsheet).

## The objects you hold

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `projects` | singleton `ProjectManager` | The project you are in and the ones you could switch to. | `bd.projects.set_current('<name>')` |
| `Database` | factory function | Returns the backend class registered for that database name. | `bd.Database('<name>')` |
| `Node` | class | One node of the graph, a mutable mapping of its fields. | `db.new_node(**attrs)`, `bd.get_node(...)` |
| `Edge` | class | One directed edge, also a mutable mapping. | `node.new_edge(**attrs)` |
| `Method` | class | One impact category: registers, writes, loads and processes its factors. | `bd.Method(('<impact>', '<category>'))` |
| `Normalization` | class | Normalisation factors, turning units into person-equivalents or similar. | `bd.Normalization(name)` |
| `Weighting` | class | Weighting factors, for combining impact categories. | `bd.Weighting(name)` |
| `Searcher` | class | Queries the full-text index of one database. | `db.search('<query>')` |

`Node` and `Edge` are the 2.5 names; the classes behind them for a SQLite database are
`Activity` and `Exchange` in `bw2data.backends.proxies`, and both names are exported
(source: brightway-glossary).

## The registries

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `databases` | serialised dict | Metadata of every database in the project, including its `backend`. | `sorted(bd.databases)` |
| `methods` | serialised dict | Metadata of every impact category. | `sorted(bd.methods)` |
| `normalizations`, `weightings` | serialised dicts | The same for normalisation and weighting sets. | `bd.normalizations` |
| `geomapping` | serialised dict | Location code to integer, needed because arrays store a numeric `geo` field. | used internally by `.process()` |
| `preferences` | serialised dict | Project-specific preferences. | `bd.preferences` |
| `calculation_setups` | serialised dict | Saved combinations of functional units and impact categories. | `bd.calculation_setups['<name>']` |
| `parameters` | `ParameterManager` | Project, database and activity parameters and their groups. | `bd.parameters.recalculate()` |
| `labels` | settings object | The node and edge type strings the framework treats as production, technosphere, biosphere and so on. | `bd.labels.technosphere_positive_edge_types` |

## Functions

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `get_node(**kwargs)` | function | Exactly one node matching any set of attributes. | `bd.get_node(name='x', location='CH')` |
| `get_activity(key=None, **kwargs)` | function | The same, also accepting an integer id or a key tuple. | `bd.get_activity(key)` |
| `get_id(key)` | function | The integer id behind a key. | internal and downstream packages |
| `prepare_lca_inputs(demand, method=None, ...)` | function | Returns the demand dictionary, the datapackages and the remapping for one calculation. | before `bc.LCA(...)` |
| `get_multilca_data_objs(functional_units, method_config)` | function | The datapackages a `MultiLCA` needs. | before `bc.MultiLCA(...)` |
| `set_data_dir(dirpath, permanent=True)` | function | Moves the Brightway data directory. | rarely; the environment variable is the usual route |
| `convert_backend(database_name, backend)` | function | Rewrites a database under a different backend. | `bd.convert_backend('db', 'iotable')` |
| `extract_brightway_databases(names)` | function | Exports databases into the wurst in-memory format. | `wurst` and `premise` pipelines |

## What a database object gives you

`bd.Database('<name>')` returns a `SQLiteBackend` unless the metadata names another
backend. Its useful methods, read from the installed 4.7:

`write`, `register`, `deregister`, `delete`, `copy`, `rename`, `random`, `search`,
`make_searchable`, `make_unsearchable`, `new_node`, `new_activity`, `nodes_to_dataframe`,
`edges_to_dataframe`, `graph_technosphere`, `find_dependents`, `find_graph_dependents`,
`process`, `datapackage`, `backup`, `validate`, `delete_duplicate_exchanges`.

A node gives you `technosphere()`, `biosphere()`, `production()`, `substitution()`,
`producers()`, `consumers()`, `upstream()`, `edges()`, `exchanges()`, `rp_exchange()`,
`new_edge()`, `copy()`, `delete()`, `save()`, `as_dict()`, `key`, `id` and `lca()`.

An edge gives you `input`, `output`, `amount`, `unit`, `uncertainty`, `uncertainty_type`,
`random_sample()`, `as_dict()`, `save()`, `delete()` and `lca()`.

## Notes

- `Database` is a function, not a class, although it is capitalised: it looks the backend
  up in `databases[name]['backend']` and returns an instance of the matching class. That
  is why `isinstance(db, Database)` does not work.
- Every store inherits `.process()` from `ProcessedDataStore`. Processing is what turns
  rows in SQLite into the datapackage a calculation reads, and it is the step a version
  migration repeats. See [gotchas.md](gotchas.md).
- The `labels` object is worth knowing before writing custom node types: it is the single
  place that says which `type` strings count as production, technosphere or biosphere.
