**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_traversal.engine` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.graph_traversal.engine cfg.yml > activity_browser.bwutils.graph_traversal.engine.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_traversal.engine"></a>

# activity\_browser.bwutils.graph\_traversal.engine

Visit-based graph-traversal helpers for Tree and Sankey.

Qt-free. Unique-process (one box per process) lives in ``sankey``;
partition geometries live in ``partition_plots``; table flatten in ``tree``.
This module must not import those three.

<a id="activity_browser.bwutils.graph_traversal.engine.NodeId"></a>

#### NodeId

unique_id of a traversal Node

<a id="activity_browser.bwutils.graph_traversal.engine.suppress_graph_traversal_warnings"></a>

#### suppress\_graph\_traversal\_warnings

```python
@contextmanager
def suppress_graph_traversal_warnings()
```

Silence bw_graph_tools coverage ``UserWarning``s (coverage is shown in the UI).

<a id="activity_browser.bwutils.graph_traversal.engine.activity_metadata_for_ids"></a>

#### activity\_metadata\_for\_ids

```python
def activity_metadata_for_ids(
        ids: Iterable[int],
        dataframe: pd.DataFrame | None = None) -> dict[int, dict]
```

Map datapackage ids to labels from a MetaDataStore dataframe.

<a id="activity_browser.bwutils.graph_traversal.engine.build_parent_child_map"></a>

#### build\_parent\_child\_map

```python
def build_parent_child_map(nodes: dict,
                           edges: list) -> dict[NodeId, list[NodeId]]
```

Return a mapping of parent unique_id → list of child unique_ids.

The functional-unit root node (unique_id < 0 by convention) is included as
a key even when it has no children.

Parameters
----------
nodes:
    ``state.nodes`` dict — keys are ``unique_id`` integers.
edges:
    ``state.edges`` list — each edge has ``.consumer_unique_id`` (parent)
    and ``.producer_unique_id`` (child).

<a id="activity_browser.bwutils.graph_traversal.engine.cumulative_percent"></a>

#### cumulative\_percent

```python
def cumulative_percent(node, total_score: float) -> float
```

Return node.cumulative_score / total_score * 100, or 0.0 on zero total.

<a id="activity_browser.bwutils.graph_traversal.engine.direct_percent"></a>

#### direct\_percent

```python
def direct_percent(node, total_score: float) -> float
```

Return node.direct_emissions_score / total_score * 100, or 0.0 on zero total.

<a id="activity_browser.bwutils.graph_traversal.engine.compute_node_tiers"></a>

#### compute\_node\_tiers

```python
def compute_node_tiers(nodes: dict, edges: list,
                       root_uid: NodeId) -> dict[NodeId, int]
```

Assign display tier by graph distance from the functional-unit root.

The virtual demand node (``root_uid``) is omitted. Its direct children —
the reference-flow activities — are **tier 0**; their suppliers are
tier 1; and so on. This matches practitioner language ("tier-1 suppliers"
= first inputs to the reference flow) and ``CONTEXT.md``.

Do **not** use ``node.depth`` from ``bw_graph_tools`` after lazy
``traverse_from_node`` calls — that API resets the traversed node's depth
to 0, so children are incorrectly labelled.

<a id="activity_browser.bwutils.graph_traversal.engine.CANDIDATE_ADJUST_MODES"></a>

#### CANDIDATE\_ADJUST\_MODES

<a id="activity_browser.bwutils.graph_traversal.engine.direct_impact_coverage"></a>

#### direct\_impact\_coverage

```python
def direct_impact_coverage(nodes: dict,
                           total_score: float,
                           root_uid: NodeId | None = None) -> float
```

Σ(direct impact of visible nodes) / |total score|.

Returns 0.0 when ``total_score`` is zero or there are no visible nodes.

<a id="activity_browser.bwutils.graph_traversal.engine.coverage_of_uids"></a>

#### coverage\_of\_uids

```python
def coverage_of_uids(
        nodes: dict,
        uids: set[NodeId],
        total_score: float,
        *,
        direct_lookup: Callable[[NodeId], float] | None = None) -> float
