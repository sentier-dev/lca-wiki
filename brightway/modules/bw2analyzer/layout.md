---
title: bw2analyzer layout
type: module-page
summary: How the bw2analyzer package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw2analyzer, bw2analyzer-docs]
related: [README.md, classes.md]
---

# bw2analyzer layout

The tree below is the installed package of version 0.11.8, walked on disk on 2026-09-21.
Twelve modules, no subpackages, no data.

```
bw2analyzer/
├── __init__.py          re-exports the analysis classes and the print helpers
├── contribution.py      ContributionAnalysis: top processes, top emissions, the top matrix
├── comparisons.py       compare_activities_by_lcia_score, compare_activities_by_grouped_leaves,
│                        find_differences_in_inputs
├── sc_graph.py          GTManipulator: simplify, unroll and annotate a traversal result
├── tagged.py            traverse_tagged_databases, impact grouped by a node label
├── utils.py             print_recursive_calculation, print_recursive_supply_chain and helpers
├── lci.py               get_labeled_inventory: a solved inventory as a named dataframe
├── health_check.py      DatabaseHealthCheck: aggregated and multi-output processes, duplicates
├── page_rank.py         PageRank over a database's technosphere graph, with ConvergenceError
├── matrix_grapher.py    SparseMatrixGrapher, a plot of a sparse matrix
├── econ.py              gini_coefficient, herfindahl_index, concentration_ratio, theil_index
├── report.py            SerializedLCAReport, a saveable summary of one calculation
└── version.py           the version tuple
```

## Key files

- `utils.py`: the two print functions live here, not in `lci.py`; they are the most used
  part of the package and the quickest way to understand a result.
- `contribution.py`: `ContributionAnalysis` is the programmatic counterpart: the same
  information as arrays and annotated lists.
- `comparisons.py`: the only part that works across several activities at once, and the
  most recently extended.
- `sc_graph.py`: written against the old `bw2calc` graph traversal; in the 2.5 line
  traversal itself lives in [../bw_graph_tools/](../bw_graph_tools/).
