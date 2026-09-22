---
title: bw2calc status
type: module-page
summary: "Where bw2calc stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw2calc, bw2calc-docs, brightway-lca-org]
related: [README.md, ../../roadmap.md]
---

# bw2calc status

## Release cadence

The newest release is **2.5.0**, published on 2026-05-16 (source: pypi-bw2calc). Before it
came 2.2.2 on 2025-11-11, 2.3 on 2025-12-05, 2.3.1 on 2026-01-25, 2.3.2 on 2026-01-26 and
2.4.0 on 2026-02-27: a release every one to two months. The repository was last pushed to
on 2026-08-05 (source: brightway-lca-org).

## Maintainers

Chris Mutel (`cmutel`) wrote almost all of it, with about 620 commits; `michaelweinold`,
`jan-eat`, `tngTUDOR` and `romainsacchi` follow, along with an automated dependency bot
(source: brightway-lca-org, counted 2026-09-21). The repository is
`brightway-lca/brightway2-calc`, licensed BSD 3-Clause.

## Works today

- Single and multiple functional units, with impact categories, normalisation and
  weighting.
- Monte Carlo from distributions or from presampled arrays, through the iterator
  protocol.
- Six alternative solver classes for systems the default handles badly.
- A fast scores-only path for screening many functional units.
- Results as pandas dataframes through `to_dataframe`.

## In flight

- 12 issues are open on the repository (source: brightway-lca-org, 2026-09-21).
- The newer fast paths, `FastScoresOnlyMultiLCA` and `PartitionedMonteCarloLCA`, are the
  most recent additions and the least documented upstream.

## Missing

- This wiki does not yet describe `grid.py` or the result cache, which would need reading
  the source.

## Where help is welcome

See [../../roadmap.md](../../roadmap.md) for this branch, and the repository's issue
tracker for upstream work.
