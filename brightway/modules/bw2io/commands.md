---
title: bw2io commands
type: module-page
summary: The calls that set up a project and run an import, in the order you make them.
audience: [P1]
updated: 2026-09-21
sources: [brightway-cheatsheet, pypi-bw2io, bw2io-docs]
related: [classes.md, gotchas.md, ../../commands.md]
---

# bw2io commands

`bw2io` 0.9.17 installs no shell command: its distribution declares an empty entry-point
list, checked with `importlib.metadata` on 2026-09-21. The calls below use
`import bw2io as bi` and `import bw2data as bd` (source: brightway-cheatsheet).

## Command line

| Command | What it does | Key options |
|---|---|---|
| none | `bw2io` has no console script. | n/a |

## Notebook entry points

### Starting a project

| Call | What it does |
|---|---|
| `bi.remote.install_project('<tag>', '<project name>')` | Downloads a prepared project and installs it. Tags in 0.9.17: `ecoinvent-3.8-biosphere`, `ecoinvent-3.9.1-biosphere`, `USEEIO-1.1`, `forwast`. |
| `bi.remote.get_projects()` | Asks the file server what is available. |
| `bi.add_example_database()` | A tiny database to experiment on. |
| `bi.bw2setup()` | The legacy setup; deprecated in favour of `install_project` (source: brightway-cheatsheet). |

### Backups

| Call | What it does |
|---|---|
| `bi.backup.backup_project_directory(project='<name>', dir_backup='<dir>')` | One project to a `.tar.gz`, returns the path. |
| `bi.backup.backup_data_directory()` | Every project at once. |
| `bi.backup.restore_project_directory(fp='<path>', project_name='<name>')` | Restore, optionally renaming. |

### An import, step by step

```python
imp = bi.SingleOutputEcospold2Importer('<directory or zip>', '<database name>')
imp.apply_strategies()
imp.match_database('<background db>')
imp.statistics()
imp.write_database()
```

| Call | What it does |
|---|---|
| `bi.ExcelImporter('<file>')` | Start from the Brightway Excel template. |
| `bi.SimaProBlockCSVImporter(Path('<file>'))` | Start from a SimaPro block CSV; needs the `multifunctional` extra. |
| `bi.import_ecoinvent_release(version=..., system_model=..., username=..., password=...)` | Download and import a licensed ecoinvent release in one call. |
| `imp.apply_strategies()` | Run the importer's default strategy list. |
| `imp.apply_strategy(func)` | Run one extra function; use `functools.partial` to pass arguments. |
| `imp.strategies = [...]` | Replace the list entirely before applying it. |
| `imp.randonneur('<transformation label>')` | Apply a stored `randonneur` transformation. |
| `imp.match_database()` | Link edges inside the imported data. |
| `imp.match_database('<other database>')` | Link them to another database. |
| `imp.statistics()` | How many datasets and how many unlinked edges are left. |
| `imp.all_linked` | True when nothing is unlinked. |
| `imp.write_excel(only_unlinked=True)` | A workbook of what did not link. |
| `imp.create_randonneur_excel_template_for_unlinked()` | A template for writing the missing mapping. |
| `for edge in imp.unlinked: ...` | Iterate the unique unlinked edges. |
| `imp.drop_unlinked(i_am_reckless=True)` | Throw them away; the argument name is the warning. |
| `imp.create_new_biosphere('<name>')` | Move unlinked biosphere flows into a new database. |
| `imp.add_unlinked_flows_to_biosphere_database('<name>')` | Add them to an existing one. |
| `imp.add_unlinked_activities()` | Create placeholder processes for missing producers. |
| `imp.write_database()` | Write the result into the project. |

All rows in this section are documented in the upstream cheat sheet
(source: brightway-cheatsheet); the importer and function names were confirmed against
the installed 0.9.17.

### Exporting

| Call | What it does |
|---|---|
| `bi.lci_matrices_to_excel('<database>')` | The inventory matrices as a workbook. |
| `bi.lci_matrices_to_matlab('<database>')` | The same for Matlab. |
| `bi.DatabaseToGEXF('<database>')` | A Gephi graph of a database. |
| `bi.keyword_to_gephi_graph('<database>', '<keyword>')` | The same, filtered by name. |
| `bi.BW2Package.export_obj(obj)` | Any data store as a compressed JSON package. |

### Credentials

`import_ecoinvent_release` takes ecoinvent credentials. Do not write them into a
notebook: `ecoinvent_interface` reads them from a settings object or an environment file,
and the upstream documentation points at that route
(source: brightway-cheatsheet). See [../ecoinvent_interface/](../ecoinvent_interface/).
