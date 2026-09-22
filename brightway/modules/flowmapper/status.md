---
title: flowmapper status
type: module-page
summary: "Where flowmapper stands on 2026-09-21: released, small, README-documented."
audience: [P2]
updated: 2026-09-21
sources: [pypi-flowmapper, flowmapper-repo]
---

# flowmapper status

## Release

- **Latest version:** 0.4, uploaded 2025-03-03 (source: pypi-flowmapper).
- **Stable or pre-release:** stable. Five releases exist on PyPI, all final: 0.1,
  0.1.1, 0.2, 0.3.1 and 0.4 (source: pypi-flowmapper).
- **Authors:** Francisco Alves de Oliveira Junior and Chris Mutel; Chris Mutel is
  listed as maintainer of the distribution (source: pypi-flowmapper).
- **Repository:** `cauldron/flowmapper`, reached by following the redirect from the
  homepage recorded in the distribution metadata (source: flowmapper-repo).
- **Python:** 3.10 and newer (source: pypi-flowmapper).
- **Dependencies:** bw_simapro_csv, pandas with the Excel extra, pint, pydantic,
  pyecospold, randonneur 0.6 or newer, randonneur_data, tqdm, typer and xmltodict
  (source: pypi-flowmapper).

## Works today

- Matching two flow lists with the bundled strategies and reporting per-side
  statistics.
- Writing the crosswalk as a GLAD file, a randonneur transformation file, or both.
- Writing unmatched flows on both sides so the next iteration has a working list.
- Extracting flow lists from ecospold2, SimaPro CSV and SimaPro ecospold1 files.
- Applying randonneur transformations to the source list before matching.
- Reusing a prepared SimaPro 2024 to ecoinvent 3.10 biosphere mapping from the bundled
  manual matching results.

## In flight

- Nothing announced in the repository README beyond what ships. The bundled manual
  matching material stops at ecoinvent 3.10, while the `randonneur_data` registry
  already carries later releases, so the manual material is the part that lags.

## Missing

- A documentation site. The README badge points at a Read the Docs URL that does not
  resolve (source: flowmapper-repo).
- Licence metadata in the distribution: the repository is MIT, the wheel says nothing
  (source: pypi-flowmapper).
- Partial matches, deliberately: the library will not emit a name-only or context-only
  correspondence (source: flowmapper-repo).

## Where help is welcome

New curated matches are more useful in the `randonneur_data` registry than here, since
anything published there is available by name to every randonneur user. For anything
larger, see the branch roadmap at [../../roadmap.md](../../roadmap.md).
