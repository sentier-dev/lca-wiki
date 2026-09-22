---
title: Information Technology
type: sector
summary: "Semiconductors, hardware and software services: what an LCA of the GICS Information Technology sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Information Technology

GICS code 45, three industry groups (gics-2023):

- 4510 Software & Services: IT services, software.
- 4520 Technology Hardware & Equipment: communications equipment, technology hardware,
  storage and peripherals, electronic equipment, instruments and components.
- 4530 Semiconductors & Semiconductor Equipment: semiconductors and semiconductor
  equipment.

Two study shapes again. Hardware is declared per device over a service life. Software
and IT services have no artefact, so the
[functional unit](../../vocabulary.md#functional-unit) becomes a unit of delivered
compute or storage (one terabyte-year, one thousand requests, one user-month), and the
allocation of a shared data centre to that unit is the whole study. See
[../concepts/](../concepts/).

## What dominates the results

For hardware, manufacturing rather than use: wafer fabrication is energy intensive and
uses process gases with very high characterisation factors, and the printed board
assembly carries a long metals supply chain behind it. Short replacement cycles then
amortise that embodied load over few years of service.

For services, the electricity of the data centre and the embodied load of the servers,
split by an allocation key. Power usage effectiveness and the assumed server lifetime
are the levers, and the grid mix decides the rest.

## Data usually needed

Foreground data is a bill of materials with die area and process node for hardware, and
a utilisation and allocation model for services. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `09-electronics`, which is the smallest sector folder by process count, with
  `02-electricity` for the operating phase, `03-chemicals` for process gases and
  `06-waste` for end of life (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `electronics`,
  `computers & network` and `electronics waste` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Current semiconductor data. Process nodes move faster than public inventories do, so a
study of a recent device is usually modelled on an older node and scaled, which is an
assumption worth stating rather than burying.

Data-centre operating data is the other gap: utilisation, cooling and power usage
effectiveness are operator-specific and seldom published per facility.

## Rules that apply

No PEFCR in the Commission's current list covers IT equipment or digital services; the
page notes that rules outside its list are either outdated or private initiatives
(ef-pef-method).

The International EPD System's PCR library carries `Machinery & equipment`,
`Metal, mineral, plastic & glass products` and `Services`, which is where hardware and
service declarations respectively land (epd-international-pcr-library).

## Use cases

No sector use case is written for this sector yet, so start from the tool-agnostic study
types in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study)
and read this page for what the sector adds to them. The gap is on
[../roadmap.md](../roadmap.md).

- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `09-electronics`, `02-electricity`, `03-chemicals`, `06-waste` |
| BAFU:2026 top-level process categories | electronics, computers & network, electronics waste |
| ISIC Rev.4 sections | C (manufacturing, computer and electronic products), J (information and communication) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
