---
title: Consumer Staples
type: sector
summary: "Food, beverages, tobacco and household products: what an LCA of the GICS Consumer Staples sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Consumer Staples

GICS code 30, three industry groups (gics-2023):

- 3010 Consumer Staples Distribution & Retail: drug retail, food distributors, food
  retail, consumer staples merchandise retail.
- 3020 Food, Beverage & Tobacco: beverages, food products, tobacco.
- 3030 Household & Personal Products: household products, personal care products.

This is the sector with the most developed rule set, and the one where the
agricultural stage decides almost everything. The
[functional unit](../../vocabulary.md#functional-unit) is a mass of product at a named
gate, often qualified by a nutritional or functional basis (per kg, per serving, per
litre of a defined product). See [../concepts/](../concepts/).

## What dominates the results

Primary production. Field emissions of nitrous oxide, enteric methane, manure
management and land use are what an agri-food result is made of; processing,
packaging and retail are visible but rarely decisive. For household and personal
products the picture shifts to the chemical feedstock and, where the product is used
with hot water, to the use phase.

Allocation between a crop and its residues, and between milk and meat, is a recurring
and contested decision, which is precisely why the sector has category rules.

## Data usually needed

Foreground data is a farm or a factory inventory: yields, inputs, energy, and the
emission model behind the field emissions. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  the `01-agriculture` folder, which holds the highest-precedence rank in the
  inventory, with `03-chemicals` for fertiliser and crop protection and `06-waste` for
  residues and packaging waste (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `agricultural`,
  `food industry` and `landfarming` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Current agricultural data. BAFU states that most of the data in the agricultural
sector of BAFU:2026 will be updated over the following two years, and that inventories
labelled for update are usable but flagged as needing one (bafu-2026-release). A study
that rests on that part of the database should say so.

Beyond that, the standing gaps are regionalised water and land use, and primary data
from farms outside the study's own country.

## Rules that apply

Five of the six PEFCRs the Commission lists as in revision sit in this sector: Feed for
Food-Producing Animals, Beer, Pasta, Pet Food and Dairy Products. The sixth, Batteries
and Accumulators, does not. Marine Fish is in development (ef-pef-method).

The International EPD System's PCR library carries `Food & beverages`
(epd-international-pcr-library).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-an-agricultural-product-in-consumer-staples.md](../use-cases/assess-an-agricultural-product-in-consumer-staples.md) - Assess an agricultural product, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `01-agriculture`, `03-chemicals`, `06-waste` |
| BAFU:2026 top-level process categories | agricultural, food industry, landfarming |
| ISIC Rev.4 sections | A (agriculture, forestry and fishing), C (manufacturing, food and beverages), G (wholesale and retail trade) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
