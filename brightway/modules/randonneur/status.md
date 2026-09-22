---
title: randonneur status
type: module-page
summary: "Where randonneur stands on 2026-09-21: released, maintained, library only."
audience: [P2]
updated: 2026-09-21
sources: [pypi-randonneur, randonneur-repo, pypi-randonneur-data]
---

# randonneur status

## Release

- **Latest version:** 0.7.2, uploaded 2025-12-17 (source: pypi-randonneur).
- **Stable or pre-release:** stable. All 18 releases on PyPI are final releases; there
  is no pre-release channel (source: pypi-randonneur).
- **Maintainer:** Chris Mutel, listed as author and maintainer of the distribution
  (source: pypi-randonneur). The repository sits in the `brightway-lca` organisation
  (source: randonneur-repo).
- **Python:** 3.9 and newer (source: pypi-randonneur).
- **Dependencies:** loguru, pydantic, randonneur_data, stats_arrays, tqdm, xlsxwriter
  and openpyxl (source: pypi-randonneur).
- **Companion data package:** randonneur_data 0.7.2, uploaded 2025-11-21
  (source: pypi-randonneur-data).

## Works today

- Applying `update`, `replace` and `disaggregate` transformations to nodes and edges.
- Looking a transformation up by label in the `randonneur_data` registry and applying
  it without handling files.
- Configuring matching through `MigrationConfig`: fields, filters, verbs, case
  sensitivity, the edge key and extra attributes.
- Round tripping a matching exercise through an Excel workbook.
- Validating a transformation file, including its licence block against the SPDX list.

## In flight

- The registry grows with each ecoinvent release; new version-to-version files appear
  in `randonneur_data` rather than in this package (source: randonneur-repo).

## Missing

- Full verb coverage. The README states that not all verbs and graph object types are
  supported by the reference implementation (source: randonneur-repo).
- Any protection against `create` producing duplicate objects: the implementation does
  not check, and the specification does not say what should happen
  (source: randonneur-repo).
- A command line. Everything is called from Python (source: pypi-randonneur).

## Where help is welcome

New transformation packages belong in `randonneur_data`, not here. For anything larger,
see the branch roadmap at [../../roadmap.md](../../roadmap.md).
