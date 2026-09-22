---
title: Consumer Discretionary
type: sector
summary: "Vehicles, durables, apparel and consumer services: what an LCA of the GICS Consumer Discretionary sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Consumer Discretionary

GICS code 25, four industry groups (gics-2023):

- 2510 Automobiles & Components: automobile components, automobiles.
- 2520 Consumer Durables & Apparel: household durables, leisure products, textiles,
  apparel and luxury goods.
- 2530 Consumer Services: hotels, restaurants and leisure, diversified consumer
  services.
- 2550 Consumer Discretionary Distribution & Retail: distributors, broadline retail,
  specialty retail.

The defining difficulty of the sector is that the
[functional unit](../../vocabulary.md#functional-unit) has to encode consumer
behaviour. A garment is declared per number of wears before disposal, a vehicle per
kilometre over a lifetime mileage, an appliance per year of service. Change the
assumed number of wears or the lifetime mileage and the ranking moves, which is why
those assumptions are scope decisions and not data. See
[../concepts/](../concepts/).

## What dominates the results

For vehicles, the use phase for combustion drivetrains and the battery plus the
electricity mix for electric ones. For apparel, fibre production and the wet
processing steps, with laundry moving into view when the use phase is inside the
boundary. For durables and electronics-bearing products, manufacturing of the
electronic components.

End of life matters more here than in most sectors, because the products are numerous,
short-lived and collected through consumer routes rather than industrial ones.

## Data usually needed

Foreground data is a bill of materials, a manufacturing recipe and a use-phase
behaviour model. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `08-materials` and `09-electronics` for product content, `04-transport` for the
  vehicle and distribution side, `06-waste` for end of life
  (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `textiles`,
  `private consumption`, `electronics`, `flooring` and `transport systems`
  (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Use-phase behaviour, which no inventory database can supply: how often a garment is
washed, how long a device is kept, how far a car is actually driven. Studies take these
from consumer surveys, and the survey is then the weakest link in the chain.

Supply chains in this sector are long, global and commercially sensitive, so tier-two
and tier-three data is usually unavailable and is replaced by regional averages.

## Rules that apply

Apparel and Footwear is one of the new PEFCRs in the Commission's list, and Batteries
and Accumulators is in revision; both apply directly here (ef-pef-method).

The International EPD System's PCR library carries
`Textiles, footwear & apparel`, `Vehicles & transport equipment` and
`Furniture & other goods` (epd-international-pcr-library).

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
| Sentier inventory folders | `08-materials`, `09-electronics`, `04-transport`, `06-waste` |
| BAFU:2026 top-level process categories | textiles, private consumption, electronics, flooring, transport systems |
| ISIC Rev.4 sections | C (manufacturing), G (wholesale and retail trade), I (accommodation and food service), P (education), S (other service activities) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