```

Σ(direct impact of ``uids``) / |total score|.

<a id="activity_browser.bwutils.graph_traversal.engine.plan_cumulative_expand"></a>

#### plan\_cumulative\_expand

```python
def plan_cumulative_expand(
    nodes: dict,
    edges: list,
    root_uid: NodeId,
    total_score: float,
    target_pct: float,
    visited: set,
    *,
    exclude: set | None = None,
    eligible_ids: set | None = None,
    direct_lookup: Callable[[NodeId], float] | None = None
) -> tuple[set[NodeId], set[NodeId], NodeId | None]
```

Largest-first cumulative expand plan starting from reference flows.

Opens included nodes with the largest **remaining upstream** impact
(|cumulative| − |direct|). When a node is opened, children that raise
coverage are added largest-direct first until Σ(direct of included) /
|total| reaches ``target_pct``. Zero-direct siblings are not dumped into
the display set: only the next remaining-upstream hop is added, then that
hop is opened before leftover siblings of the parent. A 0-direct child is
skipped when an already-included sibling still carries more remaining
upstream (follow that plant, not leftover markets), and a parent that
already has a direct-impact child plus one 0-direct hop does not gain
extra 0-direct siblings. A node with no remaining upstream is not opened.
Cumulative Adjust does not skip “mostly direct” nodes with a
remaining-upstream ratio. ``direct_lookup`` (Sankey) uses solved-inventory
directs per unique process so coverage matches the boxes on screen.

Returns
-------
included:
    Row unique_ids that should be in the tree model.
to_expand:
    Unique_ids that should be visually expanded (opened during the walk).
need_traverse:
    If not ``None``, this unvisited uid must be ``traverse_from_node``'d
    before the plan can continue; call again after traversing.

<a id="activity_browser.bwutils.graph_traversal.engine.next_expand_candidates"></a>

#### next\_expand\_candidates

```python
def next_expand_candidates(nodes: dict,
                           edges: list,
                           visited: set,
                           *,
                           mode: str,
                           value: float,
                           total_score: float,
                           root_uid: NodeId | None = None,
                           exclude: set | None = None,
                           eligible_ids: set | None = None) -> list[NodeId]
```

Return unique_ids still needing ``traverse_from_node`` for tier/path.

Cumulative impact expand must use :func:`plan_cumulative_expand` (display
set + remaining-upstream ranking). Individual path *display* / visual
expand uses :func:`path_display_set`; this helper only probes which
unvisited nodes to calculate so the display set can be built.

Parameters
----------
mode:
    ``"tier"`` or ``"path"`` only.
value:
    For tier: maximum tier (int). For path: percent of |total| (0–100).
visited:
    ``state.visited_nodes`` — nodes already traversed.
root_uid:
    Functional-unit node id; required for reliable tier mode (avoids
    trusting mutated ``node.depth``).
exclude:
    Ids to skip (e.g. already failed to expand).
eligible_ids:
    If set, only consider these ids.

Returns
-------
Matching unvisited ids (any order).

<a id="activity_browser.bwutils.graph_traversal.engine.safe_traverse_from_node"></a>

#### safe\_traverse\_from\_node

```python
def safe_traverse_from_node(state, unique_id: NodeId, depth: int = 1) -> bool
```

Zero ``node.depth``, suppress coverage warnings, then ``traverse_from_node``.

Brightway derives relative max depth from the current ``node.depth`` before
resetting it; mid-tree expands must start at depth 0 so ``depth=1`` means
one edge.

<a id="activity_browser.bwutils.graph_traversal.engine.run_expand_policy"></a>

#### run\_expand\_policy

```python
def run_expand_policy(
    state,
    *,
    mode: str,
    value: float,
    total_score: float,
    on_progress=None,
    direct_lookup: Callable[[NodeId], float] | None = None,
    eligible_ids: Callable[[], set[NodeId] | None] | None = None
) -> tuple[set[NodeId] | None, set[NodeId] | None]
```

Traverse for an adjust policy; return display-set ``(included, to_expand)``.

For ``tier`` / ``path``: traverse via :func:`next_expand_candidates`.
For ``path``: also return :func:`path_display_set`.
For ``cumulative``: loop :func:`plan_cumulative_expand` until done.
``eligible_ids`` is an optional callback returning visit ids the planner
may open (Sankey passes the highest-path visit of each process).

``on_progress(step, n_nodes)`` is optional (e.g. UI busy tick). If it
returns ``False``, stop and return the display set for the graph so far.
Returns ``(None, None)`` for tier (caller opens view by max tier).

<a id="activity_browser.bwutils.graph_traversal.engine.path_display_set"></a>

#### path\_display\_set

```python
def path_display_set(nodes: dict, edges: list, root_uid: NodeId,
                     total_score: float, min_path_pct: float,
                     visited: set) -> tuple[set[NodeId], set[NodeId]]
