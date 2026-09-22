**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_traversal.tree` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.graph_traversal.tree cfg.yml > activity_browser.bwutils.graph_traversal.tree.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_traversal.tree"></a>

# activity\_browser.bwutils.graph\_traversal.tree

Contribution-tree table helpers (SNEV flatten, footer stats, table colour).

May import ``engine``. Must not import ``sankey``.

<a id="activity_browser.bwutils.graph_traversal.tree.tree_stats"></a>

#### tree\_stats

```python
def tree_stats(nodes: dict,
               total_score: float,
               *,
               root_uid: NodeId | None = None,
               edges: list | None = None) -> dict
```

Return ``node_count``, ``coverage``, and ``max_tier`` for visible nodes.

``max_tier`` uses edge-based display tiers when ``root_uid`` and ``edges``
are provided — never Brightway's mutable ``node.depth``.

<a id="activity_browser.bwutils.graph_traversal.tree.direct_impact_intensity"></a>

#### direct\_impact\_intensity

```python
def direct_impact_intensity(value: float,
                            column_max: float,
                            *,
                            floor_ratio: float = 0.01) -> float
```

Map ``|value|`` to ``[0, 1]`` on a log10 axis — same curve as the table delegate.

<a id="activity_browser.bwutils.graph_traversal.tree.flatten_to_dataframe"></a>

#### flatten\_to\_dataframe

```python
def flatten_to_dataframe(
        nodes: dict,
        edges: list,
        total_score: float,
        metadata_lookup: Callable[[int], dict] | None = None) -> pd.DataFrame
```

Depth-first walk of the traversal state; return one row per node.

Parameters
----------
nodes:
    ``state.nodes`` dict.
edges:
    ``state.edges`` list.
total_score:
    ``lca.score``.
metadata_lookup:
    Optional callable that accepts an ``activity_datapackage_id`` and
    returns a dict with keys ``product``, ``name``, ``location``,
    ``database``, ``unit``.  If None, these columns will be empty strings.
