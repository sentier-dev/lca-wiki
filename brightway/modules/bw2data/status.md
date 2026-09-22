---
title: bw2data status
type: module-page
summary: "Where bw2data stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw2data, bw2data-docs, brightway-lca-org]
related: [README.md, gotchas.md, ../../roadmap.md]
---

# bw2data status

## Release cadence

The newest release is **4.7**, published on 2026-05-14 (source: pypi-bw2data). The six
releases before it were 4.5.2 on 2025-11-11, 4.5.3 on 2025-11-12, 4.5.4 on 2025-12-05,
4.6 on 2026-03-04 and 4.6.2 on 2026-04-15: roughly one release every one to two months,
with patch releases days apart when something breaks. The repository was last pushed to on
2026-06-27 (source: brightway-lca-org).

Releases are cut from a release branch, tagged, and published to PyPI by a GitHub Actions
workflow using trusted publishing (source: bw2data-docs).

## Maintainers

Chris Mutel (`cmutel`) is the author and by far the largest contributor, with about 1 270
commits. The next contributors by commit count are `dgdekoning`, `bbguimaraes`,
`Cerebrovinny`, `michaelweinold` and `jsvgoncalves` (source: brightway-lca-org, counted
2026-09-21). The repository is `brightway-lca/brightway2-data`, licensed BSD 3-Clause.

## Works today

- Projects, databases, nodes, edges, impact categories, normalisation and weighting.
- Two backends in the package itself, `sqlite` and `iotable`, with `multifunctional`
  available separately.
- Datapackage export for everything storable, which is what the calculation layer reads.
- Parameters at project, database and activity level.
- Full-text search per database.
- A revision layer that records signalled changes, the groundwork for synchronising
  projects.

## In flight

- The revision and signal machinery in `revisions.py` is newer than the rest and is the
  most active area of the 4.x line.
- 37 issues are open on the repository (source: brightway-lca-org, 2026-09-21).

## Missing

- No page here yet describes the revision format, which would need reading the source
  rather than the documentation.

## Where help is welcome

Bigger gaps are tracked on [../../roadmap.md](../../roadmap.md); upstream work is best
picked from the repository's issue tracker.
