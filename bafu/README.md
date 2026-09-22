---
title: bafu
type: branch
summary: "The BAFU LCA database as an external data source: what it is, how to get it, what it covers."
audience: [P1, P2]
updated: 2026-09-21
sources: [bafu-2026-release, openlca-bafu-2026-notes, bafu-terms-of-use-2025, esu-bafu-database]
related: [../sentier/modules/sentier-inventory/README.md, ../core/sectors/README.md]
---

# bafu

The life cycle inventory database of the Swiss Federal Administration, published by the
Federal Office for the Environment (Bundesamt für Umwelt, BAFU/FOEN) under the name
`BAFU:20XY`, where the year is the release year. The workbook that ships with the
release names the database "Swiss Federal Administration LCI Database (BAFU:20XY)" and
its provider as the Swiss Federal Office for the Environment, with `lca@bafu.admin.ch`
as the contact address (source: bafu-2026-release). This branch documents it as a data
source: what it contains, how it is built, under which terms it is available, and how it
reaches an LCA tool.

## Who publishes it and why it exists

BAFU coordinates and publishes the life cycle inventories that the Swiss federal
administration needs for its own work and makes them available to everyone else under
the Swiss Open Government Data strategy (source: esu-bafu-database). The database is the
successor of the UVEK and KBOB databases that Swiss practitioners used before it
(source: esu-bafu-database). Individual inventories are written by external experts under
contract, documented in reports that accompany the release (source:
openlca-bafu-2026-notes).

## Versions

Releases are named after their year: `BAFU:2025`, `BAFU:2026`. Within a year the release
carries a version, and the components of one release may not all be at the same version:
in the release inspected here the openLCA package is `BAFU-2026 v1.1` while the
ecoSpold v1 archive is `BAFU-2026 v1` (source: bafu-2026-release). The first version of
BAFU:2026 was announced on 23 June 2026 (source: openlca-bafu-2026-notes). See
[knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md).

## What it covers

The BAFU:2026 v1 release carries 11,947 processes, counted both as ecoSpold v1 files in
the release archive and as data rows in the LCIA results workbook, grouped into 60
top-level categories of the database's own grouping and 516 category and sub-category
pairs (source: bafu-2026-release). Coverage is cross-sectoral: construction, mobility and
transport, energy, metals, chemicals, paper, agriculture, food, consumption and waste
management (source: esu-bafu-database). The GICS reading of that coverage is in
[knowledge/sector-coverage.md](knowledge/sector-coverage.md).

## Licence, in one paragraph

The database is free of charge and reaches its users through the openLCA Nexus download
page; downloading requires accepting the terms of use (source: bafu-2026-release). Those
terms let anyone use, process, analyse and reuse the data, including in commissioned
studies and calculators, as long as the data is not sold, resold, distributed or marketed
separately or as part of another database; any other commercial or non-commercial use
needs an explicit agreement with BAFU. Every use must credit the source, and the
prescribed wording is the one the terms give for the release in hand. Users may modify
the data, but must document every change in a standalone document that travels with the
modified data, must not present modified data as the original, and must share modified
data onward under substantially equivalent terms. The expert reports are separately
copyrighted and their reuse needs the authors' agreement. The database is provided as-is,
with no warranty (source: bafu-terms-of-use-2025). The full reading is in
[knowledge/access-and-licence.md](knowledge/access-and-licence.md).

## How the tooling in this wiki reaches it

The Sentier platform ships this database as the `bafu-2026` inventory package. The
package and the way its data is written is documented on its own module page,
[../sentier/modules/sentier-inventory/](../sentier/modules/sentier-inventory/); the
loader that installs it into a Brightway project or a folder of plain files is
[../sentier/modules/sentier-brightway/](../sentier/modules/sentier-brightway/). Neither is
described here: this branch describes the database, those pages describe the tooling.
Outside this wiki's tooling, the openLCA package imports into openLCA directly and the
ecoSpold v1 archive imports into any tool that reads that format (source:
openlca-bafu-2026-notes).

## Read paths

- **P1, the practitioner.** [knowledge/access-and-licence.md](knowledge/access-and-licence.md)
  for what you may do with the data, then [data/fetch.md](data/fetch.md) to get it, then
  [knowledge/sector-coverage.md](knowledge/sector-coverage.md) to see whether your sector
  is in it, then [knowledge/methods.md](knowledge/methods.md) for the indicators you can
  report.
- **P2, the contributor.** [knowledge/methodology.md](knowledge/methodology.md) and
  [knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md) for what
  the database claims about itself, then [roadmap.md](roadmap.md) for what this branch
  still owes.
- **P3, the wiki developer.** [knowledge/format.md](knowledge/format.md) and
  [knowledge/schemas-and-nomenclature.md](knowledge/schemas-and-nomenclature.md) for the
  field-level structure, then [../vocabulary.md](../vocabulary.md) for the terms
  this database uses in its own sense.

## What belongs here

| Path | What it holds |
|---|---|
| [knowledge/](knowledge/) | methodology, format, versions and provenance, access and licence, sector coverage, schemas and nomenclature, methods, vocabulary |
| [data/](data/) | how to fetch the release that is actually downloadable |
| [use-cases/](use-cases/) | what a practitioner does with this database, end to end |
| [../vocabulary.md](../vocabulary.md) | the terms this database uses in its own sense |
| [roadmap.md](roadmap.md) | what is missing in this branch and where a contributor can help |

## What does not belong here

What a tool does with the data, and the data itself. Counts, category names, units and
indicator names are descriptions of the database and belong here; per-process amounts and
per-flow characterisation factors are the data and do not, whatever their licence allows.

## Naming rule

`lower-case-with-hyphens.md`, one subject per file, versions written as the publisher
writes them: `BAFU:2026`, release `v1`.

## How to add here

1. Register the release page, the documentation and the terms of use in
   [../sources.md](../sources.md) first.
2. Copy the matching page from
   [../templates/pages/module-database/](../templates/pages/module-database/).
3. Describe datasets broadly: name, version, sectors, provenance, schema, methods,
   vocabulary. Never per datapoint, and never copy the amounts themselves.
4. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to [../log.md](../log.md).
