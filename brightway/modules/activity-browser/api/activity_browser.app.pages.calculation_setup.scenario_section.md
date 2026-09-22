**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.calculation_setup.scenario_section` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.calculation_setup.scenario_section cfg.yml > activity_browser.app.pages.calculation_setup.scenario_section.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.calculation_setup.scenario_section"></a>

# activity\_browser.app.pages.calculation\_setup.scenario\_section

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection"></a>

## ScenarioSection Objects

```python
class ScenarioSection(QtWidgets.QWidget)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.max_tables"></a>

#### max\_tables

Special kind of QWidget that contains one or more tables side by side.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.connect_signals"></a>

#### connect\_signals

```python
def connect_signals() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.get_template_action"></a>

#### get\_template\_action

```python
def get_template_action() -> None
```

Save a parameter- or flow-scenario starter template chosen by the user.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.show_scenarios_help"></a>

#### show\_scenarios\_help

```python
def show_scenarios_help() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.update_stats"></a>

#### update\_stats

```python
def update_stats() -> None
```

Update the statistics at the bottom of the widget

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.toggle_combine_type"></a>

#### toggle\_combine\_type

```python
def toggle_combine_type() -> None
```

Rebuild after Combine/Extend switch; restore prior mode on failure.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.get_combine_type"></a>

#### get\_combine\_type

```python
def get_combine_type() -> str
```

Return the type of combination the user wants to do

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.scenario_dataframe"></a>

#### scenario\_dataframe

```python
def scenario_dataframe() -> pd.DataFrame
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.cs_name"></a>

#### cs\_name

```python
def cs_name() -> str | None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.current_axes"></a>

#### current\_axes

```python
def current_axes() -> list[list[str]]
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.refresh_inclusion_ui"></a>

#### refresh\_inclusion\_ui

```python
def refresh_inclusion_ui() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.sync_combinations_panel"></a>

#### sync\_combinations\_panel

```python
def sync_combinations_panel() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.set_combination_included"></a>

#### set\_combination\_included

```python
def set_combination_included(name: str, active: bool) -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.select_all_combinations"></a>

#### select\_all\_combinations

```python
def select_all_combinations() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.select_none_combinations"></a>

#### select\_none\_combinations

```python
def select_none_combinations() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.set_name_included"></a>

#### set\_name\_included

```python
def set_name_included(file_index: int, name: str, active: bool) -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.persist_inclusion"></a>

#### persist\_inclusion

```python
def persist_inclusion() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.reconcile_inclusion_after_combine"></a>

#### reconcile\_inclusion\_after\_combine

```python
def reconcile_inclusion_after_combine() -> bool
```

Reconcile S after combine. Returns True if axes mismatched vs prior S.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.load_persisted_scenarios"></a>

#### load\_persisted\_scenarios

```python
def load_persisted_scenarios() -> None
```

Reload scenario files from the CS when entering Scenario mode.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.combined_dataframe"></a>

#### combined\_dataframe

```python
def combined_dataframe(skip_checks: bool = False) -> None
```

Updates scenario dataframe to contain the combined scenarios of multiple tables.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.add_table"></a>

#### add\_table

```python
def add_table() -> None
```

Add a new table widget to the widget and add to the list of tables

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.remove_table"></a>

#### remove\_table

```python
def remove_table(index: int) -> None
```

Remove the table widget at the provided index

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.clear_tables"></a>

#### clear\_tables

```python
def clear_tables() -> None
```

Clear all scenario tables in certain cases (eg. project change).

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.updateGeometry"></a>

#### updateGeometry

```python
def updateGeometry()
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.can_add_table"></a>

#### can\_add\_table

```python
def can_add_table() -> None
```

Use this to set a hardcoded limit on the amount of scenario tables
a user can add.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.refresh_save_button"></a>

#### refresh\_save\_button

```python
def refresh_save_button() -> None
```

Enable Save when a merged flow-scenario table is available.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.save_action"></a>

#### save\_action

```python
def save_action() -> None
```

Creates and saves to file (.xlsx, or .csv) the scenario dataframe after the loaded scenarios have been
merged. Will not contain duplicates. Will not contain self-referential technosphere flows.

Triggered by a signal from ScenarioImportPanel save button, uses a dummy input argument.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioSection.save_button"></a>

#### save\_button

```python
def save_button(visible: bool)
```

Compatibility hook after manual file load; state follows the combined table.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioCombinationsPanel"></a>

## ScenarioCombinationsPanel Objects

```python
class ScenarioCombinationsPanel(QtWidgets.QWidget)
```

Checkbox list of product-combined scenario names.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioCombinationsPanel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(section: ScenarioSection, parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioCombinationsPanel.set_combinations"></a>

#### set\_combinations

```python
def set_combinations(rows: list[tuple[str, bool]]) -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget"></a>

