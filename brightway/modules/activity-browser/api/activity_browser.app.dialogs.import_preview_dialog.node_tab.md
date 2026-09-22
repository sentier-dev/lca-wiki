**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.dialogs.import_preview_dialog.node_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.dialogs.import_preview_dialog.node_tab cfg.yml > activity_browser.app.dialogs.import_preview_dialog.node_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab"></a>

# activity\_browser.app.dialogs.import\_preview\_dialog.node\_tab

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab"></a>

## ImportPreviewNodeTab Objects

```python
class ImportPreviewNodeTab(QtWidgets.QWidget)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.standardNodeColumns"></a>

#### standardNodeColumns

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.standardEdgeColumns"></a>

#### standardEdgeColumns

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(importer: LCIImporter, parent=None)
```

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.sync"></a>

#### sync

```python
def sync()
```

Synchronize the view based on simple/detailed mode.

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.build_df"></a>

#### build\_df

```python
def build_df()
```

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeTab.on_mode_switch"></a>

#### on\_mode\_switch

```python
def on_mode_switch(check: Qt.CheckState)
```

Handle the mode switch between simple and detailed view.

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeView"></a>

## ImportPreviewNodeView Objects

```python
class ImportPreviewNodeView(widgets.ABTreeView)
```

View for displaying import preview nodes.

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeView.defaultColumnDelegates"></a>

#### defaultColumnDelegates

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeModel"></a>

## ImportPreviewNodeModel Objects

```python
class ImportPreviewNodeModel(core.ABTreeModel)
```

Model for import preview nodes with node delegate support.

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeModel.displayData"></a>

#### displayData

```python
def displayData(index: QtCore.QModelIndex) -> any
```

<a id="activity_browser.app.dialogs.import_preview_dialog.node_tab.ImportPreviewNodeModel.decorationData"></a>

#### decorationData

```python
def decorationData(index: QModelIndex) -> QtGui.QIcon
```
