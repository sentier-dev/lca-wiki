**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.cas` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.cas cfg.yml > flowmapper.cas.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.cas"></a>

# flowmapper.cas

<a id="flowmapper.cas.CASField"></a>

## CASField Objects

```python
class CASField()
```

Class for CAS Registry Numbers that accepts padded or non-padded strings

<a id="flowmapper.cas.CASField.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cas: str | None)
```

<a id="flowmapper.cas.CASField.export"></a>

#### export

```python
@property
def export()
```

<a id="flowmapper.cas.CASField.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="flowmapper.cas.CASField.__eq__"></a>

#### \_\_eq\_\_

```python
def __eq__(other)
```

<a id="flowmapper.cas.CASField.check_digit_expected"></a>

#### check\_digit\_expected

```python
@cached_property
def check_digit_expected()
```

Expected digit acording to https://www.cas.org/support/documentation/chemical-substances/checkdig algorithm

<a id="flowmapper.cas.CASField.valid"></a>

#### valid

```python
@property
def valid()
```

True if check if CAS number is valid acording to https://www.cas.org/support/documentation/chemical-substances/checkdig algorithm
