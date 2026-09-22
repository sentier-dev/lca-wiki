**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.dialogs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.dialogs cfg.yml > activity_browser.app.pages.lca_results.dialogs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.dialogs"></a>

# activity\_browser.app.pages.lca\_results.dialogs

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab"></a>

## ColumnFilterTab Objects

```python
class ColumnFilterTab(QtWidgets.QWidget)
```

Content of column tab.

Required inputs:
- None
Optional inputs:
- col_type: str --> the type of column, either 'str' or 'num'. defines the search type options.
defaults to 'str'
- state: dict --> dict of existing filter state that should be re-created in UI.

Interaction:
- def get_state: Provides the state of all relevant filter elements (filter rows, AND/OR menu)
returns: dict
- def set_state: Writes given state dict to UI elements (filter rows, AND/OR menu)

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filter_types: dict,
             col_type: str = "str",
             state: dict = {},
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.add_row"></a>

#### add\_row

```python
def add_row(state: tuple = None) -> None
```

Add a new row to the self.filter_rows.

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.remove_row"></a>

#### remove\_row

```python
def remove_row(idx: int) -> None
```

Remove the row from the setup

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.get_state"></a>

#### get\_state

```python
@property
def get_state() -> dict
```

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.set_state"></a>

#### set\_state

```python
def set_state(state: dict) -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.ColumnFilterTab.show_hide_and_or"></a>

#### show\_hide\_and\_or

```python
def show_hide_and_or() -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.AndOrRadioButtons"></a>

## AndOrRadioButtons Objects

```python
class AndOrRadioButtons(QtWidgets.QWidget)
```

Convenience class for managing AND/OR buttons.

This class is purely intended for FilterManagerDialog and related, take this into account if using elsewhere.

Required inputs:
- None
Optional inputs:
- label_text: str -->
- state: str --> str of existing AND/OR state that should be re-created in UI.

Interaction:
- def get_state: Provides the state of AND/OR radio buttons (string of 'AND' or 'OR')
returns: str
- def set_state: Writes given AND/OR state UI element (string of 'AND' or 'OR')

<a id="activity_browser.app.pages.lca_results.dialogs.AndOrRadioButtons.__init__"></a>

#### \_\_init\_\_

```python
def __init__(label_text: str = "", state: str = None, parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.AndOrRadioButtons.get_state"></a>

#### get\_state

```python
@property
def get_state() -> str
```

<a id="activity_browser.app.pages.lca_results.dialogs.AndOrRadioButtons.set_state"></a>

#### set\_state

```python
def set_state(state: str) -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow"></a>

## FilterRow Objects

```python
class FilterRow(QtWidgets.QWidget)
```

Convenience class for managing a filter input row.

This class is purely intended for FilterManagerDialog and related, take this into account if using elsewhere.

Required inputs:
- idx: int --> integer index in self.filter_rows of parent. Used as ID in parent
idx is the index position of this FilterRow in the list of rows in parent.
- filter_types: dict --> the types of filter available
Optional inputs:
- state: tuple --> tuple of existing filter state that should be re-created in UI.

Interaction:
- def get_state: Provides the state of all relevant filter fields (filter type, query, case sensitive)
returns: tuple
- def set_state: Writes given state tuple to UI elements (filter type, query, case sensitive)

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(idx: int,
             filter_types: dict,
             remove_option: bool = True,
             preset_type: str = None,
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow.get_state"></a>

#### get\_state

```python
@property
def get_state() -> tuple
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow.set_state"></a>

#### set\_state

```python
def set_state(state: tuple) -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow.set_input_changes"></a>

#### set\_input\_changes

```python
def set_input_changes() -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterRow.self_destruct"></a>

#### self\_destruct

```python
def self_destruct() -> None
```

Remove this FilterRow object from parent.

<a id="activity_browser.app.pages.lca_results.dialogs.StrFilterRow"></a>

## StrFilterRow Objects

```python
class StrFilterRow(FilterRow)
```

Convenience class for managing a filter input row for 'str' type.

<a id="activity_browser.app.pages.lca_results.dialogs.StrFilterRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(idx: int,
             filter_types: dict,
             state: tuple = None,
             remove_option: bool = True,
             preset_type: str = None,
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.StrFilterRow.get_state"></a>

#### get\_state

```python
@property
def get_state() -> tuple
```

<a id="activity_browser.app.pages.lca_results.dialogs.StrFilterRow.set_state"></a>

#### set\_state

```python
def set_state(state: tuple) -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.StrFilterRow.set_input_changes"></a>

#### set\_input\_changes

```python
def set_input_changes() -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.NumFilterRow"></a>

## NumFilterRow Objects

```python
class NumFilterRow(FilterRow)
```

Convenience class for managing a filter input row for 'num' type.

<a id="activity_browser.app.pages.lca_results.dialogs.NumFilterRow.__init__"></a>

#### \_\_init\_\_

```python
def __init__(idx: int,
             filter_types: dict,
             state: tuple = None,
             remove_option: bool = True,
             preset_type: str = None,
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.NumFilterRow.get_state"></a>

#### get\_state

```python
@property
def get_state() -> tuple
```

<a id="activity_browser.app.pages.lca_results.dialogs.NumFilterRow.set_state"></a>

#### set\_state

```python
def set_state(state: tuple) -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.NumFilterRow.set_input_changes"></a>

#### set\_input\_changes

```python
def set_input_changes() -> None
```

<a id="activity_browser.app.pages.lca_results.dialogs.SimpleFilterDialog"></a>

## SimpleFilterDialog Objects

```python
class SimpleFilterDialog(QtWidgets.QDialog)
```

Add one filter to a column.

Related to FilterManagerDialog.

<a id="activity_browser.app.pages.lca_results.dialogs.SimpleFilterDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(column_name: dict,
             filter_types: dict,
             column_type: str = "str",
             preset_type: str = None,
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.SimpleFilterDialog.get_filter"></a>

#### get\_filter

```python
@property
def get_filter() -> tuple
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterManagerDialog"></a>

## FilterManagerDialog Objects

```python
class FilterManagerDialog(QtWidgets.QDialog)
```

Set filters for a table.

Dialog has 1 tab per given column. Each tab has rows for filters,
where type/query/other is defined. User can add/remove filters as desired.
When multiple filters exist for 1 column, user can choose AND/OR combination of filters.
AND/OR for combining columns can also be chosen.

Required inputs:
- column names: dict --> the column names and their indices in the table
    format: {'col_name': i}
Optional inputs:
- filters: dict --> pre-apply filters in the dialog (see format example below)
- selected_column: int --> open the dialog with this column tab open
- column_types: dict --> show other filters for this column
    format: {'col_name': 'num'}
    options: str/num, defaults to str if no type is given

Interaction:
- call 'start_filter_dialog' of 'ABFilterableDataFrameView' to launch dialog,
filters are only applied when OK is selected. This calls self.get_filters,
which returns filter data as dict.

example of filters (see also ABMultiColumnSortProxyModel):
filters = {
        0: {'filters': [('contains', 'heat', False), ('contains', 'electricity', False)],
            'mode': 'OR'},
        1: {'filters': [('contains', 'market', False)]}
    }

<a id="activity_browser.app.pages.lca_results.dialogs.FilterManagerDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(column_names: dict,
             filter_types: dict,
             filters: dict = None,
             selected_column: int = 0,
             column_types: dict = {},
             parent=None)
```

<a id="activity_browser.app.pages.lca_results.dialogs.FilterManagerDialog.get_filters"></a>

#### get\_filters

```python
@property
def get_filters() -> dict
```
