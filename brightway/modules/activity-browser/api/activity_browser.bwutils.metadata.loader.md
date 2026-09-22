**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.metadata.loader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.metadata.loader cfg.yml > activity_browser.bwutils.metadata.loader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.metadata.loader"></a>

# activity\_browser.bwutils.metadata.loader

<a id="activity_browser.bwutils.metadata.loader.MDSLoader"></a>

## MDSLoader Objects

```python
class MDSLoader(QObject)
```

Load and refresh MetaDataStore from the Brightway LCI sqlite backend.

Project-wide loads run at startup; :meth:`load_database` refreshes a single
database after import. Reloads never block the GUI thread — concurrent
requests are queued in :attr:`_pending_database_loads`.

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.primary_status"></a>

#### primary\_status

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.secondary_status"></a>

#### secondary\_status

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mds: MetaDataStore)
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.on_project_changed"></a>

#### on\_project\_changed

```python
def on_project_changed(sender)
```

Called when the Brightway project changes.

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.load_project"></a>

#### load\_project

```python
def load_project()
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.cache_load_project"></a>

#### cache\_load\_project

```python
def cache_load_project()
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.primary_load_project"></a>

#### primary\_load\_project

```python
def primary_load_project()
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.secondary_load_project"></a>

#### secondary\_load\_project

```python
def secondary_load_project(secondary_df: pd.DataFrame, sqlite_db: str)
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.load_database"></a>

#### load\_database

```python
def load_database(database_name: str)
```

Reload primary and secondary metadata for one database.

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.primary_load_database"></a>

#### primary\_load\_database

```python
def primary_load_database(database_name: str) -> None
```

<a id="activity_browser.bwutils.metadata.loader.MDSLoader.secondary_load_database"></a>

#### secondary\_load\_database

```python
def secondary_load_database(secondary_df: pd.DataFrame, sqlite_db: str)
```

<a id="activity_browser.bwutils.metadata.loader.InitSearcherThread"></a>

## InitSearcherThread Objects

```python
class InitSearcherThread(QThread)
```

Thread for initializing the searcher.

<a id="activity_browser.bwutils.metadata.loader.InitSearcherThread.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mds: MetaDataStore, parent)
```

<a id="activity_browser.bwutils.metadata.loader.InitSearcherThread.run"></a>

#### run

```python
def run()
```

Execute the searcher initialization in a background thread.

<a id="activity_browser.bwutils.metadata.loader.SecondaryLoadThread"></a>

## SecondaryLoadThread Objects

```python
class SecondaryLoadThread(QThread)
```

Thread for loading secondary metadata using multiprocessing Pool.

<a id="activity_browser.bwutils.metadata.loader.SecondaryLoadThread.result"></a>

#### result

<a id="activity_browser.bwutils.metadata.loader.SecondaryLoadThread.__init__"></a>

#### \_\_init\_\_

```python
def __init__(databases: list[str], sqlite_db: str, parent)
```

<a id="activity_browser.bwutils.metadata.loader.SecondaryLoadThread.run"></a>

#### run

```python
def run()
```

Execute the loading in a background thread.

<a id="activity_browser.bwutils.metadata.loader.load"></a>

#### load

```python
def load(fp: str, database_name: str, fields: list[str])
```

<a id="activity_browser.bwutils.metadata.loader._DatabaseReloadScheduler"></a>

## \_DatabaseReloadScheduler Objects

```python
class _DatabaseReloadScheduler(QObject)
```

Marshal single-database metadata reloads onto the Qt GUI thread.

<a id="activity_browser.bwutils.metadata.loader._DatabaseReloadScheduler.reload_requested"></a>

#### reload\_requested

<a id="activity_browser.bwutils.metadata.loader._DatabaseReloadScheduler.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QObject | None = None)
```

<a id="activity_browser.bwutils.metadata.loader.schedule_database_metadata_reload"></a>

#### schedule\_database\_metadata\_reload

```python
def schedule_database_metadata_reload(db_name: str) -> None
```

Queue a per-database metadata reload on the Qt GUI thread.
