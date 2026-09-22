**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.signalling` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.signalling cfg.yml > activity_browser.app.signalling.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.signalling"></a>

# activity\_browser.app.signalling

<a id="activity_browser.app.signalling.NodeSignals"></a>

## NodeSignals Objects

```python
class NodeSignals(QObject)
```

<a id="activity_browser.app.signalling.NodeSignals.changed"></a>

#### changed

<a id="activity_browser.app.signalling.NodeSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.NodeSignals.database_change"></a>

#### database\_change

<a id="activity_browser.app.signalling.NodeSignals.code_change"></a>

#### code\_change

<a id="activity_browser.app.signalling.EdgeSignals"></a>

## EdgeSignals Objects

```python
class EdgeSignals(QObject)
```

<a id="activity_browser.app.signalling.EdgeSignals.changed"></a>

#### changed

<a id="activity_browser.app.signalling.EdgeSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.EdgeSignals.recalculated"></a>

#### recalculated

<a id="activity_browser.app.signalling.MethodSignals"></a>

## MethodSignals Objects

```python
class MethodSignals(QObject)
```

<a id="activity_browser.app.signalling.MethodSignals.changed"></a>

#### changed

<a id="activity_browser.app.signalling.MethodSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.MethodSignals.renamed"></a>

#### renamed

<a id="activity_browser.app.signalling.ParameterSignals"></a>

## ParameterSignals Objects

```python
class ParameterSignals(QObject)
```

<a id="activity_browser.app.signalling.ParameterSignals.changed"></a>

#### changed

<a id="activity_browser.app.signalling.ParameterSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.ParameterSignals.recalculated"></a>

#### recalculated

<a id="activity_browser.app.signalling.DatabaseSignals"></a>

## DatabaseSignals Objects

```python
class DatabaseSignals(QObject)
```

<a id="activity_browser.app.signalling.DatabaseSignals.written"></a>

#### written

<a id="activity_browser.app.signalling.DatabaseSignals.reset"></a>

#### reset

<a id="activity_browser.app.signalling.DatabaseSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.ProjectSignals"></a>

## ProjectSignals Objects

```python
class ProjectSignals(QObject)
```

<a id="activity_browser.app.signalling.ProjectSignals.changed"></a>

#### changed

Project changed | new project dataset, old project dataset

<a id="activity_browser.app.signalling.ProjectSignals.created"></a>

#### created

<a id="activity_browser.app.signalling.ProjectSignals.deleted"></a>

#### deleted

<a id="activity_browser.app.signalling.MetaSignals"></a>

## MetaSignals Objects

```python
class MetaSignals(QObject)
```

<a id="activity_browser.app.signalling.MetaSignals.databases_changed"></a>

#### databases\_changed

<a id="activity_browser.app.signalling.MetaSignals.methods_changed"></a>

#### methods\_changed

<a id="activity_browser.app.signalling.MetaSignals.calculation_setups_changed"></a>

#### calculation\_setups\_changed

<a id="activity_browser.app.signalling.MetaDataSignals"></a>

## MetaDataSignals Objects

```python
class MetaDataSignals(QObject)
```

Signals for MetaDataStore updates.

<a id="activity_browser.app.signalling.MetaDataSignals.synced"></a>

#### synced

added, updated, deleted

<a id="activity_browser.app.signalling.MetaDataSignals.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.signalling.SettingSignals"></a>

## SettingSignals Objects

```python
class SettingSignals(QObject)
```

<a id="activity_browser.app.signalling.SettingSignals.changed"></a>

#### changed

Settings have changed

<a id="activity_browser.app.signalling.SettingSignals.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.signalling.SettingSignals.emit_changed"></a>

#### emit\_changed

```python
def emit_changed(*args, **kwargs)
```

Emit the changed signal.

<a id="activity_browser.app.signalling.ABSignals"></a>

## ABSignals Objects

```python
class ABSignals(QObject)
```

Signals used for the Activity Browser should be defined here.
While arguments can be passed to signals, it is good practice not to do this if possible.
Every signal should have a comment (no matter how descriptive the name of the signal) that describes what a
signal is used for and after a pipe (|), what variables are sent, if any.

<a id="activity_browser.app.signalling.ABSignals.node"></a>

#### node

<a id="activity_browser.app.signalling.ABSignals.edge"></a>

#### edge

<a id="activity_browser.app.signalling.ABSignals.method"></a>

#### method

<a id="activity_browser.app.signalling.ABSignals.database"></a>

#### database

<a id="activity_browser.app.signalling.ABSignals.project"></a>

#### project

<a id="activity_browser.app.signalling.ABSignals.meta"></a>

#### meta

<a id="activity_browser.app.signalling.ABSignals.metadata"></a>

#### metadata

<a id="activity_browser.app.signalling.ABSignals.parameter"></a>

#### parameter

<a id="activity_browser.app.signalling.ABSignals.settings"></a>

#### settings

<a id="activity_browser.app.signalling.ABSignals.database_selected"></a>

#### database\_selected

This database was selected (opened) | name of database

<a id="activity_browser.app.signalling.ABSignals.database_read_only_changed"></a>

#### database\_read\_only\_changed

The read_only state of database changed | name of database, read-only state

<a id="activity_browser.app.signalling.ABSignals.monte_carlo_finished"></a>

#### monte\_carlo\_finished

The monte carlo calculations are finished

<a id="activity_browser.app.signalling.ABSignals.plugin_selected"></a>

#### plugin\_selected

This plugin was/was not selected | name of plugin, selected state

<a id="activity_browser.app.signalling.ABSignals.__getattribute__"></a>

#### \_\_getattribute\_\_

```python
def __getattribute__(item)
```

Delayed loading of connecting to the brighway signals

<a id="activity_browser.app.signalling.patch_methods_datastore"></a>

#### patch\_methods\_datastore

```python
def patch_methods_datastore()
```

<a id="activity_browser.app.signalling.patch_projects"></a>

#### patch\_projects

```python
def patch_projects()
```
