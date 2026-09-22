**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.unit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.unit cfg.yml > flowmapper.unit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.unit"></a>

# flowmapper.unit

<a id="flowmapper.unit.ureg"></a>

#### ureg

<a id="flowmapper.unit.U"></a>

#### U

<a id="flowmapper.unit.UnitField"></a>

## UnitField Objects

```python
class UnitField(Generic[U])
```

<a id="flowmapper.unit.UnitField.__init__"></a>

#### \_\_init\_\_

```python
def __init__(original: str,
             transformed: str | None = None,
             use_lowercase: bool = False)
```

<a id="flowmapper.unit.UnitField.is_uri"></a>

#### is\_uri

```python
def is_uri(value: str) -> bool
```

<a id="flowmapper.unit.UnitField.resolve_uri"></a>

#### resolve\_uri

```python
def resolve_uri(uri: str) -> None
```

<a id="flowmapper.unit.UnitField.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

<a id="flowmapper.unit.UnitField.__bool__"></a>

#### \_\_bool\_\_

```python
def __bool__() -> bool
```

<a id="flowmapper.unit.UnitField.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other: Any)
```

<a id="flowmapper.unit.UnitField.compatible"></a>

#### compatible

```python
def compatible(other: Any)
```

<a id="flowmapper.unit.UnitField.conversion_factor"></a>

#### conversion\_factor

```python
def conversion_factor(to: U | Any) -> float
```
