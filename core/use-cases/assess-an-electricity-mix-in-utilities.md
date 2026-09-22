---
title: Assess an electricity mix in Utilities
type: use-case
summary: "Model a delivered kilowatt-hour: voltage level, grid boundary, imports, generation technologies and the temporal resolution a yearly average hides."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, bafu-2026-release, sentier-inventory-readme, epd-international-pcr-library, ef-pef-method, ilcd-2010, openlca-bafu-2026-notes, lca-wiki-editorial]
verified: no
related: [../sectors/utilities.md, ../concepts/functional-unit.md, ../concepts/uncertainty.md, choose-a-background-database.md, assess-an-energy-carrier-in-energy.md]
---

# Assess an electricity mix in Utilities

**Persona:** P1 practitioner modelling a grid, a generation portfolio or a supply
contract · **GICS sector:** Utilities, GICS code 55, a single industry group 5510 holding
Electric Utilities, Gas Utilities, Multi-Utilities, Water Utilities and Independent Power
and Renewable Electricity Producers (gics-2023); see
[../sectors/utilities.md](../sectors/utilities.md)

## Goal

Produce a defensible profile for one unit of delivered energy carrier, qualified by where
it is delivered: one kilowatt-hour at a named voltage level and grid, one megajoule of
heat at the substation, one cubic metre of drinking water at the tap. Voltage level and
grid boundary are not decoration; they change the number through transmission losses and
through the mix ([../sectors/utilities.md](../sectors/utilities.md)).

This is the sector every other sector depends on, because a grid mix is an input to
almost every study in this wiki ([../sectors/utilities.md](../sectors/utilities.md)). A
mix built here is reused, so it has to carry its own metadata.

## Prerequisites

- **Data.** A plant or a network model: generation by technology, losses, capacity
  factors, and the treatment train for water
  ([../sectors/utilities.md](../sectors/utilities.md)).
- **Standards.** No PEFCR in the Commission's current list covers electricity, heat or
  water supply (ef-pef-method). The International EPD System's PCR library carries
  `Electricity, steam & fuels`, which is the programme-rule family for a grid or a
  generation declaration (epd-international-pcr-library).
- **Tools and background data.** Sentier inventory folders `02-electricity`, one of the
  largest sector folders, with `05-energy` for the fuels behind it and `06-waste` for
  wastewater and residues (sentier-inventory-readme); BAFU:2026 top-level categories
  `electricity`, `electricity by fuel`, `power plants`, `photovoltaic`, `wind power`,
  `impoundment`, `heat`, `heating`, `heat pumps`, `water`, `wastewater treatment`,
  `nuclear waste`, `incineration`, `landfill`, `waste` and `waste management`
  (bafu-2026-release). BAFU:2026 is stated to be compatible with both the Ecological
  Scarcity method (UBP2021) and Environmental Footprint 3.1 at the impact assessment stage
  (bafu-2026-release).

## The four decisions that move the number

Before any data is collected, four declarations decide most of the result. Writing them
down as a block at the top of the scope section saves the study from re-deriving them
later (lca-wiki-editorial).

| Decision | Options in common use | Why it moves the result |
|---|---|---|
| Voltage level | high, medium, low, or at the meter | losses accumulate down the levels ([../sectors/utilities.md](../sectors/utilities.md)) |
| Grid boundary | production mix, consumption mix, supplier mix, residual mix | each includes or excludes imports and contracted attributes differently |
| Imports | neighbouring mix, residual mix, omitted | whether imports are modelled is named as a dominant factor ([../sectors/utilities.md](../sectors/utilities.md)) |
| Time basis | annual average, seasonal, hourly | an annual average hides the variation that decides a flexible load ([../sectors/utilities.md](../sectors/utilities.md)) |

None of the four is a data question, which is why they belong in the goal and scope
([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md)) and in the scenario table
as choice uncertainty rather than as stochastic spread
(ilcd-2010, chapter 16.2).

## Steps

1. **Write the delivery point into the functional unit.** One kilowatt-hour is not a
   functional unit until it carries a voltage level and a grid; the handbook's rule that
   the reference flow names where the product is available applies directly here
   (ilcd-2010, chapter 6.4.1). Concept page:
   [../concepts/functional-unit.md](../concepts/functional-unit.md).

2. **Declare the grid boundary and the treatment of imports.** For a grid mix, the
   composition of the mix and whether imports are modelled is what dominates the result
   ([../sectors/utilities.md](../sectors/utilities.md)). An import can be modelled as a
   neighbouring mix, as a residual mix, or not at all, and the three give different
   answers.

3. **Split the model by generation technology.** For thermal generation the fuel chain and
   the combustion emissions dominate; for hydro, wind, solar and nuclear the construction
   of the plant and its assumed lifetime output do, since there is no fuel to carry the
   result, so a wind result is mostly a statement about steel, concrete and capacity
   factor ([../sectors/utilities.md](../sectors/utilities.md)).

4. **Take the fuel chains from the Energy sector rather than rebuilding them.** The
   upstream of a thermal plant is a fuel chain study:
   [assess-an-energy-carrier-in-energy.md](assess-an-energy-carrier-in-energy.md) and
   [../sectors/energy.md](../sectors/energy.md).

5. **Install the background and build the mix as a linked process.** Loader:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the `02-electricity` folder and its neighbours are documented in
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/);
   the BAFU release itself in [../../bafu/use-cases/](../../bafu/use-cases/). Holding the
   mix as a node with shares as exchanges is the job of
   [../../brightway/modules/bw2data/use-cases/](../../brightway/modules/bw2data/use-cases/),
   and parameterising the shares so a scenario is a parameter change rather than a new
   model is
   [../../brightway/modules/bw2parameters/use-cases/](../../brightway/modules/bw2parameters/use-cases/).

