**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.graph_objects` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_graph_tools==0.10'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
cat > cfg.yml <<'YML'
processors:
  - type: filter
    documented_only: false
    expression: "type(obj).__name__ != 'Indirection' and default()"
  - type: smart
renderer:
  type: markdown
  render_toc: false
YML
uvx --python 3.11 --from pydoc-markdown==4.8.2 pydoc-markdown \
  -I "$SP" -m bw_graph_tools.graph_traversal.graph_objects cfg.yml > bw_graph_tools.graph_traversal.graph_objects.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.graph_objects"></a>

# bw\_graph\_tools.graph\_traversal.graph\_objects

<a id="bw_graph_tools.graph_traversal.graph_objects.Node"></a>

## Node Objects

```python
@dataclass
class Node()
```

A visited activity in a supply chain graph. Although our graph is cyclic, we treat each
activity as a separate node every time we visit it.

Parameters
----------
unique_id : int
    A unique integer id for this visit to this activity node
activity_datapackage_id : int
    The id that identifies this activity in the datapackage, and hence in the database
activity_index : int
    The technosphere matrix column index of this activity
reference_product_datapackage_id : int
    The id that identifies the reference product of this activity in the datapackage
reference_product_index : int
    The technosphere matrix row index of this activity's reference product
reference_product_production_amount : float
    The *net* production amount of this activity's reference product
depth : int
    Depth in the supply chain graph, starting from 0 as the functional unit
supply_amount : float
    The amount of the *activity* (not reference product!) needed to supply the demand from the
    requesting supply chain edge.
cumulative_score : float
    Total LCIA score attributed to `supply_amount` of this activity, including impacts from
    direct emissions.
direct_emissions_score : float
    Total LCIA score attributed only to the direct characterized biosphere flows of
    `supply_amount` of this activity.
direct_emissions_score_outside_specific_flows : float
    The score attributable to *direct emissions* of this node which isn't broken out into
    separate `Flow` objects.
remaining_cumulative_score_outside_specific_flows : float
    The *cumulative* score of this node, including direct emissions, which isn't broken out
    into separate `Flow` objects.
terminal : bool
    Boolean flag indicating whether graph traversal was cutoff at this node

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.unique_id"></a>

#### unique\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.activity_datapackage_id"></a>

#### activity\_datapackage\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.activity_index"></a>

#### activity\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.reference_product_datapackage_id"></a>

#### reference\_product\_datapackage\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.reference_product_index"></a>

#### reference\_product\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.reference_product_production_amount"></a>

#### reference\_product\_production\_amount

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.depth"></a>

#### depth

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.supply_amount"></a>

#### supply\_amount

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.cumulative_score"></a>

#### cumulative\_score

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.direct_emissions_score"></a>

#### direct\_emissions\_score

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.max_depth"></a>

#### max\_depth

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.direct_emissions_score_outside_specific_flows"></a>

#### direct\_emissions\_score\_outside\_specific\_flows

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.remaining_cumulative_score_outside_specific_flows"></a>

#### remaining\_cumulative\_score\_outside\_specific\_flows

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.terminal"></a>

#### terminal

<a id="bw_graph_tools.graph_traversal.graph_objects.Node.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes"></a>

## GroupedNodes Objects

```python
@dataclass
class GroupedNodes()
```

A group of nodes

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.nodes"></a>

#### nodes

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.label"></a>

#### label

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.unique_id"></a>

#### unique\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.depth"></a>

#### depth

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.supply_amount"></a>

#### supply\_amount

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.cumulative_score"></a>

#### cumulative\_score

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.direct_emissions_score"></a>

#### direct\_emissions\_score

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.max_depth"></a>

#### max\_depth

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.direct_emissions_score_outside_specific_flows"></a>

#### direct\_emissions\_score\_outside\_specific\_flows

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.terminal"></a>

#### terminal

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.activity_index"></a>

#### activity\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.GroupedNodes.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge"></a>

## Edge Objects

```python
@dataclass
class Edge()
```

An edge between two `Node` instances. The `amount` is the amount of the product demanded by the
`consumer`.

Parameters
----------
consumer_index : int
    The matrix column index of the consuming activity
consumer_unique_id : int
    The traversal-specific unique id of the consuming activity
producer_index : int
    The matrix column index of the producing activity
producer_unique_id : int
    The traversal-specific unique id of the producing activity
product_index : int
    The matrix row index of the consumed product
amount : float
    The amount of the product demanded by the consumer. Not scaled to producer production
    amount.

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.consumer_index"></a>

#### consumer\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.consumer_unique_id"></a>

#### consumer\_unique\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.producer_index"></a>

#### producer\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.producer_unique_id"></a>

#### producer\_unique\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.product_index"></a>

#### product\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Edge.amount"></a>

#### amount

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow"></a>

## Flow Objects

```python
@dataclass
class Flow()
```

A characterized biosphere flow associated with a given `Node` instance.

Parameters
----------
flow_datapackage_id : int
    The id that identifies the biosphere flow in the datapackage
flow_index : int
    The matrix row index of the biosphere flow
activity_unique_id : int
    The `Node.unique_id` of this instance of the emitting activity
activity_id : int
    The id that identifies the emitting activity in the datapackage
activity_index : int
    The matrix column index of the emitting activity
amount : float
    The amount of the biosphere flow being emitting by this activity instance
score : float
    The LCIA score for `amount` of this biosphere flow

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.flow_datapackage_id"></a>

#### flow\_datapackage\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.flow_index"></a>

#### flow\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.activity_unique_id"></a>

#### activity\_unique\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.activity_id"></a>

#### activity\_id

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.activity_index"></a>

#### activity\_index

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.amount"></a>

#### amount

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.score"></a>

#### score

<a id="bw_graph_tools.graph_traversal.graph_objects.Flow.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```
