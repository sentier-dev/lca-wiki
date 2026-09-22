---
title: Industrials
type: sector
summary: "Capital goods, commercial services and transport: what an LCA of the GICS Industrials sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Industrials

GICS code 20, three industry groups (gics-2023):

- 2010 Capital Goods: aerospace and defense, building products, construction and
  engineering, electrical equipment, industrial conglomerates, machinery, trading
  companies and distributors.
- 2020 Commercial & Professional Services: commercial services and supplies,
  professional services.
- 2030 Transportation: air freight and logistics, passenger airlines, marine
  transportation, ground transportation, transportation infrastructure.

The sector holds two different kinds of study. A capital good is assessed over a
service life, so the [functional unit](../../vocabulary.md#functional-unit) is a unit
of machine multiplied by the output it delivers before it is scrapped. A transport
service is assessed per unit of transport work, the tonne-kilometre or the
passenger-kilometre, which shifts the whole study onto load factor and empty running.
Both are defined generically in [../concepts/](../concepts/).

## What dominates the results

For a capital good, the split between embodied manufacturing and the use phase, which
turns on the assumed service life and utilisation. A machine assessed over ten years
and a machine assessed over twenty give different answers from identical inventories,
so the service-life assumption belongs in the goal and scope rather than in a
footnote.

For transport, the fuel or electricity of the operating phase usually dominates, with
vehicle manufacture and infrastructure becoming visible for electrified and for
low-utilisation modes. Load factor, empty return trips and the allocation between
passengers and freight on a mixed service are the levers.

## Data usually needed

Foreground data is a bill of materials plus a use-phase energy model for capital goods,
and a fleet and operations model for transport. The background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `04-transport` for transport processes, `08-materials` and `09-electronics` for the
  bill of materials, `07-construction` and `10-building-services` for infrastructure
  and installed equipment (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `transport systems`,
  `mechanical`, `building processes`, `construction processes`, `compressed air` and
  `recycling` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Real service lives and real utilisation. Manufacturers publish design lives, not
observed ones, and the observed figure is what the study needs.

For services inside 2020 Commercial & Professional Services there is often no
inventory at all: the environmental load is office energy, staff travel and purchased
IT, none of which is a product in a database. Studies fall back on organisational
accounting; see the note on that route in [financials.md](financials.md).

## Rules that apply

The International EPD System's PCR library carries `Machinery & equipment`,
`Vehicles & transport equipment`, `Infrastructure & buildings` and `Services`
(epd-international-pcr-library).

Of the PEFCRs the Commission lists, Aviation, Drones & eVTOLs is in development and is
the only one touching this sector (ef-pef-method). Building products declared as
construction products fall under EN 15804, documented in
[../standards/](../standards/).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-a-transport-service-in-industrials.md](../use-cases/assess-a-transport-service-in-industrials.md) - Assess a transport service, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `04-transport`, `07-construction`, `08-materials`, `09-electronics`, `10-building-services` |
| BAFU:2026 top-level process categories | transport systems, mechanical, building processes, construction processes, compressed air, recycling |
| ISIC Rev.4 sections | C (manufacturing), E (water supply, sewerage, waste management), F (construction), H (transportation and storage), N (administrative and support services) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
