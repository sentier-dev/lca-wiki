---
title: Communication Services
type: sector
summary: "Telecommunication networks, media and interactive services: what an LCA of the GICS Communication Services sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Communication Services

GICS code 50, two industry groups (gics-2023):

- 5010 Telecommunication Services: diversified telecommunication services, wireless
  telecommunication services.
- 5020 Media & Entertainment: media, entertainment, interactive media and services.

The sector was created by transforming the former Telecommunication Services sector
(gics-2023). Its studies deliver a service over a shared infrastructure, so the
[functional unit](../../vocabulary.md#functional-unit) is a unit of that service: a
gigabyte transmitted, a subscriber-year, an hour of streamed video. Each of those
requires an allocation of network and device load to the unit, and different
allocation keys give results an order of magnitude apart. See
[../concepts/](../concepts/).

## What dominates the results

The electricity of the network and of the end-user device, and the embodied load of
both. Access networks and radio sites carry most of the network energy, and that
energy is largely independent of the traffic carried, which is why a per-gigabyte unit
is so sensitive to the allocation rule.

Where the study includes the viewing device, the device usually dominates the network,
and the result becomes a statement about televisions rather than about networks.

## Data usually needed

Foreground data is a network topology with per-element power draw and a traffic model.
Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `02-electricity` for the operating phase, `09-electronics` for network and terminal
  equipment, `07-construction` for masts, ducts and buildings
  (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `computers & network`
  and `electricity` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Per-element network energy at the granularity a study needs. Operators publish
aggregate figures; inventories need per-node draw and utilisation, and the gap is
usually filled with top-down intensity figures that cannot be traced to a process.

Content production, the media half of the sector, is almost entirely uncovered as an
inventory subject. It belongs on [../roadmap.md](../roadmap.md).

## Rules that apply

No PEFCR in the Commission's current list covers telecommunication or media services
(ef-pef-method).

The International EPD System's PCR library carries a general `Services` product
category, and `Machinery & equipment` for the network hardware itself
(epd-international-pcr-library). Otherwise the general standards in
[../standards/](../standards/) apply.

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
| Sentier inventory folders | `02-electricity`, `09-electronics`, `07-construction` |
| BAFU:2026 top-level process categories | computers & network, electricity |
| ISIC Rev.4 sections | J (information and communication), R (arts, entertainment and recreation) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
