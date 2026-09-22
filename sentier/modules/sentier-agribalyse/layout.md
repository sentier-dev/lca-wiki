---
title: sentier-agribalyse layout
type: module-page
summary: "The tracked repository tree: the flat source package, the public inputs, the dashboard, and the folders that stay local."
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-agribalyse-repo]
---

# sentier-agribalyse layout

What a clone actually contains, as of commit `3d0df56` dated 2026-09-17. The repository
tracks 308 files, of which 165 are modules of the package and 99 are tests. Folders
marked local are created by a run and are gitignored.
(source: sentier-agribalyse-repo)

```
src/                     the package, flat layout, one folder per concern
  cli/                   26 files: one module per console script, plus a shared base
  config/                paths and settings, both frozen dataclasses
  core/                  logging, the parquet cache and an atomic parquet writer
  domain/                pure value objects: the tier enumeration, a mapping row,
                         match outcomes, compartment buckets, audit entries
  readers/               typed readers for JSON, gzipped JSON, parquet, spreadsheets
                         and stored mapping packages
  registry/              the mapping registry: builder, loaded view, lookup indexes,
                         table schemas and one ingester per source kind
  transforms/            the SimaPro parsing and correction chain
  matching/              the matchers and catalogues that place links
  ef/                    the impact assessment side: flow universe, factor tables,
                         regionalised factors, audits
  scoring/               matrices, allocation, the solver path, decomposition,
                         the scoring package
  pipelines/             the orchestrations the commands call
  reporting/             run reports, coverage, dashboards, residual exports
  exports/               the spreadsheets and mapping packages it writes out
  bw_export/             Brightway datapackage export and its parity check
  bw_import/             the standalone importer shipped with an export
  llm/                   the optional model-assisted mapping and explanation paths
  utils/                 diagnostics for unmatched rows
tests/                   80 unit tests and 13 integration tests, on synthetic fixtures
source/                  the inputs, and the mapping packages this repository publishes
  randonneur_packages/   the packages it authors
  bw2io-data/            static migration reference files
dashboard/               the static review interface, committed with its libraries
to_review/               human-review spreadsheets
unlinked/                residual unlinked exports
registry/                local: the built registry parquets; only registry.meta.json
                         is committed
cache/                   local: parquet caches, the parsed import and scoring packages
bw_package/              local: the Brightway export, gitignored and guarded
BOOTSTRAP.md             how a licensed user regenerates the local input files
.githooks/pre-commit     the guard that refuses to commit licensed files
.github/workflows/ci.yml lint and the full test suite, on synthetic fixtures only
pyproject.toml           dependencies, extras and the 24 console scripts
```

## Key files

- `pyproject.toml` declares every command. The console-script names are the public
  interface of this repository; see [commands.md](commands.md).
- `src/config/paths.py` is a frozen dataclass holding every location the pipeline reads
  or writes, so no module builds a path by hand.
- `src/domain/tier.py` is the priority ladder. Lower number wins, and from a documented
  tier onward the tiers are fill-only: they may only place a link on an exchange that
  has none.
- `registry/registry.meta.json` is the only committed registry file. It records when the
  registry was built, which release of each input it was built from, the row count per
  table, a hash per source file and the tier ladder. It is provenance, not data.
- `.githooks/pre-commit` refuses a commit that stages any of the five licensed paths,
  even when they were force-added past the ignore file.
- `dashboard/backtest_dashboard.html` plus the committed copies of its front-end
  libraries make the review interface work from a plain static server, with no build
  step and no network access.

## What is deliberately absent

No Brightway project directory and no database file: the runtime is free of the
Brightway data layer and reads the files under `source/` and `registry/` instead. The
optional export writes datapackages the other way, for a tool that wants them.
