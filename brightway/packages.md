---
title: Brightway packages
type: module-page
summary: The landscape table of the 15 Brightway packages this wiki documents, with versions, what each one does and what it exposes.
audience: [P1, P2]
updated: 2026-09-21
sources: [brightway-ecosystem, brightway-docs, pypi-bw2data, pypi-bw2calc, pypi-bw2io, pypi-bw-processing, pypi-matrix-utils, pypi-bw2parameters, pypi-bw2analyzer, pypi-randonneur, pypi-flowmapper, pypi-ecoinvent-interface, pypi-bw-graph-tools, pypi-bw-timex, pypi-bw-temporalis, pypi-activity-browser, pypi-pypardiso]
related: [README.md, commands.md, modules/README.md]
---

# Brightway packages

One row per package, with the version this wiki documents. Versions come from the PyPI
JSON API on 2026-09-21; the "base names" column lists what you actually type, checked by
importing the package and reading its public namespace where an import was possible, and
taken from the package's own documentation where it was not. Each row links to the module
folder that documents the package in full.

The upstream documentation groups these as core libraries, supporting libraries and
community projects (source: brightway-ecosystem); this table keeps that grouping.

## Core libraries

| Package | Version | What it does, in plain words | Base names it exposes | Module | Licence |
|---|---|---|---|---|---|
| `bw2data` | 4.7 | Holds your work: projects, databases of nodes and edges, impact categories, parameters, search. | `projects`, `Database`, `Method`, `get_node`, `get_activity`, `databases`, `methods`, `parameters`, `prepare_lca_inputs` | [modules/bw2data/](modules/bw2data/) | BSD 3-Clause |
| `bw2calc` | 2.5.0 | Turns that data into matrices and solves them: inventory, impact score, Monte Carlo. | `LCA`, `MultiLCA`, `MethodConfig`, `DenseLCA`, `LeastSquaresLCA`, `IterativeLCA`, `CachingLCA` | [modules/bw2calc/](modules/bw2calc/) | BSD 3-Clause |
| `bw2io` | 0.9.17 | Reads foreign LCA file formats, links them to what you already have, writes them into a database. | `SingleOutputEcospold2Importer`, `ExcelImporter`, `SimaProCSVImporter`, `remote.install_project`, `import_ecoinvent_release`, `bw2setup` (deprecated) | [modules/bw2io/](modules/bw2io/) | BSD 3-Clause |
| `bw2analyzer` | 0.11.8 | Explains a finished result: which processes and which emissions caused the score. | `ContributionAnalysis`, `print_recursive_calculation`, `print_recursive_supply_chain`, `compare_activities_by_grouped_leaves`, `traverse_tagged_databases` | [modules/bw2analyzer/](modules/bw2analyzer/) | BSD 3-Clause |

## Supporting libraries

| Package | Version | What it does, in plain words | Base names it exposes | Module | Licence |
|---|---|---|---|---|---|
| `bw_processing` | 1.6 | The file format calculations actually read: numeric arrays plus a metadata file. | `create_datapackage`, `load_datapackage`, `Datapackage`, `MatrixEntry`, `create_datapackage_from_entries` | [modules/bw_processing/](modules/bw_processing/) | BSD 3-Clause |
| `matrix_utils` | 0.9 | Builds a sparse matrix out of one or more datapackages, and rebuilds it for each iteration. | `MappedMatrix`, `MappedMatrixDict`, `ArrayMapper`, `ResourceGroup`, `RandomIndexer` | [modules/matrix_utils/](modules/matrix_utils/) | BSD 3-Clause |
| `bw2parameters` | 1.1.0 | Evaluates formulas in the right order, with units, so an amount can be a calculation. | `ParameterSet`, `Interpreter`, `PintParameterSet`, `PintInterpreter`, `mangle_formula` | [modules/bw2parameters/](modules/bw2parameters/) | BSD 3-Clause |
| `bw_graph_tools` | 0.10 | Walks the supply chain of a solved system and reports the paths that matter. | `NewNodeEachVisitGraphTraversal`, `GraphTraversalSettings`, `Node`, `Edge`, `Flow` | [modules/bw_graph_tools/](modules/bw_graph_tools/) | BSD 3-Clause |
| `randonneur` | 0.7.2 | Applies a written-down, reusable change set to inventory data instead of a one-off script. | `migrate_nodes`, `migrate_edges`, `migrate_nodes_with_stored_data`, `Datapackage`, `MigrationConfig` | [modules/randonneur/](modules/randonneur/) | MIT |
| `flowmapper` | 0.4 | Matches one elementary flow list against another and writes out the mapping. | `Flow`, `Flowmap`, `OutputFormat`, and the `flowmapper` command | [modules/flowmapper/](modules/flowmapper/) | unknown; see the module page |
| `ecoinvent_interface` | 3.1 | Logs a licensed user in to ecoinvent and fetches releases, reports and process files. | `Settings`, `EcoinventRelease`, `EcoinventProcess`, `ReleaseType`, `ProcessFileType` | [modules/ecoinvent_interface/](modules/ecoinvent_interface/) | MIT |

