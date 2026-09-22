**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.flow` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper.flow cfg.yml > flowmapper.flow.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.flow"></a>

# flowmapper.flow

<a id="flowmapper.flow.Flow"></a>

## Flow Objects

```python
class Flow()
```

<a id="flowmapper.flow.Flow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(data: dict, transformations: List[dict] | None = None)
```

<a id="flowmapper.flow.Flow.uniqueness_id"></a>

#### uniqueness\_id

```python
@property
def uniqueness_id()
```

<a id="flowmapper.flow.Flow.missing"></a>

#### missing

```python
@property
def missing()
```

This flow has been marked as missing in target list

<a id="flowmapper.flow.Flow.export"></a>

#### export

```python
@property
def export() -> dict
```

<a id="flowmapper.flow.Flow.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

<a id="flowmapper.flow.Flow.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="flowmapper.flow.Flow.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="flowmapper.flow.Flow.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```
