---
title: Brightway commands
type: module-page
summary: Every runnable command and one-line Python entry point across the Brightway packages, with how each one was checked.
audience: [P1]
updated: 2026-09-21
sources: [brightway-cheatsheet, brightway-installation, brightway-upgrading, brightway-faq-data, pypi-activity-browser, pypi-flowmapper, bw2io-docs, bw2analyzer-docs]
related: [packages.md, README.md]
---

# Brightway commands

Brightway is a library, not a command line tool. Almost everything you run is a line of
Python typed in a notebook or a script. This page collects the few shell commands that do
exist, and the one-line Python calls that make up a normal session.

**How the rows were checked.** Rows marked *introspected* were confirmed on 2026-09-21 by
installing the pinned version and reading the distribution's entry points with
`importlib.metadata`, or by reading the imported module's public namespace. Rows marked
*documented* come from the upstream page named in the row and were not run here.

## Shell commands

| Command | Package | What it does | How checked |
|---|---|---|---|
| `activity-browser` | activity-browser 3.0.0b202608291724 | Opens the desktop interface on the Brightway data directory. | introspected: the distribution declares the console script `activity-browser = activity_browser:run_activity_browser` |
| `flowmapper` | flowmapper 0.4 | Runs the elementary flow matching from a terminal on two flow lists. | introspected: the distribution declares the console script `flowmapper = flowmapper.cli:app` |
| `pip install brightway25 pypardiso` | meta-package | Installs the 2.5 generation on x64 hardware. | documented: brightway-installation |
| `pip install brightway25 scikit-umfpack` | meta-package | Installs the 2.5 generation on Apple Silicon, where `pypardiso` does not run. | documented: brightway-installation |
| `pip install -U brightway25` | meta-package | Updates the whole stack. | documented: brightway-upgrading |
| `conda create -n brightway -c conda-forge -c cmutel brightway25` | meta-package | Creates a conda environment with the 2.5 generation. | documented: brightway-installation |

None of `bw2data` 4.7, `bw2calc` 2.5.0, `bw2io` 0.9.17, `bw2analyzer` 0.11.8,
`bw_processing` 1.6, `matrix_utils` 0.9, `bw2parameters` 1.1.0, `bw_timex` 1.4.0,
`bw_temporalis` 1.2.0, `bw_graph_tools` 0.10, `randonneur` 0.7.2,
`ecoinvent_interface` 3.1 or `pypardiso` 0.4.7 declares a console script: every one of
those distributions returns an empty entry-point list (introspected). If you are looking
for a `bw2-...` command, you are looking at Brightway 2 documentation.

## Python entry points

All rows assume the import convention the cheat sheet uses (source: brightway-cheatsheet):

```python
import bw2analyzer as ba
import bw2calc as bc
import bw2data as bd
import bw2io as bi
```

### Projects

| Call | What it does | How checked |
|---|---|---|
| `bd.projects.current` | The project you are in. | introspected on bw2data 4.7 |
| `bd.projects.set_current('<name>')` | Switches to a project, creating it if it does not exist. | documented: brightway-cheatsheet |
| `sorted(bd.projects)` | Lists the projects. | documented: brightway-cheatsheet |
| `bd.projects.copy_project('<new>')` | Copies the current project. | introspected on bw2data 4.7 |
| `bd.projects.delete_project('<name>', delete_dir=True)` | Deletes a project, with or without its files. | documented: brightway-cheatsheet |
| `bd.projects.dir` | The directory the current project lives in. | documented: brightway-faq-data |
| `bd.projects.migrate_project_25()` | Reprocesses a Brightway 2 project so 2.5 can read it. | introspected: reads `Updates()._reprocess_all()` and sets the `25` flag |
| `bi.remote.install_project('<key>', '<name>')` | Downloads and installs a starter project with elementary flows and impact categories. | introspected on bw2io 0.9.17 |
| `bi.backup.backup_project_directory(project='<name>')` | Writes a `.tar.gz` of one project. | introspected on bw2io 0.9.17 |
| `bi.backup.restore_project_directory(fp='<path>')` | Restores such an archive. | introspected on bw2io 0.9.17 |

### Databases and the graph

