**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_traversal.sankey` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.graph_traversal.sankey cfg.yml > activity_browser.bwutils.graph_traversal.sankey.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_traversal.sankey"></a>

# activity\_browser.bwutils.graph\_traversal.sankey

Unique-process Sankey helpers (one box per process).

Wraps visit-based ``engine`` display-set / Adjust / node-link payload.
Must not import ``tree`` or ``partition_plots``.

<a id="activity_browser.bwutils.graph_traversal.sankey.run_expand_policy"></a>

#### run\_expand\_policy

```python
def run_expand_policy(
    state,
    *,
    mode: str,
    value: float,
    total_score: float,
    on_progress=None,
    direct_lookup: Callable[[NodeId], float] | None = None
) -> tuple[set[NodeId] | None, set[NodeId] | None]
```

Traverse with unique-process eligibility; collapse the display set after.

<a id="activity_browser.bwutils.graph_traversal.sankey.graph_display_set"></a>

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
    direct_lookup: Callable[[NodeId], float] | None = None
) -> tuple[set[NodeId], set[NodeId]]
```

Visit display set, then one box per process (highest |path impact|).

<a id="activity_browser.bwutils.graph_traversal.sankey.visits_of_same_activity"></a>

#### visits\_of\_same\_activity

```python
def visits_of_same_activity(nodes: dict, uid: NodeId) -> list[NodeId]
```

NNEV visit ids of the same process as ``uid`` (clicked visit first).

Unique-process Sankey draws one box; other visits of that process can still
hold cutoff suppliers the representative visit never listed.

<a id="activity_browser.bwutils.graph_traversal.sankey.supplier_visit_ids"></a>

#### supplier\_visit\_ids

```python
def supplier_visit_ids(pcm: dict[NodeId, list[NodeId]], nodes: dict,
                       uid: NodeId) -> list[NodeId]
```

Supplier visit ids of every NNEV visit of the same process as ``uid``.

<a id="activity_browser.bwutils.graph_traversal.sankey.unopened_same_activity_hops"></a>

#### unopened\_same\_activity\_hops

```python
def unopened_same_activity_hops(nodes: dict, uid: NodeId,
                                opened: set[NodeId] | None) -> list[NodeId]
```

Unopened same-process visits that still have remaining upstream.

<a id="activity_browser.bwutils.graph_traversal.sankey.keep_best_visit_per_activity"></a>

#### keep\_best\_visit\_per\_activity

```python
def keep_best_visit_per_activity(nodes: dict, edges: list,
                                 included: set[NodeId],
                                 root_uid: NodeId) -> set[NodeId]
```

Keep one visit per process: the included visit with largest |path impact|.

NNEV may discover a process first via a small path (e.g. a minor exchange
to the reference flow) and later via a large path. Unique-process Sankey
must draw and hop the large path, or Individual path impact stops on a box
whose only calculated suppliers are the small visit's. Circular supply
(A→B→A) still yields two boxes: the later visit of A has a smaller path
impact than the first, so it is dropped.

``edges`` is unused (call-site stability). Selection is by |path impact|
among ``included``, not first-visit / BFS order from ``root_uid``.

<a id="activity_browser.bwutils.graph_traversal.sankey.unique_process_stats"></a>

#### unique\_process\_stats

```python
def unique_process_stats(
        nodes: dict,
        edges: list,
        root_uid: NodeId,
        total_score: float,
        included: set[NodeId] | None = None,
        *,
        direct_lookup: Callable[[NodeId], float] | None = None) -> dict
```

Shown vs calculated unique-process counts, coverage, and max tier.

<a id="activity_browser.bwutils.graph_traversal.sankey.toggle_graph_display_node"></a>

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

<a id="activity_browser.bwutils.graph_traversal.sankey.apply_graph_display_click"></a>

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

Returns ``(included, hop_uid)``. ``hop_uid`` is set when this process still
has an unopened visit with remaining upstream (the clicked visit if that
one is unopened). The caller hops every
:func:`unopened_same_activity_hops` visit, then
:func:`include_new_unique_suppliers`.

<a id="activity_browser.bwutils.graph_traversal.sankey.include_new_unique_suppliers"></a>

#### include\_new\_unique\_suppliers

```python
def include_new_unique_suppliers(included: set[NodeId], nodes: dict,
                                 edges: list, uid: NodeId, *,
                                 root_uid: NodeId) -> set[NodeId]
```

Add unique-process suppliers of ``uid`` discovered after a hop.

Engine cutoff already limits which children exist. Does not apply Adjust
path/cumulative filters. Unions suppliers of every NNEV visit of this
process so a small first visit cannot hide another visit's suppliers.

<a id="activity_browser.bwutils.graph_traversal.sankey.sankey_traversal_max_depth"></a>

#### sankey\_traversal\_max\_depth

```python
def sankey_traversal_max_depth(mode: str | None,
                               value: float | int) -> int | None
```

NNEV ``max_depth`` for a Sankey Adjust policy.

``None`` means unlimited (path / cumulative). Tier mode adds two hops
past the displayed tier: NNEV counts the virtual root as depth 0, and
the extra hop lets a two-process cycle remap both flows onto unique
process boxes. Startup at tier 1 therefore uses depth 3, not 1000 visits.

<a id="activity_browser.bwutils.graph_traversal.sankey.merge_graph_edges"></a>

#### merge\_graph\_edges

```python
def merge_graph_edges(edges: list[dict]) -> list[dict]
```

One ribbon per process pair: keep the largest path impact, drop cutoff tails.

<a id="activity_browser.bwutils.graph_traversal.sankey.overlay_inventory_directs"></a>

#### overlay\_inventory\_directs

```python
def overlay_inventory_directs(payload: dict, lca, total_score: float) -> None
```

Replace visit-level directs with solved-inventory directs (unique-process Sankey).

<a id="activity_browser.bwutils.graph_traversal.sankey.inventory_direct_lookup"></a>

#### inventory\_direct\_lookup

```python
def inventory_direct_lookup(
        nodes: dict, directs: dict[int, float]) -> Callable[[NodeId], float]
```

Map a visit uid to the solved-inventory direct of its unique process.

<a id="activity_browser.bwutils.graph_traversal.sankey.mapped_edge_amounts"></a>

#### mapped\_edge\_amounts

```python
def mapped_edge_amounts(
        nodes: dict, edges: list,
        payload_nodes: list[dict]) -> dict[tuple[int, int], float]
```

Sum NNEV exchange amounts onto unique-process (source, target) pairs.

<a id="activity_browser.bwutils.graph_traversal.sankey.d3_graph_payload"></a>

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
``unique_activities`` (Sankey) keeps one box per process (the highest-path
visit) and remaps later-visit edges onto that box so circular supply stays
two processes.
