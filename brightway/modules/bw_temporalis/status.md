---
title: bw_temporalis status
type: module-page
summary: "Where bw_temporalis stands on 2026-09-21: stable, small, quiet."
audience: [P2]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo, pypi-bw-timex]
---

# bw_temporalis status

## Release

- **Latest version:** 1.2.0, uploaded 2025-07-14, more than a year before this page was
  written (source: pypi-bw-temporalis).
- **Stable or pre-release:** stable. 19 PyPI releases, all final
  (source: pypi-bw-temporalis).
- **Maintainer:** Chris Mutel, listed as author and maintainer; the repository is in
  the `brightway-lca` organisation (source: pypi-bw-temporalis,
  bw-temporalis-repo).
- **Licence:** BSD 3-Clause, stated both in the distribution metadata and the README
  (source: pypi-bw-temporalis, bw-temporalis-repo).
- **Python:** 3.8 and newer according to the metadata
  (source: pypi-bw-temporalis).
- **Dependencies:** bw2calc, bw2data, bw_graph_tools, numpy, pandas, scipy and tqdm
  (source: pypi-bw-temporalis).
- **Also on conda:** the `cmutel` channel (source: bw-temporalis-repo).
- **Lineage:** a revision of the older `bw2temporalis` for modern Brightway
  (source: pypi-bw-temporalis).

## Works today

- Relative and absolute temporal distributions, including the two fixed variants.
- Uniform, triangular and normal distributions from the two easy constructors.
- Traversal that convolves distributions along each path, with cutoffs, a calculation
  cap and a set of activities held static.
- A timeline that sums and groups the dated flows, and becomes a dataframe.
- Dynamic characterisation of carbon dioxide and methane as radiative forcing,
  marginal or cumulative, over a chosen period.
- A database-wide consistency check on the distributions.
- Serialisation of distributions into and out of a Brightway database.

## In flight

- Nothing announced. The package has been quiet since July 2025, while its main
  dependant, `bw_timex`, released six times in the five weeks before this page was
  written (source: pypi-bw-temporalis, pypi-bw-timex).

## Missing

- Characterisation beyond carbon dioxide and methane. Anything else is a function you
  write, or a downstream package's registry. See
  [../bw_timex/datasets.md](../bw_timex/datasets.md).
- A documentation site. The README points at Read the Docs, and the worked material
  lives in the separate `from-the-ground-up` teaching repository
  (source: bw-temporalis-repo).
- Accurate installation notes: the README still warns about a Python 3.11 problem that
  its dependency has since resolved (source: bw-temporalis-repo).
- A command line (source: pypi-bw-temporalis).

## Where help is welcome

A worked timeline example against a small public database, written up as a use case,
would close the gap the README's missing documentation leaves. For anything larger, see
the branch roadmap at [../../roadmap.md](../../roadmap.md).
