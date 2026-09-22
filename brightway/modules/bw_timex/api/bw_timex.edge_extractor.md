**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.edge_extractor` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.edge_extractor cfg.yml > bw_timex.edge_extractor.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.edge_extractor"></a>

# bw\_timex.edge\_extractor

<a id="bw_timex.edge_extractor.datetime_type"></a>

#### datetime\_type

<a id="bw_timex.edge_extractor.timedelta_type"></a>

#### timedelta\_type

<a id="bw_timex.edge_extractor.Edge"></a>

## Edge Objects

```python
@dataclass
class Edge()
```

Class for storing a temporal edge with source and target.

Leaf edges link to a source process which is a leaf in
our graph traversal (either through cutoff or a filter
function).

<a id="bw_timex.edge_extractor.Edge.edge_type"></a>

#### edge\_type

<a id="bw_timex.edge_extractor.Edge.distribution"></a>

#### distribution

<a id="bw_timex.edge_extractor.Edge.leaf"></a>

#### leaf

<a id="bw_timex.edge_extractor.Edge.consumer"></a>

#### consumer

<a id="bw_timex.edge_extractor.Edge.producer"></a>

#### producer

<a id="bw_timex.edge_extractor.Edge.td_producer"></a>

#### td\_producer

<a id="bw_timex.edge_extractor.Edge.td_consumer"></a>

#### td\_consumer

<a id="bw_timex.edge_extractor.Edge.abs_td_producer"></a>

#### abs\_td\_producer

<a id="bw_timex.edge_extractor.Edge.abs_td_consumer"></a>

#### abs\_td\_consumer

<a id="bw_timex.edge_extractor.Edge.temporal_evolution"></a>

#### temporal\_evolution

<a id="bw_timex.edge_extractor.Edge.temporal_evolution_reference"></a>

#### temporal\_evolution\_reference

<a id="bw_timex.edge_extractor.Edge.cumulative_amount_producer"></a>

#### cumulative\_amount\_producer

<a id="bw_timex.edge_extractor.extract_temporal_evolution"></a>

#### extract\_temporal\_evolution

```python
def extract_temporal_evolution(exc_data: dict) -> dict | None
```

Read ``temporal_evolution`` data from an exchange's data dict.

Returns a ``{datetime: factor}`` dict, or ``None`` if the exchange carries
no temporal evolution. ``temporal_evolution_amounts`` are normalized to
factors using the exchange's base ``amount``. ``temporal_evolution_factors``
and ``temporal_evolution_amounts`` are mutually exclusive.

<a id="bw_timex.edge_extractor.load_temporal_distribution"></a>

#### load\_temporal\_distribution

```python
def load_temporal_distribution(value)
```

Restore a ``TemporalDistribution`` that was serialized with a loader.

<a id="bw_timex.edge_extractor.MergedExchange"></a>

## MergedExchange Objects

```python
class MergedExchange()
```

Stand-in for a single ``ExchangeDataset`` when several exchanges link the
same (input, output) pair. Exposes ``.data``, which is what the edge
extractors read from an exchange.

``netted_types`` marks the case where the duplicates have different types
(a process consuming its own product), so the technosphere matrix holds
their net rather than any single edge's amount. ``consuming_amount`` is
then the amount of the consuming part alone, which is what a traversal
following that input edge needs.

<a id="bw_timex.edge_extractor.MergedExchange.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data: dict, *, netted_types=False, consuming_amount=None)
```

<a id="bw_timex.edge_extractor.carries_temporal_information"></a>

#### carries\_temporal\_information

```python
def carries_temporal_information(exchange_data: dict) -> bool
```

Whether an exchange has a temporal distribution or temporal evolution.

<a id="bw_timex.edge_extractor.merge_duplicate_exchanges"></a>

#### merge\_duplicate\_exchanges

```python
def merge_duplicate_exchanges(exchange_datas: list[dict]) -> "MergedExchange"
```

Merge several exchanges between the same two nodes into one.

Multiple exchanges between the same pair of nodes are a legitimate
modelling choice, and common in ecoinvent/premise background data. The
technosphere matrix already holds their sum, so the merged exchange carries
the summed ``amount`` and the amount-weighted combination of the individual
temporal distributions (duplicates without one count as happening at
timedelta 0) and temporal evolutions.

<a id="bw_timex.edge_extractor.VariantBackgroundMixin"></a>

## VariantBackgroundMixin Objects

```python
class VariantBackgroundMixin()
```

Shared variant-aware (respective-variant) background-descent machinery.

The base graph traversal (priority or BFS) runs on ``base_lca``, which only
contains the *referenced* background variant. When descent continues INTO a
background process reached at a date that routes to a NON-referenced variant,
the respective variant's exchanges/amounts/TDs must be read from the bw2data
activity proxy (``self.bw_node_proxies``) rather than from the
(referenced-only) technosphere matrix or graph-traversal node objects.

Both ``EdgeExtractorBFS`` and the priority ``EdgeExtractor`` mix this in.
They differ in how they reach the first background crossing (matrix BFS vs.
``TemporalisLCA`` heap), but the variant split + the proxy-only descent
through the resulting variant subtree are identical, so they live here.

Mixers must provide:
- ``self.bw_node_proxies``: ``{activity_id: bw2data Activity proxy}``.
- ``self.database_dates_static``, ``self.interpolation_type``,
  ``self.interdatabase_activity_mapping`` (set by ``TimelineBuilder``).
