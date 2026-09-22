---
title: bw2analyzer classes and functions
type: module-page
summary: The analysis classes and print helpers of bw2analyzer 0.11.8.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2analyzer, bw2analyzer-docs]
related: [README.md, commands.md, gotchas.md]
---

# bw2analyzer classes and functions

The names below are the public namespace of the installed version 0.11.8, read with
`dir(bw2analyzer)` on 2026-09-21, plus the module-level functions the package keeps
un-exported but documented.

## The classes

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `ContributionAnalysis` | class | Ranks the processes and elementary flows behind a solved `LCA`. | `ba.ContributionAnalysis().annotated_top_processes(lca)` |
| `DatabaseHealthCheck` | class | Looks for structural problems in a whole database. | `ba.DatabaseHealthCheck('<database>').check()` |
| `PageRank` | class | Ranks nodes by their position in the technosphere graph. | `ba.PageRank('<database>').calculate()` |
| `GTManipulator` | class | Simplifies, unrolls and annotates a graph traversal result. | `ba.GTManipulator.simplify(...)` |

## The functions

| Name | What it is for | Invoked by |
|---|---|---|
| `print_recursive_calculation(activity, lcia_method, ...)` | Walks the supply chain and prints each branch with its share of the total score, its absolute score and the amount. | `ba.print_recursive_calculation(act, method)` |
| `print_recursive_supply_chain(activity, ...)` | The same walk without scores; exploration only. | `ba.print_recursive_supply_chain(act)` |
| `compare_activities_by_lcia_score(activities, lcia_method, band=0.1)` | Says whether the activities are substantially different, meaning all scores lie within `band` of the maximum. | `ba.compare_activities_by_lcia_score([...], method)` |
| `compare_activities_by_grouped_leaves(activities, lcia_method, ...)` | Compares activities by the impact of their inputs, aggregated by the product classification of those inputs; returns a list or a dataframe. | `ba.compare_activities_by_grouped_leaves([...], method)` |
| `find_differences_in_inputs(activity, ...)` | Whether other activities with the same name and reference product have the same input levels. | `ba.find_differences_in_inputs(act)` |
| `traverse_tagged_databases(functional_unit, method, label='tag', ...)` | Traverses the foreground and groups impact by a label on the nodes. | `ba.traverse_tagged_databases(fu, method)` |

## What ContributionAnalysis gives you

Methods, read from the installed 0.11.8: `top_processes`, `top_emissions`, `top_matrix`,
`annotated_top_processes`, `annotated_top_emissions`, `annotate`, `sort_array`,
`get_name`, `hinton_matrix`, `d3_treemap`.

The `annotated_*` variants return names beside the numbers, which is what you want in a
notebook; the plain variants return arrays.

`DatabaseHealthCheck` gives `check`, `aggregated_processes`, `multioutput_processes`,
`no_self_production`, `unique_exchanges`, `uncertainty_check`, `page_rank` and
`make_graphs`.

`GTManipulator` gives `simplify`, `simplify_naive`, `unroll_graph`, `add_metadata`,
`d3_treemap` and `d3_force_directed`.

## Options worth knowing

`print_recursive_calculation` takes `amount`, `max_level`, `cutoff`, `string_length`,
`file_obj`, `tab_character` and `use_matrix_values`, read from the installed 0.11.8. The
defaults are `max_level=3` and `cutoff=0.01`, so branches below one per cent of the score
are not printed; raise them when a supply chain looks suspiciously flat.

`compare_activities_by_grouped_leaves` takes `mode` (`relative` or otherwise),
`max_level`, `cutoff`, `output_format` and `str_length`.

## Notes

- `print_recursive_supply_chain` says in its own docstring that it is for exploration and
  points at a better performing traversal function. In the 2.5 line that traversal lives
  in [../bw_graph_tools/](../bw_graph_tools/), not in `bw2calc`.
- The module also carries inequality measures in `econ.py` (`gini_coefficient`,
  `herfindahl_index`, `concentration_ratio`, `theil_index`) and a serialisable report
  class in `report.py`; neither is re-exported at package level.
