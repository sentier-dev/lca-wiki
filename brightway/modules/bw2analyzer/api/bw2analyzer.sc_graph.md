**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.sc_graph` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2analyzer==0.11.8'
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
  -I "$SP" -m bw2analyzer.sc_graph cfg.yml > bw2analyzer.sc_graph.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.sc_graph"></a>

# bw2analyzer.sc\_graph

<a id="bw2analyzer.sc_graph.tupify"></a>

#### tupify

```python
def tupify(o)
```

Transform edge from dict to tuples. Multiply impact by -1 because sort by min, not max

<a id="bw2analyzer.sc_graph.GTManipulator"></a>

## GTManipulator Objects

```python
class GTManipulator()
```

Manipulate ``GraphTraversal`` results.

<a id="bw2analyzer.sc_graph.GTManipulator.unroll_graph"></a>

#### unroll\_graph

```python
@staticmethod
def unroll_graph(nodes, edges, score, cutoff=0.005, max_links=2500)
```

Unroll a ``GraphTraversal`` result, allowing the same activity to appear in the graph multiple times.

<a id="bw2analyzer.sc_graph.GTManipulator.add_metadata"></a>

#### add\_metadata

```python
@staticmethod
def add_metadata(nodes, lca)
```

Add metadata to nodes, like name, unit, and category.

<a id="bw2analyzer.sc_graph.GTManipulator.d3_force_directed"></a>

#### d3\_force\_directed

```python
@staticmethod
def d3_force_directed(nodes, edges, score)
```

Reformat to D3 style, which is a list of nodes, and edge ids are node list indices.

<a id="bw2analyzer.sc_graph.GTManipulator.simplify"></a>

#### simplify

```python
@staticmethod
def simplify(nodes, edges, score, limit=0.005)
```

Simplify supply chain to include only nodes which individually contribute ``limit * score``.

Only removes and combines edges; doesn't check to make sure amounts add up correctly.

<a id="bw2analyzer.sc_graph.GTManipulator.simplify_naive"></a>

#### simplify\_naive

```python
@staticmethod
def simplify_naive(nodes, edges, score, limit=0.0025)
```

Naive simplification which simplifies removes links below an LCA score cutoff. Orphan nodes are also deleted.

<a id="bw2analyzer.sc_graph.GTManipulator.d3_treemap"></a>

#### d3\_treemap

```python
@staticmethod
def d3_treemap(nodes, edges, lca, add_biosphere=False)
```

Add node data by traversing the graph; assign different metadata to leaf nodes.
