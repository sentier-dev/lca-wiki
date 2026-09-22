**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.tables` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.tables cfg.yml > activity_browser.app.pages.lca_results.tables.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.tables"></a>

# activity\_browser.app.pages.lca\_results.tables

LCA Results tables: pandas models and filterable views for inventory and contributions.

<a id="activity_browser.app.pages.lca_results.tables.CustomHeader"></a>

## CustomHeader Objects

```python
class CustomHeader(QtWidgets.QHeaderView)
```

Header which has a filter button on each cell that can trigger a signal.

Largely based on https://stackoverflow.com/a/30938728

<a id="activity_browser.app.pages.lca_results.tables.CustomHeader.clicked"></a>

#### clicked

<a id="activity_browser.app.pages.lca_results.tables.CustomHeader.__init__"></a>

#### \_\_init\_\_

```python
def __init__(orientation=Qt.Horizontal, parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.CustomHeader.paintSection"></a>

#### paintSection

```python
def paintSection(painter, rect, logical_index)
```

Paint the button onto the column header.

<a id="activity_browser.app.pages.lca_results.tables.CustomHeader.mousePressEvent"></a>

#### mousePressEvent

```python
def mousePressEvent(event)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel"></a>

## PandasModel Objects

```python
class PandasModel(QtCore.QAbstractTableModel)
```

Abstract pandas table model adapted from
https://stackoverflow.com/a/42955764.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.HEADERS"></a>

#### HEADERS

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.updated"></a>

#### updated

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(df: pd.DataFrame = None, parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.columns"></a>

#### columns

```python
@property
def columns() -> list[str]
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.rowCount"></a>

#### rowCount

```python
def rowCount(parent=None, *args, **kwargs)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.columnCount"></a>

#### columnCount

```python
def columnCount(parent=None, *args, **kwargs)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.data"></a>

#### data

```python
def data(index, role=Qt.DisplayRole)
```

Return value for table index based on a certain DisplayRole enum.

More on DisplayRole enums: https://doc.qt.io/qt-5/qt.html#ItemDataRole-enum

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.flags"></a>

#### flags

```python
def flags(index)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.headerData"></a>

#### headerData

```python
def headerData(section, orientation, role=Qt.DisplayRole)
```

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.row_data"></a>

#### row\_data

```python
def row_data(index: int) -> list
```

Return the row at index as a list.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.to_clipboard"></a>

#### to\_clipboard

```python
def to_clipboard(rows, columns, include_header: bool = False)
```

Copy the given rows and columns of the dataframe to clipboard.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.to_csv"></a>

#### to\_csv

```python
def to_csv(path: str) -> None
```

Store the dataframe as csv in the given path.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.to_excel"></a>

#### to\_excel

```python
def to_excel(path: str) -> None
```

Store the underlying dataframe as excel in the given path

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.sync"></a>

#### sync

```python
def sync(*args, **kwargs) -> None
```

(Re)build the dataframe according to the given arguments.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.proxy_to_source"></a>

#### proxy\_to\_source

```python
@staticmethod
def proxy_to_source(proxy: QtCore.QModelIndex) -> QtCore.QModelIndex
```

Step from the QSortFilterProxyModel to the underlying PandasModel.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.test_query_on_column"></a>

#### test\_query\_on\_column

```python
@staticmethod
def test_query_on_column(test_type: str, col_data: pd.Series, query) -> bool
```

Compare query and col_data on test_type, return array with boolean test results.

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.get_filter_mask"></a>

#### get\_filter\_mask

```python
def get_filter_mask(filters: dict) -> pd.Series
```

Generate a filter mask of the dataframe based on the filters.

Returns a pd.Series of boolean results (the mask).

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.set_read_only"></a>

#### set\_read\_only

```python
def set_read_only(read_only: bool)
```

Interface function, to support editable models

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.is_read_only"></a>

#### is\_read\_only

```python
def is_read_only() -> bool
```

Interface function, to support editable models

<a id="activity_browser.app.pages.lca_results.tables.PandasModel.set_builtin_checkbox_delegate"></a>

#### set\_builtin\_checkbox\_delegate

```python
def set_builtin_checkbox_delegate(column: int,
                                  show_text_value: bool,
                                  true_value: Any = True,
                                  false_value: Any = False)
```

Enables the builtin checkbox delegate for columns.
Can be used on bool values only.
As the underlying data can be bool or string, we provide the values to be
stored as parameters.

<a id="activity_browser.app.pages.lca_results.tables.ABSortProxyModel"></a>

## ABSortProxyModel Objects

```python
class ABSortProxyModel(QtCore.QSortFilterProxyModel)
```

Reimplementation to allow for sorting on the actual data in cells instead of the visible data.

See this for context: https://github.com/LCA-ActivityBrowser/activity-browser/pull/1151

<a id="activity_browser.app.pages.lca_results.tables.ABSortProxyModel.lessThan"></a>

#### lessThan

```python
def lessThan(left: QtCore.QModelIndex, right: QtCore.QModelIndex) -> bool
```

Override to sort actual data, expects `left` and `right` are comparable.

If `left` and `right` are not the same type, we check if numerical and empty string are compared, if that is the
case, we assume empty string == 0.
Added this case for: https://github.com/LCA-ActivityBrowser/activity-browser/issues/1215

<a id="activity_browser.app.pages.lca_results.tables.ABMultiColumnSortProxyModel"></a>

## ABMultiColumnSortProxyModel Objects

```python
class ABMultiColumnSortProxyModel(ABSortProxyModel)
```

Subclass of QSortFilterProxyModel to enable sorting on multiple columns.

The main purpose of this subclass is to override def filterAcceptsRow().

Subclass based on various ideas from:
https://stackoverflow.com/questions/47201539/how-to-filter-multiple-column-in-qtableview
http://www.dayofthenewdan.com/2013/02/09/Qt_QSortFilterProxyModel.html
https://gist.github.com/dbridges/4732790

<a id="activity_browser.app.pages.lca_results.tables.ABMultiColumnSortProxyModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.ABMultiColumnSortProxyModel.set_filters"></a>

#### set\_filters

```python
def set_filters(mask) -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABMultiColumnSortProxyModel.clear_filters"></a>

#### clear\_filters

```python
def clear_filters() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABMultiColumnSortProxyModel.filterAcceptsRow"></a>

#### filterAcceptsRow

```python
def filterAcceptsRow(row: int, parent) -> bool
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView"></a>

## ABDataFrameView Objects

```python
class ABDataFrameView(QtWidgets.QTableView)
```

Base class for showing pandas dataframe objects as tables.

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.ALL_FILTER"></a>

#### ALL\_FILTER

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.CSV_FILTER"></a>

#### CSV\_FILTER

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.TSV_FILTER"></a>

#### TSV\_FILTER

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.EXCEL_FILTER"></a>

#### EXCEL\_FILTER

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.sizeHint"></a>

#### sizeHint

```python
def sizeHint() -> QSize
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.minimumSizeHint"></a>

#### minimumSizeHint

```python
def minimumSizeHint() -> QSize
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.rowCount"></a>

#### rowCount

```python
def rowCount() -> int
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.update_proxy_model"></a>

#### update\_proxy\_model

```python
@Slot(name="updateProxyModel")
def update_proxy_model() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.to_clipboard"></a>

#### to\_clipboard

```python
@Slot(name="exportToClipboard")
def to_clipboard()
```

Copy dataframe to clipboard

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.savefilepath"></a>

#### savefilepath

```python
def savefilepath(default_file_name: str,
                 caption: str = None,
                 file_filter: str = None)
```

Construct and return default path where data is stored

Uses the application directory for AB

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.to_csv"></a>

#### to\_csv

```python
@Slot(name="exportToCsv")
def to_csv()
```

Save the dataframe data to a CSV file.

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.to_excel"></a>

#### to\_excel

```python
@Slot(name="exportToExcel")
def to_excel(caption: str = None)
```

Save the dataframe data to an excel file.

<a id="activity_browser.app.pages.lca_results.tables.ABDataFrameView.keyPressEvent"></a>

#### keyPressEvent

```python
@Slot(QtGui.QKeyEvent, name="copyEvent")
def keyPressEvent(e)
```

Allow user to copy selected data from the table

NOTE: by default, the table headers (column names) are also copied.

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView"></a>

## ABFilterableDataFrameView Objects

```python
class ABFilterableDataFrameView(ABDataFrameView)
```

Filterable base class for showing pandas dataframe objects as tables.

To use this table, the following MUST be set in the table model:
- self.filterable_columns: dict
    --> these columns are available for filtering
    --> key is column name, value is column index

To use this table, the following MUST be set in the table view:
- self.header.column_indices = list(self.model.filterable_columns.values())
    --> If not set, no filter buttons will appear.
    --> Probably wise to set in a `if isinstance(self.model.filterable_columns, dict):`
    --> This variable must be set any time the columns of the table change

To use this table, the following can be set in the table model:
- self.different_column_types: dict
    --> these columns require a different filter type than 'str'
    --> e.g. self.different_column_types = {'col_name': 'num'}

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.FILTER_TYPES"></a>

#### FILTER\_TYPES

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.header_filter_button_clicked"></a>

#### header\_filter\_button\_clicked

```python
def header_filter_button_clicked(column: int, button: str) -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.header_context_menu"></a>

#### header\_context\_menu

```python
def header_context_menu() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.update_proxy_model"></a>

#### update\_proxy\_model

```python
@Slot(name="updateProxyModel")
def update_proxy_model() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.quick_filter"></a>

#### quick\_filter

```python
def quick_filter() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.filter_manager_dialog"></a>

#### filter\_manager\_dialog

```python
def filter_manager_dialog() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.simple_filter_dialog"></a>

#### simple\_filter\_dialog

```python
def simple_filter_dialog(preset_type: str = None) -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.add_filter"></a>

#### add\_filter

```python
def add_filter(new_filter: tuple) -> None
```

Add a single filter to self.filters.

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.write_filters"></a>

#### write\_filters

```python
def write_filters(filters: dict) -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.apply_filters"></a>

#### apply\_filters

```python
def apply_filters() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.reset_column_filters"></a>

#### reset\_column\_filters

```python
def reset_column_filters() -> None
```

Reset all filters for this column.

<a id="activity_browser.app.pages.lca_results.tables.ABFilterableDataFrameView.reset_filters"></a>

#### reset\_filters

```python
def reset_filters() -> None
```

Reset all filters for this entire table.

<a id="activity_browser.app.pages.lca_results.tables.LCAResultsModel"></a>

## LCAResultsModel Objects

```python
class LCAResultsModel(PandasModel)
```

<a id="activity_browser.app.pages.lca_results.tables.LCAResultsModel.sync"></a>

#### sync

```python
def sync(df)
```

<a id="activity_browser.app.pages.lca_results.tables.LCAResultsTable"></a>

## LCAResultsTable Objects

```python
class LCAResultsTable(ABDataFrameView)
```

<a id="activity_browser.app.pages.lca_results.tables.LCAResultsTable.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryModel"></a>

## InventoryModel Objects

```python
class InventoryModel(PandasModel)
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryModel.sync"></a>

#### sync

```python
def sync(df)
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryTable"></a>

## InventoryTable Objects

```python
class InventoryTable(ABFilterableDataFrameView)
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryTable.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryTable.update_filter_data"></a>

#### update\_filter\_data

```python
def update_filter_data() -> None
```

<a id="activity_browser.app.pages.lca_results.tables.InventoryTable.write_filters"></a>

#### write\_filters

```python
def write_filters(filters: dict) -> None
```

<a id="activity_browser.app.pages.lca_results.tables.ContributionModel"></a>

## ContributionModel Objects

```python
class ContributionModel(PandasModel)
```

<a id="activity_browser.app.pages.lca_results.tables.ContributionModel.sync"></a>

#### sync

```python
def sync(df, unit="% of range", tab=None)
```

<a id="activity_browser.app.pages.lca_results.tables.ContributionTable"></a>

## ContributionTable Objects

```python
class ContributionTable(ABDataFrameView)
```

<a id="activity_browser.app.pages.lca_results.tables.ContributionTable.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```
