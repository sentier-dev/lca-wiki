**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.same_node_each_visit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_graph_tools.graph_traversal.same_node_each_visit cfg.yml > bw_graph_tools.graph_traversal.same_node_each_visit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.same_node_each_visit"></a>

# bw\_graph\_tools.graph\_traversal.same\_node\_each\_visit

<a id="bw_graph_tools.graph_traversal.same_node_each_visit.SameNodeEachVisitGraphTraversal"></a>

## SameNodeEachVisitGraphTraversal Objects

```python
class SameNodeEachVisitGraphTraversal(NewNodeEachVisitGraphTraversal)
```

A stateful graph traversal that keeps track of which nodes have been visited already.

Because each node in the database corresponds to one and one one `Node` instance in this class,
some simplifications to our data structures can be made.

<a id="bw_graph_tools.graph_traversal.same_node_each_visit.SameNodeEachVisitGraphTraversal.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw_graph_tools.graph_traversal.same_node_each_visit.SameNodeEachVisitGraphTraversal.traverse"></a>

#### traverse

```python
def traverse(nodes: List[Node] = None, depth: Optional[int] = None) -> None
```

Perform graph traversal from the given `Node` instances, or from the functional unit.

Repeat calls to traverse from the same node(s) will raise a `GraphTraversalException`.
See `traverse_from_node` for a safe version of repeated calls for traversal.

Parameters
----------
nodes : list[Node]
    List of `Node` instances to traverse from. Uses `self._root_node` as the default.
depth : int
    depth to traverse for each node provided up to the max specified in the setting's max_depth (if any)

Returns
-------
`None`
    Modifies the class object's state in-place

<a id="bw_graph_tools.graph_traversal.same_node_each_visit.SameNodeEachVisitGraphTraversal.traverse_edges"></a>

#### traverse\_edges

```python
def traverse_edges(*args, **kwargs) -> None
```

<a id="bw_graph_tools.graph_traversal.same_node_each_visit.SameNodeEachVisitGraphTraversal.traverse_from_node"></a>

#### traverse\_from\_node

```python
def traverse_from_node(node: Union[int, Node],
                       depth: Optional[int] = 1) -> bool
```

Traverse the graph starting from the specified node and exp
returning a boolean indicating if the node traversed already

Parameters
----------
node
    either the node's unique id or a `Node` object
depth
    depth to traverse from this node, otherwise will default to 1

Returns
-------
bool
    indicates if the node was traversed
