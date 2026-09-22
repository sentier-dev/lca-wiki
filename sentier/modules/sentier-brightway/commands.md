---
title: sentier-brightway commands
type: module-page
summary: The four command line subcommands and the Python entry points, checked against their own --help.
audience: [P1]
updated: 2026-09-21
sources: [sentier-brightway-repo]
---

# sentier-brightway commands

Every entry point, checked on 2026-09-21 against its own `--help` in a clone at commit
`a9dba75`, package version 0.1.0. The console script is `sentier-brightway`, declared in
`pyproject.toml` and implemented in `cli.py`. (source: sentier-brightway-repo)

## Command line

| Command | What it does | Key options |
|---|---|---|
| `sentier-brightway --help` | Lists the four subcommands. | none |
| `sentier-brightway db --project NAME` | Writes the inventory, the biosphere, the residual database and the 25 methods into a Brightway project. Needs `bw2data`. | `--project` (required), `--overwrite`, `--data-root DIR`, `--skip-nomenclature` |
| `sentier-brightway files --out DIR` | Writes the same build as parquet registry, mappings and `bw_processing` datapackages. No `bw2data` needed. | `--out` (required), `--overwrite`, `--no-datapackages`, `--data-root DIR`, `--skip-nomenclature` |
| `sentier-brightway coverage` | Prints how many source flows link to the method nomenclature, with the citation. Touches neither Brightway nor the output folder. | `--data-root DIR`, `--skip-nomenclature` |
| `sentier-brightway backtest --out DIR` | Scores every process for all 25 categories, compares them with the published reference results, and writes the dashboard data folder. | `--out` (required), `--xlsx FILE`, `--files DIR`, `--data-root DIR`, `--skip-nomenclature` |

### What the shared options mean

- `--data-root DIR`: read the four Sentier data repositories from local clones under
  `DIR` instead of downloading them. The environment variable `SENTIER_DATA_ROOT` has
  the same effect, and the folder is expected to hold one subfolder per repository,
  named as the repository is.
- `--skip-nomenclature`: do not apply the fourth, nomenclature-only mapping package, so
  source flows whose counterpart carries no characterisation factor stay in the residual
  database instead of being relinked.
- `--overwrite`: replace a previous install or export. In file mode only a folder that
  holds a `manifest.json`, that is a previous export, is replaced; anything else is left
  alone. Re-running with `--overwrite` is also the recovery step after a project write
  that failed part way.
- `--xlsx FILE`: the published reference results workbook, `.xlsx` or `.zip`. Its
  default is a path on the author's machine, so pass it explicitly.
- `--files DIR`: reuse an existing file-mode export instead of writing a new one into
  `<out>/files` first.

### Examples

```bash
# check the linking before installing anything
uv run sentier-brightway coverage

# install into a Brightway project, replacing a previous install
uv run sentier-brightway db --project my-project --overwrite

# write plain files, without the datapackages
uv run sentier-brightway files --out ./export --no-datapackages

# backtest an export that already exists, then serve the dashboard
uv run sentier-brightway backtest --out ./dashboard --files ./export --xlsx ./reference.xlsx
uv run python -m http.server 8000 --directory ./dashboard
```

## Python entry points

Used interactively rather than from a shell; all four are exported from the package root.

| Call | What it does |
|---|---|
| `import_bafu_db(project, overwrite=False, data_root=None, include_nomenclature=True)` | The `db` command. Returns the `Coverage`. |
| `import_bafu_files(out_dir, data_root=None, include_nomenclature=True, datapackages=True, overwrite=False)` | The `files` command. Returns the `Coverage`. |
| `coverage(data_root=None, include_nomenclature=True)` | The `coverage` command, as an object rather than a printed report. |
| `assemble(data_root=None, include_nomenclature=True)` | Reads and builds, writes nothing; useful for inspecting a build before installing it. |
| `backtest.run_backtest(files_dir, xlsx, out_dir)` | The `backtest` command. |
| `datapackage.score(out_dir, process_code, method_id)` | Scores one process of a files export for one method id, without `bw2data`. |
| `registry.load_registry(folder)` | Reads the five parquet tables of an export back into frames. |

After an install, link your own activities to the installed inventory and biosphere and
score them with stock `bw2calc`; in the Activity Browser, reload the project and the
methods appear under the Sentier method prefix. (source: sentier-brightway-repo)

## Developer commands

| Command | What it does |
|---|---|
| `uv run --extra testing pytest` | Runs the suite. `pytest --collect-only -q` collected 281 tests on 2026-09-21 at commit `a9dba75`. |
| `uv run --extra dev pre-commit run --all-files` | Runs the formatter and lint hooks, as CI does. |
| `uv run python scripts/pin_sources.py` | Regenerates `sources.toml` after the data repositories move. |

(source: sentier-brightway-repo)
