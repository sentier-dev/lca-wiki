---
title: sentier-vocab commands
type: module-page
summary: The generate and coverage subcommands, the importer script, and the checks a contributor runs before a pull request.
audience: [P1]
updated: 2026-09-21
sources: [sentier-vocab-repo]
---

# sentier-vocab commands

Every entry point you can run, checked against its own `--help` on 2026-09-21 in a
clone at commit `ef440c6`. Run them from the repository root.
(source: sentier-vocab-repo)

| Command | What it does | Key options |
|---|---|---|
| `uv run python -m sentier_vocab generate` | validate every source file of every category and write one Turtle file per source into `output/` | `--output-dir DIR` writes elsewhere |
| `uv run python -m sentier_vocab coverage` | regenerate the coverage matrix | `--output PATH`, default `docs/COVERAGE.md` |
| `uv run sentier-vocab <command>` | the same CLI under its console-script name, declared in `pyproject.toml` | as above |
| `uv run bash scripts/generate.sh` | fetch the external ontologies, then run every transitional importer | no flags; see the subcommands below |
| `uv run bash scripts/generate.sh fetch` | download the Combined Nomenclature archive only | takes no arguments |
| `uv run bash scripts/generate.sh generate [MODULE...]` | run the named importers, or all of them | module names are `qudt`, `combined_nomenclature`, `envo`, `model_terms`, `open_energy_ontology`, `custom_products` |
| `uv run --extra dev pre-commit run --all-files` | format and lint, including the 3 MB added-file size guard | `--all-files` as shown |
| `uv run --extra testing pytest` | the test suite | standard pytest flags |
| `sphinx-build docs _build/html` | build the documentation site | the conda environment is `docs/environment.yaml` |

## Verified output

`python -m sentier_vocab --help` prints the two subcommands `generate` and `coverage`
and nothing else. `generate --help` shows only `--output-dir`, and `coverage --help`
only `--output`. There is no per-category flag: `generate` always walks all thirteen
categories and prints `skip <category>` for a category with no source files.
(source: sentier-vocab-repo)

## What generate writes

For each category it reads every `*.yaml`, `*.yml` and `*.parquet` file in
`data/<category>/`, sorted, and writes one Turtle file per source:

- a source whose file stem is `core` or `water` writes the bare `<category>.ttl`, which
  is committed;
- any other stem writes `<category>.<stem>.ttl`, which is gitignored and rebuilt at
  deploy time;
- the elementary-flows category writes files named `flows.*` rather than
  `elementary-flows.*`.

## Notebook entry points

The package is not meant to be called from a notebook, and the importers are scripts
rather than a library. `dev/` holds exploratory notebooks for ENVO, OEO and QUDT, and
`docs/content/` holds the narrative documentation. If you need the vocabulary in a
notebook, read the published Turtle or query the triplestore rather than importing the
generator. (source: sentier-vocab-repo)
