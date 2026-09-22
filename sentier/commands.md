---
title: Sentier commands
type: module-page
summary: One table of every runnable command across the Sentier packages, with how each row was checked.
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-brightway-repo, sentier-importers-repo, sentier-vocab-repo, sentier-inventory-repo, sentier-methods-repo, sentier-mappings-repo]
related: [README.md, modules/sentier-brightway/commands.md, modules/sentier-importers/commands.md]
---

# Sentier commands

Everything you can run across the Sentier packages, in one table. The last column says
how the row was checked on 2026-09-21: either the command's own `--help` was run in a
local clone, or the command was read from the repository's README without being run.

Every package here has a `commands.md` of its own under [modules/](modules/), and that
page is the one to read for flags, exit codes and worked examples; this table is the
index. The code packages are
[modules/sentier-brightway/commands.md](modules/sentier-brightway/commands.md),
[modules/sentier-importers/commands.md](modules/sentier-importers/commands.md) and
[modules/sentier-vocab/commands.md](modules/sentier-vocab/commands.md)
(sentier-brightway-repo, sentier-importers-repo, sentier-vocab-repo); the data
repositories are
[modules/sentier-inventory/commands.md](modules/sentier-inventory/commands.md),
[modules/sentier-methods/commands.md](modules/sentier-methods/commands.md) and
[modules/sentier-mappings/commands.md](modules/sentier-mappings/commands.md), whose rows
below are read from each repository's README (sentier-inventory-repo,
sentier-methods-repo, sentier-mappings-repo).

## The table

| Command | Package | What it does | Verified how |
|---|---|---|---|
| `sentier-brightway db --project NAME` | sentier-brightway | Installs the inventory, the biosphere, the residual database and the 25 EF 3.1 methods into a Brightway project. | `--help` run, 0.1.0 |
| `sentier-brightway files --out DIR` | sentier-brightway | Writes the same build as a parquet registry, the mappings and `bw_processing` datapackages, without `bw2data`. | `--help` run, 0.1.0 |
| `sentier-brightway coverage` | sentier-brightway | Prints the flow linking coverage and the data citation, touching nothing else. | `--help` run, 0.1.0 |
| `sentier-brightway backtest --out DIR` | sentier-brightway | Scores every process for the 25 categories, compares with the published reference results, writes the dashboard data. | `--help` run, 0.1.0 |
| `uv run python scripts/pin_sources.py` | sentier-brightway | Regenerates the pinned data manifest after the data repositories move. | README |
| `sentier-importers list` | sentier-importers | Prints every registered source with its target, category and enabled flag. | `--help` run, 0.0.1 |
| `sentier-importers validate <source>` | sentier-importers | Runs the pipeline up to validation and prints the valid row count. Emits nothing. | `--help` run, 0.0.1 |
| `sentier-importers run <source>` | sentier-importers | Runs one source end to end; a dry run unless `--deliver` or `--deliver-local` is given. | `--help` run, 0.0.1 |
| `sentier-importers run --all` | sentier-importers | Runs every enabled source; the continuous integration smoke test. | `--help` run, 0.0.1 |
| `uv run python -m sentier_vocab generate` | sentier-vocab | Validates every data category against the LinkML schemas and writes the generated Turtle. | README |
| `uv run python -m sentier_vocab coverage` | sentier-vocab | Regenerates the coverage matrix of the vocabulary. | README |
| `uv run sentier-vocab <command>` | sentier-vocab | The same command line as `python -m sentier_vocab`, through the console script. | README |
| `uv run bash scripts/generate.sh` | sentier-vocab | Fetches the external ontologies and runs the transitional importers. | README |
| `uv run --with "jsonschema[format],pyyaml,pyarrow" python scripts/validate.py` | sentier-inventory | Validates every sector folder against the schema contracts; what CI runs on each pull request. | README |
| `uv run --with pyarrow --with pyyaml --with 'jsonschema[format]' python scripts/validate.py` | sentier-methods | Validates every method data folder against the schemas; what CI runs on each pull request. | README |
| `uv run --with-requirements scripts/requirements.txt python scripts/validate.py` | sentier-mappings | Validates every source-and-target pair against the package and metadata schemas. | README |
| `uv run --with-requirements scripts/requirements.txt pytest -q tests` | sentier-mappings | Runs the validator's own test suite. | README |

The three data repositories have no package to install: they are cloned and read
directly, and their only code is the validator continuous integration runs.

## Reading a table in a data repository

Each data repository documents a one-line reader in its README, in the same shape: run
Python with pyarrow or pandas added on the fly and print a parquet table. They are
inspection helpers rather than an interface, so they are not listed row by row here;
take them from the repository you are reading.

## Developer commands, common to the packages

| Command | Package | What it does | Verified how |
|---|---|---|---|
| `uv run --extra testing pytest` | sentier-brightway, sentier-importers, sentier-vocab | Runs the test suite. | `pytest --collect-only -q` run in the sentier-brightway and sentier-importers clones, 2026-09-21 |
| `uv run --extra testing pytest app/sentier_importers/sources/` | sentier-importers | Runs the plugin tests that live beside their source, as CI does. | README |
| `uv run --extra dev pre-commit run --all-files` | sentier-brightway, sentier-importers, sentier-vocab | Runs the formatter and the lint hooks before committing. | README |

## Not covered here

The Agribalyse-facing work has its own set of build commands, which
[modules/sentier-agribalyse/](modules/sentier-agribalyse/) documents. Anything that needs
a licensed background database to run is out of scope for this wiki, and the module page
says so rather than listing the command.
