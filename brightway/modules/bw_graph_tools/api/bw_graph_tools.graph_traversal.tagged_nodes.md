**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.tagged_nodes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_graph_tools.graph_traversal.tagged_nodes cfg.yml > bw_graph_tools.graph_traversal.tagged_nodes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.tagged_nodes"></a>

# bw\_graph\_tools.graph\_traversal.tagged\_nodes

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal"></a>

## NewNodeEachVisitTaggedGraphTraversal Objects

```python
class NewNodeEachVisitTaggedGraphTraversal(
        NewNodeEachVisitGraphTraversal,
        BaseGraphTraversal[TaggedGraphTraversalSettings])
```

Traverse the graph with leaves nodes grouped by their tags

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.group_nodes_by_tags"></a>

#### group\_nodes\_by\_tags

```python
@classmethod
def group_nodes_by_tags(cls, children: Iterable[Node],
                        tags: List[str]) -> Dict[str, List[Node]]
```

Organize child nodes by their tags for a given parent node.

Groups child nodes based on the tags found in their associated activity

Parameters
----------
children : set
    A set of child nodes to be organized by tags.
tags : list
    A list of string for the nodes to be grouped by

Returns
-------
nodes_by_tags : dict
    A dictionary where the keys are tag labels and the values are lists of nodes
    grouped by those tags. Nodes with no applicable tags are grouped under an empty string.

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.group_leaf_nodes_by_parent"></a>

#### group\_leaf\_nodes\_by\_parent

```python
@classmethod
def group_leaf_nodes_by_parent(cls, edges: List[Edge])
```

Group leaf nodes by their parent nodes.

Identifies leaf nodes (nodes that are terminal) and groups them
according to their parent nodes.

Parameters
----------
edges: list
    A list of graph edges

Returns
-------
leaf_nodes_by_parent : dict
    A dictionary where the keys are parent node IDs and the values are sets of
    child node IDs (leaf nodes).

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.generate_id_for_grouped_node"></a>

#### generate\_id\_for\_grouped\_node

```python
def generate_id_for_grouped_node(parent_node: Node, nodes: List[Node],
                                 tag_group: str) -> int
```

Generate an id for a grouped node

Parameters
----------
parent_node: Node
    parent node
nodes: List[Node]
    nodes that belong to the parent
tag_group: str
    tag value for this group

Returns
-------
int
    unique id for GroupedNodes

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.should_group_leaves"></a>

#### should\_group\_leaves

```python
def should_group_leaves(parent_node: Node, nodes: List[Node],
                        tag_group: str) -> bool
```

Whether to group leaves for a specific parent and tag group

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.create_group_tagged_nodes"></a>

#### create\_group\_tagged\_nodes

```python
def create_group_tagged_nodes(
        parent_node, nodes_by_tags,
        grouped_edges) -> Tuple[Dict[int, GroupedNodes], List[Edge]]
```

Create grouped nodes for child nodes that should be grouped based on their tags.

Aggregates nodes that share the same tag group into a single grouped node, summing
their relevant attributes.

Parameters
----------
parent_node : Node
    The parent node to which the child nodes belong.
nodes_by_tags : dict
    A dictionary where the keys are tag labels and the values are lists of child nodes
    that share those tags.
grouped_edges: Dict[Tuple[int, int], Edge]
    A dictionary of mapping from (consumer, producer) to Edge

Returns
-------
grouped_nodes : dict
    A dictionary where the keys are unique IDs for grouped nodes, and the values are
    GroupedNodes instances representing nodes grouped by tags.
edges: list
    A list of Edges for the newly grouped Nodes

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.traverse"></a>

#### traverse

```python
def traverse(nodes: list = None, depth: int = None) -> None
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.nodes"></a>

#### nodes

```python
@property
def nodes()
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.edges"></a>

#### edges

```python
@property
def edges()
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.NewNodeEachVisitTaggedGraphTraversal.flows"></a>

#### flows

```python
@property
def flows()
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.SameNodeEachVisitTaggedGraphTraversal"></a>

## SameNodeEachVisitTaggedGraphTraversal Objects

```python
class SameNodeEachVisitTaggedGraphTraversal(
        NewNodeEachVisitTaggedGraphTraversal, SameNodeEachVisitGraphTraversal)
```

A tagged variant of same node each visit

<a id="bw_graph_tools.graph_traversal.tagged_nodes.SameNodeEachVisitTaggedGraphTraversal.generate_id_for_grouped_node"></a>

#### generate\_id\_for\_grouped\_node

```python
def generate_id_for_grouped_node(parent_node: Node, nodes: List[Node],
                                 tag_group: str) -> int
```

Generate a consistent id for a grouped node.

Uses only parent unique_id and tag label — depth is excluded because node
depth is reset to 0 when re-traversed, which would otherwise change the ID
and break the should_group_leaves idempotency check.  Uses 16 hex characters
(64-bit range) to avoid collisions with the sequential counter IDs used for
regular nodes (which start at 0 and count upward).

<a id="bw_graph_tools.graph_traversal.tagged_nodes.SameNodeEachVisitTaggedGraphTraversal.should_group_leaves"></a>

#### should\_group\_leaves

```python
def should_group_leaves(parent_node: Node, nodes: List[Node],
                        tag_group: str) -> bool
```

<a id="bw_graph_tools.graph_traversal.tagged_nodes.SameNodeEachVisitTaggedGraphTraversal.traverse_from_node"></a>

#### traverse\_from\_node

```python
def traverse_from_node(node: Union[int, Node],
                       depth: Optional[int] = 1) -> bool
```
