**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.LCA_results` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.LCA_results cfg.yml > activity_browser.app.pages.lca_results.LCA_results.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.LCA_results"></a>

# activity\_browser.app.pages.lca\_results.LCA\_results

LCA Results page: tab widget shell and analysis sub-tabs.

Each calculation setup opens an :class:`LCAResultsPage` with sub-tabs for inventory,
LCIA scores, contributions, Sankey, Monte Carlo, and GSA. Shared tab chrome lives in
:mod:`style`; tables and plots in sibling modules; data builders in ``bwutils``.

<a id="activity_browser.app.pages.lca_results.LCA_results.ca"></a>

#### ca

<a id="activity_browser.app.pages.lca_results.LCA_results.Tabs"></a>

#### Tabs

<a id="activity_browser.app.pages.lca_results.LCA_results.Relativity"></a>

#### Relativity

<a id="activity_browser.app.pages.lca_results.LCA_results.TotalMenu"></a>

#### TotalMenu

<a id="activity_browser.app.pages.lca_results.LCA_results.FULL_LABELS_TOOLTIP"></a>

#### FULL\_LABELS\_TOOLTIP

<a id="activity_browser.app.pages.lca_results.LCA_results.ExportTable"></a>

#### ExportTable

<a id="activity_browser.app.pages.lca_results.LCA_results.ExportPlot"></a>

#### ExportPlot

<a id="activity_browser.app.pages.lca_results.LCA_results.PlotTableCheck"></a>

#### PlotTableCheck

<a id="activity_browser.app.pages.lca_results.LCA_results.Combobox"></a>

#### Combobox

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsPage"></a>

## LCAResultsPage Objects

```python
class LCAResultsPage(QtWidgets.QTabWidget)
```

Class for the main 'LCA Results' tab.

Shows:
    One sub-tab for each calculation setup
    For each calculation setup-tab one array of relevant tabs.

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name, mlca, contributions, mc, parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsPage.setup_tabs"></a>

#### setup\_tabs

```python
def setup_tabs()
```

Have all the tabs pull in their required data and add them.

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsPage.generate_content_on_click"></a>

#### generate\_content\_on\_click

```python
@QtCore.Slot(int, name="generateSankeyOnClick")
def generate_content_on_click(index)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab"></a>

## NewAnalysisTab Objects

```python
class NewAnalysisTab(QtWidgets.QWidget)
```

Parent class around which all sub-tabs are built.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.explain_text"></a>

#### explain\_text

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.add_tab_header"></a>

#### add\_tab\_header

```python
def add_tab_header(title: str, help_tooltip: Optional[str] = None) -> None
```

Title row; optional compact help button (same height as plain headers).

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.add_tab_control_rows"></a>

#### add\_tab\_control\_rows

```python
def add_tab_control_rows(*rows: QtWidgets.QHBoxLayout) -> None
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.build_tab_body"></a>

#### build\_tab\_body

```python
def build_tab_body(
    alignment: QtCore.Qt.Alignment = QtCore.Qt.AlignVCenter
) -> QtWidgets.QWidget
```

Standard expandable plot/table area used across LCA result tabs.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.populate_tab_body"></a>

#### populate\_tab\_body

```python
def populate_tab_body(
    *,
    plot_stretch: int = 1,
    table_stretch: int = 1,
    alignment: QtCore.Qt.Alignment = QtCore.Qt.AlignVCenter
) -> QtWidgets.QWidget
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.add_tab_footer"></a>

#### add\_tab\_footer

```python
def add_tab_footer(has_plot: bool = True,
                   has_table: bool = True,
                   *,
                   wrapped: bool = False) -> Optional[QtWidgets.QWidget]
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.add_tab_body_with_placeholder"></a>

#### add\_tab\_body\_with\_placeholder

```python
def add_tab_body_with_placeholder() -> QtWidgets.QWidget
```

Add expandable body plus placeholder so chrome stays at the top when empty.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.set_tab_body_visible"></a>

#### set\_tab\_body\_visible

```python
def set_tab_body_visible(visible: bool) -> None
```

Toggle between placeholder stretch and the results body.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.invert_plot"></a>

#### invert\_plot

```python
@QtCore.Slot(name="invertPlot")
def invert_plot()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.space_check"></a>

#### space\_check

```python
@QtCore.Slot(name="updatePlotTableVisibility")
def space_check()
```

Show plot or table according to the selected view radio.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.relativity_check"></a>

#### relativity\_check

```python
@QtCore.Slot(bool, name="isRelativeToggled")
def relativity_check(checked: bool)
```

Check if the relative or absolute option is selected.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.total_check"></a>

#### total\_check

