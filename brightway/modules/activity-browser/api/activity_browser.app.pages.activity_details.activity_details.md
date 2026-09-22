**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.activity_details` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.activity_details cfg.yml > activity_browser.app.pages.activity_details.activity_details.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.activity_details"></a>

# activity\_browser.app.pages.activity\_details.activity\_details

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage"></a>

## ActivityDetailsPage Objects

```python
class ActivityDetailsPage(widgets.ABAbstractPage)
```

A widget that displays detailed information about a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display details for.
- `activity_data_grid` _ActivityHeader_ - The header widget displaying activity data.
- `tabs` _QtWidgets.QTabWidget_ - The tab widget containing various detail tabs.
- `exchanges_tab` _ExchangesTab_ - The tab displaying exchanges related to the activity.
- `description_tab` _DescriptionTab_ - The tab displaying the description of the activity.
- `graph_explorer` _GraphTab_ - The tab displaying the graph related to the activity.
- `parameters_tab` _ParametersTab_ - The tab displaying parameters of the activity.
- `consumer_tab` _ConsumersTab_ - The tab displaying consumers of the activity.
- `data_tab` _DataTab_ - The tab displaying data related to the activity.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity: tuple | int | bd.Node, parent=None)
```

Initializes the ActivityDetailsPage widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display details for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connects signals to their respective slots.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.on_node_deleted"></a>

#### on\_node\_deleted

```python
def on_node_deleted(node)
```

Slot to handle node deletion.

**Arguments**:

- `node` - The node that was deleted.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.on_database_deleted"></a>

#### on\_database\_deleted

```python
def on_database_deleted(name)
```

Slot to handle database deletion.

**Arguments**:

- `name` - The name of the database that was deleted.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.syncLater"></a>

#### syncLater

```python
def syncLater()
```

Schedules a sync operation to be performed later.

<a id="activity_browser.app.pages.activity_details.activity_details.ActivityDetailsPage.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the activity.
