---
title: bw2io status
type: module-page
summary: "Where bw2io stands on 2026-09-21: release cadence, maintainers, open work."
audience: [P2]
updated: 2026-09-22
sources: [pypi-bw2io, bw2io-docs, brightway-lca-org]
related: [README.md, gotchas.md, ../../roadmap.md]
---

# bw2io status

## Release cadence

The newest release is **0.9.17**, published on 2026-04-26 (source: pypi-bw2io). The five
before it were 0.9.12 on 2025-12-17, 0.9.13 on 2025-12-31, 0.9.14 on 2026-01-13, 0.9.15 on
2026-04-16 and 0.9.16 on 2026-04-24: the most frequent release cycle in the core stack,
with patch releases days apart. The repository was last pushed to on 2026-07-20
(source: brightway-lca-org).

## Maintainers

Chris Mutel (`cmutel`) with about 1 190 commits, then `michaelweinold`, `Cerebrovinny`,
`tngTUDOR`, `ccomb` and `haasad` (source: brightway-lca-org, counted 2026-09-21). The
repository is `brightway-lca/brightway2-io`, licensed BSD 3-Clause.

## Works today

- Importers for ecospold 1 and 2, SimaPro CSV, Excel and CSV, JSON-LD, EXIOBASE and
  USEEIO, plus four impact assessment importers.
- 108 named strategies, and `randonneur` transformations applied from an importer.
- Prepared project archives downloaded from the Brightway file server.
- One-call import of a licensed ecoinvent release.
- Project backup and restore.
- Export to Excel, CSV, ecospold 1, Gephi and Matlab.

## In flight

- 97 issues are open, the largest count in the core stack
  (source: brightway-lca-org, 2026-09-21).
- The `strategies/sentier/` subpackage is recent and small, which suggests the Sentier
  unit handling is still being settled; see [../../../sentier/](../../../sentier/).
- The SimaPro block CSV path, behind the `multifunctional` extra, is newer than the
  classic SimaPro importer.

## Missing

- The exporters are documented upstream far less than the importers, and this page
  reflects that.

## Where help is welcome

Import problems are where most practitioners get stuck, so a well-written use case under
[use-cases/](use-cases/) helps more here than anywhere else in this branch.