- ``self.static_activity_indices`` (set; empty under traverse_background).
- ``self.variant_resolved_producers`` (set, collected during descent).
- ``self.cutoff`` and a ``self.edge_ff`` edge-filter callable.

<a id="bw_timex.edge_extractor.EdgeExtractor"></a>

## EdgeExtractor Objects

```python
class EdgeExtractor(VariantBackgroundMixin, TemporalisLCA)
```

Child class of TemporalisLCA that traverses the supply chain just as the parent class but can create a timeline of edges, in addition timeline of flows or nodes.

The edge timeline is then used to match the timestamp of edges to that of background
databases and to replace these edges with edges from these background databases
using Brightway Datapackages.

<a id="bw_timex.edge_extractor.EdgeExtractor.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args,
             edge_filter_function: Callable = None,
             traverse_background: bool = False,
             **kwargs) -> None
```

Initialize the EdgeExtractor class and traverses the supply chain using
functions of the parent class TemporalisLCA.

Parameters
----------
*args : Variable length argument list
edge_filter_function : Callable, optional
    A callable that filters edges. If not provided, a function that always
    returns False is used.
traverse_background : bool, optional
    Flag indicating whether to traverse background databases. Default is False.
**kwargs : Arbitrary keyword arguments

Returns
-------
None
    stores the output of the TemporalisLCA graph traversal (incl. relation of edges (edge_mapping) and nodes (node_mapping) in the instance of the class.

<a id="bw_timex.edge_extractor.EdgeExtractor.get_technosphere_exchange"></a>

#### get\_technosphere\_exchange

```python
def get_technosphere_exchange(input_id: int, output_id: int)
```

Look up the exchange between two nodes.

Overrides ``TemporalisLCA.get_technosphere_exchange``, which raises
``MultipleTechnosphereExchanges`` when several exchanges link the same
two nodes. That is a legitimate modelling choice and common in
background databases, so merge the duplicates into a single exchange
instead (see ``merge_duplicate_exchanges``).

<a id="bw_timex.edge_extractor.EdgeExtractor.build_edge_timeline"></a>

#### build\_edge\_timeline

```python
def build_edge_timeline() -> list
```

Creates a timeline of the edges from the output of the graph traversal.
Starting from the edges of the functional unit node, it goes through
each node using a heap, selecting the node with the highest impact first.
It, then, propagates the TemporalDistributions of the edges from node to
node through time using convolution-operators. It stops in case the current edge
is known to have no temporal distribution (=leaf) (e.g. part of background database).

Returns
-------
list
    A list of Edge instances with timestamps and amounts, and ids of its producing
    and consuming node.

<a id="bw_timex.edge_extractor.EdgeExtractor.join_datetime_and_timedelta_distributions"></a>

#### join\_datetime\_and\_timedelta\_distributions

```python
def join_datetime_and_timedelta_distributions(
        td_producer: TemporalDistribution,
        td_consumer: TemporalDistribution) -> TemporalDistribution
```

Joins a relative or absolute TemporalDistribution (td_producer) with an
absolute TemporalDistribution (td_consumer) to create a new
TemporalDistribution.

If the producer does not have a TemporalDistribution, the consumer's
TemporalDistribution is returned to continue the timeline.
If both the producer and consumer have TemporalDistributions, they are joined together.

Parameters
----------
td_producer : TemporalDistribution
    TemporalDistribution of the producer. Expected to be a timedelta or
    datetime TemporalDistribution.
td_consumer : TemporalDistribution
    TemporalDistribution of the consumer. Expected to be a datetime
    TemporalDistribution.

Returns
-------
TemporalDistribution
    A new TemporalDistribution that is the result of joining the producer
    and consumer TemporalDistributions.

Raises
------
ValueError
    If the dtype of `td_consumer.date` is not `datetime64[s]` or the dtype
    of `td_producer.date` is neither `datetime64[s]` nor `timedelta64[s]`.

<a id="bw_timex.edge_extractor.EdgeExtractorBFS"></a>

## EdgeExtractorBFS Objects

```python
class EdgeExtractorBFS(VariantBackgroundMixin)
```

Breadth-First-Search (BFS) graph traversal for extracting temporal edges from
the supply chain.

Unlike EdgeExtractor (which inherits from TemporalisLCA and uses priority-first
traversal with per-subgraph LCA calculations), this class works directly with
the technosphere matrix from a bw2calc LCA object and traverses using BFS.
This avoids the overhead of computing individual subgraph LCAs for priority
ordering.

Returns the same list[Edge] format as EdgeExtractor, so all downstream code
(TimelineBuilder, MatrixModifier, etc.) works unchanged.

<a id="bw_timex.edge_extractor.EdgeExtractorBFS.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca_object,
             starting_datetime: datetime | str = "now",
             edge_filter_function: Callable = None,
             cutoff: float = 1e-9,
             static_activity_indices: set[int] | None = None,
             nodes: dict | None = None,
             traverse_background: bool = False,
             max_calc: int = 1_000_000) -> None
```

<a id="bw_timex.edge_extractor.EdgeExtractorBFS.build_edge_timeline"></a>

#### build\_edge\_timeline

```python
def build_edge_timeline() -> list
```

Breadth-First-Search (BFS) traversal of the supply chain, extracting
temporal edges.

Returns a list of Edge instances compatible with the existing
EdgeExtractor output format.
