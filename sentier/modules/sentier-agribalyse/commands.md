---
title: sentier-agribalyse commands
type: module-page
summary: All 24 console scripts, with the flags their own help prints, grouped by the order you run them in.
audience: [P1]
updated: 2026-09-21
sources: [sentier-agribalyse-repo]
---

# sentier-agribalyse commands

Every command declared in `pyproject.toml`, each checked against its own `--help` on
2026-09-21 in a clone at commit `3d0df56`. Run them as `uv run <command>` from the
repository root. Flags below are the ones the help actually prints.
(source: sentier-agribalyse-repo)

## Bootstrap, for a licensed user only

| Command | What it does | Key options |
|---|---|---|
| `dds-snapshot-ecoinvent-exchanges` | one-time dump of background exchanges from a Brightway project database file into `source/`, without depending on the Brightway data layer | `--sqlite PATH` required, `--db-name NAME` |

## Build the registry

| Command | What it does | Key options |
|---|---|---|
| `dds-build-registry` | build the mapping registry parquets from every artifact under `source/`; run this first | none |
| `dds-build-ef-flows-registry` | write the hygiene-filtered impact assessment flow universe | none |
| `dds-build-biosphere-catalog` | write the biosphere catalogue from the snapshotted flow lists and the flow universe | none |
| `dds-build-method-cfs-registry` | write the per-method characterisation factor tables and their index | none |
| `dds-build-ecoinvent-catalog` | write the background activity catalogue from the snapshotted activity list | none |
| `dds-build-parameters` | write the parameter and exchange-formula tables from the export | none |
| `dds-build-packages` | author the mapping packages under `source/randonneur_packages/` and the residuals review spreadsheet | none |

## Link and score

| Command | What it does | Key options |
|---|---|---|
| `dds-link-all` | the full link pipeline; writes the scoring package and the run report | `--skip-ecoinvent`, `--no-llm` |
| `dds-run-end-to-end` | smoke test: link, register the methods, score a sample | `--skip-linking`, `--skip-ecoinvent`, `--solver {scipy,pardiso}`, `--n-products N` |
| `dds-backtest` | score every mapped product against the published reference values and write the dashboard tables | `--solver {scipy,pardiso}`, `--workers N`, `--n-products N`, `--exact-name-only` |
| `dds-decompose-score` | explain one score as per-flow contributions | `--database` and `--code` and `--method` required, `--top-n N`, `--inventory`, `--out DIR`, `--solver {scipy,pardiso}` |
| `dds-reset` | clear the caches, the parsed import and the overrides so the next link rebuilds the baseline | `--keep-overrides` |

## Review and reporting

| Command | What it does | Key options |
|---|---|---|
| `dds-build-flow-decomp` | per-product flow decomposition files for the dashboard drill-down | `--top-n N` default 25, `--out DIR`, `--solver {scipy,pardiso}` |
| `dds-build-product-reasons` | model-written notes explaining outlier products | `--threshold PCT` default 30, `--limit N`, `--codes ...`, `--workers N` default 4, `--top-flows N` default 6, `--force`, `--use-api` |
| `dds-compare-cfs` | per-category factor distribution statistics, the adapted source against the reference one | `--source {registry,raw}`, `--method NAME` repeatable, `--decimals N`, `--no-emit`, `--all-flows` |
| `dds-build-cf-comparison-csv` | flatten the stored factor comparison into the dashboard table | none |
| `dds-mappings-comparison` | regenerate the mapping comparison spreadsheet from the cached link | none |
| `dds-llm-suggest-mappings` | ask a model to resolve residual unlinked flows; accepted picks land in the reviewed spreadsheet | `--use-api`, `--model NAME`, `--max-candidates N`, `--limit N` |

## Parameters

| Command | What it does | Key options |
|---|---|---|
| `dds-list-parameters` | list parameter names, how many processes define them, and the active overrides | `--name-like TEXT`, `--product CODE` |
| `dds-set-parameter` | override a parameter and rescore; takes the name and the value as positional arguments | one of `--product CODE` or `--all-products` required, `--comment TEXT`, `--no-rescore`, `--fast`, `--solver {scipy,pardiso}` |
| `dds-clear-parameters` | remove overrides, all of them or a subset | `--name NAME`, `--product CODE` |

## Export

| Command | What it does | Key options |
|---|---|---|
| `dds-build-bw-package` | export the linked system as `bw_processing` datapackages plus a standalone importer, and parity-check it through a stock calculation | `--out DIR`, `--parity-n N` default 3, `--parity-full`, `--skip-parity` |
| `dds-build-skeleton` | strip the licensed amounts out of a built scoring package and write the public-only skeleton into a separate checkout | `--content-hash HASH` and `--bundle-root PATH`, both required |

## Flags worth knowing

- `--solver pardiso` is offered on the scoring commands and is already the default on
  the flow decomposition and the parameter override. The reason is in
  [gotchas.md](gotchas.md).
- `--skip-ecoinvent` on the link and the end-to-end run skips the background import when
  it is already loaded.
- `--no-llm` on the link disables the model-assisted overrides and the curated synonym
  fallback.
- The two model-assisted commands shell out to a local assistant binary by default and
  only use an API when `--use-api` is given, which needs the `llm-api` extra.

## The documented order

Regenerate the local inputs if you are licensed, then build the registry and its
catalogues, then `dds-link-all`, then `dds-backtest`, then the dashboard tables, then
serve the `dashboard/` folder with any static file server. After replacing the export,
run `dds-reset` and start again from the link step. (source: sentier-agribalyse-repo)

## Notebook entry points

None are advertised. The pipelines are classes with options dataclasses, so a notebook
can drive them directly, but the supported interface is the command line plus the
artifacts under `dashboard/`, `to_review/` and `unlinked/`.
