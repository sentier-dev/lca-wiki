---
title: Materials
type: sector
summary: "Bulk materials from ore and feedstock to the factory gate: what an LCA of the GICS Materials sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Materials

GICS code 15. The Materials sector has a single industry group, 1510 Materials, holding
the industries Chemicals, Construction Materials, Containers & Packaging, Metals &
Mining, and Paper & Forest Products (gics-2023).

An LCA here is almost always cradle-to-gate, and its result is an input to somebody
else's study. The declared unit is a mass or a volume of material at the factory gate
(1 kg of steel, 1 t of cement, 1 m3 of sawn timber), which makes the
[functional unit](../../vocabulary.md#functional-unit) look simple; the hard part is
the system boundary, because most material chains have co-products, scrap loops and
recycled input, and each of those is an allocation decision that changes the number.
Those decisions are defined in [../concepts/](../concepts/).

## What dominates the results

Process energy and the direct process emissions of the conversion step. For primary
metals and for clinker the calcination and smelting emissions plus the electricity
mix carry the result; for recycled routes the credit rule for scrap does. For paper
and forest products the questions move to the forestry model and to biogenic carbon
accounting.

The electricity mix is the single lever that most often changes the ranking between
two producers of the same material, which is why a materials study usually reports
which grid it assumed.

## Data usually needed

Foreground data is the process recipe: inputs per unit of output, energy carriers,
direct emissions and the fate of by-products. Background data comes from:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  the `08-materials` folder, with `03-chemicals` for feedstocks and `07-construction`
  for the construction-bound materials; sector folders carry a rank prefix and the
  lower rank wins when records overlap (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `metals`, `minerals`,
  `chemicals`, `plastics`, `glass`, `ceramics`, `wood`, `paper+ board`, `cardboard`,
  `construction materials` and `insulation materials` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Producer-specific data, which is what an EPD needs and what an aggregated database
cannot supply. The usual substitute is a sector average, which is defensible for a
screening study and not defensible for a comparative assertion.

Mine-site data is the other gap: ore grade, overburden ratio and tailings management
vary per deposit and rarely reach a public inventory.

## Rules that apply

This is the sector with the densest programme-rule coverage. The International EPD
System's PCR library carries the product categories `Chemical products`,
`Construction products`, `Metal, mineral, plastic & glass products` and
`Paper and plastic products` (epd-international-pcr-library). Construction products
additionally sit under the EN 15804 core rules, documented in
[../standards/](../standards/).

No PEFCR in the Commission's current list covers bulk materials; the list is limited
to the product groups named on the PEF method page (ef-pef-method).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-a-material-in-materials.md](../use-cases/assess-a-material-in-materials.md) - Assess a material, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `08-materials`, `03-chemicals`, `07-construction` |
| BAFU:2026 top-level process categories | metals, minerals, chemicals, plastics, glass, ceramics, wood, paper+ board, cardboard, construction materials, insulation materials |
| ISIC Rev.4 sections | B (mining and quarrying), C (manufacturing) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
