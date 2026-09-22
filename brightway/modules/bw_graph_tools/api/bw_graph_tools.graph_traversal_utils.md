**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal_utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_graph_tools.graph_traversal_utils cfg.yml > bw_graph_tools.graph_traversal_utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal_utils"></a>

# bw\_graph\_tools.graph\_traversal\_utils

<a id="bw_graph_tools.graph_traversal_utils.get_path_from_matrix"></a>

#### get\_path\_from\_matrix

```python
def get_path_from_matrix(matrix: sparse.spmatrix,
                         source: int,
                         target: int,
                         algorithm: str = "BF") -> List
```

Get the path with the most mass or energetic flow from ``source`` (the function unit) to ``target`` (something deep in the supply chain). Both ``source`` and ``target`` are integer matrix indices.

``algorithm`` should be either ``BF`` (Bellman-Ford) or ``J`` (Johnson). Dijkstra is not recommended as we have negative weights.

Returns a list like ``[source, int, int, int, target]``.

<a id="bw_graph_tools.graph_traversal_utils.path_as_brightway_objects"></a>

#### path\_as\_brightway\_objects

```python
def path_as_brightway_objects(source_node: Node,
                              target_node: Node,
                              lca: Optional[LCA] = None) -> List[Edge]
```
