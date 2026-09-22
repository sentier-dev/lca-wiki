---
title: BAFU versions and provenance
type: database
summary: How BAFU releases are named and numbered, what changed in BAFU:2026 v1, and where the inventory data comes from.
audience: [P1, P2]
updated: 2026-09-21
sources: [bafu-2026-release, openlca-bafu-2026-notes, esu-bafu-database, bafu-terms-of-use-2025]
related: [methodology.md, access-and-licence.md]
---

# BAFU versions and provenance

## How releases are named

A release is named after its year, written with a colon: `BAFU:2025`, `BAFU:2026`. The
publisher writes the generic form as `BAFU:20XY` in its own documents, including the Info
sheet of the LCIA results workbook and the citation clause of the terms of use (source:
bafu-2026-release, bafu-terms-of-use-2025).

Within a year the release carries a version. Do not assume the components of one release
share it. In the release inspected for this page the openLCA package is labelled
`BAFU-2026 v1.1` while the ecoSpold v1 archive of the same release is labelled
`BAFU-2026 v1` (source: bafu-2026-release). Record the component label, not just the
year, whenever a result has to be reproducible.

The terms of use are versioned with the database and apply to the version you downloaded
(source: bafu-terms-of-use-2025).

## Release history this wiki can source

- `BAFU:2025`, the first release under the BAFU name that this wiki has a public
  description of, replacing the earlier UVEK and KBOB databases that Swiss practitioners
  used (source: esu-bafu-database).
- `BAFU:2026 v1`, announced on 23 June 2026 (source: openlca-bafu-2026-notes).
- `BAFU-2026 v1.1`, the openLCA package label carried by the same release (source:
  bafu-2026-release).

Earlier UVEK and KBOB releases are outside what this page can source; see
[../roadmap.md](../roadmap.md).

## What changed in BAFU:2026 v1

The announcement lists four changes (source: openlca-bafu-2026-notes):

- New and updated datasets in the construction sector, from update projects on
  construction machinery and infrastructure, heat pumps, cement and reinforcing steel.
- A restricted elementary flow list in the openLCA package: it now carries only the
  flows actually used inside BAFU:2026, which keeps datasets built on top of it
  consistent.
- Minor corrections to datasets, addressing mistakes and inconsistencies reported by
  users.
- A dataset change log file inside the documentation component, recording which datasets
  were created, updated, corrected or renamed between versions.

That change log is the right place to start when a number moves between two releases, and
this wiki has no reason to duplicate it.

## Where the inventory data comes from

Each dataset names its own provenance in its metadata. The bibliographic source block of
an ecoSpold v1 dataset carries the first author, the additional authors, the editors, the
publisher, the place and year of publication, the title of the report in its original
language and a short type note; the administrative block carries the person who entered
the data and the person who validated it (source: bafu-2026-release). The reports
themselves ship in the documentation component of the release (source:
openlca-bafu-2026-notes).

Individual inventories are therefore traceable to a named expert report rather than to
the database as a whole. That is also why the terms of use treat the reports separately
from the data: each report is copyrighted and its reuse needs the authors' agreement,
while the data itself may be reused under the terms (source: bafu-terms-of-use-2025).

The quality bar the datasets are stated to meet is the BAFU data quality requirements
document DQRv2:2023, and most datasets are stated to have passed a critical review for
compatibility with ISO 14040 (source: esu-bafu-database).

## Citing a release

The terms of use prescribe the citation and tie it to the release: the quotation shall be
"Life Cycle Inventory database of the Swiss Federal Administration, BAFU:20XY" with the
year of the release you used (source: bafu-terms-of-use-2025). The release announcement
words the same requirement as "Database of the Swiss Federal Administration, BAFU:2026,
Federal Office for the Environment, 2026" (source: openlca-bafu-2026-notes). When the two
wordings differ, the terms of use that shipped with your download are the ones that bind
you.

## Related pages

- [access-and-licence.md](access-and-licence.md): the full terms and what they permit.
- [methodology.md](methodology.md): how the datasets are modelled.
- [../data/fetch.md](../data/fetch.md): how to obtain a release and record its checksum.
