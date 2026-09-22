---
title: Assess an energy carrier in Energy
type: use-case
summary: "Model a fuel chain to a named point: the energy basis, the refinery allocation, fugitive and vented methane, and whether combustion is inside the boundary."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, sentier-inventory-readme, bafu-2026-release, epd-international-pcr-library, ef-pef-method, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../sectors/energy.md, ../concepts/allocation-and-multifunctionality.md, ../concepts/system-boundary.md, assess-an-electricity-mix-in-utilities.md, choose-a-background-database.md]
---

# Assess an energy carrier in Energy

**Persona:** P1 practitioner at a fuel producer, a trader or a consultancy supplying
upstream factors · **GICS sector:** Energy, GICS code 10, a single industry group 1010
holding Energy Equipment & Services and Oil, Gas & Consumable Fuels (gics-2023); see
[../sectors/energy.md](../sectors/energy.md)

## Goal

Produce a profile for a carrier of energy at a named point in the chain, 1 kg of crude at
the refinery gate, 1 MJ of diesel at the filling station, on a declared energy basis.

Fixing the point in the chain and the energy basis, lower or higher heating value, is the
first decision a study in this sector makes, and it is the one that makes two studies
incomparable when it is left implicit
([../sectors/energy.md](../sectors/energy.md)). The object of assessment is a carrier of
energy rather than an artefact, so the declared unit is usually a mass or an energy
content of fuel ([../sectors/energy.md](../sectors/energy.md)).

## Prerequisites

- **Data.** A mass and energy balance of the conversion step plus a measured or reported
  emission profile; the rest is background
  ([../sectors/energy.md](../sectors/energy.md)).
- **Standards.** The International EPD System's PCR library carries
  `Electricity, steam & fuels`, which is where a fuel or an energy carrier declaration
  finds its programme rules (epd-international-pcr-library). No PEFCR in the Commission's
  current list covers fuels or extraction, and rules outside that list are either outdated
  or private initiatives (ef-pef-method).
- **Tools and background data.** Sentier inventory folder `05-energy`, which holds the
  energy carriers and the largest process count of any sector folder, with `03-chemicals`
  and `04-transport` supplying the process inputs and the delivery steps
  (sentier-inventory-readme); BAFU:2026 top-level categories `fuels`, `oil`,
  `natural gas`, `pipeline`, `biomass` and `underground deposit` (bafu-2026-release).

## The two decisions that come before data

Both are declarations, not measurements, and both are settled in the goal and scope
([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md); lca-wiki-editorial).

| Decision | Options | Effect |
|---|---|---|
| Point in the chain | wellhead, refinery gate, terminal, filling station, burner tip | decides which transport, storage and distribution steps are inside ([../sectors/energy.md](../sectors/energy.md)) |
| Energy basis | lower heating value or higher heating value | rescales every per-MJ result; the handbook names the calorific value as a methodological choice carrying choice uncertainty (ilcd-2010, chapter 16.2) |

A third declaration follows from the first: whether combustion sits inside the system
boundary. A cradle-to-gate fuel declaration stops at the point of sale, while a
cradle-to-grave study of an energy service carries the combustion emissions
([../sectors/energy.md](../sectors/energy.md)).

## Steps

1. **Declare the point in the chain and the energy basis.** Write both into the declared
   unit, not into a footnote ([../sectors/energy.md](../sectors/energy.md);
   ilcd-2010, chapter 6.4.1). Concept page:
   [../concepts/functional-unit.md](../concepts/functional-unit.md).

2. **Decide whether combustion is inside the boundary and say so in the title of the
   result.** The two readings produce numbers that differ by an order of magnitude and
   look alike ([../concepts/system-boundary.md](../concepts/system-boundary.md);
   [../sectors/energy.md](../sectors/energy.md)).

3. **Settle the refinery allocation.** The allocation between the co-products of a
   refinery is one of the two things that repeatedly decide a fuel result, and the
   standards treat it as an allocation problem rather than a data problem
   ([../sectors/energy.md](../sectors/energy.md)). Follow the ISO hierarchy: avoid
   allocation by subdivision or system expansion, then partition by a physical
   relationship, then by another relationship (ilcd-2010, chapter 6.5.3.2). Mass, energy
   content and revenue give different answers. Concept page:
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

4. **Model fugitive and vented methane explicitly.** The fugitive and vented methane of
   the gas chain is the other decisive item
   ([../sectors/energy.md](../sectors/energy.md)), and it is a separate inventory line
   rather than a correction factor
   ([../concepts/elementary-and-intermediate-flows.md](../concepts/elementary-and-intermediate-flows.md)).

5. **Carry the site variability as a spread, not as a point.** Site-specific flaring,
   venting and fugitive rates vary by field and by operator and are rarely published per
   site, so practitioners fall back on regional averages and carry the spread as a
   sensitivity rather than a single number
   ([../sectors/energy.md](../sectors/energy.md)). Concept page:
   [../concepts/uncertainty.md](../concepts/uncertainty.md).

6. **Add transport, but do not expect it to lead.** Transport of the fuel itself is rarely
   decisive next to extraction, conversion and the two items above, with long pipeline and
   shipping distances the exception ([../sectors/energy.md](../sectors/energy.md)). The
   transport modelling itself is
   [assess-a-transport-service-in-industrials.md](assess-a-transport-service-in-industrials.md).

