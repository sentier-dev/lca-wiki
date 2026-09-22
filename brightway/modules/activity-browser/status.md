---
title: activity-browser status
type: module-page
summary: "Where Activity Browser stands on 2026-09-21: stable 2.11.2, open beta 3.0."
audience: [P2]
updated: 2026-09-21
sources: [pypi-activity-browser, activity-browser-repo, activity-browser-conda-forge, activity-browser-docs]
---

# activity-browser status

## Release

- **Latest stable:** 2.11.2 on conda-forge, which is the channel the project documents
  as the official one (source: activity-browser-conda-forge,
  activity-browser-repo). 24 versions are listed there.
- **Latest pre-release:** 3.0.0b202608291724, uploaded to PyPI on 2026-08-29
  (source: pypi-activity-browser).
- **Stable or pre-release on PyPI:** pre-release only. All 77 PyPI versions are
  `3.0.0b...` builds; there is no final release on PyPI at all
  (source: pypi-activity-browser).
- **Beta status:** the README announces an open beta for version 3, supporting
  multifunctionality and using Brightway 2.5, and asks for feedback
  (source: activity-browser-repo).
- **Main developers:** Bernhard Steubing (Leiden University), the creator, and Marc van
  der Meide, the maintainer; the README lists further important contributors
  (source: activity-browser-repo).
- **Licence:** LGPL-3.0-or-later (source: pypi-activity-browser,
  activity-browser-conda-forge).
- **Python:** 3.10 up to but not including 3.13, for the 3.0 line
  (source: pypi-activity-browser).
- **Qt binding:** PySide6 between 6.5 and 6.10 in the 3.0 line; the older conda recipe
  in the repository still names PySide2, which is one measure of how far the two lines
  have diverged (source: pypi-activity-browser, activity-browser-repo).
- **Brightway dependencies of the 3.0 line:** bw2analyzer, bw2calc 2.0 or newer,
  bw2data 4.1 or newer, bw2parameters, bw2io, bw_graph_tools, bw_processing,
  bw_simapro_csv, ecoinvent_interface, matrix_utils and a pinned bw-functional build
  (source: pypi-activity-browser).
- **Documentation:** a wiki bundled in the package, plus a separate documentation site
  for version 3 which states that it is an ongoing project with sections missing
  (source: activity-browser-repo, activity-browser-docs).

## Works today

- Project, database, activity, exchange, method and parameter management in tables.
- Database import and export wizards, on top of `bw2io`.
- Calculation setups across several reference flows and impact categories.
- Scenario calculations from scenario difference files, including prospective databases
  produced by premise.
- Contribution analysis, Sankey diagrams and a graph explorer.
- Monte Carlo uncertainty analysis and global sensitivity analysis.
- Pedigree matrix entry and uncertainty distributions.
- A plugin mechanism with a manager wizard.

## In flight

- Version 3 itself: Brightway 2.5 under the hood, multifunctionality, and a new
  documentation site (source: activity-browser-repo,
  activity-browser-docs).
- The documentation site says outright that sections may be missing or incomplete, and
  invites contributions (source: activity-browser-docs).

## Missing

- A final 3.0 release. The line has been in beta through 2026
  (source: pypi-activity-browser).
- A stable release on PyPI at all; conda-forge is the only channel carrying the stable
  line (source: pypi-activity-browser, activity-browser-conda-forge).
- A batch or scripting mode. Repeatable work is done with the Brightway packages
  against the same project; see [../bw2data/README.md](../bw2data/README.md).
- A documented Python API for driving the interface.

## Where help is welcome

The project asks for beta feedback and for wiki contributions
(source: activity-browser-repo, activity-browser-docs). In this
wiki, a use case that names which line it was run on would be the most useful addition.
For anything larger, see the branch roadmap at [../../roadmap.md](../../roadmap.md).