## Community projects

| Package | Version | What it does, in plain words | Base names it exposes | Module | Licence |
|---|---|---|---|---|---|
| `bw_timex` | 1.4.0 | Time-explicit LCA: picks the database whose year fits each step of the supply chain. | `TimexLCA`, `TimexLCASettings`, `TimelineBuilder`, `TemporalDistribution` | [modules/bw_timex/](modules/bw_timex/) | BSD 3-Clause |
| `bw_temporalis` | 1.2.0 | Spreads emissions over time and characterises them dynamically. | `TemporalisLCA`, `TemporalDistribution`, `Timeline`, `easy_timedelta_distribution` | [modules/bw_temporalis/](modules/bw_temporalis/) | BSD 3-Clause |
| `activity-browser` | 3.0.0b202608291724 | A desktop window onto a Brightway project, for people who do not want a notebook. | the `activity-browser` command | [modules/activity-browser/](modules/activity-browser/) | LGPL-3.0-or-later |
| `pypardiso` | 0.4.7 | A much faster sparse solver, used in place of the SciPy one when it is installed. | `spsolve`, `factorized`, `PyPardisoSolver` | [modules/pypardiso/](modules/pypardiso/) | BSD 3-Clause |

## How to read the table

- **Version** is the newest release on PyPI on 2026-09-21, not necessarily the version
  your environment has. Check with `importlib.metadata.version("<name>")`; several
  packages also expose `__version__`, and `bw2parameters` and `bw2analyzer` expose it as
  a tuple rather than a string.
- **Base names** is the shortest useful set, not the whole public API. Each module's
  `classes.md` has the full list.
- The distribution name and the import name differ for two packages: `bw-processing` is
  imported as `bw_processing`, `matrix-utils` as `matrix_utils`, and `activity-browser`
  as `activity_browser`.
- Licences are what the distribution or its repository states. `flowmapper` states none
  in its distribution metadata, so this wiki records it as unknown rather than guessing.
- Only two of the 15 install a shell command: `flowmapper` and `activity-browser`. The
  other 13 are used from Python. See [commands.md](commands.md).

## Dependencies worth knowing

`bw2calc` 2.5.0 requires `bw_processing >= 1.0`, `matrix_utils >= 0.6` and
`bw_graph_tools >= 0.8`; `bw2data` 4.7 requires `bw_processing >= 0.9.5` and
`bw2parameters`; `bw2io` 0.9.17 requires `bw2data >= 4.6.2`, `bw2calc >= 2.0`,
`randonneur >= 0.6` and `randonneur_data >= 0.5.4` (source: pypi-bw2calc, pypi-bw2data,
pypi-bw2io). In other words, installing `bw2io` pulls in most of the stack, and
`randonneur` is now part of the standard import path rather than an optional extra.

`bw2calc` uses `pypardiso` when it is importable and warns on x64 hardware when it is
not, falling back to the SciPy solver (checked by importing `bw2calc` 2.5.0 without
`pypardiso` present).
