**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.context` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.context cfg.yml > flowmapper.context.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.context"></a>

# flowmapper.context

<a id="flowmapper.context.MISSING_VALUES"></a>

#### MISSING\_VALUES

<a id="flowmapper.context.ContextField"></a>

## ContextField Objects

```python
class ContextField(Iterable)
```

<a id="flowmapper.context.ContextField.__init__"></a>

#### \_\_init\_\_

```python
def __init__(original: Any, transformed: Any = None)
```

<a id="flowmapper.context.ContextField.normalize"></a>

#### normalize

```python
def normalize(value: Any) -> tuple[str, ...]
```

<a id="flowmapper.context.ContextField.export_as_string"></a>

#### export\_as\_string

```python
def export_as_string()
```

<a id="flowmapper.context.ContextField.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="flowmapper.context.ContextField.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="flowmapper.context.ContextField.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="flowmapper.context.ContextField.__bool__"></a>

#### \_\_bool\_\_

```python
def __bool__()
```

<a id="flowmapper.context.ContextField.__hash__"></a>

#### \_\_hash\_\_

```python
def __hash__()
```

<a id="flowmapper.context.ContextField.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(other)
```

This context is more generic than the `other` context.

```python
Context("a/b/c") in Context("a/b")
>>> True
```
