**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.report` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2analyzer.report cfg.yml > bw2analyzer.report.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.report"></a>

# bw2analyzer.report

<a id="bw2analyzer.report.SerializedLCAReport"></a>

## SerializedLCAReport Objects

```python
class SerializedLCAReport()
```

A complete LCA report (i.e. LCA score, Monte Carlo uncertainty analysis, contribution analysis) that can be serialized to a defined standard.

<a id="bw2analyzer.report.SerializedLCAReport.version"></a>

#### version

<a id="bw2analyzer.report.SerializedLCAReport.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity, method, iterations=10000, cpus=None, outliers=0.025)
```

<a id="bw2analyzer.report.SerializedLCAReport.calculate"></a>

#### calculate

```python
def calculate()
```

Calculate LCA report data

<a id="bw2analyzer.report.SerializedLCAReport.get_treemap"></a>

#### get\_treemap

```python
def get_treemap(nodes, edges, lca, unroll_cutoff=0.01, simplify_limit=0.1)
```

<a id="bw2analyzer.report.SerializedLCAReport.get_monte_carlo"></a>

#### get\_monte\_carlo

```python
def get_monte_carlo()
```

Get Monte Carlo results

<a id="bw2analyzer.report.SerializedLCAReport.get_force_directed"></a>

#### get\_force\_directed

```python
def get_force_directed(nodes, edges, lca)
```

Get graph traversal results

<a id="bw2analyzer.report.SerializedLCAReport.write"></a>

#### write

```python
def write()
```

Write report data to file

<a id="bw2analyzer.report.SerializedLCAReport.upload"></a>

#### upload

```python
def upload()
```

Upload report data if allowed
