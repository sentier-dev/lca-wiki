---
title: bw2analyzer status
type: module-page
summary: "Where bw2analyzer stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw2analyzer, bw2analyzer-docs, brightway-lca-org]
related: [README.md, gotchas.md, ../../roadmap.md]
---

# bw2analyzer status

## Release cadence

The newest release is **0.11.8**, published on 2023-09-15, the same day as 0.11.7
(source: pypi-bw2analyzer). Before those came 0.11.6 on 2023-08-12, 0.11.5 on 2023-04-24,
0.11.4 on 2022-07-04 and 0.11.3 on 2022-06-30. There has been no release for three years
and the repository was last pushed to on 2023-12-15 (source: brightway-lca-org).

This is the one core package whose cadence should worry a planner. It is still the
documented way to read a result (source: bw2analyzer-docs), and it still imports and runs
against the 2.5 stack, but nothing is moving.

## Maintainers

Chris Mutel (`cmutel`) with about 171 commits, then `michaelweinold`, `romainsacchi`,
`pjamesjoyce`, `nabilahmed739` and `m-rossi` (source: brightway-lca-org, counted
2026-09-21). The repository is `brightway-lca/brightway2-analyzer`, licensed BSD
3-Clause.

## Works today

- Contribution analysis over a solved calculation, annotated with names.
- Recursive printing of a supply chain with or without scores.
- Comparison of several activities, by score and by grouped inputs.
- Impact grouped by a tag on the nodes.
- Structural health checks and PageRank over a database.

## In flight

- Nothing visible. 19 issues are open (source: brightway-lca-org, 2026-09-21).

## Missing

- The docstrings still describe a Brightway 2 world in places, notably the pointer to
  `bw2calc.GraphTraversal`; see [gotchas.md](gotchas.md).
- Nothing here yet compares this package with `bw_graph_tools`, which now owns traversal.

## Where help is welcome

Small, contained upstream work: correcting the docstrings that point at moved functions,
and the Bitbucket URL in the packaging metadata. Both are good first contributions.
