---
title: bw2analyzer commands
type: module-page
summary: The calls that explain a finished LCA result.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw2analyzer, brightway-cheatsheet, bw2analyzer-docs]
related: [classes.md, gotchas.md, ../../commands.md]
---

# bw2analyzer commands

`bw2analyzer` 0.11.8 installs no shell command: its distribution declares an empty
entry-point list, checked with `importlib.metadata` on 2026-09-21. The calls below use
`import bw2analyzer as ba`, the convention of the cheat sheet
(source: brightway-cheatsheet).

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw2analyzer` has no console script. | n/a |

## Notebook entry points

### Reading a supply chain

| Call | What it does |
|---|---|
| `ba.print_recursive_calculation(activity, method)` | Prints the supply chain with each branch's share of the score. |
| `ba.print_recursive_calculation(activity, method, max_level=5, cutoff=0.005)` | Deeper, and showing smaller branches. |
| `ba.print_recursive_calculation(activity, method, file_obj=open('out.txt', 'w'))` | The same into a file. |
| `ba.print_recursive_supply_chain(activity)` | The structure without scores. |

### Ranking contributions

```python
ca = ba.ContributionAnalysis()
ca.annotated_top_processes(lca)
ca.annotated_top_emissions(lca)
```

| Call | What it does |
|---|---|
| `ca.annotated_top_processes(lca)` | The processes that dominate the score, with names. |
| `ca.annotated_top_emissions(lca)` | The elementary flows that dominate it. |
| `ca.top_processes(matrix)`, `ca.top_emissions(matrix)` | The same as arrays. |
| `ca.top_matrix(matrix)` | The largest cells of a result matrix. |
| `ca.hinton_matrix(lca)` | A Hinton-style plot of the result. |

The `lca` argument is a `bw2calc` object on which `lci()` and `lcia()` have already been
called; see [../bw2calc/commands.md](../bw2calc/commands.md).

### Comparing activities

| Call | What it does |
|---|---|
| `ba.compare_activities_by_lcia_score(activities, method, band=0.1)` | Whether they differ substantially. |
| `ba.compare_activities_by_grouped_leaves(activities, method, output_format='pandas')` | Where their impacts come from, grouped by input classification. |
| `ba.find_differences_in_inputs(activity)` | Whether near-identical activities have different input levels. |

### Grouping by a tag

```python
for node in bd.Database('<db>'):
    node['tag'] = 'use phase'
    node.save()

ba.traverse_tagged_databases({node: 1}, method, label='tag')
```

| Call | What it does |
|---|---|
| `ba.traverse_tagged_databases(fu, method, label='<field>')` | Impact grouped by that field's value. |
| `ba.traverse_tagged_databases(fu, method, default_tag='other', fg_databases=[...])` | Restricting the traversal to named foreground databases. |

### Checking a database

| Call | What it does |
|---|---|
| `ba.DatabaseHealthCheck('<database>').check()` | Runs every structural check and returns the findings. |
| `ba.PageRank('<database>').calculate()` | Ranks nodes by their position in the graph. |