```python
@QtCore.Slot(bool, name="isTotalToggled")
def total_check(checked: bool)
```

Check if the relative or absolute option is selected.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.get_scenario_labels"></a>

#### get\_scenario\_labels

```python
def get_scenario_labels() -> List[str]
```

Get scenario labels if scenarios are used.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

Determine if scenario Qt widgets are visible or not and retrieve
scenario labels for the selection drop-down box.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.set_combobox_index"></a>

#### set\_combobox\_index

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.update_combobox"></a>

#### update\_combobox

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

Update the plot and/or table for the views that are selected.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.update_table"></a>

#### update\_table

```python
def update_table(*args, **kwargs)
```

Update the table.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.update_plot"></a>

#### update\_plot

```python
def update_plot(*args, **kwargs)
```

Update the plot.

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.build_export"></a>

#### build\_export

```python
def build_export(has_table: bool = True,
                 has_plot: bool = True) -> QtWidgets.QHBoxLayout
```

Construct the shared plot/table export footer.

Plot: Copy (PNG clipboard), .png, .svg (disk).
Table: Copy (TSV clipboard), .csv, .xlsx (disk).

<a id="activity_browser.app.pages.lca_results.LCA_results.NewAnalysisTab.explanation"></a>

#### explanation

```python
def explanation()
```

Builds and shows a message box containing whatever text is set
on self.explain_text

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab"></a>

## InventoryTab Objects

```python
class InventoryTab(NewAnalysisTab)
```

Class for the 'Inventory' sub-tab.

This tab allows for investigation of the inventories of the calculation.

Shows:
    Option to choose between 'Biosphere flows' and 'Technosphere flows'
    Inventory table for either 'Biosphere flows' or 'Technosphere flows'
    Export options

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.add_categorisation_factor_filter"></a>

#### add\_categorisation\_factor\_filter

```python
@QtCore.Slot(QtWidgets.QRadioButton, name="addCategorisationFactorFilter")
def add_categorisation_factor_filter(index: int)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.toggle_categorisation_factor_filter_buttons"></a>

#### toggle\_categorisation\_factor\_filter\_buttons

```python
@QtCore.Slot(QtWidgets.QRadioButton,
             name="toggleCategorisationFactorFilterButtons")
def toggle_categorisation_factor_filter_buttons(bttn: QtWidgets.QRadioButton)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.remove_zeros_checked"></a>

#### remove\_zeros\_checked

```python
@QtCore.Slot(bool, name="isRemoveZerosToggled")
def remove_zeros_checked(toggled: bool)
```

Update table according to remove-zero selected.

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.button_clicked"></a>

#### button\_clicked

```python
@QtCore.Slot(bool, name="isBiosphereToggled")
def button_clicked(toggled: bool)
```

Update table according to radiobutton selected.

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

Allow scenarios options to be visible when used.

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

Update the tab.

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.elementary_flows_contributing_to_IA_methods"></a>

#### elementary\_flows\_contributing\_to\_IA\_methods

```python
def elementary_flows_contributing_to_IA_methods(contributary: bool = True,
                                                bios: pd.DataFrame = None
                                                ) -> pd.DataFrame
```

Returns a biosphere dataframe filtered for the presence in the impact assessment methods
Requires a boolean argument for whether those flows included in the impact assessment method
should be returned (True), or not (False)

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.update_table"></a>

#### update\_table

```python
def update_table()
```

Update the table.

<a id="activity_browser.app.pages.lca_results.LCA_results.InventoryTab.clear_tables"></a>

#### clear\_tables

```python
def clear_tables() -> None
```

Set the biosphere and technosphere to None.

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab"></a>

## LCAResultsTab Objects

```python
class LCAResultsTab(NewAnalysisTab)
```

LCIA results landing tab: grouped bar chart (default) or table.

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.relativity_check"></a>

#### relativity\_check

```python
@QtCore.Slot(bool, name="lcaScoresRelativeToggled")
def relativity_check(checked: bool)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.update_plot"></a>

#### update\_plot

```python
def update_plot()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.LCAResultsTab.update_table"></a>

#### update\_table

```python
def update_table()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab"></a>

## ContributionTab Objects

```python
class ContributionTab(NewAnalysisTab)
```

Parent class for any 'XXX Contributions' sub-tab.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent, **kwargs)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.assemble_contribution_tab_layout"></a>

#### assemble\_contribution\_tab\_layout

```python
def assemble_contribution_tab_layout(title: str,
                                     *,
                                     has_method: bool = True,
                                     has_func: bool = False) -> None
