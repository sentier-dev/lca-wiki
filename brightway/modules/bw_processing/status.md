---
title: bw_processing status
type: module-page
summary: "Where bw_processing stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw-processing, bw-processing-docs, brightway-lca-org]
related: [README.md, ../../roadmap.md]
---

# bw_processing status

## Release cadence

The newest release is **1.6**, published on 2026-07-12 (source: pypi-bw-processing). The
five before it were 1.1.1 on 2026-04-28, 1.2 on 2026-05-26, 1.3 on 2026-06-03, 1.4 on
2026-06-04 and 1.5 on 2026-06-04: a burst of format work in mid-2026, with two releases on
one day. The repository was last pushed to on 2026-08-08 (source: brightway-lca-org).

That cadence matters more here than elsewhere: every other package in the stack reads this
format.

## Maintainers

Chris Mutel (`cmutel`) with about 294 commits, then `nikolaj-funartech`,
`michaelweinold`, `tngTUDOR` and `mfastudillo`, plus an automated dependency bot
(source: brightway-lca-org, counted 2026-09-21). The repository is
`brightway-lca/bw_processing`, licensed BSD 3-Clause, and it is one of the few Brightway
packages with its own documentation site (source: bw-processing-docs).

## Works today

- Persistent vectors and arrays, dynamic vectors and arrays through interfaces.
- `flip`, `scale`, uncertainty and parameter arrays per resource group.
- Numpy and parquet serialisation, directory and zip filesystems, and anything else
  `fsspec` can reach.
- Reindexing and index resetting, which is what makes a package portable.
- Merging two resource groups through a boolean mask.

## In flight

- 14 issues are open (source: brightway-lca-org, 2026-09-21).
- Parameter arrays and their label schemas are the newest part of the format and the
  least used downstream.

## Missing

- This wiki does not yet document the datapackage policies the README mentions, which
  decide how groups interact when several write to one matrix.

## Where help is welcome

A worked example that builds a datapackage by hand and runs an LCA on it with no project
would be the single most useful page this module could gain.
