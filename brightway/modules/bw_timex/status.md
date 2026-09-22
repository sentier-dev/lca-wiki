---
title: bw_timex status
type: module-page
summary: "Where bw_timex stands on 2026-09-21: stable, actively developed, well documented."
audience: [P2]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs, bw-timex-repo]
---

# bw_timex status

## Release

- **Latest version:** 1.4.0, uploaded 2026-09-18, three days before this page was
  written (source: pypi-bw-timex).
- **Stable or pre-release:** stable, and moving quickly. 34 releases exist on PyPI;
  1.2.0, 1.2.1, 1.3.0, 1.3.1, 1.3.2 and 1.4.0 all landed between 2026-08-14 and
  2026-09-18 (source: pypi-bw-timex).
- **Maintainers:** Timo Diepers (RWTH Aachen), Amelie Muller (Leiden University) and
  Arthur Jakobs (Paul Scherrer Institute), listed as both authors and maintainers
  (source: pypi-bw-timex). The repository is in the `brightway-lca` organisation
  (source: bw-timex-repo).
- **Licence:** BSD 3-Clause, with copyright held by the four institutes behind the
  project (source: bw-timex-repo).
- **Python:** 3.11 and newer (source: pypi-bw-timex).
- **Dependencies:** bw2calc 2.4 or newer, bw2data 4.6 or newer, bw_graph_tools 0.9 or
  newer, bw_temporalis 1.1 or newer, dynamic_characterization 1.4.2 or newer, numpy,
  pandas, tqdm, matplotlib, seaborn, loguru, ipython, ipywidgets, pydantic 2, and
  pypardiso on x86-64 Linux and Windows (source: pypi-bw-timex).
- **Extras:** `solvers` for the non-pypardiso platforms, `premise` for prospective
  database building, `testing` and `docs` (source: pypi-bw-timex).
- **Citation:** the project asks that its methodology paper and its JOSS paper be cited
  (source: bw-timex-docs).

## Works today

- The four-step workflow: temporal information, timeline, time-explicit inventory,
  impact assessment.
- A single settings object covering a whole run, with `run()` and `from_settings()`.
- Comparing several configurations in one call and getting a summary table.
- Static characterisation with ordinary methods, and dynamic characterisation with
  characterisation functions over a time horizon.
- Automatic construction of the background vintages a scenario names, through premise.
- Database dating stored in Brightway metadata rather than repeated per call.
- Labelled dataframes and plots for the inventory and the characterised result.
- A notebook widget for drafting temporal distributions.

## In flight

- The scenario surface. `ensure_scenario_databases`, `set_database_metadata` and the
  configured-run and comparison pages are the newest parts of the documentation
  (source: bw-timex-docs).
- Background temporalisation and uncertainty with datapackages are documented under
  Advanced, which is where the less settled material sits (source: bw-timex-docs).

## Missing

- Coexistence with Brightway 2 tooling: a Brightway 2 environment cannot hold bw_timex
  (source: bw-timex-docs).
- A command line (source: pypi-bw-timex).
- A single-environment premise path: the documentation recommends a second environment
  because of the numpy pin (source: bw-timex-docs).

## Where help is welcome

The documentation site is thorough, so the useful contribution here is a use case
written against a Brightway project a reader can actually build. For anything larger,
see the branch roadmap at [../../roadmap.md](../../roadmap.md).