```

Header, two control rows, main body, and export footer.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.set_filename"></a>

#### set\_filename

```python
def set_filename(optional_fields: dict = None)
```

Given a dictionary of fields, put together a usable filename for the plot and table.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.build_compare_row"></a>

#### build\_compare\_row

```python
def build_compare_row(has_method: bool = True,
                      has_func: bool = False) -> QtWidgets.QHBoxLayout
```

Row 1: Compare and optional impact-category / scenario selectors.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.build_view_options_row"></a>

#### build\_view\_options\_row

```python
def build_view_options_row(invertable: bool = False) -> QtWidgets.QHBoxLayout
```

Row 2: Plot/Table, then cut-off and other plot options.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.build_combobox"></a>

#### build\_combobox

```python
def build_combobox(has_method: bool = True,
                   has_func: bool = False) -> QtWidgets.QHBoxLayout
```

Construct a horizontal layout for picking and choosing what data to show and how.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

Supplement the superclass method because there are more things to hide in these tabs.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.toggle_comparisons"></a>

#### toggle\_comparisons

```python
@QtCore.Slot(int, name="changeComparisonView")
def toggle_comparisons(index: int)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.toggle_scenario"></a>

#### toggle\_scenario

```python
@QtCore.Slot(bool, name="hideScenarioCombo")
def toggle_scenario(active: bool)
```

Allow scenarios options to be visible when used.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.toggle_func"></a>

#### toggle\_func

```python
@QtCore.Slot(bool, name="hideFuCombo")
def toggle_func(active: bool)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.toggle_method"></a>

#### toggle\_method

```python
@QtCore.Slot(bool, name="hideMethodCombo")
def toggle_method(active: bool)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.set_combobox_changes"></a>

#### set\_combobox\_changes

```python
@QtCore.Slot(name="comboboxTriggerUpdate")
def set_combobox_changes()
```

Update fields based on user-made changes in combobox.

Any trigger linked to this slot will cause the values in the
combobox objects to be read out (which comparison, drop-down indexes,
etc.) and fed into update calls.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Override the inherited method to perform the same thing plus aggregation.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

Update the tab.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.update_dataframe"></a>

#### update\_dataframe

```python
def update_dataframe(*args, **kwargs)
```

Update the underlying dataframe.

Implement in subclass.

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.update_table"></a>

#### update\_table

```python
def update_table()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ContributionTab.update_plot"></a>

#### update\_plot

```python
def update_plot()
```

Update the plot.

<a id="activity_browser.app.pages.lca_results.LCA_results.ElementaryFlowContributionTab"></a>

## ElementaryFlowContributionTab Objects

```python
class ElementaryFlowContributionTab(ContributionTab)
```

Class for the 'Elementary flow Contributions' sub-tab.

This tab allows for analysis of elementary flows.

Example questions that can be answered by this tab:
    What is the CO2 production caused by reference flow XXX?
    Which impact is largest on the impact category YYY?
    What are the 5 largest elementary flows caused by reference flow ZZZ?

Shows:
    Compare row, then Plot/Table, cut-off, Relative/Absolute, Score/Range, Horizontal
    Compare options button to change between 'Reference Flows' and 'Impact Categories'
    'Impact Category'/'Reference Flow' chooser with aggregation method
    Export options

<a id="activity_browser.app.pages.lca_results.LCA_results.ElementaryFlowContributionTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ElementaryFlowContributionTab.build_combobox"></a>

#### build\_combobox

```python
def build_combobox(has_method: bool = True,
                   has_func: bool = False) -> QtWidgets.QHBoxLayout
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ElementaryFlowContributionTab.update_dataframe"></a>

#### update\_dataframe

```python
def update_dataframe(*args, **kwargs)
```

Retrieve the top elementary flow contributions.

<a id="activity_browser.app.pages.lca_results.LCA_results.ProcessContributionsTab"></a>

## ProcessContributionsTab Objects

```python
class ProcessContributionsTab(ContributionTab)
```

Class for the 'Process Contributions' sub-tab.

This tab allows for analysis of process contributions.

Example questions that can be answered by this tab:
    What is the contribution of electricity production to reference flow XXX?
    Which process contributes the most to impact category YYY?
    What are the top 5 contributing processes to reference flow ZZZ?

Shows:
    Compare row, then Plot/Table, cut-off, Relative/Absolute, Score/Range, Horizontal
    Compare options button to change between 'Reference Flows' and 'Impact Categories'
    'Impact Category'/'Reference Flow' chooser with aggregation method
    Export options

<a id="activity_browser.app.pages.lca_results.LCA_results.ProcessContributionsTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ProcessContributionsTab.build_combobox"></a>

#### build\_combobox

```python
def build_combobox(has_method: bool = True,
                   has_func: bool = False) -> QtWidgets.QHBoxLayout
```

