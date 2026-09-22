---
title: Utilities
type: sector
summary: "Electricity, gas, water and heat supply: what an LCA of the GICS Utilities sector needs and which data sources cover it."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Utilities

GICS code 55, a single industry group, 5510 Utilities, holding the industries Electric
Utilities, Gas Utilities, Multi-Utilities, Water Utilities, and Independent Power and
Renewable Electricity Producers (gics-2023).

This is the sector every other sector depends on, because a grid mix is an input to
almost every study in this wiki. The
[functional unit](../../vocabulary.md#functional-unit) is a unit of delivered carrier
qualified by where it is delivered: one kilowatt-hour at a named voltage level and
grid, one megajoule of heat at the substation, one cubic metre of drinking water at
the tap. Voltage level and grid boundary are not decoration; they change the number
through transmission losses and through the mix. See [../concepts/](../concepts/).

## What dominates the results

For thermal generation, the fuel chain and the combustion emissions. For hydro, wind,
solar and nuclear, the construction of the plant and its assumed lifetime output,
since there is no fuel to carry the result; a wind result is therefore mostly a
statement about steel, concrete and capacity factor.

For a grid mix, the composition of the mix and whether imports are modelled. For water
and wastewater, pumping electricity and the treatment process emissions.

## Data usually needed

Foreground data is a plant or a network model: generation by technology, losses,
capacity factors, and the treatment train for water. Background:

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  `02-electricity`, one of the largest sector folders and the Brightcon deliverable,
  with `05-energy` for the fuels behind it and `06-waste` for wastewater and residues
  (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - BAFU:2026 top-level categories `electricity`,
  `electricity by fuel`, `power plants`, `photovoltaic`, `wind power`, `impoundment`,
  `heat`, `heating`, `heat pumps`, `water`, `wastewater treatment`, `nuclear waste`,
  `incineration`, `landfill`, `waste` and `waste management` (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Temporal resolution. A yearly average mix hides the hour-by-hour variation that decides
the result for anything with a flexible load, and hourly inventories are not what a
general database offers.

Regionalisation is the second gap, and BAFU states it for its own database: the
regionalisation of inventories and impact assessment is only partly taken into account
in BAFU:2026 and is named as a development need (bafu-2026-release).

## Rules that apply

The International EPD System's PCR library carries `Electricity, steam & fuels`, which
is the programme-rule family for a grid or a generation declaration
(epd-international-pcr-library).

No PEFCR in the Commission's current list covers electricity, heat or water supply
(ef-pef-method). BAFU:2026 is stated to be compatible with both the Ecological Scarcity
method (UBP2021) and Environmental Footprint 3.1 at the impact assessment stage
(bafu-2026-release).

## Use cases

This sector has one use case of its own, and it rests on the tool-agnostic study types
in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study) rather
than restating them: it says which steps decide the answer here and what the sector's
data usually lacks.

- [../use-cases/assess-an-electricity-mix-in-utilities.md](../use-cases/assess-an-electricity-mix-in-utilities.md) - Assess an electricity mix, the sector use case for this page.
- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - the
  inventory folders named above, and how to read them.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | `02-electricity`, `05-energy`, `06-waste` |
| BAFU:2026 top-level process categories | electricity, electricity by fuel, power plants, photovoltaic, wind power, impoundment, heat, heating, heat pumps, water, wastewater treatment, nuclear waste, incineration, landfill, waste, waste management |
| ISIC Rev.4 sections | D (electricity, gas, steam and air conditioning supply), E (water supply; sewerage, waste management and remediation) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