## ScenarioImportWidget Objects

```python
class ScenarioImportWidget(QtWidgets.QWidget)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.__init__"></a>

#### \_\_init\_\_

```python
def __init__(index: int, parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.load_action"></a>

#### load\_action

```python
def load_action() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.reload_action"></a>

#### reload\_action

```python
def reload_action() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.load_from_path"></a>

#### load\_from\_path

```python
def load_from_path(path: Path,
                   *,
                   sheet_index: int | None = 1,
                   separator: str = ";",
                   combine: bool = True,
                   quiet: bool = False) -> bool
```

Load a scenario file from disk. Returns False on user-cancel / bad type.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.sync_superstructure"></a>

#### sync\_superstructure

```python
def sync_superstructure(df: pd.DataFrame, combine: bool = True) -> None
```

synchronizes the contents of either a single, or multiple scenario files to create a single scenario
dataframe

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.sync_inclusion_flags"></a>

#### sync\_inclusion\_flags

```python
def sync_inclusion_flags(flags: list[bool]) -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.scenario_db_check"></a>

#### scenario\_db\_check

```python
def scenario_db_check(df: pd.DataFrame) -> pd.DataFrame
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportWidget.dataframe"></a>

#### dataframe

```python
@property
def dataframe() -> pd.DataFrame
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportView"></a>

## ScenarioImportView Objects

```python
class ScenarioImportView(widgets.ABTreeView)
```

Tree view for scenario imports.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportView.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportView.updateIndexColumnVisibility"></a>

#### updateIndexColumnVisibility

```python
def updateIndexColumnVisibility()
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportView.setDefaultColumnDelegates"></a>

#### setDefaultColumnDelegates

```python
def setDefaultColumnDelegates()
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportModel"></a>

## ScenarioImportModel Objects

```python
class ScenarioImportModel(core.ABTreeModel)
```

Model for displaying imported scenario names with include checkboxes.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportModel.data"></a>

#### data

```python
def data(index, role=QtCore.Qt.ItemDataRole.DisplayRole)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportModel.setData"></a>

#### setData

```python
def setData(index, value, role=QtCore.Qt.ItemDataRole.EditRole)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioImportModel.indexUserCheckable"></a>

#### indexUserCheckable

```python
def indexUserCheckable(index)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog"></a>

## ExcelReadDialog Objects

```python
class ExcelReadDialog(QtWidgets.QDialog)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog.SUFFIXES"></a>

#### SUFFIXES

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog.browse"></a>

#### browse

```python
def browse() -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog.update_combobox"></a>

#### update\_combobox

```python
def update_combobox(file_path) -> None
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ExcelReadDialog.changed"></a>

#### changed

```python
def changed() -> None
```

Determine if selected path is valid.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioDatabaseDialog"></a>

## ScenarioDatabaseDialog Objects

```python
class ScenarioDatabaseDialog(QtWidgets.QDialog)
```

Displays the possible databases for relinking the exchanges for a given activity

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioDatabaseDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget = None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioDatabaseDialog.relink"></a>

#### relink

```python
@property
def relink() -> dict
```

Returns a dictionary of str -> str key/values, showing which keys
should be linked to which values.

Only returns key/value pairs if they differ.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenarioDatabaseDialog.construct_dialog"></a>

#### construct\_dialog

```python
@classmethod
def construct_dialog(cls,
                     parent: QtWidgets.QWidget = None,
                     options: list = None) -> "ScenarioDatabaseDialog"
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.GetScenarioTemplateDialog"></a>

## GetScenarioTemplateDialog Objects

```python
class GetScenarioTemplateDialog(QtWidgets.QDialog)
```

Choose parameter vs flow starter template and csv/xlsx format.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.GetScenarioTemplateDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.GetScenarioTemplateDialog.selection"></a>

#### selection

```python
def selection() -> tuple[str, str]
```

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenariosHelpDialog"></a>

## ScenariosHelpDialog Objects

```python
class ScenariosHelpDialog(QtWidgets.QDialog)
```

Compact explanation of scenario modeling in the calculation setup.

<a id="activity_browser.app.pages.calculation_setup.scenario_section.ScenariosHelpDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```
