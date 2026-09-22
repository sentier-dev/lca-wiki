**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_traversal.partition_plots` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.graph_traversal.partition_plots cfg.yml > activity_browser.bwutils.graph_traversal.partition_plots.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_traversal.partition_plots"></a>

# activity\_browser.bwutils.graph\_traversal.partition\_plots

Partition-plot helpers: horizontal/vertical chain, sunburst, treemap/icicle.

May import ``engine``. Must not import ``sankey``.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.build_chain_layout"></a>

#### build\_chain\_layout

```python
def build_chain_layout(nodes: dict,
                       edges: list,
                       total_score: float,
                       max_depth: int,
                       root_uid: NodeId | None = None,
                       metadata_lookup: Callable[[int], dict] | None = None,
                       included_uids: set[NodeId] | None = None) -> list[dict]
```

Parent-aligned layout segments for contribution-tree plots.

Each segment has ``tier``, ``x0``/``x1`` in ``[0, 1]``, impact scores,
and activity metadata. Tier-0 (reference flow) nodes only — not every
virtual-root child.

When ``included_uids`` is set, only those nodes appear and visible
siblings reflow within each parent's upstream (non-direct) span.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.plot_click_target_uid"></a>

#### plot\_click\_target\_uid

```python
def plot_click_target_uid(segment: dict) -> int
```

Tree ``unique_id`` to toggle when a plot segment is clicked.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.D3_PLOT_MODES"></a>

#### D3\_PLOT\_MODES

<a id="activity_browser.bwutils.graph_traversal.partition_plots.format_plot_segment_tooltip"></a>

#### format\_plot\_segment\_tooltip

```python
def format_plot_segment_tooltip(seg: dict, unit: str = "") -> str
```

Hover text for a contribution-tree plot segment.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.d3_plot_payload"></a>

#### d3\_plot\_payload

```python
def d3_plot_payload(segments: list[dict],
                    mode: str,
                    unit: str = "",
                    *,
                    empty_message: str = "",
                    style: dict | None = None,
                    plot_depth: int | None = None,
                    color_by: str = "direct") -> dict
```

JSON-ready plot payload: partition geometry plus click ids.

Geometry (``tier``, ``x0``, ``x1``) is copied, not recomputed. Partition
plots map those spans onto SVG. Treemap nests the same segments by span
containment and sizes cells by path-impact span.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.aggregate_plot_segments"></a>

#### aggregate\_plot\_segments

```python
def aggregate_plot_segments(segments: list[dict], aggregate_by: str | None,
                            pcm: dict[NodeId, list[NodeId]], root_uid: NodeId,
                            total_score: float) -> list[dict]
```

Merge sibling plot segments under each parent by a metadata field.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.build_plot_segments"></a>

#### build\_plot\_segments

```python
def build_plot_segments(nodes: dict,
                        edges: list,
                        total_score: float,
                        max_depth: int,
                        root_uid: NodeId | None = None,
                        metadata_lookup: Callable[[int], dict] | None = None,
                        included_uids: set[NodeId] | None = None,
                        aggregate_by: str | None = None) -> list[dict]
```

Chain layout plus optional sibling aggregation for contribution-tree plots.

<a id="activity_browser.bwutils.graph_traversal.partition_plots.build_sunburst_rings"></a>

#### build\_sunburst\_rings

```python
def build_sunburst_rings(nodes: dict,
                         edges: list,
                         total_score: float,
                         max_depth: int,
                         root_uid: NodeId | None = None) -> list[list[dict]]
```

Build per-tier ring data for a sunburst (layered donut) chart.

Rings use **display tiers** (RF = 0), not Brightway's mutable ``node.depth``.
``max_depth`` is the number of rings (tiers ``0 .. max_depth-1``).

Each ring is a list of wedge dicts with ``unique_id``, ``label``, ``share``,
``cumulative_score``, ``parent_unique_id``.
