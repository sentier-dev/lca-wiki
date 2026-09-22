---
title: sentier-importers commands
type: module-page
summary: The three command line subcommands of sentier-importers, checked against their own --help.
audience: [P1]
updated: 2026-09-21
sources: [sentier-importers-repo]
---

# sentier-importers commands

Every entry point, checked on 2026-09-21 against its own `--help` in a clone at commit
`dac2e67`, version 0.0.1. The console script is `sentier-importers`, declared in
`pyproject.toml`; `python -m sentier_importers` is the same program.
(source: sentier-importers-repo)

## Command line

| Command | What it does | Key options |
|---|---|---|
| `sentier-importers --help` | Lists the three subcommands. | none |
| `sentier-importers list` | Prints every registered source with its target, its category and whether it is enabled. | none |
| `sentier-importers validate <source>` | Runs the pipeline up to validation and prints the number of valid rows. Emits nothing. | `--cache-dir`, `--output-dir`, `--offline`, `--schema-dir` |
| `sentier-importers run <source>` | Runs one source end to end. A dry run by default: files are staged under the output folder and no pull request is opened. | `--all`, `--deliver`, `--deliver-local PATH`, `--cache-dir`, `--output-dir`, `--offline`, `--schema-dir` |
| `sentier-importers run --all` | Runs every enabled source. This is the continuous integration smoke test. | as above |

### What the options mean

- `--deliver`: open a pull request on the target repository. It needs an authenticated
  `gh` on the path; without it a run stays a dry run.
- `--deliver-local PATH`: copy the emitted files into a local checkout of the target
  repository, with no git operation and no pull request. Useful for inspecting a diff
  before proposing it.
- `--offline`: fail on any fetch cache miss instead of reaching the network.
- `--cache-dir` and `--output-dir`: override the fetch cache and the staging folder. The
  defaults are the user cache directory for the cache and `output/` in the working
  directory for the staging folder.
- `--schema-dir`: validate against schemas in a local folder instead of the target's
  pinned reference, which is what you want while a schema change is still unmerged.

Emitted files are staged as `output/<target>/<category>/`.
(source: sentier-importers-repo)

### Examples

```bash
# what is registered, and what is enabled
uv run sentier-importers list

# validate one source without writing anything
uv run sentier-importers validate example-csv

# dry run: stage the files, open nothing
uv run sentier-importers run example-csv

# stage into a local checkout of the target repository instead
uv run sentier-importers run example-csv --deliver-local ../sentier-inventory

# the CI smoke test: every enabled source, offline
uv run sentier-importers run --all --offline
```

## Python entry points

There is no published library API: the framework is driven through the command line, and
a source is a class rather than a function a user calls. The two calls worth knowing when
embedding it are `core.pipeline.run_source(source, ctx)` and
`core.pipeline.validate_source(source, ctx)`, both taking a `RunContext` built the way
the command line builds it. (source: sentier-importers-repo)

## Developer commands

| Command | What it does |
|---|---|
| `uv run --extra testing pytest` | Runs the suite with coverage on the framework core, the matching package and the largest source family. `pytest --collect-only -q` collected 722 tests on 2026-09-21 at commit `dac2e67`. |
| `uv run --extra testing pytest app/sentier_importers/sources/` | Runs the plugin tests that live beside their source, as CI does in a second step. |
| `uv run --extra dev pre-commit run --all-files` | Runs the formatter and the lint hooks. |

(source: sentier-importers-repo)
