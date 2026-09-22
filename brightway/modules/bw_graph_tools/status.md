---
title: bw_graph_tools status
type: module-page
summary: "Where bw_graph_tools stands on 2026-09-21: stable, actively released, library only."
audience: [P2]
updated: 2026-09-21
sources: [pypi-bw-graph-tools, bw-graph-tools-repo, bw-graph-tools-docs]
---

# bw_graph_tools status

## Release

- **Latest version:** 0.10, uploaded 2026-07-12 (source: pypi-bw-graph-tools).
- **Stable or pre-release:** stable. All 16 PyPI releases are final, and the recent
  cadence is brisk: 0.7 in April 2026, 0.8 in May, 0.9 in June, 0.10 in July
  (source: pypi-bw-graph-tools).
- **Maintainer:** Chris Mutel, listed as author and maintainer; the repository is in
  the `brightway-lca` organisation (source: pypi-bw-graph-tools,
  bw-graph-tools-repo).
- **Licence:** BSD 3-Clause (source: bw-graph-tools-repo).
- **Python:** 3.9 and newer (source: pypi-bw-graph-tools).
- **Dependencies:** bw2calc, bw2data, bw_processing, matrix_utils, numpy below 3,
  pydantic and scipy (source: pypi-bw-graph-tools).
- **Also on conda:** the `cmutel` channel (source: bw-graph-tools-repo).
- **Documentation:** the Brightway documentation site under the `graphtools` project
  name, which is currently a landing page pointing at the API reference and usage
  pages rather than a written guide (source: bw-graph-tools-docs).

## Works today

- Four traversal behaviours: new node each visit, same node each visit, assumed
  diagonal, and tagged variants of the first two.
- A settings object with cutoffs, a calculation cap, an optional depth limit, coproduct
  skipping, separate biosphere flows, a caching solver hook and a coverage target.
- Results as three lists of dataclasses, ready to tabulate.
- Largest-flow path finding between two nodes, as matrix indices or Brightway
  exchanges.
- Production exchange guessing from datapackages, and adjacency matrix normalisation.
- Test helpers exported for downstream suites.

## In flight

- Tagged traversal is the newest surface and the least documented: the classes and
  their grouping methods exist, but the documentation site has no guide for them yet
  (source: bw-graph-tools-docs).

## Missing

- A written user guide. The README covers the three original components and stops
  mid-example; the documentation site is a landing page
  (source: bw-graph-tools-repo, bw-graph-tools-docs).
- A command line (source: pypi-bw-graph-tools).

## Where help is welcome

A worked traversal example, from a solved `LCA` to a sorted table of contributions,
would be a good first use case in [use-cases/](use-cases/). For anything larger, see
the branch roadmap at [../../roadmap.md](../../roadmap.md).
