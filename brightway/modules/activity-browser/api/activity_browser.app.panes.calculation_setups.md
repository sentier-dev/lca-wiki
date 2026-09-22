**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.panes.calculation_setups` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.panes.calculation_setups cfg.yml > activity_browser.app.panes.calculation_setups.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.panes.calculation_setups"></a>

# activity\_browser.app.panes.calculation\_setups

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane"></a>

## CalculationSetupsPane Objects

```python
class CalculationSetupsPane(widgets.ABAbstractPane)
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.title"></a>

#### title

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.unique"></a>

#### unique

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent)
```

Initializes the CalculationSetupsPane.

This constructor sets up the view and model for displaying calculation setups,
configures the view's appearance and behavior, and builds the layout while
connecting necessary signals.

**Arguments**:

- `parent` _QtWidgets.QWidget_ - The parent widget for this pane.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connects the signals to the appropriate slots.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the model with the current state of the calculation setups.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsPane.build_df"></a>

#### build\_df

```python
def build_df() -> pd.DataFrame
```

Builds a DataFrame from the calculation setups.

**Returns**:

- `pd.DataFrame` - The DataFrame containing the calculation setups data.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView"></a>

## CalculationSetupsView Objects

```python
class CalculationSetupsView(widgets.ABTreeView)
```

A view that displays the calculation setups in a tree structure.

**Attributes**:

- `defaultColumnDelegates` _dict_ - The default column delegates for the view.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.calculation_setups"></a>

#### calculation\_setups

```python
@property
def calculation_setups()
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.single_selection"></a>

#### single\_selection

```python
@property
def single_selection()
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.HeaderMenu"></a>

## HeaderMenu Objects

```python
class HeaderMenu(QtWidgets.QMenu)
```

A header menu for the DatabasesView. Currently not used.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.HeaderMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.mouseDoubleClickEvent"></a>

#### mouseDoubleClickEvent

```python
def mouseDoubleClickEvent(event: QtGui.QMouseEvent)
```

Handles the mouse double click event to open the selected calculation setups.

**Arguments**:

- `event` _QtGui.QMouseEvent_ - The mouse double click event.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.dragMoveEvent"></a>

#### dragMoveEvent

```python
def dragMoveEvent(event) -> None
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.dragEnterEvent"></a>

#### dragEnterEvent

```python
def dragEnterEvent(event)
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsView.dropEvent"></a>

#### dropEvent

```python
def dropEvent(event) -> None
```

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsModel"></a>

## CalculationSetupsModel Objects

```python
class CalculationSetupsModel(core.ABTreeModel)
```

A model representing the data for the calculation setups.

<a id="activity_browser.app.panes.calculation_setups.CalculationSetupsModel.fontData"></a>

#### fontData

```python
def fontData(index)
```

Provides font data for the model.

**Arguments**:

- `index` - The index for which to provide font data.
  

**Returns**:

- `QtGui.QFont` - The font data for the index.
