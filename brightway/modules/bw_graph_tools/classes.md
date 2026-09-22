---
title: bw_graph_tools classes and functions
type: module-page
summary: The public surface of bw_graph_tools 0.10, from traversal classes to path helpers.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo]
---

# bw_graph_tools classes and functions

Hand-written companion to the generated `api/` folder. Names, signatures and method
lists were read by importing bw_graph_tools 0.10 from PyPI and inspecting `__all__` and
the classes (source: pypi-bw-graph-tools); the descriptions follow the repository
README and the docstrings (source: bw-graph-tools-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `NewNodeEachVisitGraphTraversal` | class | The default traversal: one node record per visit, so two paths to the same activity are two records | `NewNodeEachVisitGraphTraversal.calculate(lca, settings)` |
| `SameNodeEachVisitGraphTraversal` | class | A stateful traversal that records each node once, however often it is reached | same shape |
| `AssumedDiagonalGraphTraversal` | class | Traversal for a system whose production exchanges sit on the diagonal | same shape |
| `NewNodeEachVisitTaggedGraphTraversal` | class | The default traversal with leaf nodes grouped by tag | same shape, with tagged settings |
| `SameNodeEachVisitTaggedGraphTraversal` | class | The tagged variant of the stateful traversal | same shape |
| `GraphTraversalSettings` | class | Cutoffs and limits for a traversal | `GraphTraversalSettings(cutoff=0.005, max_calc=1000)` |
| `TaggedGraphTraversalSettings` | class | The same, plus the functional unit tag | used with the tagged classes |
| `Node` | dataclass | One visited activity, with its supply amount and its scores | returned in `.nodes` |
| `Edge` | dataclass | One edge between two visited nodes, with the amount demanded | returned in `.edges` |
| `Flow` | dataclass | One characterised biosphere flow attached to a visited node | returned in `.flows` |
| `guess_production_exchanges` | function | Heuristically identify production exchanges in a mapped technosphere matrix | `guess_production_exchanges(mapped_matrix)` |
| `to_normalized_adjacency_matrix` | function | Turn a Brightway technosphere matrix into a normalised adjacency matrix | `to_normalized_adjacency_matrix(matrix)` |
| `get_path_from_matrix` | function | The path from a source index to a target index carrying the most flow | `get_path_from_matrix(matrix, source, target)` |
| `path_as_brightway_objects` | function | The same path expressed as Brightway exchanges | `path_as_brightway_objects(source_activity, target_activity, lca=None)` |

## Traversal settings

`GraphTraversalSettings` is a pydantic model. Its fields and defaults, read from the
class:

| Field | Default | What it controls |
|---|---|---|
| `cutoff` | 0.005 | the share of the total score below which a branch is not followed |
| `biosphere_cutoff` | 0.0001 | the share below which a biosphere flow is not recorded separately |
| `max_calc` | 1000 | the hard cap on the number of calculations |
| `max_depth` | none | an optional depth limit |
| `skip_coproducts` | false | whether to ignore coproduct edges |
| `separate_biosphere_flows` | true | whether to record biosphere flows as their own records |
| `caching_solver` | none | an optional solver that reuses factorisations |
| `min_coverage_fraction` | 0.9 | the share of the score the traversal aims to explain |

`TaggedGraphTraversalSettings` adds the tag used for the functional unit.

## Traversal classes

All the traversal classes expose the same members: `calculate`, `traverse`,
`traverse_edges`, `nodes`, `edges`, `flows`, `calculation_count`,
`exceeded_calculation_count`, `add_biosphere_flows`, `get_characterized_biosphere`,
`get_demand_vector_for_activity` and `get_production_exchanges`. The stateful variant
adds `traverse_from_node`; the tagged variants add `group_nodes_by_tags`,
`group_leaf_nodes_by_parent`, `create_group_tagged_nodes` and
`generate_id_for_grouped_node`.

```python
from bw_graph_tools import NewNodeEachVisitGraphTraversal, GraphTraversalSettings

result = NewNodeEachVisitGraphTraversal.calculate(
    lca, settings=GraphTraversalSettings(cutoff=0.01, max_calc=500)
)
result.nodes, result.edges, result.flows
```

## Result objects

`Node` carries `unique_id`, the datapackage and matrix indices of the activity and its
reference product, the reference product production amount, `depth`, `supply_amount`,
`cumulative_score`, `direct_emissions_score`, the two "outside specific flows"
variants, `max_depth` and `terminal`.

`Edge` carries the consumer index and unique id, the producer index and unique id, the
product index and the `amount` of the product demanded.

`Flow` carries the flow's datapackage id and index, the activity's unique id, id and
index, the `amount` and the characterised `score`.

`unique_id` is what makes the new-node-each-visit behaviour usable: it is per visit,
not per activity, so `Edge` records join visits rather than activities.

## Notes

- Traversal is much slower than solving the matrix, and is the right tool only when you
  need per-path information that the solution cannot carry
  (source: bw-graph-tools-repo).
- `guess_production_exchanges` is a heuristic with six numbered rules. It exists for
  datapackages that do not label production exchanges, and its result should be
  checked rather than trusted.
- `bw_graph_tools.testing` exposes `node_equal_dict`, `edge_equal_dict`,
  `flow_equal_dict` and `equal_dict`, for comparing results in a downstream test suite.