7. **Install the background and build the chain.** Loader:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the `05-energy` folder in
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/);
   the BAFU release in [../../bafu/use-cases/](../../bafu/use-cases/); a licensed ecoinvent
   release through
   [../../brightway/modules/ecoinvent_interface/use-cases/](../../brightway/modules/ecoinvent_interface/use-cases/).
   Parameterise the heating value and the allocation key so a basis change is a parameter
   change:
   [../../brightway/modules/bw2parameters/use-cases/](../../brightway/modules/bw2parameters/use-cases/).

8. **Check the geographic fit of the background.** The Swiss focus of BAFU:2026 is a gap
   for non-Swiss studies: the database is built for the Swiss federal administration and
   is tailored to Swiss needs (bafu-2026-release), so import chains outside Europe need
   another background source ([../sectors/energy.md](../sectors/energy.md);
   [choose-a-background-database.md](choose-a-background-database.md)).

9. **Calculate and run the contribution analysis by stage.** Extraction, conversion,
   distribution and, where inside the boundary, combustion
   ([../concepts/interpretation.md](../concepts/interpretation.md)). Calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/);
   contribution modules:
   [../../brightway/modules/bw2analyzer/use-cases/](../../brightway/modules/bw2analyzer/use-cases/)
   and
   [../../brightway/modules/bw_graph_tools/use-cases/](../../brightway/modules/bw_graph_tools/use-cases/).

10. **Publish the result as a reusable upstream factor.** A fuel result is consumed by
    Utilities and by Industrials, so it travels with its point in the chain, its energy
    basis, its allocation key and its geography attached
    ([assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md);
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md)).

## Expected output

- **An inventory table** by stage: extraction, processing, conversion, transport and
  storage, with the fugitive and vented flows as their own rows, and, where inside the
  boundary, combustion.
- **An impact profile per declared unit**, with the point in the chain, the energy basis,
  the allocation key and the geography printed alongside the number.
- **A spread rather than a point** for the flaring, venting and fugitive contribution
  ([../sectors/energy.md](../sectors/energy.md)).
- **An allocation sensitivity table**: the same chain under mass, energy and economic
  partitioning (ilcd-2010, chapter 6.5.3.2).
- **A stage contribution split**, which is what a producer acts on.
- **A reusable upstream factor** with its metadata, ready to be consumed by an electricity
  or a transport study.

## Pitfalls

- **Leaving the energy basis implicit**, which is the sector's named cause of
  incomparability ([../sectors/energy.md](../sectors/energy.md)).
- **Leaving the point in the chain implicit**, with the same effect
  ([../sectors/energy.md](../sectors/energy.md)).
- **Reporting a cradle-to-gate fuel number where a cradle-to-grave energy service was
  asked for**, or the reverse ([../sectors/energy.md](../sectors/energy.md)).
- **Treating the refinery allocation as a data problem**, when the standards treat it as
  an allocation problem ([../sectors/energy.md](../sectors/energy.md);
  ilcd-2010, chapter 6.5.3.2).
- **Folding fugitive methane into a generic loss factor**, which hides the item most
  likely to decide the result ([../sectors/energy.md](../sectors/energy.md)).
- **Using a regional average as if it were site data** without carrying the spread
  ([../sectors/energy.md](../sectors/energy.md)).
- **Using a Swiss-focused background for a non-European import chain**
  (bafu-2026-release).
- **Looking for a PEFCR.** None in the current list covers fuels or extraction
  (ef-pef-method).

## What this use case does not cover

- **Electricity as a carrier.** A delivered kilowatt-hour is a Utilities study, because
  its levers are the mix, the voltage level and the losses rather than a fuel chain
  ([assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md)).
- **Energy equipment.** Drilling, equipment and services sit in the same GICS industry
  group (gics-2023) but are capital goods studies
  ([../sectors/industrials.md](../sectors/industrials.md)).
- **Consequential questions about substituted fuels.** Whether displacing one fuel with
  another changes production elsewhere is a consequential model, selected by the decision
  context rather than by the sector
  ([../concepts/attributional-vs-consequential.md](../concepts/attributional-vs-consequential.md)).
- **Carbon capture and storage chains.** No page in this wiki sources them yet.

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [reference flow](../../vocabulary.md#reference-flow)
- [system boundary](../../vocabulary.md#system-boundary)
- [allocation](../../vocabulary.md#allocation)
- [co-product](../../vocabulary.md#co-product)
- [multifunctional process](../../vocabulary.md#multifunctional-process)
- [uncertainty](../../vocabulary.md#uncertainty)

## Related pages

- [../sectors/energy.md](../sectors/energy.md) - what dominates, what is missing, which
  rules apply
- [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md) -
  the largest consumer of a fuel chain result
- [assess-a-transport-service-in-industrials.md](assess-a-transport-service-in-industrials.md) -
  the second consumer
- [choose-a-background-database.md](choose-a-background-database.md) - the geographic fit
  question this sector raises

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a real mass and energy balance
for a conversion step, reported flaring, venting and fugitive rates for the fields
supplying it, a background release installed, and a reviewer to confirm that the
allocation sensitivity table reproduces from the declared keys and energy basis.