```

Rows to show / expand for individual path-impact policy.

* Auto-expand a node only if its path impact is ≥ ``min_path_pct`` **and**
  it has at least one child that is also ≥ ``min_path_pct`` (the high-impact
  path continues). Terminal high-impact nodes stay collapsed.
* Hide siblings that are not themselves on a ≥ ``min_path_pct`` path.
  Show all (footer) reveals the rest of the calculated graph.

Returns ``(included_uids, visually_expanded_uids)``.

<a id="activity_browser.bwutils.graph_traversal.engine.graph_display_set"></a>

#### graph\_display\_set

```python
def graph_display_set(
    nodes: dict,
    edges: list,
    *,
    mode: str,
    value: float,
    total_score: float,
    root_uid: NodeId,
    visited: set | None = None,
    direct_lookup: Callable[[NodeId], float] | None = None,
    eligible_ids: set[NodeId] | None = None
) -> tuple[set[NodeId], set[NodeId]]
```

Display set for a calculated graph (Tree plot or Sankey) from Adjust policy.

Does not traverse. ``tier`` uses :func:`compute_node_tiers`; ``path`` and
``cumulative`` reuse the Tree policies on the nodes already in ``nodes``.
``eligible_ids`` (Sankey) limits cumulative planning to chosen visits.

<a id="activity_browser.bwutils.graph_traversal.engine.open_process_refs"></a>

#### open\_process\_refs

```python
def open_process_refs(*,
                      is_aggregate: bool = False,
                      activity_id=None,
                      database: str | None = None,
                      code: str | None = None,
                      nodes: dict | None = None,
                      uid: NodeId | None = None,
                      constituent_uids: list | None = None) -> list[dict]
```

Identity refs for **Open process** on a shown Tree or Sankey box.

The traversal visit is the source of truth (not a JS datapackage id that
may be a visit uid). Aggregates are a group of processes — Open process
is disabled. Payload ``database`` / ``code`` are fallbacks when Brightway
``get_node(id=)`` cannot resolve the visit.

<a id="activity_browser.bwutils.graph_traversal.engine.activities_from_open_refs"></a>

#### activities\_from\_open\_refs

```python
def activities_from_open_refs(refs: list[dict]) -> list
```

Brightway nodes for Open process refs (product/waste → processor).

<a id="activity_browser.bwutils.graph_traversal.engine.open_process_activity_id"></a>

#### open\_process\_activity\_id

```python
def open_process_activity_id(
        *,
        is_aggregate: bool = False,
        activity_id=None,
        nodes: dict | None = None,
        uid: NodeId | None = None,
        constituent_uids: list | None = None) -> int | None
