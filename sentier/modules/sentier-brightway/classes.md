---
title: sentier-brightway classes and functions
type: module-page
summary: The public surface of sentier-brightway, in the order a user meets it.
audience: [P1, P3]
updated: 2026-09-22
sources: [sentier-brightway-repo]
---

# sentier-brightway classes and functions

Hand-written companion to the generated [api/](api/README.md) folder. The
names below are the ones exported from `sentier_brightway/__init__.py` plus the few
module-level helpers a user calls directly, read at commit `a9dba75`.
(source: sentier-brightway-repo)

## The public API

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `import_bafu_db` | function | Installs the inventory, the biosphere and the 25 methods into a Brightway project. | `sentier-brightway db` |
| `import_bafu_files` | function | Writes the same build as a registry, mappings and datapackages in a folder. | `sentier-brightway files` |
| `coverage` | function | Returns the linking coverage without touching Brightway. | `sentier-brightway coverage` |
| `assemble` | function | Reads the data and builds the node dictionaries, without writing anything. | the three functions above |
| `render` | function | Formats a `Coverage` into the printed report, citation included. | `sentier-brightway coverage` |
| `Coverage` | frozen dataclass | Counts of flows used, flows mapped, exchange rows and residual rows. | returned by all three commands |
| `BuildResult` | dataclass | The assembled databases, bound methods and coverage, before any writer sees them. | `assemble` |
| `backtest.run_backtest` | function | Scores every process for all 25 categories and writes the dashboard folder. | `sentier-brightway backtest` |
| `backtest.render_summary` | function | Formats the backtest result as the printed summary. | `sentier-brightway backtest` |
| `__version__` | string | The installed distribution version. | the manifest and the run report |

## Reading the data

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `fetch.resolve_data_root` | function | Picks the data root: an explicit path, the environment variable, or the verified download cache. | `assemble` |
| `fetch.load_packaged_manifest` | function | Parses the pinned `sources.toml` into `Source` records. | `resolve_data_root`, the file-mode manifest |
| `fetch.materialize` | function | Downloads every pinned file and checks its sha256 into the cache. | `resolve_data_root` |
| `inventory.load_inventory` | function | Reads the sector folders into a processes frame and an exchanges frame. | `assemble` |
| `flows.load_ef_flows` / `flows.load_bafu_flows` | functions | Read the elementary-flow terms of one upstream source out of the vocabulary shards. | `assemble` |
| `methods.load_methods` | function | Reads the 25 methods and their global characterisation factors. | `assemble` |
| `bridge.load_bridge` | function | Reads the ordered mapping packages into one source-code to target-flow mapping. | `assemble` |
| `bridge.applied_packages` | function | Names the packages that were applied, in order, for the manifest. | `import_bafu_files` |

## Building and writing

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `build.build` | function | Turns the frames plus the bridge into the three node dictionaries, the bound methods and the coverage. | `assemble` |
| `build.BoundMethod` | dataclass | One method key with its list of characterised flows. | `build.build` |
| `writer.write` | function | Writes the databases and the methods through `bw2data`, targets first. | `import_bafu_db` |
| `writer.get_node` / `writer.score` | functions | Fetch a node and score it with stock `bw2calc`, for a quick check after an install. | a user, interactively |
| `files.write_files` | function | Writes `registry/`, `mappings/`, `bw_package/` and `manifest.json`. | `import_bafu_files` |
| `registry.build_registry` / `write_registry` / `load_registry` | functions | Build, write and read back the parquet registry keyed by an integer id. | `files.write_files`, the backtest |
| `registry.Registry` | dataclass | The five tables of the registry: processes, biosphere, exchanges, methods, factors. | `build_registry` |
| `datapackage.write_datapackages` | function | Writes one inventory datapackage and one per method. | `files.write_files` |
| `datapackage.load_inventory_datapackage` / `load_method_datapackage` | functions | Load an exported datapackage for a stock `bw2calc.LCA`. | a user, or the backtest |
| `datapackage.score` | function | Scores one process for one method id from a files export, in one call. | a user, interactively |
| `datapackage.method_slug` | function | The folder-safe form of a method id. | `write_datapackages` |
| `units.normalize_unit` | function | Maps a source unit spelling onto the name Brightway uses. | `build.build` |

## Notes

- **Order matters in the writer.** The biosphere and the residual database are written
  before the inventory that links into them.
- **`bw2data` is imported lazily**, inside `import_bafu_db` and inside `writer`, so
  `import sentier_brightway` and the whole of file mode work without Brightway.
- **`assemble` is the seam.** Anything that reads data returns a frame, anything that
  writes takes a `BuildResult`; tests exercise the middle without touching a project.
- **The errors are typed**: `fetch.FetchError` and `fetch.IntegrityError` for the data,
  `files.ExistingOutputError` for a non-empty output folder, `writer.ExistingDatabaseError`
  for a project that already holds the databases. The command line turns them into a
  message and a non-zero exit code rather than a traceback.

(source: sentier-brightway-repo)
