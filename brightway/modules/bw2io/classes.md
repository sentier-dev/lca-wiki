---
title: bw2io classes and functions
type: module-page
summary: The importers, setup functions, exporters and strategy families of bw2io 0.9.17.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw2io, bw2io-docs, brightway-cheatsheet]
related: [README.md, commands.md, datasets.md, gotchas.md]
---

# bw2io classes and functions

The names below are the public namespace of the installed version 0.9.17, read with
`dir(bw2io)` on 2026-09-21, plus the submodules `bw2io.importers` and
`bw2io.strategies`.

## Importers

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `SingleOutputEcospold2Importer` | class | ecoinvent 3 and other ecospold 2 directories or zip files. | `bi.SingleOutputEcospold2Importer('<dir>', '<db>')` |
| `SingleOutputEcospold1Importer` | class | ecospold 1, single-output datasets. | `bi.SingleOutputEcospold1Importer('<dir>', '<db>')` |
| `MultiOutputEcospold1Importer` | class | ecospold 1 with allocation applied first. | same signature |
| `SimaProCSVImporter` | class | SimaPro CSV exports. | `bi.SimaProCSVImporter('<file>', '<db>')` |
| `SimaProBlockCSVImporter` | class | the newer SimaPro block CSV reader; needs the `multifunctional` extra. | `bi.SimaProBlockCSVImporter(Path('<file>'))` |
| `ExcelImporter`, `CSVImporter` | classes | the Brightway spreadsheet templates. | `bi.ExcelImporter('<file>')` |
| `Exiobase3MonetaryImporter`, `Exiobase3HybridImporter` | classes | EXIOBASE 3 input-output data. | `bi.exiobase_monetary(...)` |
| `Ecospold1LCIAImporter`, `SimaProLCIACSVImporter`, `ExcelLCIAImporter`, `CSVLCIAImporter` | classes | impact assessment methods rather than inventories. | `bi.ExcelLCIAImporter(...)` |
| `EcoinventLCIAImporter`, `Ecospold2BiosphereImporter` | classes (in `bw2io.importers`) | the bundled ecoinvent methods and elementary flow list. | used by the setup functions |

## Setting up a project

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `remote.install_project(key, name)` | function | Downloads a prepared project archive and installs it. | `bi.remote.install_project('ecoinvent-3.9.1-biosphere', 'my project')` |
| `remote.get_projects()` | function | The catalogue of archives on the file server. | `bi.remote.get_projects()` |
| `import_ecoinvent_release(version, system_model, ...)` | function | Downloads and imports a licensed ecoinvent release, with namespaced methods and biosphere. | `bi.import_ecoinvent_release(...)` |
| `bw2setup()` | function | The legacy setup: biosphere, methods, core migrations. Deprecated. | `bi.bw2setup()` |
| `create_default_biosphere3()`, `create_default_lcia_methods()`, `create_core_migrations()` | functions | The three steps `bw2setup` calls, usable separately. | rarely, directly |
| `useeio20(name=...)`, `exiobase_monetary(...)` | functions | One-call installs of those two databases. | `bi.useeio20()` |
| `add_example_database()` | function | A tiny database to try things on. | `bi.add_example_database()` |

## Backups and packages

| Name | Kind | What it is for |
|---|---|---|
| `backup_project_directory(project=...)` | function | One project to a `.tar.gz`. |
| `backup_data_directory()` | function | Every project to a `.tar.gz`. |
| `restore_project_directory(fp=...)` | function | Back again, optionally under a new name. |
| `BW2Package` | class | Serialises any data store to bzip2-compressed JSON. |

## Exporters and analysis helpers

| Name | Kind | What it is for |
|---|---|---|
| `DatabaseToGEXF`, `DatabaseSelectionToGEXF`, `keyword_to_gephi_graph` | classes and function | Gephi graph export. |
| `lci_matrices_to_excel`, `lci_matrices_to_matlab` | functions | The matrices as a workbook or a `.mat` file. |
| `activity_hash`, `es2_activity_hash` | functions | Stable identifiers for formats that have none. |
| `normalize_units`, `load_json_data_file` | functions | Unit normalisation and access to the shipped tables. |
| `Migration`, `migrations` | class and registry | Stored rename and remap tables applied during an import. |
| `UnlinkedData`, `unlinked_data` | class and registry | What did not link, kept for a second pass. |
| `ChemIDPlus` | class | Chemical synonym lookup against an external API. |

## The strategies

`bw2io.strategies` exports 108 public names in 0.9.17 (counted on 2026-09-21). They fall
into families:

- **identity**: `activity_hash`-based codes, `set_code_by_activity_hash`,
  `create_composite_code`, `clean_integer_codes`;
- **linking**: `link_iterable_by_fields`, `link_biosphere_by_flow_uuid`,
  `link_technosphere_by_activity_hash`, `link_internal_technosphere_by_composite_code`;
- **biosphere naming**: `normalize_biosphere_names`, `normalize_biosphere_categories`,
  `drop_unspecified_subcategories`, `match_subcategories`;
- **SimaPro specifics**: `normalize_simapro_biosphere_names`, `split_simapro_name_geo`,
  `sp_allocate_products`, `sp_allocate_functional_products`;
- **ecospold specifics**: `es1_allocate_multioutput`, `fix_ecoinvent_flows_pre35`,
  `es2_assign_only_product_with_amount_as_reference_product`;
- **units and locations**: `normalize_units`, `change_electricity_unit_mj_to_kwh`,
  `update_ecoinvent_locations`, `fix_localized_water_flows`;
- **clean-up**: `drop_unlinked`, `remove_zero_amount_coproducts`,
  `delete_ghost_exchanges`, `fix_unreasonably_high_lognormal_uncertainties`;
- **products and multifunctionality**: `create_products_as_new_nodes`,
  `separate_processes_from_products`, `override_process_name_using_single_functional_exchange`;
- **migrations**: `migrate_datasets`, `migrate_exchanges`.

Each importer's `.strategies` attribute is an ordinary Python list of these functions, so
you can reorder it, remove entries or append your own before calling `apply_strategies`
(source: brightway-cheatsheet).

## Notes

- A strategy is a plain function taking the whole import data and returning it. Writing
  one needs no class and no registration (source: brightway-cheatsheet).
- Nothing touches the project until `write_database()`. An importer is a list of
  dictionaries in memory until then, which is what makes the iterative approach safe.
