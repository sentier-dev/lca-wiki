---
title: bw2parameters status
type: module-page
summary: "Where bw2parameters stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw2parameters, bw2parameters-docs, brightway-lca-org, pypi-bw2io]
related: [README.md, gotchas.md, ../../roadmap.md]
---

# bw2parameters status

## Release cadence

The newest release is **1.1.0**, published on 2023-04-18 (source: pypi-bw2parameters).
Before it came 0.7 on 2021-12-25 and a run of 0.6.x releases in 2018. This is the slowest
cadence in the core stack by a wide margin: roughly one release every few years. The
repository was last pushed to on 2025-02-19 (source: brightway-lca-org).

The package is nonetheless current: `bw2io` 0.9.17 requires `bw2parameters >= 1.1.0`
(source: pypi-bw2io), so the whole 2.5 stack depends on this release.

## Maintainers

Chris Mutel (`cmutel`) with about 89 commits, then `tngTUDOR`, `BenPortner` and
`michaelweinold` (source: brightway-lca-org, counted 2026-09-21). The repository is
`brightway-lca/brightway2-parameters`, licensed BSD 3-Clause.

## Works today

- Dependency ordering, validation and evaluation of parameter sets.
- Unit-aware evaluation through `pint`.
- Monte Carlo evaluation from the parameters' uncertainty distributions.
- Formula rewriting for namespacing, which is what makes `bw2data`'s three parameter
  levels possible.

## In flight

- 4 issues are open (source: brightway-lca-org, 2026-09-21).
- Nothing visible is being actively developed; the package is in maintenance.

## Missing

- The PyPI summary is a leftover from a project template and should be corrected upstream;
  that is a one-line pull request for a first-time contributor.

## Where help is welcome

Documentation of the `pint` path, which is the newest part of the package and has no
examples upstream.