```

Datapackage id for **Open process**, or ``None`` when there is no process.

Prefer the traversal visit over a JS ``activity_id``. Aggregates have no
single process to open.

<a id="activity_browser.bwutils.graph_traversal.engine.toggle_graph_display_node"></a>

#### toggle\_graph\_display\_node

```python
def toggle_graph_display_node(included: set[NodeId],
                              nodes: dict,
                              edges: list,
                              uid: NodeId,
                              *,
                              root_uid: NodeId | None = None) -> set[NodeId]
```

Expand or collapse one visit in a calculated graph display set.

Manual expand shows every unique-process supplier already in the calculated
graph (engine cutoff). Adjust-hidden siblings come back on expand.
Collapse runs only when those suppliers are already shown. Already-drawn
processes stay one box (no cycle unroll).

<a id="activity_browser.bwutils.graph_traversal.engine.apply_graph_display_click"></a>

#### apply\_graph\_display\_click

```python
def apply_graph_display_click(
        included: set[NodeId],
        nodes: dict,
        edges: list,
        uid: NodeId,
        *,
        opened: set[NodeId] | None = None,
        root_uid: NodeId | None = None) -> tuple[set[NodeId], NodeId | None]
```

Toggle the display set, or request a one-hop traverse of ``uid``.

Returns ``(included, hop_uid)``. ``hop_uid`` is set when this visit is
unopened and still has remaining upstream.

<a id="activity_browser.bwutils.graph_traversal.engine.PLOT_AGGREGATE_FIELDS"></a>

#### PLOT\_AGGREGATE\_FIELDS

<a id="activity_browser.bwutils.graph_traversal.engine.PLOT_AGGREGATE_LABELS"></a>

#### PLOT\_AGGREGATE\_LABELS

<a id="activity_browser.bwutils.graph_traversal.engine.format_impact_abs"></a>

#### format\_impact\_abs

```python
def format_impact_abs(value: float) -> str
```

Compact absolute score for plot tooltips.

<a id="activity_browser.bwutils.graph_traversal.engine.GRAPH_COLOR_BY"></a>

#### GRAPH\_COLOR\_BY

<a id="activity_browser.bwutils.graph_traversal.engine.GRAPH_EDGE_MAX_WIDTH"></a>

#### GRAPH\_EDGE\_MAX\_WIDTH

<a id="activity_browser.bwutils.graph_traversal.engine.format_graph_node_tooltip"></a>

#### format\_graph\_node\_tooltip

```python
def format_graph_node_tooltip(node: dict, unit: str = "") -> str
```

Hover text for a tree-plot / Sankey-plot process box.

<a id="activity_browser.bwutils.graph_traversal.engine.format_graph_edge_tooltip"></a>

#### format\_graph\_edge\_tooltip

```python
def format_graph_edge_tooltip(edge: dict) -> str
```

Hover text for a tree-plot / Sankey-plot ribbon (fallback if JS is absent).

<a id="activity_browser.bwutils.graph_traversal.engine.d3_graph_payload"></a>

#### d3\_graph\_payload

```python
def d3_graph_payload(nodes: dict,
                     edges: list,
                     total_score: float,
                     *,
                     root_uid: NodeId,
                     included_uids: set[NodeId] | None = None,
                     metadata_lookup: Callable[[int], dict] | None = None,
                     aggregate_by: str | None = None,
                     color_by: str = "direct",
                     unit: str = "",
                     empty_message: str = "",
                     style: dict | None = None,
                     visited: set | None = None,
                     opened_uids: set | None = None) -> dict
```

JSON-ready node-link payload for the shared tree/Sankey renderer.

Only ``included_uids`` (the display set) become boxes. The virtual demand
root is omitted. JS must not recompute adjust policy or click targets.
Unique-process collapse lives in ``sankey.d3_graph_payload``.

<a id="activity_browser.bwutils.graph_traversal.engine.is_terminal_node"></a>

#### is\_terminal\_node

```python
def is_terminal_node(nodes: dict, edges: list, visited: set,
                     uid: NodeId) -> bool
```

True when a visited node has no downstream suppliers in the graph.
