**Generated API reference** · package `bw2data` 4.7 · module `bw2data.sqlite` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.sqlite cfg.yml > bw2data.sqlite.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.sqlite"></a>

# bw2data.sqlite

<a id="bw2data.sqlite.PickleField"></a>

## PickleField Objects

```python
class PickleField(BlobField)
```

<a id="bw2data.sqlite.PickleField.db_value"></a>

#### db\_value

```python
def db_value(value)
```

<a id="bw2data.sqlite.PickleField.python_value"></a>

#### python\_value

```python
def python_value(value)
```

<a id="bw2data.sqlite.SubstitutableDatabase"></a>

## SubstitutableDatabase Objects

```python
class SubstitutableDatabase()
```

<a id="bw2data.sqlite.SubstitutableDatabase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, tables)
```

<a id="bw2data.sqlite.SubstitutableDatabase.db"></a>

#### db

```python
@property
def db()
```

<a id="bw2data.sqlite.SubstitutableDatabase.change_path"></a>

#### change\_path

```python
def change_path(filepath)
```

<a id="bw2data.sqlite.SubstitutableDatabase.atomic"></a>

#### atomic

```python
def atomic()
```

<a id="bw2data.sqlite.SubstitutableDatabase.execute_sql"></a>

#### execute\_sql

```python
def execute_sql(*args, **kwargs)
```

<a id="bw2data.sqlite.SubstitutableDatabase.transaction"></a>

#### transaction

```python
def transaction()
```

<a id="bw2data.sqlite.SubstitutableDatabase.vacuum"></a>

#### vacuum

```python
def vacuum()
```

<a id="bw2data.sqlite.JSONField"></a>

## JSONField Objects

```python
class JSONField(TextField)
```

Simpler JSON field that doesn't support advanced querying and is human-readable

<a id="bw2data.sqlite.JSONField.db_value"></a>

#### db\_value

```python
def db_value(value)
```

<a id="bw2data.sqlite.JSONField.python_value"></a>

#### python\_value

```python
def python_value(value)
```

<a id="bw2data.sqlite.TupleJSONField"></a>

## TupleJSONField Objects

```python
class TupleJSONField(JSONField)
```

<a id="bw2data.sqlite.TupleJSONField.python_value"></a>

#### python\_value

```python
def python_value(value)
```
