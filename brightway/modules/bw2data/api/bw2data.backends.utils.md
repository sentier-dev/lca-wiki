**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.utils cfg.yml > bw2data.backends.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.utils"></a>

# bw2data.backends.utils

<a id="bw2data.backends.utils.get_csv_data_dict"></a>

#### get\_csv\_data\_dict

```python
def get_csv_data_dict(ds)
```

<a id="bw2data.backends.utils.convert_backend"></a>

#### convert\_backend

```python
def convert_backend(database_name, backend)
```

Convert a Database to another backend.

bw2data currently supports the `default` and `json` backends.

**Arguments**:

  * `database_name` (unicode): Name of database.
  * `backend` (unicode): Type of database. `backend` should be recoginized by `DatabaseChooser`.
  
  Returns `False` if the old and new backend are the same. Otherwise returns an instance of the new Database object.

<a id="bw2data.backends.utils.check_exchange"></a>

#### check\_exchange

```python
def check_exchange(exc)
```

Check exchange data validity when processing

<a id="bw2data.backends.utils.dict_as_activitydataset"></a>

#### dict\_as\_activitydataset

```python
def dict_as_activitydataset(ds: Any, add_snowflake_id: bool = False) -> dict
```

<a id="bw2data.backends.utils.dict_as_exchangedataset"></a>

#### dict\_as\_exchangedataset

```python
def dict_as_exchangedataset(ds: Any) -> dict
```

<a id="bw2data.backends.utils.get_obj_as_dict"></a>

#### get\_obj\_as\_dict

```python
def get_obj_as_dict(cls: SignaledDataset, obj_id: Optional[int]) -> dict
```

Loads an object's data from the database as a dictionary.

The format used is that of the serialization of revisions (see also the
`dict_as_*` functions above); in particular, an empty dictionary is returned
if the ID is `None` (but not if the object does not exist).

<a id="bw2data.backends.utils.replace_cfs"></a>

#### replace\_cfs

```python
def replace_cfs(old_key, new_key)
```

Replace ``old_key`` with ``new_key`` in characterization factors.

Returns list of modified methods.

<a id="bw2data.backends.utils.retupleize_geo_strings"></a>

#### retupleize\_geo\_strings

```python
def retupleize_geo_strings(value)
```

Transform data from SQLite representation to Python objects.

We are using a SQLite3 cursor, which means that the Peewee data conversion code is not called. So ``('foo', 'bar')`` is stored as a string, not a tuple. This code tries to do this conversion correctly.

TODO: Adapt what Peewee does in this case?
