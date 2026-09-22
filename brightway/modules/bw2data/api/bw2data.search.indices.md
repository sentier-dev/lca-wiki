**Generated API reference** · package `bw2data` 4.7 · module `bw2data.search.indices` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.search.indices cfg.yml > bw2data.search.indices.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.search.indices"></a>

# bw2data.search.indices

<a id="bw2data.search.indices.MODELS"></a>

#### MODELS

<a id="bw2data.search.indices.IndexManager"></a>

## IndexManager Objects

```python
class IndexManager()
```

<a id="bw2data.search.indices.IndexManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database_path)
```

<a id="bw2data.search.indices.IndexManager.get"></a>

#### get

```python
def get()
```

<a id="bw2data.search.indices.IndexManager.create"></a>

#### create

```python
def create()
```

<a id="bw2data.search.indices.IndexManager.add_dataset"></a>

#### add\_dataset

```python
def add_dataset(ds)
```

<a id="bw2data.search.indices.IndexManager.add_datasets"></a>

#### add\_datasets

```python
def add_datasets(datasets)
```

<a id="bw2data.search.indices.IndexManager.update_dataset"></a>

#### update\_dataset

```python
def update_dataset(ds)
```

<a id="bw2data.search.indices.IndexManager.delete_dataset"></a>

#### delete\_dataset

```python
def delete_dataset(ds)
```

<a id="bw2data.search.indices.IndexManager.delete_database"></a>

#### delete\_database

```python
def delete_database()
```

<a id="bw2data.search.indices.IndexManager.close"></a>

#### close

```python
def close()
```

<a id="bw2data.search.indices.IndexManager.escape_search_for_fts5"></a>

#### escape\_search\_for\_fts5

```python
@staticmethod
def escape_search_for_fts5(string: str) -> str
```

<a id="bw2data.search.indices.IndexManager.search"></a>

#### search

```python
def search(string, limit=None, weights=None, mask=None, filter=None)
```
