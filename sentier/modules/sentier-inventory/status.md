---
title: sentier-inventory status
type: module-page
summary: "Where the inventory repository stands: one source folder, schema 0.3.0 on an open pull request, unit processes only."
audience: [P2]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5, sentier-importers-pr-29, sentier-brightway-pr-3]
---

# sentier-inventory status

As of commit `cf54f55`, dated 2026-10-12, the head of pull request #5 (branch
`feat/source-folders`), which is open and not yet merged. (source: sentier-inventory-pr-5)

## Works today

- One source folder, `data/bafu-2026-v1/`, with 11,947 processes and 420,063 exchanges,
  validating against the schema contract at version `0.3.0`.
- A complete, self-contained validator that continuous integration runs on every pull
  request and on every push to a non-default branch, now also checking that a folder
  holds one source and one version matching its name, and that the declared sectors
  match the `sector` column.
- A stable delivery convention: importers open pull requests, nothing is hand-edited, a
  delivery replaces its source folder whole, and the metadata declares row counts and
  sectors that are checked against the files.
- Downstream consumption works: the loader documented in
  [../sentier-brightway/](../sentier-brightway/) opens the one folder matching a source
  at a pinned commit, and verified the same 11,947 processes and the same bridge coverage
  as before the layout change. (source: sentier-brightway-pr-3)

## In flight

- **The source-folder layout, on three open pull requests.** Pull request #5 here moves
  the data from eleven sector folders into `data/bafu-2026-v1/`, adds the `sector`
  column and the per-source metadata, and raises the schema to `0.3.0`; #29 on
  [../sentier-importers/](../sentier-importers/) collapses the 22 per-sector registry
  blocks into two and emits the sector as a column; #3 on
  [../sentier-brightway/](../sentier-brightway/) reads one source folder and re-pins the
  inventory to `cf54f55`. The trigger was a question on 2026-10-12 about whether sector
  parquet from several sources would stack: it would not, because a delivery overwrote
  the sector file whole. All three are pending merge as of 2026-10-12, so the default
  branches still show the old layout. (source: sentier-inventory-pr-5,
  sentier-importers-pr-29, sentier-brightway-pr-3)
- **Schema version `0.3.0`.** The contract is still young: the enumerations allow
  system processes and aggregated inventory results that no delivered row uses yet, and
  only one source exercises the one-folder-per-source rule.

## Missing

- No aggregated results and no system processes: every delivered process is a unit
  process.
- No `valid_from` dates in the delivered table, although the contract defines the
  column.
- No second datasource. The layout is built for several sources side by side, each in
  its own folder, but only BAFU:2026 v1 has been delivered.
- No per-row upstream provenance beyond `source` and `source_version`. Tracing a row
  back to its upstream record means going to the importers' log rather than reading a
  column.
- Uncertainty is present in the contract and largely absent from the data.

## Where help is welcome

The two tractable contributions are delivering a second datasource into its own folder
through the importers, and populating the optional columns the contract already defines.
Anything bigger belongs on [../../roadmap.md](../../roadmap.md).
