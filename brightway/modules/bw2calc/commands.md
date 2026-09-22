---
title: bw2calc commands
type: module-page
summary: The calls that run a calculation, all of them from Python.
audience: [P1]
updated: 2026-09-21
sources: [brightway-cheatsheet, pypi-bw2calc]
related: [classes.md, gotchas.md, ../../commands.md]
---

# bw2calc commands

`bw2calc` 2.5.0 installs no shell command: its distribution declares an empty entry-point
list, checked with `importlib.metadata` on 2026-09-21. The calls below use the
conventional imports `import bw2calc as bc` and `import bw2data as bd`
(source: brightway-cheatsheet).

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw2calc` has no console script. | n/a |

## Notebook entry points

### A single score

```python
fu, objs, _ = bd.prepare_lca_inputs({my_node: 42}, method=('<impact>', '<category>'))
lca = bc.LCA(demand=fu, data_objs=objs)
lca.lci()
lca.lcia()
lca.score
```

| Call | What it does |
|---|---|
| `bc.LCA(demand=fu, data_objs=objs)` | Builds the calculation object; nothing is solved yet. |
| `lca.lci()` | Solves the system and fills `lca.inventory`. |
| `lca.lcia()` | Characterises it and fills `lca.characterized_inventory`. |
| `lca.normalize()`, `lca.weight()` | The optional further steps, when their data was supplied. |
| `lca.score` | The single number. |
| `lca.to_dataframe(matrix_label="characterized_inventory")` | The largest entries as a dataframe. |
| `lca.switch_method(('<impact>', '<category>'))` then `lca.lcia()` | Another impact category without rebuilding the inventory. |
| `lca.redo_lci({other_node: 1})` | Another functional unit on the same matrices. |

### Going from a matrix index to a node

| Call | What it does |
|---|---|
| `lca.dicts.activity[node.id]` | Column index of a process. |
| `lca.dicts.product[node.id]` | Row index of a product in the technosphere matrix. |
| `lca.dicts.biosphere[flow.id]` | Row index of an elementary flow. |
| `bd.get_node(id=lca.dicts.activity.reversed[i])` | Back from an index to the node. |

### Many functional units at once

```python
functional_units = {"a": {node_1.id: 3.9}, "b": {node_2.id: 6.2}}
config = bc.MethodConfig(impact_categories=[('<impact>', '<a>')])
objs = bd.get_multilca_data_objs(functional_units, config)
lca = bc.MultiLCA(demands=functional_units, method_config=config, data_objs=objs)
lca.lci()
lca.lcia()
lca.scores
```

The keys of a `MultiLCA` functional unit must be integer node ids, not `Node` objects,
although a `Node` may be used as the label of a functional unit
(source: brightway-cheatsheet).

### Uncertainty

| Call | What it does |
|---|---|
| `bc.LCA(..., use_distributions=True)` | Draw from the probability distributions in the datapackages. |
| `bc.LCA(..., use_arrays=True)` | Use presampled columns instead, or as well. |
| `next(lca)` | New samples, new matrices, new solution. |
| `[lca.score for _ in zip(lca, range(10))]` | Ten iterations as a comprehension. |

### Running without a project

`data_objs` is a list of datapackages. They can come from `bd.prepare_lca_inputs(...)`,
from `db.datapackage()`, or from datapackages you built yourself with `bw_processing`,
which is how a calculation runs with no `bw2data` project at all. See
[../bw_processing/](../bw_processing/).
