---
title: bw_graph_tools layout
type: module-page
summary: How the bw_graph_tools package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo]
---

# bw_graph_tools layout

The installed package tree of bw_graph_tools 0.10, read from the wheel installed from
PyPI (source: pypi-bw-graph-tools).

```
bw_graph_tools/
├── __init__.py                     the public surface, re-exported through __all__
├── errors.py                       the exception types
├── matrix_tools.py                 guess_production_exchanges and its six heuristics,
│                                   plus to_normalized_adjacency_matrix
├── shortest_path.py                get_path_from_matrix and path_as_brightway_objects
├── graph_traversal_utils.py        helpers shared by the traversal classes
├── testing.py                      comparison helpers for Node, Edge and Flow in tests
└── graph_traversal/
    ├── __init__.py                 the traversal classes and settings, re-exported
    ├── base.py                     BaseGraphTraversal: the shared machinery
    ├── new_node_each_visit.py      the default traversal, one node record per visit
    ├── same_node_each_visit.py     the stateful variant that visits each node once
    ├── assumed_diagonal.py         the variant for systems with a diagonal production
    ├── tagged_nodes.py             the tagged traversals and GroupedNodes
    ├── graph_objects.py            Node, Edge and Flow
    ├── settings.py                 GraphTraversalSettings and TaggedGraphTraversalSettings
    └── utils.py                    traversal-specific helpers
```

## Key files

- `graph_traversal/new_node_each_visit.py` is the largest file and the default
  behaviour. Read it to understand what a `Node` record means: the same activity
  reached twice by different paths becomes two records.
- `graph_traversal/graph_objects.py` defines the three result dataclasses. Their fields
  are the vocabulary of every result table this package produces.
- `graph_traversal/settings.py` holds the cutoffs. Nothing about a traversal result can
  be interpreted without knowing which settings produced it.
- `matrix_tools.py` is independent of traversal: `guess_production_exchanges` works on
  a mapped matrix, and its heuristics are numbered so a caller can see which one fired.
- `shortest_path.py` is the other independent piece: a largest-flow path between two
  nodes, either as matrix indices or as Brightway exchange objects.
- `testing.py` is exported for downstream test suites, not for production code.

## Where it sits

Between `bw2calc`, which solves the system, and the tools that interpret a supply
chain: `bw_temporalis` subclasses the traversal to convolve temporal distributions, and
`bw_timex` builds on that in turn. See [../bw_temporalis/README.md](../bw_temporalis/README.md)
and [../bw_timex/README.md](../bw_timex/README.md).
