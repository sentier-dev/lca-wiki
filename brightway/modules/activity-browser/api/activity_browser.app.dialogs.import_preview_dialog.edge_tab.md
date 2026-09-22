**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.dialogs.import_preview_dialog.edge_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.dialogs.import_preview_dialog.edge_tab cfg.yml > activity_browser.app.dialogs.import_preview_dialog.edge_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab"></a>

# activity\_browser.app.dialogs.import\_preview\_dialog.edge\_tab

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab"></a>

## ImportPreviewEdgeTab Objects

```python
class ImportPreviewEdgeTab(QtWidgets.QWidget)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.standardEdgeColumns"></a>

#### standardEdgeColumns

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(importer: LCIImporter, parent=None)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.sync"></a>

#### sync

```python
def sync()
```

Synchronize the view based on simple/detailed mode.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.on_mode_switch"></a>

#### on\_mode\_switch

```python
def on_mode_switch(check: Qt.CheckState)
```

Handle the mode switch between simple and detailed view.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeTab.relink_selected_exchanges"></a>

#### relink\_selected\_exchanges

```python
def relink_selected_exchanges()
```

Open a dialog to link selected exchanges to existing nodes.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ShiftedCardDelegate"></a>

## ShiftedCardDelegate Objects

```python
class ShiftedCardDelegate(delegates.CardDelegate)
```

Delegate that shifts the card content to the left to compensate for indentation.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ShiftedCardDelegate.paint"></a>

#### paint

```python
def paint(painter, option, index)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView"></a>

## ImportPreviewEdgeView Objects

```python
class ImportPreviewEdgeView(widgets.ABTreeView)
```

View for displaying import preview nodes.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView.ContextMenu"></a>

## ContextMenu Objects

```python
class ContextMenu(widgets.ABMenu)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView.ContextMenu.menuSetup"></a>

#### menuSetup

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(importer: LCIImporter, tab: ImportPreviewEdgeTab)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeView.selected_exchanges"></a>

#### selected\_exchanges

```python
@property
def selected_exchanges()
```

Returns a list of selected exchange locations as (node_index, exchange_index) tuples. These can be used to
identify and manipulate the selected exchanges in the importer's data, which is a list of lists.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeModel"></a>

## ImportPreviewEdgeModel Objects

```python
class ImportPreviewEdgeModel(core.ABTreeModel)
```

Model for import preview nodes with node delegate support.

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeModel.displayData"></a>

#### displayData

```python
def displayData(index: QtCore.QModelIndex) -> any
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QModelIndex) -> QtGui.QIcon
```

<a id="activity_browser.app.dialogs.import_preview_dialog.edge_tab.ImportPreviewEdgeModel.indexSelectable"></a>

#### indexSelectable

```python
def indexSelectable(index: QModelIndex) -> bool
```
