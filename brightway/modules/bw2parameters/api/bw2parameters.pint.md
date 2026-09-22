**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.pint` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2parameters==1.1.0'
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
  -I "$SP" -m bw2parameters.pint cfg.yml > bw2parameters.pint.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.pint"></a>

# bw2parameters.pint

<a id="bw2parameters.pint.PintWrapperSingleton"></a>

## PintWrapperSingleton Objects

```python
class PintWrapperSingleton()
```

<a id="bw2parameters.pint.PintWrapperSingleton.__new__"></a>

#### \_\_new\_\_

```python
def __new__(cls)
```

<a id="bw2parameters.pint.PintWrapperSingleton.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2parameters.pint.PintWrapperSingleton.to_unit"></a>

#### to\_unit

```python
def to_unit(string, raise_errors=False)
```

Returns pint.Unit if the given string can be interpreted as a unit, returns None otherwise

<a id="bw2parameters.pint.PintWrapperSingleton.to_units"></a>

#### to\_units

```python
def to_units(iterable, raise_errors=False, drop_none=True)
```

Takes and iterable and tries to interpret each element as a pint.Unit. Returns a dict where key is
the original element and value is the interpreted pint.Unit. Elements which cannot be interpreted as
a pint.Unit are `None` (or dropped if `drop_none == True`).

<a id="bw2parameters.pint.PintWrapperSingleton.is_quantity"></a>

#### is\_quantity

```python
def is_quantity(value)
```

<a id="bw2parameters.pint.PintWrapperSingleton.is_quantity_from_same_registry"></a>

#### is\_quantity\_from\_same\_registry

```python
def is_quantity_from_same_registry(value)
```

<a id="bw2parameters.pint.PintWrapperSingleton.get_dimensionality"></a>

#### get\_dimensionality

```python
def get_dimensionality(unit_name=None)
```

<a id="bw2parameters.pint.PintWrapperSingleton.to_quantity"></a>

#### to\_quantity

```python
def to_quantity(amount, unit=None)
```

Return a pint.Quantity if a unit is given, otherwise the amount.

<a id="bw2parameters.pint.PintWrapper"></a>

#### PintWrapper
