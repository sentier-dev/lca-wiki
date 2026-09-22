**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.string_field` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.string_field cfg.yml > flowmapper.string_field.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.string_field"></a>

# flowmapper.string\_field

<a id="flowmapper.string_field.SF"></a>

#### SF

<a id="flowmapper.string_field.StringField"></a>

## StringField Objects

```python
class StringField(Generic[SF])
```

<a id="flowmapper.string_field.StringField.__init__"></a>

#### \_\_init\_\_

```python
def __init__(original: str | None,
             transformed: str | None = None,
             use_lowercase: bool = True)
```

<a id="flowmapper.string_field.StringField.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other: Any) -> bool
```

<a id="flowmapper.string_field.StringField.__bool__"></a>

#### \_\_bool\_\_

```python
def __bool__() -> bool
```

<a id="flowmapper.string_field.StringField.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```
