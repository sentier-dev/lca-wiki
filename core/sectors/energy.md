---
title: Energy
type: sector
summary: "Fuel chains from extraction to combustion: what an LCA of the GICS Energy sector needs and which of this wiki's data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Energy

GICS code 10. The Energy sector has a single industry group, 1010 Energy, holding the
industries Energy Equipment & Services (drilling, equipment and services) and Oil, Gas
& Consumable Fuels (integrated oil and gas, exploration and production, refining and
marketing, storage and transportation, coal and consumable fuels) (gics-2023).

An LCA here is a fuel chain study. The object of assessment is a carrier of energy
rather than an artefact, so the declared unit is usually a mass or an energy content
of fuel at a named point in the chain (1 kg of crude at the refinery gate, 1 MJ of
diesel at the filling station). Fixing the point in the chain and the energy basis,
lower or higher heating value, is the first decision a study in this sector makes,
and it is the one that makes two studies incomparable when it is left implicit. The
generic side of that decision is the [functional unit](../../vocabulary.md#functional-unit),
defined in [../concepts/](../concepts/).

## What dominates the results

Extraction and conversion, then whatever happens at the burner. Two things repeatedly
decide a fuel result: the fugitive and vented methane of the gas chain, and the
allocation between the co-products of a refinery, which the standards treat as an
allocation problem rather than a data problem (see [../concepts/](../concepts/)).
Transport of the fuel itself is rarely decisive next to those two, with long pipeline
and shipping distances the exception.

Whether combustion sits inside the system boundary depends on the study: a
cradle-to-gate fuel declaration stops at the point of sale, while a cradle-to-grave
study of an energy service carries the combustion emissions.

## Data usually needed

Foreground data for a study in this sector is usually a mass and energy balance of the
conversion step plus a measured or reported emission profile; the rest is background.
This wiki covers the background in three places.

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  the `05-energy` folder holds the energy carriers, the largest process count of any
  sector folder, with `03-chemicals` and `04-transport` supplying the process inputs
  and the delivery steps (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - the BAFU:2026 database, whose top-level process
  categories include `fuels`, `oil`, `natural gas`, `pipeline`, `biomass` and
  `underground deposit` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - documented as structure only; no amounts are
  published in this wiki.

## Data usually missing

Site-specific flaring, venting and fugitive rates are the usual gap: they vary by field
and by operator and are rarely published per site, so practitioners fall back on
regional averages and carry the spread as a sensitivity rather than a single number.

The Swiss focus of BAFU:2026 is a second gap for non-Swiss studies: the database is
built for the Swiss federal administration and is tailored to Swiss needs
(bafu-2026-release), so import chains outside Europe need another background source.

## Rules that apply

The International EPD System's PCR library carries a product category
`Electricity, steam & fuels`, which is where a fuel or an energy carrier declaration
finds its programme rules (epd-international-pcr-library).

No PEFCR in the Commission's current list covers fuels or extraction: the list names
new PEFCRs for Apparel and Footwear, Cut Flowers & Potted Plants and Synthetic Turf,
PEFCRs in development for Aviation, Drones & eVTOLs, Marine Fish, Space and Tourism,
and PEFCRs in revision for Feed for Food-Producing Animals, Batteries and
Accumulators, Beer, Pasta, Pet Food and Dairy Products (ef-pef-method). Rules outside
that list are either outdated or private initiatives (ef-pef-method). The standards
themselves are documented in [../standards/](../standards/).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-an-energy-carrier-in-energy.md](../use-cases/assess-an-energy-carrier-in-energy.md) - Assess an energy carrier, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `05-energy`, `03-chemicals`, `04-transport` |
| BAFU:2026 top-level process categories | fuels, oil, natural gas, pipeline, biomass, underground deposit |
| ISIC Rev.4 sections | B (mining and quarrying), C (manufacturing, refined petroleum), D (electricity, gas, steam), H (transportation and storage) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
