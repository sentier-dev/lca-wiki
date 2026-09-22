**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.metadata.updater` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.metadata.updater cfg.yml > activity_browser.bwutils.metadata.updater.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.metadata.updater"></a>

# activity\_browser.bwutils.metadata.updater

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater"></a>

## MDSUpdater Objects

```python
class MDSUpdater(QObject)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mds: MetaDataStore)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.on_signaleddataset_save"></a>

#### on\_signaleddataset\_save

```python
def on_signaleddataset_save(sender, old, new)
```

Called when a dataset is created or modified in Brightway.

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.on_signaleddataset_delete"></a>

#### on\_signaleddataset\_delete

```python
def on_signaleddataset_delete(sender, old)
```

Called when a dataset is deleted in Brightway.

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.on_database_deleted_bw"></a>

#### on\_database\_deleted\_bw

```python
def on_database_deleted_bw(sender, name)
```

Called when a database is deleted in Brightway.

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.on_databases_metadata_change"></a>

#### on\_databases\_metadata\_change

```python
def on_databases_metadata_change(sender, old, new)
```

Called when the databases metadata changes (e.g., new database added).

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.on_database_changed"></a>

#### on\_database\_changed

```python
def on_database_changed() -> None
```

Sync MetaDataStore with databases present in activitydataset.

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.modify_node"></a>

#### modify\_node

```python
def modify_node(ds: pd.Series)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.add_node"></a>

#### add\_node

```python
def add_node(ds: pd.Series)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.delete_node"></a>

#### delete\_node

```python
def delete_node(ds: pd.Series)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.add_database"></a>

#### add\_database

```python
def add_database(db_name: str)
```

<a id="activity_browser.bwutils.metadata.updater.MDSUpdater.delete_database"></a>

#### delete\_database

```python
def delete_database(db_name: str)
```

<a id="activity_browser.bwutils.metadata.updater.databases_in_sqlite"></a>

#### databases\_in\_sqlite

```python
def databases_in_sqlite() -> set[str]
```
