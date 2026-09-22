---
title: Health Care
type: sector
summary: "Pharmaceuticals, devices and care delivery: what an LCA of the GICS Health Care sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Health Care

GICS code 35, two industry groups (gics-2023):

- 3510 Health Care Equipment & Services: health care equipment and supplies, health
  care providers and services, health care technology.
- 3520 Pharmaceuticals, Biotechnology & Life Sciences: biotechnology,
  pharmaceuticals, life sciences tools and services.

The [functional unit](../../vocabulary.md#functional-unit) in this sector is a health
outcome rather than a product: one treatment, one dose, one procedure, one patient
episode. That is the honest unit and also the hardest to model, so many published
studies fall back on a product unit (one device, one kilogram of active ingredient)
and state the restriction. See [../concepts/](../concepts/).

## What dominates the results

Single-use consumables and their end of life, the energy of sterilisation and of
climate-controlled facilities, and, for pharmaceuticals, the solvent-intensive
synthesis of the active ingredient. Anaesthetic gases and propellants carry a large
result of their own where they are in scope.

Reusable versus single-use comparisons are the classic study in this sector, and they
turn entirely on the reprocessing model and the assumed number of reuse cycles.

## Data usually needed

Foreground data is a synthesis route or a device bill of materials, plus a facility
energy model. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `03-chemicals` for synthesis inputs, `09-electronics` for instrumented devices,
  `06-waste` for clinical waste routes (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `chemicals` and
  `incineration` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Inventories for active pharmaceutical ingredients. Synthesis routes are proprietary and
rarely published at the level an LCA needs, so practitioners build proxies from
reaction stoichiometry and generic solvent recovery assumptions and carry a wide
uncertainty.

Clinical waste treatment beyond incineration, and the environmental load of care
delivery itself, are also thinly covered. Both belong on
[../roadmap.md](../roadmap.md) rather than in a page that pretends to have them.

## Rules that apply

No PEFCR in the Commission's current list covers pharmaceuticals, medical devices or
care delivery (ef-pef-method).

The International EPD System's PCR library has no health care product category either;
the nearest ones are `Chemical products` and `Machinery & equipment`
(epd-international-pcr-library). A study in this sector therefore usually works
directly from the general standards in [../standards/](../standards/).

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
| Sentier inventory folders | `03-chemicals`, `09-electronics`, `06-waste` |
| BAFU:2026 top-level process categories | chemicals, incineration |
| ISIC Rev.4 sections | C (manufacturing, pharmaceuticals and medical devices), Q (human health and social work activities) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
