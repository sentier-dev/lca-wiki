---
title: bw2data commands
type: module-page
summary: What you can run from bw2data, all of it from Python.
audience: [P1]
updated: 2026-09-21
sources: [brightway-cheatsheet, brightway-faq-data, pypi-bw2data]
related: [classes.md, gotchas.md, ../../commands.md]
---

# bw2data commands

`bw2data` 4.7 installs no shell command: its distribution declares an empty entry-point
list, checked with `importlib.metadata` on 2026-09-21. Everything below is Python, with
the conventional import `import bw2data as bd` (source: brightway-cheatsheet).

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw2data` has no console script. The `bw2-...` commands belong to the Brightway 2 line. | n/a |

## Notebook entry points

### Projects

| Call | What it does |
|---|---|
| `bd.projects.current` | The name of the active project. |
| `bd.projects.set_current('<name>')` | Switches to it, creating it when it does not exist. |
| `sorted(bd.projects)` | Every project. |
| `bd.projects.copy_project('<new>')` | Copies the active project under a new name. |
| `bd.projects.rename_project('<new>')` | Renames the active project. |
| `bd.projects.delete_project('<name>', delete_dir=True)` | Removes the project; with `delete_dir=False` only the name goes and the data stays. |
| `bd.projects.dir`, `bd.projects.logs_dir` | Where the data and the logs of the active project are. |
| `bd.projects.migrate_project_25()` | Reprocesses every database and impact category so a Brightway 2 project works under 2.5. |

### Databases

| Call | What it does |
|---|---|
| `sorted(bd.databases)` | Every database in the project. |
| `'<name>' in bd.databases` | Whether one is installed. |
| `db = bd.Database('<name>')` | The database object. |
| `db.metadata['backend']` | Which storage engine it uses: `sqlite`, `iotable` or `multifunctional`. |
| `db.copy('<new>')`, `db.rename('<new>')` | Copy or rename it. |
| `del bd.databases['<name>']` | Delete it. |
| `db.search('<query>')` | Full-text search, if the database is searchable. |
| `db.datapackage()` | The `bw_processing` datapackage of the current state. |
| `db.process()` | Rewrite that datapackage from the SQLite rows. |
| `db.nodes_to_dataframe()`, `db.edges_to_dataframe()` | The database as pandas frames. |

### Nodes and edges

| Call | What it does |
|---|---|
| `bd.get_node(name='<n>', location='<l>')` | Exactly one node; raises when zero or several match. |
| `db.random()` | One node at random. |
| `for node in db: ...` | Iterate the database; the usual way to filter with a comprehension. |
| `node.as_dict()` | Every attribute of the node. |
| `node['<key>'] = value; node.save()` | Change one. |
| `db.new_node(**attrs).save()` | Create a node. |
| `node.technosphere()`, `node.biosphere()`, `node.production()`, `node.edges()` | The edges of a node, filtered by kind. |
| `node.consumers()`, `node.upstream()` | The edges that consume this node. |
| `node.new_edge(**attrs).save()` | Create an edge; `type`, `amount` and `input` are required. |
| `edge.input`, `edge.output`, `edge.amount` | The ends and the value of an edge. |
| `edge.delete()` | Remove it. |

### Impact assessment data

| Call | What it does |
|---|---|
| `sorted(bd.methods)` | Every impact category in the project. |
| `bd.methods.random()` | One at random. |
| `m = bd.Method(('<impact>', '<category>'))` | The impact category object. |
| `list(m)` | Its factors, as `(flow, factor)` or `(flow, factor, location)` tuples. |
| `m.write(data)` | Write a new set of factors. |
| `m.metadata['<key>'] = value` | Change its metadata. |

### Preparing a calculation

| Call | What it does |
|---|---|
| `fu, objs, _ = bd.prepare_lca_inputs({node: 1}, method=('<impact>', '<category>'))` | The demand and the datapackages for a single calculation. |
| `objs = bd.get_multilca_data_objs(functional_units, method_config)` | The same for a `MultiLCA`. |
| `bd.calculation_setups['<name>'] = {...}` | Save a set of functional units and impact categories for later. |

### Parameters

| Call | What it does |
|---|---|
| `bd.parameters.new_project_parameters(data)` | Define parameters visible to the whole project. |
| `bd.parameters.new_database_parameters(data, '<db>')` | Define them for one database. |
| `bd.parameters.new_activity_parameters(data, '<group>')` | Define them for a group of activities. |
| `bd.parameters.add_exchanges_to_group('<group>', activity)` | Let the group's formulas drive that activity's edges. |
| `bd.parameters.recalculate()` | Re-evaluate every formula and write the new amounts. |

The formula evaluation itself is `bw2parameters`; see [../bw2parameters/](../bw2parameters/).

### Where the data is

`bd.projects.dir` answers it for the active project. The data directory is chosen per
platform, and can be moved with the `BRIGHTWAY2_DIR` environment variable, which the
documentation does not recommend for beginners (source: brightway-faq-data).
