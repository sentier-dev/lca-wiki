**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.health_check` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2analyzer.health_check cfg.yml > bw2analyzer.health_check.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.health_check"></a>

# bw2analyzer.health\_check

<a id="bw2analyzer.health_check.DatabaseHealthCheck"></a>

## DatabaseHealthCheck Objects

```python
class DatabaseHealthCheck()
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database)
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.check"></a>

#### check

```python
def check(graphs_dir=None)
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.make_graphs"></a>

#### make\_graphs

```python
def make_graphs(graphs_dir=None)
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.page_rank"></a>

#### page\_rank

```python
def page_rank()
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.unique_exchanges"></a>

#### unique\_exchanges

```python
def unique_exchanges()
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.uncertainty_check"></a>

#### uncertainty\_check

```python
def uncertainty_check()
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.multioutput_processes"></a>

#### multioutput\_processes

```python
def multioutput_processes()
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.aggregated_processes"></a>

#### aggregated\_processes

```python
def aggregated_processes(cutoff=500)
```

<a id="bw2analyzer.health_check.DatabaseHealthCheck.no_self_production"></a>

#### no\_self\_production

```python
def no_self_production()
```
