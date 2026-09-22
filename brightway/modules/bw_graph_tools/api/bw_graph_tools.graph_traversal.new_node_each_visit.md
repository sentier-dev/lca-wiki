**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.new_node_each_visit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_graph_tools.graph_traversal.new_node_each_visit cfg.yml > bw_graph_tools.graph_traversal.new_node_each_visit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.new_node_each_visit"></a>

# bw\_graph\_tools.graph\_traversal.new\_node\_each\_visit

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal"></a>

## NewNodeEachVisitGraphTraversal Objects

```python
class NewNodeEachVisitGraphTraversal(BaseGraphTraversal[GraphTraversalSettings]
                                     )
```

Traverse a supply chain, following paths of greatest impact.

This implementation uses a queue of datasets to assess. As the supply chain is traversed,
activities are added to a list sorted by LCA score. Each activity in the sorted list is
assessed, and added to the supply chain graph, as long as its impact is above a certain
threshold, and the maximum number of calculations has not been exceeded.

Because the next dataset assessed is chosen by its impact, not its position in the graph, this
is neither a breadth-first nor a depth-first search, but rather "importance-first".

Priority-first traversal (i.e. follow the past of highest score) of the supply chain graph.
This class unrolls the graph, i.e. every time it arrives at a given activity, it treats
it as a separate node in the graph.

In contrast with previous graph traversal implementations, we do not assume reference
production exchanges are on the diagonal. It should also correctly handle the following:

* Functional unit has more than one link to a given product
* Non-unitary reference production amounts
* Negative reference production amounts
* Co-production edge traversal, if desired. Requires co-products to be substituted (can be
    implicit substitution).

You must provide an `lca_object` which is already instantiated, and for which you have
already done LCI and LCIA calculations. The `lca_object` does not have to be an instance of
`bw2calc.LCA`, but it needs to support the following methods and attributes:

* `technosphere_matrix`
* `technosphere_mm`
* `demand`

You can subclass `NewNodeEachVisitGraphTraversal` and redefine
`get_characterized_biosphere` if your LCA class does not have a traditional
`characterization_matrix` and `biosphere_matrix`. For example, regionalization has its
own characterization framework without a single `characterization_matrix`.

Without further manipulation, the results will have double counting if you add all scores
together. Specifically, each `Node` has both a `cumulative_score` and a
`direct_emissions_score`; the `cumulative_score` **includes** the `direct_emissions_score`.
See the following attributes of the `Node` object to find the numbers you are looking for
in your specific case:

* cumulative_score
* direct_emissions_score
* direct_emissions_score_outside_specific_flows
* remaining_cumulative_score_outside_specific_flows

.. warning:: Graph traversal with multioutput processes only works when other inputs are
    substituted (see `Multioutput processes in LCA <http://chris.mutel.org/multioutput.html>`__
    for a description of multiputput process math in LCA).

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.calculate"></a>

#### calculate

```python
@classmethod
@deprecated(
    "Use `NewNodeEachVisitGraphTraversal(lca, settings)` instead of `NNEVGT().calculate(stuff)`"
)
def calculate(cls,
              lca_object: LCA,
              cutoff: Optional[float] = 5e-3,
              biosphere_cutoff: Optional[float] = 1e-4,
              max_calc: Optional[int] = 1000,
              max_depth: Optional[int] = None,
              skip_coproducts: Optional[bool] = False,
              separate_biosphere_flows: Optional[bool] = True,
              static_activity_indices: Optional[set[int]] = set(),
              functional_unit_unique_id: Optional[int] = -1) -> dict
```

Priority-first traversal (i.e. follow the past of highest score) of the supply chain graph.
This class unrolls the graph, i.e. every time it arrives at a given activity, it treats
it as a separate node in the graph.

In contrast with previous graph traversal implementations, we do not assume reference
production exchanges are on the diagonal. It should also correctly handle the following:

* Functional unit has more than one link to a given product
* Non-unitary reference production amounts
* Negative reference production amounts
* Co-production edge traversal, if desired. Requires co-products to be substituted (can be
    implicit substitution).

You must provide an `lca_object` which is already instantiated, and for which you have
already done LCI and LCIA calculations. The `lca_object` does not have to be an instance of
`bw2calc.LCA`, but it needs to support the following methods and attributes:

