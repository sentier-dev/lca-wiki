---
title: bw_temporalis layout
type: module-page
summary: How the bw_temporalis package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo]
---

# bw_temporalis layout

The installed package tree of bw_temporalis 1.2.0, read from the wheel installed from
PyPI (source: pypi-bw-temporalis). It is a small package: eight files.

```
bw_temporalis/
├── __init__.py                 the public surface, re-exported through __all__
├── temporal_distribution.py    TemporalDistribution, FixedTD, FixedTimeOfYearTD, TDAware
├── convolution.py              the convolution of two distributions along a path
├── lca.py                      TemporalisLCA, the traversal that carries time
├── timeline.py                 Timeline and FlowTD: the dated result
├── utils.py                    the easy_* constructors and check_database_exchanges
└── lcia/
    ├── __init__.py
    └── climate.py              characterize_co2 and characterize_methane
```

## Key files

- `temporal_distribution.py` is the core. Everything else exists to build, combine or
  consume a `TemporalDistribution`. It also defines `TDAware`, the base class for
  callables that can be multiplied by a distribution.
- `convolution.py` is the mathematical heart: combining a distribution on an edge with
  the distribution already accumulated along the path.
- `lca.py` holds `TemporalisLCA`, which takes a solved `bw2calc.LCA` and a graph
  traversal class from `bw_graph_tools` and produces dated flows. The default traversal
  is `NewNodeEachVisitGraphTraversal`, which is exactly why traversal is needed here:
  the same activity reached by two paths happens at two different times. See
  [../bw_graph_tools/classes.md](../bw_graph_tools/classes.md).
- `timeline.py` turns those dated flows into something you can group, sum and plot.
- `lcia/climate.py` is the only characterisation code, and it is deliberately small:
  two functions, both returning a dataframe over a period.
- `utils.py` holds the constructors most users actually call, plus the database check.

## What it does not contain

No matrix building, no solver, no importer. It consumes a solved `LCA` object and the
traversal machinery of `bw_graph_tools`, and produces a timeline. Relinking to
different background vintages is `bw_timex`'s job; see
[../bw_timex/layout.md](../bw_timex/layout.md).