6. **Add the losses explicitly.** Transmission and distribution losses are what turn a
   generation mix into a delivered mix, and they are per voltage level
   ([../sectors/utilities.md](../sectors/utilities.md)).

7. **Model construction and lifetime output for non-fuel technologies.** The lifetime
   output assumption is the capacity factor in disguise, and it is a choice, so it goes in
   the scenario table (ilcd-2010, chapter 16.2). Concept page:
   [../concepts/uncertainty.md](../concepts/uncertainty.md).

8. **Calculate, and report in both method families where the audience needs it.** BAFU
   ships IPCC 2021, Ecological Scarcity 2021 (UBP2021) and Environmental Footprint 3.1
   (openlca-bafu-2026-notes;
   [../../bafu/knowledge/methods.md](../../bafu/knowledge/methods.md)). Calculation
   module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

9. **Test the temporal assumption.** A yearly average mix hides the hour-by-hour variation
   that decides the result for anything with a flexible load, and hourly inventories are
   not what a general database offers
   ([../sectors/utilities.md](../sectors/utilities.md)). Where the study's conclusion
   turns on timing, the time-explicit route is
   [../../brightway/modules/bw_timex/use-cases/](../../brightway/modules/bw_timex/use-cases/)
   and
   [../../brightway/modules/bw_temporalis/use-cases/](../../brightway/modules/bw_temporalis/use-cases/).

10. **State the regionalisation gap.** BAFU states it for its own database: the
    regionalisation of inventories and impact assessment is only partly taken into account
    in BAFU:2026 and is named as a development need (bafu-2026-release). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

## Expected output

- **An inventory table** with one row per generation technology: share of the mix, output,
  capacity factor, and the dataset each technology was linked to, plus rows for imports
  and for losses per voltage level.
- **An impact profile per delivered unit**, at each voltage level the study declares, in
  the method families the audience asks for.
- **A contribution split** between fuel chain, combustion, plant construction and network,
  which is the finding a utility acts on
  ([../concepts/interpretation.md](../concepts/interpretation.md)).
- **A scenario table** over the import treatment, the capacity factors and, where
  relevant, the temporal resolution.
- **A reusable mix dataset** with its geography, its year and its voltage level in the
  metadata, since other studies will consume it
  ([../concepts/data-quality.md](../concepts/data-quality.md)).

## Pitfalls

- **A kilowatt-hour with no voltage level or grid.** The two change the number through
  losses and through the mix ([../sectors/utilities.md](../sectors/utilities.md)).
- **Silently omitting imports**, which is a modelling choice presented as an absence.
- **Reporting a renewable result without its capacity factor.** With no fuel, the result
  is mostly steel, concrete and assumed lifetime output
  ([../sectors/utilities.md](../sectors/utilities.md)).
- **Using a yearly average for a flexible load**, which is exactly the case where the
  average hides the answer ([../sectors/utilities.md](../sectors/utilities.md)).
- **Ignoring the regionalisation limit** that BAFU declares for its own database
  (bafu-2026-release).
- **Publishing a single eco-point total as the result.** A single weighted total in
  eco-points is part of BAFU's published output, and it is a weighting
  ([../../bafu/knowledge/methods.md](../../bafu/knowledge/methods.md);
  ilcd-2010, chapter 8.4).
- **Reusing a mix without its metadata.** Every downstream study inherits the year, the
  geography and the import assumption, whether or not they were written down
  (lca-wiki-editorial).

## What this use case does not cover

- **Water and wastewater as the object of study.** They sit in the same industry group
  (gics-2023) and their levers are pumping electricity and the treatment process
  emissions ([../sectors/utilities.md](../sectors/utilities.md)); the steps here are
  written for an electricity carrier.
- **Contractual instruments.** Guarantees of origin and power purchase agreements are an
  attributional bookkeeping question that the mix definitions above only touch; no page in
  this wiki sources them yet.
- **Grid expansion questions.** Whether additional demand causes additional capacity is a
  consequential model, selected by the decision context
  ([../concepts/attributional-vs-consequential.md](../concepts/attributional-vs-consequential.md)).
- **The generation technologies' own supply chains.** Turbines, panels and plant
  components are Industrials and Materials studies
  ([assess-a-material-in-materials.md](assess-a-material-in-materials.md)).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [geography](../../vocabulary.md#geography)
- [market activity](../../vocabulary.md#market-activity)
- [production volume](../../vocabulary.md#production-volume)
- [eco-point (UBP)](../../vocabulary.md#eco-point-ubp)
- [weighting](../../vocabulary.md#weighting)
- [uncertainty](../../vocabulary.md#uncertainty)

## Related pages

- [../sectors/utilities.md](../sectors/utilities.md) - what dominates, what is missing,
  which rules apply
- [assess-an-energy-carrier-in-energy.md](assess-an-energy-carrier-in-energy.md) - the
  fuel chains upstream of a thermal plant
- [choose-a-background-database.md](choose-a-background-database.md) - the regional fit
  question this sector raises first
- [assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md) -
  the largest consumer of the mix this use case produces

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need published generation statistics
for a real grid year, loss factors per voltage level, a background release installed, and
a second practitioner to confirm that the delivered-unit profile is reproducible from the
stated mix, imports and losses.
