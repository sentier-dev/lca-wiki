---
title: matrix_utils status
type: module-page
summary: "Where matrix_utils stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-matrix-utils, matrix-utils-docs, brightway-lca-org, pypi-bw-processing]
related: [README.md, ../../roadmap.md]
---

# matrix_utils status

## Release cadence

The newest release is **0.9**, published on 2026-07-12, the same day as `bw_processing`
1.6 (source: pypi-matrix-utils, pypi-bw-processing). Before it came 0.6.2 on 2025-08-06,
0.6.3 on 2026-02-23, 0.7.0 on 2026-02-27, 0.7.1 on 2026-03-20 and 0.8 on 2026-06-04. The
repository was last pushed to on 2026-08-08 (source: brightway-lca-org).

Releases track `bw_processing`: when the format gains a feature, this package gains the
code that reads it.

## Maintainers

Chris Mutel (`cmutel`) with about 171 commits, then `aleksandra-kim`, `romainsacchi` and
`mixib` with one each, plus an automated dependency bot (source: brightway-lca-org,
counted 2026-09-21). The repository is `brightway-lca/matrix_utils`, licensed
BSD 3-Clause. Effectively a single-maintainer package.

## Works today

- One matrix from many datapackages, with vectors, arrays, distributions and interfaces.
- Shared row and column mappers so several matrices agree on dimensions.
- Random, sequential and combinatorial sampling, with an optional seed override.
- Masks and custom filters per resource group.
- Aggregation of duplicate coordinates before insertion.

## In flight

- 3 issues are open, the fewest in the core stack (source: brightway-lca-org,
  2026-09-21).

## Missing

- The datapackage policies that decide how two groups writing to one matrix interact are
  not documented here, nor much upstream.

## Where help is welcome

Documentation. This package is small, central and thinly explained, so a worked example
of building a technosphere and a biosphere matrix with a shared mapper would be valuable.
