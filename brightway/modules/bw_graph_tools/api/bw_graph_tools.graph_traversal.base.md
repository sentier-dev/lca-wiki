**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_graph_tools.graph_traversal.base cfg.yml > bw_graph_tools.graph_traversal.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.base"></a>

# bw\_graph\_tools.graph\_traversal.base

<a id="bw_graph_tools.graph_traversal.base.Settings"></a>

#### Settings

<a id="bw_graph_tools.graph_traversal.base.GraphTraversalException"></a>

## GraphTraversalException Objects

```python
class GraphTraversalException(Exception)
```

<a id="bw_graph_tools.graph_traversal.base.BaseGraphTraversal"></a>

## BaseGraphTraversal Objects

```python
class BaseGraphTraversal(Generic[Settings])
```

<a id="bw_graph_tools.graph_traversal.base.BaseGraphTraversal.__init__"></a>

#### \_\_init\_\_

```python
def __init__(lca: "bw2calc.LCA",
             settings: Settings,
             functional_unit_unique_id: int = -1,
             static_activity_indices=None)
```

Base class for common graph traversal methods. Should be inherited from, not used directly.

Parameters
----------
lca : bw2calc.LCA
    Already instantiated `LCA` object with inventory and impact
    assessment calculated.
settings: object
    Settings for the graph traversal
functional_unit_unique_id : int
    An integer id we can use for the functional unit virtual activity.
    Shouldn't overlap any other activity ids. Don't change unless you
    really know what you are doing.
static_activity_indices : set
    A set of activity matrix indices which we don't want the graph to
    traverse - i.e. we stop traversal when we hit these nodes, but
    still add them to the returned `nodes` dictionary, and calculate
    their direct and cumulative scores.

<a id="bw_graph_tools.graph_traversal.base.BaseGraphTraversal.nodes"></a>

#### nodes

```python
@property
def nodes()
```

List of `Node` dataclass instances.

Each `Node` instance has a `unique_id`, regardless of graph traversal class. In some
classes, each node in the database will only appear once in this list of graph traversal
node instances, but in `NewNodeEachVisitGraphTraversal`, we create a new `Node` every time
we reach a database node, even if we have seen it before.

See the `Node` documentation for its other attributes.

<a id="bw_graph_tools.graph_traversal.base.BaseGraphTraversal.edges"></a>

#### edges

```python
@property
def edges()
```

List of `Edge` instances. Edges link two `Node` instances.

Note that there are no `Edge` instances which link `Flow` instances - these are handled
separately.

See the `Edge` documentation for its other attributes.

<a id="bw_graph_tools.graph_traversal.base.BaseGraphTraversal.flows"></a>

#### flows

```python
@property
def flows()
```

List of `Flow` instances.

A `Flow` instance is a *characterized biosphere flow* associated with a specific `Node`
instance.

See the `Flow` documentation for its other attributes.