* `technosphere_matrix`
* `technosphere_mm`
* `solve_linear_system()`
* `demand`
* `demand_array`

You can subclass `NewNodeEachVisitGraphTraversal` and redefine
`get_characterized_biosphere` if your LCA class does not have a traditional
`characterization_matrix` and `biosphere_matrix`. For example, regionalization has its
own characterization framework without a single `characterization_matrix`.

The return object is a dictionary with four values.

* `nodes` is a dictionary of visited **activities**; the keys in this dictionary are
    unique increasing integer ids (not related to any other ids or indices), and values are
    instances of the `Node` dataclass. Each `Node` has a `unique_id`, as every time we
    arrive at an activity (even if we have seen it before via another branch of the supply
    chain), we create a new `Node` object with a unique id. See the `Node` documentation
    for its other attributes.
* `edges` is a list of `Edge` instances. Edges link two `Node` instances (but not `Flow`
    instances, that is handled separately). The `Edge` amount is the amount demanded of
    the producer at that point in the supply chain, scaled to the amount of the producer
    requested.
* `flows` is a list of `Flow` instances; biosphere flows are linked to a particular `Node`.
    We apply the `biosphere_cutoff` to determine if individual biosphere flows should
    be stored separately. Will be empty is `separate_biosphere_flows` is false.

Finally, `calculation_count` gives the total number of inventory calculations performed.

Without further manipulation, the results will have double counting if you add all scores
together. Specifically, each `Node` has both a `cumulative_score` and a
`direct_emissions_score`; the `cumulative_score` **includes** the `direct_emissions_score`.
See the following attributes of the `Node` object to find the numbers you are looking for
in your specific case:

* cumulative_score
* direct_emissions_score
* direct_emissions_score_outside_specific_flows
* remaining_cumulative_score_outside_specific_flows

Parameters
----------
lca_object : bw2calc.LCA
    Already instantiated `LCA` object with inventory and impact
    assessment calculated.
cutoff : float
    Cutoff value used to stop graph traversal. Fraction of total score,
    should be in `(0, 1)`
biosphere_cutoff : float
    Cutoff value used to determine if a separate biosphere node is
    added. Fraction of total score.
max_calc : int
    Maximum number of inventory calculations to perform
max_depth : int
    Maximum depth in the supply chain traversal. Default is no maximum.
skip_coproducts : bool
    Don't traverse co-production edges, i.e. production edges other
    than the reference product
separate_biosphere_flows : bool
    Add separate `Flow` nodes for important individual biosphere
    emissions
static_activity_indices : set
    A set of activity matrix indices which we don't want the graph to
    traverse - i.e. we stop traversal when we hit these nodes, but
    still add them to the returned `nodes` dictionary, and calculate
    their direct and cumulative scores.
functional_unit_unique_id : int
    An integer id we can use for the functional unit virtual activity.
    Shouldn't overlap any other activity ids. Don't change unless you
    really know what you are doing.

Returns
-------
dict
    Dictionary with keys `nodes`, `edges`, `flows`, `calculation_counter`

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.calculation_count"></a>

#### calculation\_count

```python
@property
def calculation_count()
```

gives the total number of inventory calculations performed.

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.traverse"></a>

#### traverse

```python
def traverse(nodes: Optional[List[Node]] = None,
             depth: Optional[int] = None,
             reset_results: bool = False) -> None
```

Perform the graph traversal following `NewNodeEachVisitGraphTraversal` logic.

If `nodes` is not specified, start at the given functional unit. If `nodes` is specified,
*only* traverse the graph starting from the given nodes. These nodes can be anywhere in the
supply chain.

Passing multiple `Node` objects in `nodes` must be done carefully. This function assumes
that all such nodes should be placed on the heap together. This means that we do
priority-first traversal based on the scores of these nodes - i.e. if node A has a much
higher score than B, it could be that the supply chain of B is never explored at all. To
avoid this behaviour, call `traverse()` separately with each input node.

Note that traversing from nodes which are already at or greater than `settings.max_depth`
will not do anything. `settings.max_depth` is a global maximum depth regardless of the value
pass as `depth`.