| Call | What it does | How checked |
|---|---|---|
| `sorted(bd.databases)` | Lists the databases in the project. | documented: brightway-cheatsheet |
| `db = bd.Database('<name>')` | The database object. | introspected on bw2data 4.7 |
| `db.search('<query>')` | Full-text search inside a database. | introspected on bw2data 4.7 |
| `db.random()` | One random node, useful for a first look. | introspected on bw2data 4.7 |
| `db.datapackage()` | The `bw_processing` datapackage the calculation will read. | documented: brightway-cheatsheet |
| `bd.get_node(name='<n>', location='<l>')` | One node by any set of attributes. | introspected on bw2data 4.7 |
| `node.technosphere()`, `node.biosphere()`, `node.production()`, `node.edges()` | The edges of a node, by kind. | introspected on bw2data 4.7 |
| `node.new_edge(**attrs).save()` | Adds an edge; needs `type`, `amount` and `input`. | documented: brightway-cheatsheet |

### Impact assessment data

| Call | What it does | How checked |
|---|---|---|
| `sorted(bd.methods)` | Lists the installed impact categories. | documented: brightway-cheatsheet |
| `m = bd.Method(('<impact>', '<category>'))` | One impact category. | introspected on bw2data 4.7 |
| `list(m)` | Its characterisation factors, as `(flow, factor[, location])` tuples. | documented: brightway-cheatsheet |
| `m.write(data)` | Writes a new set of factors. | introspected on bw2data 4.7 |

### Running a calculation

| Call | What it does | How checked |
|---|---|---|
| `fu, objs, _ = bd.prepare_lca_inputs({node: 42}, method=('<impact>', '<category>'))` | Collects the functional unit and the datapackages for it. | introspected on bw2data 4.7 |
| `lca = bc.LCA(demand=fu, data_objs=objs)` | The calculation object. | introspected on bw2calc 2.5.0 |
| `lca.lci()` | Solves the inventory; fills `lca.inventory`. | introspected on bw2calc 2.5.0 |
| `lca.lcia()` | Characterises it; fills `lca.characterized_inventory`. | introspected on bw2calc 2.5.0 |
| `lca.score` | The single number. | introspected on bw2calc 2.5.0 |
| `lca.to_dataframe(matrix_label="characterized_inventory")` | The largest entries of a result matrix, as a dataframe. | documented: brightway-cheatsheet |
| `bc.LCA(..., use_distributions=True)` then `next(lca)` | Monte Carlo: new samples and a new solution per iteration. | documented: brightway-cheatsheet |
| `objs = bd.get_multilca_data_objs(fus, config)`, `bc.MultiLCA(demands=fus, method_config=config, data_objs=objs)` | Many functional units and many impact categories in one pass. | introspected on bw2data 4.7 and bw2calc 2.5.0 |

### Importing

| Call | What it does | How checked |
|---|---|---|
| `imp = bi.SingleOutputEcospold2Importer('<dir>', '<db name>')` | Starts an ecospold2 import. | introspected on bw2io 0.9.17 |
| `imp = bi.ExcelImporter('<file>')` | Starts an import from the Brightway Excel template. | introspected on bw2io 0.9.17 |
| `bi.import_ecoinvent_release(version=..., system_model=...)` | Downloads and imports a licensed ecoinvent release in one call. | introspected on bw2io 0.9.17 |
| `imp.apply_strategies()` | Runs the default clean-up and linking steps. | documented: brightway-cheatsheet |
| `imp.match_database('<other db>')` | Links the imported edges against another database. | documented: brightway-cheatsheet |
| `imp.statistics()`, `imp.all_linked` | How much is still unlinked. | documented: brightway-cheatsheet |
| `imp.write_database()` | Writes the result into the project. | documented: brightway-cheatsheet |
| `bi.bw2setup()` | Legacy one-shot setup of biosphere, methods and migrations. Deprecated; use `bi.remote.install_project`. | introspected on bw2io 0.9.17, deprecation documented: brightway-cheatsheet |

### Reading a result

| Call | What it does | How checked |
|---|---|---|
| `ba.print_recursive_calculation(activity, method)` | Prints the supply chain with each branch's share of the score. | introspected on bw2analyzer 0.11.8 |
| `ba.print_recursive_supply_chain(activity)` | Prints the supply chain without scores. | introspected on bw2analyzer 0.11.8 |
| `ba.ContributionAnalysis().annotated_top_processes(lca)` | The processes that dominate the score, with names. | introspected on bw2analyzer 0.11.8 |
| `ba.ContributionAnalysis().annotated_top_emissions(lca)` | The elementary flows that dominate the score. | introspected on bw2analyzer 0.11.8 |
| `ba.compare_activities_by_grouped_leaves(activities, method)` | Compares several activities by where their impact comes from. | introspected on bw2analyzer 0.11.8 |
| `ba.traverse_tagged_databases(fu, method, label='tag')` | Groups impact by a tag you put on the nodes. | introspected on bw2analyzer 0.11.8 |
