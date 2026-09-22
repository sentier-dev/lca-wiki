---
title: Real Estate
type: sector
summary: "Buildings and property over a reference study period: what an LCA of the GICS Real Estate sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Real Estate

GICS code 60, two industry groups (gics-2023):

- 6010 Equity Real Estate Investment Trusts (REITs): diversified, industrial, hotel and
  resort, office, health care and residential REITs.
- 6020 Real Estate Management & Development: diversified real estate activities, real
  estate operating companies, real estate development, real estate services.

Real Estate was carved out of the Financials sector in a GICS structure review
(gics-2023), and unlike its parent it has a physical object to assess. The
[functional unit](../../vocabulary.md#functional-unit) is an area of floor over a
reference study period, typically one square metre of net floor area per year across
an assumed service life of the building. The service life and the area definition are
the two assumptions that decide comparability. See [../concepts/](../concepts/).

## What dominates the results

Operational energy over decades, and the embodied load of the structure. Which of the
two leads depends on the grid and on the building standard: as operational energy
falls, the embodied share rises, and in a low-energy building on a clean grid the
structure dominates.

Within the embodied share, concrete, steel and insulation carry most of the result, so
a building study is largely an assembly of material results from
[materials.md](materials.md). Refurbishment cycles over the study period are the third
lever and the one most often left out.

## Data usually needed

Foreground data is a quantity take-off of the building plus an energy model of its
operation. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `07-construction`, which carries the largest exchange count of any sector folder,
  with `10-building-services` for installed technical equipment, `08-materials` for
  product content and `02-electricity` for operation (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `building components`,
  `building processes`, `construction`, `construction materials`,
  `construction processes`, `construction waste`, `flooring`, `insulation materials`
  and `ventilation`. The BAFU:2026 v1 release states that new and updated datasets in
  the construction sector are its main content, including construction machinery and
  infrastructure, heat pumps, cement and reinforcing steel (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Measured operational energy, as opposed to calculated demand. The gap between the two
is well known to practitioners and is not something a database can close.

Product-specific declarations for the whole bill of materials are the other gap: a real
take-off has hundreds of products and only some of them have an EPD, so the rest are
filled with generic data and the mixture is rarely reported.

## Rules that apply

The most rule-bound sector after Consumer Staples. The International EPD System's PCR
library carries `Infrastructure & buildings` and `Construction products`
(epd-international-pcr-library), and construction product declarations follow the
EN 15804 core rules documented in [../standards/](../standards/).

No PEFCR in the Commission's current list covers buildings; the closest listed rule is
Synthetic Turf, which is a landscaping product rather than a building one
(ef-pef-method).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-a-building-product-in-real-estate.md](../use-cases/assess-a-building-product-in-real-estate.md) - Assess a building product, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `07-construction`, `10-building-services`, `08-materials`, `02-electricity` |
| BAFU:2026 top-level process categories | building components, building processes, construction, construction materials, construction processes, construction waste, flooring, insulation materials, ventilation |
| ISIC Rev.4 sections | F (construction), L (real estate activities) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
