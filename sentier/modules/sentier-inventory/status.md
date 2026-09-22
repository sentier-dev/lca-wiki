---
title: sentier-inventory status
type: module-page
summary: "Where the inventory repository stands: one source database, eleven sectors, unit processes only."
audience: [P2]
updated: 2026-09-21
sources: [sentier-inventory-repo]
---

# sentier-inventory status

As of commit `6fced18`, dated 2026-09-17. (source: sentier-inventory-repo)

## Works today

- Eleven populated sector folders, 11,947 processes and about 420,000 exchanges, all
  validating against the schema contract.
- A complete, self-contained validator that continuous integration runs on every pull
  request and on every push to a non-default branch.
- A stable delivery convention: importers open pull requests, nothing is hand-edited,
  and the metadata declares row counts that are checked against the files.
- Downstream consumption works: the loader documented in
  [../sentier-brightway/](../sentier-brightway/) reads every sector folder at a pinned
  commit.

## In flight

- **One source, many sectors.** The release carries the Swiss federal inventory only.
  The folder convention is built for several sources spanning the same sectors, and the
  sector metadata already separates the provenance line from the sector identity.
- **Schema version `0.1.0`.** The contract is explicitly young: the enumerations allow
  system processes and aggregated inventory results that no delivered row uses yet.

## Missing

- No aggregated results and no system processes: every delivered process is a unit
  process.
- No `valid_from` dates in the delivered tables, although the contract defines the
  column.
- No documented precedence implementation. The rank rule is stated in prose and applied
  by consumers.
- No per-row provenance. Tracing a row back to its upstream record means going to the
  importers' log rather than reading a column.
- Uncertainty is present in the contract and largely absent from the data.

## Where help is welcome

The two tractable contributions are a documented, tested precedence helper for merging
sector folders, and populating the optional columns the contract already defines.
Anything bigger belongs on [../../roadmap.md](../../roadmap.md).
