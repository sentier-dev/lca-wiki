---
title: bw_graph_tools commands
type: module-page
summary: bw_graph_tools has no command line; traversal runs from Python.
audience: [P1]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo]
---

# bw_graph_tools commands

bw_graph_tools 0.10 installs **no console script**. The wheel published on PyPI
contains no `entry_points.txt`, checked by reading the wheel's metadata directly
(source: pypi-bw-graph-tools).

| Command | What it does | Key options |
|---|---|---|
| none | the library is called from Python only | not applicable |

## Notebook entry points

### Traversing a solved system

```python
import bw2calc as bc
from bw_graph_tools import NewNodeEachVisitGraphTraversal, GraphTraversalSettings

lca = bc.LCA(demand, method)
lca.lci()
lca.lcia()

result = NewNodeEachVisitGraphTraversal.calculate(
    lca,
    settings=GraphTraversalSettings(cutoff=0.01, biosphere_cutoff=0.001, max_calc=500),
)

result.nodes          # one record per visit
result.edges          # the edges between those visits
result.flows          # characterised biosphere flows, when separate_biosphere_flows is on
result.calculation_count
result.exceeded_calculation_count
```

### Visiting each activity once instead

```python
from bw_graph_tools import graph_traversal

result = graph_traversal.SameNodeEachVisitGraphTraversal.calculate(lca, settings=settings)
```

### Grouping leaves by tag

```python
from bw_graph_tools.graph_traversal import (
    NewNodeEachVisitTaggedGraphTraversal,
    TaggedGraphTraversalSettings,
)

result = NewNodeEachVisitTaggedGraphTraversal.calculate(
    lca, settings=TaggedGraphTraversalSettings(...)
)
result.group_nodes_by_tags(...)
```

### Finding the path between two activities

```python
from bw_graph_tools import get_path_from_matrix, path_as_brightway_objects

indices = get_path_from_matrix(lca.technosphere_matrix, source=source_index, target=target_index)
exchanges = path_as_brightway_objects(source_activity, target_activity, lca=lca)
```

### Guessing production exchanges

```python
from bw_graph_tools import guess_production_exchanges

rows, cols = guess_production_exchanges(mapped_matrix)
```

## Turning a result into a table

`Node`, `Edge` and `Flow` are dataclasses, so a result goes straight into a dataframe
without a custom serialiser. That is the usual next step: sort nodes by
`cumulative_score` or `direct_emissions_score` and read off where the impact sits.
