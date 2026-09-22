**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.matrix_grapher` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2analyzer.matrix_grapher cfg.yml > bw2analyzer.matrix_grapher.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.matrix_grapher"></a>

# bw2analyzer.matrix\_grapher

<a id="bw2analyzer.matrix_grapher.SparseMatrixGrapher"></a>

## SparseMatrixGrapher Objects

```python
class SparseMatrixGrapher()
```

<a id="bw2analyzer.matrix_grapher.SparseMatrixGrapher.__init__"></a>

#### \_\_init\_\_

```python
def __init__(matrix)
```

<a id="bw2analyzer.matrix_grapher.SparseMatrixGrapher.graph"></a>

#### graph

```python
def graph(filename=None,
          marker_string="c.",
          mew=0.5,
          ms=1,
          alpha=0.8,
          width=None,
          height=None,
          dpi=300)
```

<a id="bw2analyzer.matrix_grapher.SparseMatrixGrapher.magnitude_graph"></a>

#### magnitude\_graph

```python
def magnitude_graph(filename=None, dpi=600, width=None, height=None)
```

<a id="bw2analyzer.matrix_grapher.SparseMatrixGrapher.ordered_graph"></a>

#### ordered\_graph

```python
def ordered_graph(filename=None, dpi=600, width=None, height=None)
```