`depth` is *relative* to the depth of the given `nodes` - i.e. if the first node is at depth
7, and `depth` is 3, then *for that node*, we traverse up to depth 10. Relative depth is
calculated separately for each input node.

You may already have some results stored in `self.nodes`, `self.edges`, etc. Use
`reset_results` to purge this cache if you want to only see the results of this traversal.

The calculation count is reset each time `traverse()` is run.

Parameters
----------
nodes : List[Node]
    List of nodes to traverse. Uses the functional unit (`self._root_node`) as the default
depth : int
    Relative depth to traverse for each node provided up to `settings.max_depth`
reset_results : bool
    Reset `self.nodes`, `self.edges`, and `self.flows`.

Returns
-------
`None`
    Modifies the class object's state in-place

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.exceeded_calculation_count"></a>

#### exceeded\_calculation\_count

```python
@property
def exceeded_calculation_count()
```

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.traverse_edges"></a>

#### traverse\_edges

```python
def traverse_edges(*,
                   consumer_index: int,
                   consumer_unique_id: int,
                   consumer_max_depth: Optional[int],
                   product_indices: list[int],
                   product_amounts: list[float],
                   lca: LCA,
                   current_depth: int,
                   calculation_count: Counter,
                   characterized_biosphere: spmatrix,
                   matrix: spmatrix,
                   edges: list[Edge],
                   flows: list[Flow],
                   nodes: Dict[int, Node],
                   heap: list,
                   production_exchange_mapping: dict[int, int],
                   static_activity_indices: set[int],
                   separate_biosphere_flows: bool,
                   caching_solver: CachingSolver,
                   biosphere_cutoff_score: float,
                   cutoff_score: float,
                   max_depth: Optional[int] = None) -> None
```

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.get_characterized_biosphere"></a>

#### get\_characterized\_biosphere

```python
@classmethod
def get_characterized_biosphere(cls, lca: LCA) -> spmatrix
```

Pre-calculate the characterized biosphere matrix.

Broken out as a separate method because subclasses like regionalized
LCA could have more complicated characterization.

Parameters
----------
lca : bw2calc.LCA
    LCA class instance

Returns
-------
scipy.sparse.spmatrix
    Unmapped matrix of biosphere flows by activities.

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.get_production_exchanges"></a>

#### get\_production\_exchanges

```python
@classmethod
def get_production_exchanges(
        cls, mapped_matrix: mu.MappedMatrix) -> (np.array, np.array)
```

Get matrix row and column indices of productions exchanges by trying a
series of heuristics. See documentation for
``guess_production_exchanges``.

Broken out as a separate method because subclasses could change this logic.

Parameters
----------
mapped_matrix : matrix_utils.MappedMatrix
    A matrix and mapping data (from database ids to matrix indices)
    from the ``matrix_utils`` library. Normally built automatically by
    an ``LCA`` class. Should be the ``technosphere_matrix`` or
    equivalent.

Returns
-------
(numpy.array, numpy.array)
    The matrix row and column indices of the production exchanges.

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.add_biosphere_flows"></a>

#### add\_biosphere\_flows

```python
@classmethod
def add_biosphere_flows(cls, flows: list[Flow], matrix: spmatrix, lca: LCA,
                        node: Node, biosphere_cutoff_score: float) -> float
```

Add individual biosphere flows as `Flow` instances to `flow` if their score is above
`biosphere_cutoff_score`.

Parameters
----------
flows : list
    List of existing `Flow` instances
matrix : scipy.sparse.spmatrix
    Pre-calculated characterization times biosphere matrix
lca : bw2calc.LCA
    LCA class instance
node : `Node`
    Node whose direct biosphere flows we are examining
biosphere_cutoff_score : float
    Score below which individual characterized biosphere flows are ignored

Returns
-------
The total LCIA score broken out to separate `Flow` instances

<a id="bw_graph_tools.graph_traversal.new_node_each_visit.NewNodeEachVisitGraphTraversal.get_demand_vector_for_activity"></a>

#### get\_demand\_vector\_for\_activity

```python
def get_demand_vector_for_activity(
        node: Node, skip_coproducts: bool,
        matrix: spmatrix) -> (list[int], list[float])
```
