---
title: sentier-brightway status
type: module-page
summary: Where sentier-brightway stands at version 0.1.0.
audience: [P2]
updated: 2026-09-22
sources: [sentier-brightway-repo]
---

# sentier-brightway status

As of 2026-09-21, from the repository README, `CHANGELOG.md` and the source tree at
commit `a9dba75` (2026-09-17), version 0.1.0, which the changelog still marks
"unreleased". (source: sentier-brightway-repo)

## Works today

- **Project mode.** `db` installs the inventory, an EF 3.1 biosphere, the residual
  database and the 25 EF 3.1 methods into a Brightway project, relinked through the
  mapping bridge.
- **File mode.** `files` writes the same build as a parquet registry, the applied mapping
  packages and `bw_processing` datapackages, so stock `bw2calc` can score without
  `bw2data`.
- **Pinned, verified data.** A generated manifest pins a commit per data repository and a
  sha256 per file; data is downloaded on first use and nothing is shipped in the wheel.
- **Coverage report.** `coverage` prints the linking numbers and the citation without
  touching Brightway.
- **Backtest and dashboard.** `backtest` scores all 11,947 processes over the 25
  categories by adjoint solve, cross-checks that against a plain scoring loop, compares
  with the published reference results, and writes a static dashboard: box plots per
  category, a sector facet, a worst-200 drill-down per category and a per-process panel.
- **Tests and CI.** The suite collected 281 tests on 2026-09-21; CI runs it on Python
  3.10 and 3.11 and then the formatter and lint hooks.

## In flight

- 0.1.0 is not released: the changelog heading reads "unreleased", and the package is not
  on PyPI, so every install is from git.

## Missing

The README lists the limitations of 0.1.0, and each is a contribution opportunity:

- global EF factors only, no regionalised categories such as country-level water use;
- one inventory and one method family only, BAFU-2026 v1 and EF 3.1;
- static values: the datapackage export carries no uncertainty distributions, so Monte
  Carlo over an export sees fixed amounts;
- no flow-level drill-down in the backtest dashboard;
- 113 inventory flows still have no EF 3.1 counterpart, which is mapping work in
  sentier-mappings rather than in this package.

## Where help is welcome

Anything larger than a page is listed on [../../roadmap.md](../../roadmap.md). Mapping
gaps belong upstream, in [../sentier-mappings/](../sentier-mappings/); method coverage
belongs in [../sentier-methods/](../sentier-methods/).