<a id="activity_browser.app.pages.lca_results.LCA_results.ProcessContributionsTab.update_dataframe"></a>

#### update\_dataframe

```python
def update_dataframe(*args, **kwargs)
```

Retrieve the top process contributions

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab"></a>

## FirstTierContributionsTab Objects

```python
class FirstTierContributionsTab(ContributionTab)
```

First-tier (direct supplier) contributions tab.

Not registered in :class:`LCAResultsPage` by default (see commented ``ft=`` slot).
Calculation logic remains here for potential re-enablement; consider moving heavy
logic to ``bwutils`` if this tab is restored.

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name, parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

Update the tab.

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.build_combobox"></a>

#### build\_combobox

```python
def build_combobox(has_method: bool = True,
                   has_func: bool = False) -> QtWidgets.QHBoxLayout
```

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.get_data"></a>

#### get\_data

```python
def get_data(compare) -> List[list]
```

Get the data for analysis, either from self.cache or from calculation.

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.calculate_contributions"></a>

#### calculate\_contributions

```python
def calculate_contributions(demand,
                            demand_key,
                            demand_index,
                            method,
                            method_index: int = None,
                            scenario_lca: bool = False,
                            scenario_index: int = None) -> dict
```

Retrieve relevant activity data and calculate first tier contributions.

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.key_to_metadata"></a>

#### key\_to\_metadata

```python
def key_to_metadata(key: tuple) -> list
```

Convert the key information to list with metadata.

format:
[reference product, activity name, location, unit, database]

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.metadata_to_index"></a>

#### metadata\_to\_index

```python
def metadata_to_index(data: list) -> str
```

Convert list to formatted index.

format:
reference product | activity name | location | unit | database

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.data_to_df"></a>

#### data\_to\_df

```python
def data_to_df(all_data: List[list], compare: str) -> pd.DataFrame
```

Convert the provided data into a dataframe.

<a id="activity_browser.app.pages.lca_results.LCA_results.FirstTierContributionsTab.update_dataframe"></a>

#### update\_dataframe

```python
def update_dataframe(*args, **kwargs)
```

Retrieve the product contributions.

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab"></a>

## MonteCarloTab Objects

```python
class MonteCarloTab(NewAnalysisTab)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.add_MC_ui_elements"></a>

#### add\_MC\_ui\_elements

```python
def add_MC_ui_elements()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.calculate_mc_lca"></a>

#### calculate\_mc\_lca

```python
@QtCore.Slot(name="calculateMcLca")
def calculate_mc_lca()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.update_mc"></a>

#### update\_mc

```python
def update_mc(cs_name=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.update_plot"></a>

#### update\_plot

```python
def update_plot(method)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloTab.update_table"></a>

#### update\_table

```python
def update_table()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab"></a>

## GSATab Objects

```python
class GSATab(NewAnalysisTab)
```

Global sensitivity analysis tab (requires a completed Monte Carlo run).

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.add_GSA_ui_elements"></a>

#### add\_GSA\_ui\_elements

```python
def add_GSA_ui_elements()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.update_tab"></a>

#### update\_tab

```python
def update_tab()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.monte_carlo_finished"></a>

#### monte\_carlo\_finished

```python
def monte_carlo_finished()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.calculate_gsa"></a>

#### calculate\_gsa

```python
def calculate_gsa()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.update_gsa"></a>

#### update\_gsa

```python
def update_gsa()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.export_gsa_data"></a>

#### export\_gsa\_data

```python
def export_gsa_data(*, as_csv: bool = False)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.update_plot"></a>

#### update\_plot

```python
def update_plot(*args, **kwargs)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.update_table"></a>

#### update\_table

```python
def update_table()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.GSATab.build_export"></a>

#### build\_export

```python
def build_export(has_table: bool = True,
                 has_plot: bool = True) -> QtWidgets.QHBoxLayout
```

Plot export plus GSA input/output data export (no standard table group).

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloWorkerThread"></a>

## MonteCarloWorkerThread Objects

```python
class MonteCarloWorkerThread(QtCore.QThread)
```

Background worker for Monte Carlo (reserved for future use).

Not used today: MC runs synchronously in the UI thread because pyparadiso
does not safely support parallel solves on Windows. Kept as a reference if
that limitation is lifted.

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloWorkerThread.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloWorkerThread.set_mc"></a>

#### set\_mc

```python
def set_mc(mc, iterations=20)
```

<a id="activity_browser.app.pages.lca_results.LCA_results.MonteCarloWorkerThread.run"></a>

#### run

```python
def run()
```

<a id="activity_browser.app.pages.lca_results.LCA_results.worker_thread"></a>

#### worker\_thread
