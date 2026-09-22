# API reference: activity-browser 3.0.0b202608291724

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `activity-browser` 3.0.0b202608291724. Generated files: do not edit
them by hand; each one carries the command that produced it and regenerating overwrites
it.

The package source is the `activity-browser` 3.0.0b202608291724 distribution from PyPI,
installed without dependencies into a throwaway environment; pydoc-markdown reads the
source statically, so nothing here required importing the package.

The command, with the module name changed per file:

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
  -I "$SP" -m activity_browser cfg.yml > activity_browser.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `activity-browser` and stay under
that package's own licence: LGPL-3.0-or-later. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [activity_browser](activity_browser.md) — 1 KB
- [activity_browser.app](activity_browser.app.md) — 1 KB
- [activity_browser.app.actions](activity_browser.app.actions.md) — 1 KB
- [activity_browser.app.actions.base](activity_browser.app.actions.base.md) — 2 KB
- [activity_browser.app.actions.metadatastore_cache_clear](activity_browser.app.actions.metadatastore_cache_clear.md) — 1 KB
- [activity_browser.app.actions.metadatastore_open](activity_browser.app.actions.metadatastore_open.md) — 1 KB
- [activity_browser.app.actions.migrations_install](activity_browser.app.actions.migrations_install.md) — 2 KB
- [activity_browser.app.actions.node_select_open](activity_browser.app.actions.node_select_open.md) — 1 KB
- [activity_browser.app.actions.pyside_upgrade](activity_browser.app.actions.pyside_upgrade.md) — 2 KB
- [activity_browser.app.actions.save_parameters_to_excel](activity_browser.app.actions.save_parameters_to_excel.md) — 1 KB
- [activity_browser.app.dialogs](activity_browser.app.dialogs.md) — 1 KB
- [activity_browser.app.dialogs.database_select_dialog](activity_browser.app.dialogs.database_select_dialog.md) — 1 KB
- [activity_browser.app.dialogs.import_preview_dialog](activity_browser.app.dialogs.import_preview_dialog.md) — 1 KB
- [activity_browser.app.dialogs.import_preview_dialog.edge_tab](activity_browser.app.dialogs.import_preview_dialog.edge_tab.md) — 5 KB
- [activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog](activity_browser.app.dialogs.import_preview_dialog.import_preview_dialog.md) — 1 KB
- [activity_browser.app.dialogs.import_preview_dialog.node_tab](activity_browser.app.dialogs.import_preview_dialog.node_tab.md) — 3 KB
- [activity_browser.app.dialogs.node_select_dialog](activity_browser.app.dialogs.node_select_dialog.md) — 4 KB
- [activity_browser.app.dialogs.thread_progress](activity_browser.app.dialogs.thread_progress.md) — 1 KB
- [activity_browser.app.main](activity_browser.app.main.md) — 2 KB
- [activity_browser.app.menu_bar](activity_browser.app.menu_bar.md) — 6 KB
- [activity_browser.app.pages](activity_browser.app.pages.md) — 1 KB
- [activity_browser.app.pages.activity_details](activity_browser.app.pages.activity_details.md) — 1 KB
- [activity_browser.app.pages.activity_details.activity_details](activity_browser.app.pages.activity_details.activity_details.md) — 4 KB
- [activity_browser.app.pages.activity_details.activity_header](activity_browser.app.pages.activity_details.activity_header.md) — 10 KB
- [activity_browser.app.pages.activity_details.consumers_tab](activity_browser.app.pages.activity_details.consumers_tab.md) — 3 KB
- [activity_browser.app.pages.activity_details.data_tab](activity_browser.app.pages.activity_details.data_tab.md) — 4 KB
- [activity_browser.app.pages.activity_details.description_tab](activity_browser.app.pages.activity_details.description_tab.md) — 2 KB
- [activity_browser.app.pages.activity_details.exchanges_tab](activity_browser.app.pages.activity_details.exchanges_tab.md) — 13 KB
- [activity_browser.app.pages.activity_details.graph_tab](activity_browser.app.pages.activity_details.graph_tab.md) — 5 KB
- [activity_browser.app.pages.activity_details.parameters_tab](activity_browser.app.pages.activity_details.parameters_tab.md) — 7 KB
- [activity_browser.app.pages.calculation_setup](activity_browser.app.pages.calculation_setup.md) — 1 KB
- [activity_browser.app.pages.calculation_setup.calculation_setup](activity_browser.app.pages.calculation_setup.calculation_setup.md) — 2 KB
- [activity_browser.app.pages.calculation_setup.cs_table](activity_browser.app.pages.calculation_setup.cs_table.md) — 3 KB
- [activity_browser.app.pages.calculation_setup.functional_unit_section](activity_browser.app.pages.calculation_setup.functional_unit_section.md) — 5 KB
- [activity_browser.app.pages.calculation_setup.impact_category_section](activity_browser.app.pages.calculation_setup.impact_category_section.md) — 4 KB
- [activity_browser.app.pages.calculation_setup.scenario_section](activity_browser.app.pages.calculation_setup.scenario_section.md) — 15 KB
- [activity_browser.app.pages.impact_category_details](activity_browser.app.pages.impact_category_details.md) — 1 KB
- [activity_browser.app.pages.impact_category_details.impact_category_details](activity_browser.app.pages.impact_category_details.impact_category_details.md) — 9 KB
- [activity_browser.app.pages.impact_category_details.impact_category_header](activity_browser.app.pages.impact_category_details.impact_category_header.md) — 4 KB
- [activity_browser.app.pages.lca_results](activity_browser.app.pages.lca_results.md) — 1 KB
- [activity_browser.app.pages.lca_results.LCA_results](activity_browser.app.pages.lca_results.LCA_results.md) — 27 KB
- [activity_browser.app.pages.lca_results.combobox_utils](activity_browser.app.pages.lca_results.combobox_utils.md) — 3 KB
- [activity_browser.app.pages.lca_results.contribution_tree_d3_plot](activity_browser.app.pages.lca_results.contribution_tree_d3_plot.md) — 5 KB
- [activity_browser.app.pages.lca_results.contribution_tree_model](activity_browser.app.pages.lca_results.contribution_tree_model.md) — 6 KB
- [activity_browser.app.pages.lca_results.contribution_tree_plot](activity_browser.app.pages.lca_results.contribution_tree_plot.md) — 2 KB
- [activity_browser.app.pages.lca_results.contribution_tree_tab](activity_browser.app.pages.lca_results.contribution_tree_tab.md) — 3 KB
- [activity_browser.app.pages.lca_results.dialogs](activity_browser.app.pages.lca_results.dialogs.md) — 10 KB
- [activity_browser.app.pages.lca_results.plots](activity_browser.app.pages.lca_results.plots.md) — 5 KB
- [activity_browser.app.pages.lca_results.sankey_navigator_tab](activity_browser.app.pages.lca_results.sankey_navigator_tab.md) — 8 KB
- [activity_browser.app.pages.lca_results.style](activity_browser.app.pages.lca_results.style.md) — 4 KB
- [activity_browser.app.pages.lca_results.tables](activity_browser.app.pages.lca_results.tables.md) — 16 KB
- [activity_browser.app.pages.metadatastore](activity_browser.app.pages.metadatastore.md) — 2 KB
- [activity_browser.app.pages.parameters](activity_browser.app.pages.parameters.md) — 1 KB
- [activity_browser.app.pages.parameters.parameterized_exchanges_section](activity_browser.app.pages.parameters.parameterized_exchanges_section.md) — 7 KB
- [activity_browser.app.pages.parameters.parameters](activity_browser.app.pages.parameters.parameters.md) — 2 KB
- [activity_browser.app.pages.parameters.parameters_section](activity_browser.app.pages.parameters.parameters_section.md) — 7 KB
- [activity_browser.app.pages.settings](activity_browser.app.pages.settings.md) — 1 KB
- [activity_browser.app.pages.settings.appearance](activity_browser.app.pages.settings.appearance.md) — 2 KB
- [activity_browser.app.pages.settings.base](activity_browser.app.pages.settings.base.md) — 2 KB
- [activity_browser.app.pages.settings.metadatastore](activity_browser.app.pages.settings.metadatastore.md) — 2 KB
- [activity_browser.app.pages.settings.plugins](activity_browser.app.pages.settings.plugins.md) — 3 KB
- [activity_browser.app.pages.settings.project_manager](activity_browser.app.pages.settings.project_manager.md) — 6 KB
- [activity_browser.app.pages.settings.settings_page](activity_browser.app.pages.settings.settings_page.md) — 3 KB
- [activity_browser.app.pages.settings.startup](activity_browser.app.pages.settings.startup.md) — 3 KB
- [activity_browser.app.pages.welcome](activity_browser.app.pages.welcome.md) — 2 KB
- [activity_browser.app.panes](activity_browser.app.panes.md) — 1 KB
- [activity_browser.app.panes.calculation_setups](activity_browser.app.panes.calculation_setups.md) — 5 KB
- [activity_browser.app.panes.database_products](activity_browser.app.panes.database_products.md) — 9 KB
- [activity_browser.app.panes.databases](activity_browser.app.panes.databases.md) — 7 KB
- [activity_browser.app.panes.impact_categories](activity_browser.app.panes.impact_categories.md) — 5 KB
- [activity_browser.app.signalling](activity_browser.app.signalling.md) — 7 KB
- [activity_browser.bwutils](activity_browser.bwutils.md) — 1 KB
- [activity_browser.bwutils.calculation_setup](activity_browser.bwutils.calculation_setup.md) — 5 KB
- [activity_browser.bwutils.characterization_factors](activity_browser.bwutils.characterization_factors.md) — 4 KB
- [activity_browser.bwutils.commontasks](activity_browser.bwutils.commontasks.md) — 12 KB
- [activity_browser.bwutils.contribution_labels](activity_browser.bwutils.contribution_labels.md) — 2 KB
- [activity_browser.bwutils.elementary_flows](activity_browser.bwutils.elementary_flows.md) — 3 KB
- [activity_browser.bwutils.errors](activity_browser.bwutils.errors.md) — 6 KB
- [activity_browser.bwutils.export_names](activity_browser.bwutils.export_names.md) — 3 KB
- [activity_browser.bwutils.exporters](activity_browser.bwutils.exporters.md) — 3 KB
- [activity_browser.bwutils.filesystem](activity_browser.bwutils.filesystem.md) — 1 KB
- [activity_browser.bwutils.graph_explorer](activity_browser.bwutils.graph_explorer.md) — 1 KB
- [activity_browser.bwutils.graph_explorer.explorer](activity_browser.bwutils.graph_explorer.explorer.md) — 7 KB
- [activity_browser.bwutils.graph_explorer.inventory](activity_browser.bwutils.graph_explorer.inventory.md) — 3 KB
- [activity_browser.bwutils.graph_traversal](activity_browser.bwutils.graph_traversal.md) — 1 KB
- [activity_browser.bwutils.graph_traversal.engine](activity_browser.bwutils.graph_traversal.engine.md) — 16 KB
- [activity_browser.bwutils.graph_traversal.partition_plots](activity_browser.bwutils.graph_traversal.partition_plots.md) — 5 KB
- [activity_browser.bwutils.graph_traversal.sankey](activity_browser.bwutils.graph_traversal.sankey.md) — 9 KB
- [activity_browser.bwutils.graph_traversal.tree](activity_browser.bwutils.graph_traversal.tree.md) — 2 KB
- [activity_browser.bwutils.impact_categories](activity_browser.bwutils.impact_categories.md) — 1 KB
- [activity_browser.bwutils.impact_categories.ab_lcia_file](activity_browser.bwutils.impact_categories.ab_lcia_file.md) — 5 KB
- [activity_browser.bwutils.impact_categories.bw2io_lcia_file](activity_browser.bwutils.impact_categories.bw2io_lcia_file.md) — 3 KB
- [activity_browser.bwutils.impact_categories.common](activity_browser.bwutils.impact_categories.common.md) — 4 KB
- [activity_browser.bwutils.impact_categories.ecoinvent_lcia](activity_browser.bwutils.impact_categories.ecoinvent_lcia.md) — 3 KB
- [activity_browser.bwutils.impact_categories.templates](activity_browser.bwutils.impact_categories.templates.md) — 2 KB
- [activity_browser.bwutils.importers](activity_browser.bwutils.importers.md) — 5 KB
- [activity_browser.bwutils.lca_inputs](activity_browser.bwutils.lca_inputs.md) — 3 KB
- [activity_browser.bwutils.lcia_overview](activity_browser.bwutils.lcia_overview.md) — 6 KB
- [activity_browser.bwutils.metadata](activity_browser.bwutils.metadata.md) — 1 KB
- [activity_browser.bwutils.metadata.fields](activity_browser.bwutils.metadata.fields.md) — 1 KB
- [activity_browser.bwutils.metadata.loader](activity_browser.bwutils.metadata.loader.md) — 5 KB
- [activity_browser.bwutils.metadata.metadata](activity_browser.bwutils.metadata.metadata.md) — 5 KB
- [activity_browser.bwutils.metadata.searcher](activity_browser.bwutils.metadata.searcher.md) — 6 KB
- [activity_browser.bwutils.metadata.updater](activity_browser.bwutils.metadata.updater.md) — 3 KB
- [activity_browser.bwutils.montecarlo](activity_browser.bwutils.montecarlo.md) — 1 KB
- [activity_browser.bwutils.montecarlo.engine](activity_browser.bwutils.montecarlo.engine.md) — 4 KB
- [activity_browser.bwutils.montecarlo.matrix_patch](activity_browser.bwutils.montecarlo.matrix_patch.md) — 1 KB
- [activity_browser.bwutils.montecarlo.scenarios](activity_browser.bwutils.montecarlo.scenarios.md) — 1 KB
- [activity_browser.bwutils.multilca](activity_browser.bwutils.multilca.md) — 14 KB
- [activity_browser.bwutils.parameters](activity_browser.bwutils.parameters.md) — 1 KB
- [activity_browser.bwutils.parameters.formula_exchanges](activity_browser.bwutils.parameters.formula_exchanges.md) — 3 KB
- [activity_browser.bwutils.parameters.manager](activity_browser.bwutils.parameters.manager.md) — 5 KB
- [activity_browser.bwutils.parameters.parameter_montecarlo](activity_browser.bwutils.parameters.parameter_montecarlo.md) — 5 KB
- [activity_browser.bwutils.pedigree](activity_browser.bwutils.pedigree.md) — 7 KB
- [activity_browser.bwutils.searchengine](activity_browser.bwutils.searchengine.md) — 1 KB
- [activity_browser.bwutils.searchengine.base](activity_browser.bwutils.searchengine.base.md) — 12 KB
- [activity_browser.bwutils.searchengine.metadata_search](activity_browser.bwutils.searchengine.metadata_search.md) — 5 KB
- [activity_browser.bwutils.sensitivity_analysis](activity_browser.bwutils.sensitivity_analysis.md) — 7 KB
- [activity_browser.bwutils.settings](activity_browser.bwutils.settings.md) — 2 KB
- [activity_browser.bwutils.strategies](activity_browser.bwutils.strategies.md) — 6 KB
- [activity_browser.bwutils.superstructure](activity_browser.bwutils.superstructure.md) — 1 KB
- [activity_browser.bwutils.superstructure.activities](activity_browser.bwutils.superstructure.activities.md) — 4 KB
- [activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios](activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.md) — 7 KB
- [activity_browser.bwutils.superstructure.dataframe](activity_browser.bwutils.superstructure.dataframe.md) — 6 KB
- [activity_browser.bwutils.superstructure.excel](activity_browser.bwutils.superstructure.excel.md) — 2 KB
- [activity_browser.bwutils.superstructure.file_dialogs](activity_browser.bwutils.superstructure.file_dialogs.md) — 8 KB
- [activity_browser.bwutils.superstructure.file_imports](activity_browser.bwutils.superstructure.file_imports.md) — 6 KB
- [activity_browser.bwutils.superstructure.inclusion](activity_browser.bwutils.superstructure.inclusion.md) — 4 KB
- [activity_browser.bwutils.superstructure.manager](activity_browser.bwutils.superstructure.manager.md) — 10 KB
- [activity_browser.bwutils.superstructure.mlca](activity_browser.bwutils.superstructure.mlca.md) — 5 KB
- [activity_browser.bwutils.superstructure.scenario_overlay](activity_browser.bwutils.superstructure.scenario_overlay.md) — 3 KB
- [activity_browser.bwutils.superstructure.scenario_templates](activity_browser.bwutils.superstructure.scenario_templates.md) — 2 KB
- [activity_browser.bwutils.superstructure.utils](activity_browser.bwutils.superstructure.utils.md) — 3 KB
- [activity_browser.bwutils.uncertainty](activity_browser.bwutils.uncertainty.md) — 10 KB
- [activity_browser.bwutils.utils](activity_browser.bwutils.utils.md) — 8 KB
- [activity_browser.info](activity_browser.info.md) — 1 KB
- [activity_browser.mod](activity_browser.mod.md) — 1 KB
- [activity_browser.mod.bw2analyzer](activity_browser.mod.bw2analyzer.md) — 1 KB
- [activity_browser.mod.bw2analyzer.contribution](activity_browser.mod.bw2analyzer.contribution.md) — 1 KB
- [activity_browser.mod.bw2io](activity_browser.mod.bw2io.md) — 1 KB
- [activity_browser.mod.bw2io.ecoinvent](activity_browser.mod.bw2io.ecoinvent.md) — 1 KB
- [activity_browser.mod.ecoinvent_interface](activity_browser.mod.ecoinvent_interface.md) — 1 KB
- [activity_browser.mod.ecoinvent_interface.release](activity_browser.mod.ecoinvent_interface.release.md) — 1 KB
- [activity_browser.mod.patching](activity_browser.mod.patching.md) — 2 KB
- [activity_browser.mod.peewee](activity_browser.mod.peewee.md) — 1 KB
- [activity_browser.mod.pyprind](activity_browser.mod.pyprind.md) — 1 KB
- [activity_browser.mod.pyprind.progbar](activity_browser.mod.pyprind.progbar.md) — 1 KB
- [activity_browser.mod.tqdm](activity_browser.mod.tqdm.md) — 1 KB
- [activity_browser.mod.tqdm.std](activity_browser.mod.tqdm.std.md) — 1 KB
- [activity_browser.ui](activity_browser.ui.md) — 1 KB
- [activity_browser.ui.core](activity_browser.ui.core.md) — 1 KB
- [activity_browser.ui.core.application](activity_browser.ui.core.application.md) — 3 KB
- [activity_browser.ui.core.mimedata](activity_browser.ui.core.mimedata.md) — 1 KB
- [activity_browser.ui.core.qt_sync](activity_browser.ui.core.qt_sync.md) — 1 KB
- [activity_browser.ui.core.threading](activity_browser.ui.core.threading.md) — 4 KB
- [activity_browser.ui.core.tree_model](activity_browser.ui.core.tree_model.md) — 10 KB
- [activity_browser.ui.delegates](activity_browser.ui.delegates.md) — 1 KB
- [activity_browser.ui.delegates.amount](activity_browser.ui.delegates.amount.md) — 3 KB
- [activity_browser.ui.delegates.card](activity_browser.ui.delegates.card.md) — 2 KB
- [activity_browser.ui.delegates.checkbox](activity_browser.ui.delegates.checkbox.md) — 1 KB
- [activity_browser.ui.delegates.combobox](activity_browser.ui.delegates.combobox.md) — 2 KB
- [activity_browser.ui.delegates.date_time](activity_browser.ui.delegates.date_time.md) — 1 KB
- [activity_browser.ui.delegates.delete_button](activity_browser.ui.delegates.delete_button.md) — 2 KB
- [activity_browser.ui.delegates.float](activity_browser.ui.delegates.float.md) — 2 KB
- [activity_browser.ui.delegates.impact_background](activity_browser.ui.delegates.impact_background.md) — 3 KB
- [activity_browser.ui.delegates.json](activity_browser.ui.delegates.json.md) — 2 KB
- [activity_browser.ui.delegates.list](activity_browser.ui.delegates.list.md) — 3 KB
- [activity_browser.ui.delegates.new_formula](activity_browser.ui.delegates.new_formula.md) — 2 KB
- [activity_browser.ui.delegates.property](activity_browser.ui.delegates.property.md) — 3 KB
- [activity_browser.ui.delegates.string](activity_browser.ui.delegates.string.md) — 2 KB
- [activity_browser.ui.delegates.uncertainty](activity_browser.ui.delegates.uncertainty.md) — 2 KB
- [activity_browser.ui.delegates.viewonly](activity_browser.ui.delegates.viewonly.md) — 2 KB
- [activity_browser.ui.dialogs](activity_browser.ui.dialogs.md) — 1 KB
- [activity_browser.ui.dialogs.list_edit_dialog](activity_browser.ui.dialogs.list_edit_dialog.md) — 5 KB
- [activity_browser.ui.dialogs.progress_dialog](activity_browser.ui.dialogs.progress_dialog.md) — 2 KB
- [activity_browser.ui.dialogs.uncertainty_dialog](activity_browser.ui.dialogs.uncertainty_dialog.md) — 3 KB
- [activity_browser.ui.dialogs.uncertainty_pdf_preview](activity_browser.ui.dialogs.uncertainty_pdf_preview.md) — 2 KB
- [activity_browser.ui.icons](activity_browser.ui.icons.md) — 1 KB
- [activity_browser.ui.selection_history](activity_browser.ui.selection_history.md) — 2 KB
- [activity_browser.ui.widgets](activity_browser.ui.widgets.md) — 1 KB
- [activity_browser.ui.widgets.abstract_navigator](activity_browser.ui.widgets.abstract_navigator.md) — 7 KB
- [activity_browser.ui.widgets.abstract_page](activity_browser.ui.widgets.abstract_page.md) — 2 KB
- [activity_browser.ui.widgets.abstract_pane](activity_browser.ui.widgets.abstract_pane.md) — 2 KB
- [activity_browser.ui.widgets.button_collapser](activity_browser.ui.widgets.button_collapser.md) — 4 KB
- [activity_browser.ui.widgets.buttons](activity_browser.ui.widgets.buttons.md) — 2 KB
- [activity_browser.ui.widgets.central](activity_browser.ui.widgets.central.md) — 5 KB
- [activity_browser.ui.widgets.combobox](activity_browser.ui.widgets.combobox.md) — 3 KB
- [activity_browser.ui.widgets.comparison_switch](activity_browser.ui.widgets.comparison_switch.md) — 2 KB
- [activity_browser.ui.widgets.cutoff_menu](activity_browser.ui.widgets.cutoff_menu.md) — 4 KB
- [activity_browser.ui.widgets.database_name_edit](activity_browser.ui.widgets.database_name_edit.md) — 2 KB
- [activity_browser.ui.widgets.dock_widget](activity_browser.ui.widgets.dock_widget.md) — 2 KB
- [activity_browser.ui.widgets.drop_overlay](activity_browser.ui.widgets.drop_overlay.md) — 2 KB
- [activity_browser.ui.widgets.file_selector](activity_browser.ui.widgets.file_selector.md) — 2 KB
- [activity_browser.ui.widgets.formula_edit](activity_browser.ui.widgets.formula_edit.md) — 8 KB
- [activity_browser.ui.widgets.label](activity_browser.ui.widgets.label.md) — 1 KB
- [activity_browser.ui.widgets.line](activity_browser.ui.widgets.line.md) — 1 KB
- [activity_browser.ui.widgets.line_edit](activity_browser.ui.widgets.line_edit.md) — 3 KB
- [activity_browser.ui.widgets.main_window](activity_browser.ui.widgets.main_window.md) — 2 KB
- [activity_browser.ui.widgets.menu](activity_browser.ui.widgets.menu.md) — 1 KB
- [activity_browser.ui.widgets.plot](activity_browser.ui.widgets.plot.md) — 13 KB
- [activity_browser.ui.widgets.tab_widget](activity_browser.ui.widgets.tab_widget.md) — 2 KB
- [activity_browser.ui.widgets.text_edit](activity_browser.ui.widgets.text_edit.md) — 3 KB
- [activity_browser.ui.widgets.tree_view](activity_browser.ui.widgets.tree_view.md) — 4 KB
- [activity_browser.ui.widgets.web_engine_page](activity_browser.ui.widgets.web_engine_page.md) — 1 KB
- [activity_browser.ui.widgets.wizard](activity_browser.ui.widgets.wizard.md) — 2 KB
- [activity_browser.ui.widgets.wizard_page](activity_browser.ui.widgets.wizard_page.md) — 3 KB

Total: 206 files, 859 KB.
