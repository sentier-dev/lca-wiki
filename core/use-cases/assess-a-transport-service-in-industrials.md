---
title: Assess a transport service in Industrials
type: use-case
summary: "Model a tonne-kilometre or a passenger-kilometre: load factor, empty running, the split between vehicle and infrastructure, and the allocation on a mixed service."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, sentier-inventory-readme, bafu-2026-release, epd-international-pcr-library, ef-pef-method, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../sectors/industrials.md, ../concepts/functional-unit.md, ../concepts/allocation-and-multifunctionality.md, assess-an-energy-carrier-in-energy.md, assess-an-electricity-mix-in-utilities.md]
---

# Assess a transport service in Industrials

**Persona:** P1 practitioner at a carrier, a shipper or a consultancy pricing a logistics
claim · **GICS sector:** Industrials, GICS code 20, industry group 2030 Transportation,
holding air freight and logistics, passenger airlines, marine transportation, ground
transportation and transportation infrastructure (gics-2023); see
[../sectors/industrials.md](../sectors/industrials.md)

## Goal

Produce an environmental profile per unit of transport work, the tonne-kilometre or the
passenger-kilometre, that survives the question every reviewer asks first: at what load
factor, and with what empty running.

A transport service is assessed per unit of transport work, which shifts the whole study
onto load factor and empty running
([../sectors/industrials.md](../sectors/industrials.md)). The same sector also holds
capital-good studies, where the functional unit is a unit of machine multiplied by the
output it delivers before it is scrapped
([../sectors/industrials.md](../sectors/industrials.md)); this page is the transport half.

## Prerequisites

- **Data.** A fleet and operations model: vehicle types, payloads, distances, load
  factors, empty return share, fuel or electricity consumption per vehicle-kilometre, and
  the infrastructure the service uses
  ([../sectors/industrials.md](../sectors/industrials.md)).
- **Standards.** The International EPD System's PCR library carries
  `Vehicles & transport equipment`, `Machinery & equipment`,
  `Infrastructure & buildings` and `Services` (epd-international-pcr-library). Of the
  PEFCRs the Commission lists, Aviation, Drones & eVTOLs is in development and is the only
  one touching this sector (ef-pef-method).
- **Tools and background data.** Sentier inventory folder `04-transport` for transport
  processes, with `08-materials` and `09-electronics` for the bill of materials and
  `07-construction` and `10-building-services` for infrastructure and installed equipment
  (sentier-inventory-readme); BAFU:2026 top-level categories `transport systems`,
  `mechanical`, `building processes`, `construction processes`, `compressed air` and
  `recycling` (bafu-2026-release).

## What the unit of transport work has to say

"1 tkm" is a label, not a functional unit. The handbook requires the quantified
performance and the location the reference flow refers to
(ilcd-2010, chapters 6.4.1 and 6.4.2), which for a transport service means six things
stated together (lca-wiki-editorial):

| Element | Example of a complete statement |
|---|---|
| Work unit | net payload tonne-kilometre, or passenger-kilometre |
| Mode and vehicle class | articulated truck of a named gross weight class |
| Distance basis | great-circle, road distance, or actual routed distance |
| Load factor | the share of available payload actually carried |
| Empty running | the share of vehicle-kilometres run without load |
| Corridor and conditions | origin and destination region, terrain, urban share |

Two of these, load factor and empty running, are the sector's levers
([../sectors/industrials.md](../sectors/industrials.md)), so a profile published without
them is not reusable. A reader who has them can rescale the result; a reader who does not
has to take it on trust.

## Steps

1. **Choose the unit of transport work and say what it includes.** A tonne-kilometre is
   not defined until the study says whether it is net payload or gross, and over which
   distance measure. The handbook's four questions, what, how much, how well and for how
   long, apply to a service as much as to a product (ilcd-2010, chapter 6.4.1). Concept
   page: [../concepts/functional-unit.md](../concepts/functional-unit.md).

2. **Declare the load factor and the empty return share as scope parameters.** They are
   the levers of the sector ([../sectors/industrials.md](../sectors/industrials.md)), so
   they belong in the goal and scope with a stated source, not inside the model
   ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md)). Parameterise them:
   [../../brightway/modules/bw2parameters/use-cases/](../../brightway/modules/bw2parameters/use-cases/).

3. **Decide the allocation on a mixed service.** The allocation between passengers and
   freight on a mixed service is one of the sector's named levers
   ([../sectors/industrials.md](../sectors/industrials.md)). The ISO hierarchy applies:
   avoid allocation by subdivision or system expansion, then partition by a physical
   relationship, then by another relationship (ilcd-2010, chapter 6.5.3.2). Mass, volume
   and revenue give different answers, and the choice is reported. Concept page:
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

4. **Build the operating phase first.** The fuel or electricity of the operating phase
   usually dominates, with vehicle manufacture and infrastructure becoming visible for
   electrified and for low-utilisation modes
   ([../sectors/industrials.md](../sectors/industrials.md)).

5. **Take the energy carrier from the right sector.** Liquid and gaseous fuels are a fuel
   chain study, [assess-an-energy-carrier-in-energy.md](assess-an-energy-carrier-in-energy.md);
   traction electricity is a delivered mix,
   [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md).

6. **Amortise the vehicle over its real service life and utilisation.** Manufacturers
   publish design lives, not observed ones, and the observed figure is what the study
   needs ([../sectors/industrials.md](../sectors/industrials.md)). The bill of materials
   comes from `08-materials` and `09-electronics`
   (sentier-inventory-readme;
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/)).

7. **Decide whether infrastructure is inside the boundary, and say so either way.** Track,
   road, port and terminal are amortised over traffic volumes that the study has to state
   ([../concepts/system-boundary.md](../concepts/system-boundary.md)).

8. **Install the background and calculate.** Loader:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   BAFU release: [../../bafu/use-cases/](../../bafu/use-cases/); calculation:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

9. **Run the contribution analysis by phase.** Operating energy, vehicle manufacture,
   maintenance, infrastructure. The split is what tells a carrier whether to change fuel
   or to change utilisation ([../concepts/interpretation.md](../concepts/interpretation.md));
   modules:
   [../../brightway/modules/bw2analyzer/use-cases/](../../brightway/modules/bw2analyzer/use-cases/)
   and
   [../../brightway/modules/bw_graph_tools/use-cases/](../../brightway/modules/bw_graph_tools/use-cases/).

10. **Sweep the load factor and the allocation key as scenarios.** Both are choices, so
    they are modelled as distinct scenarios rather than as a distribution
    (ilcd-2010, chapter 16.2). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

## Expected output

- **An inventory table** per vehicle-kilometre and per unit of transport work: energy
  carrier and consumption, payload, load factor, empty share, vehicle amortisation,
  maintenance, and infrastructure if included.
- **An impact profile per tonne-kilometre or passenger-kilometre**, with the load factor
  and empty share printed next to the number, because the number means nothing without
  them ([../sectors/industrials.md](../sectors/industrials.md)).
- **A phase contribution split**: operating energy, vehicle, maintenance, infrastructure.
- **A load factor curve**: the profile across the plausible range, which is more useful to
  a reader than a single point.
- **An allocation statement** for a mixed service, naming the key and the ISO step it sits
  at (ilcd-2010, chapter 6.5.3.2).
- **A report** with sections for the unit of transport work, the operations model, the
  allocation, the results, the contribution analysis and the data quality statement.

## Pitfalls

- **A tonne-kilometre with no load factor.** It is the sector's defining omission
  ([../sectors/industrials.md](../sectors/industrials.md)).
- **Forgetting empty running**, which flatters every carrier that has it
  ([../sectors/industrials.md](../sectors/industrials.md)).
- **Using design life instead of observed service life and utilisation**
  ([../sectors/industrials.md](../sectors/industrials.md)).
- **Changing the allocation key between the compared alternatives**, which reports a method
  difference as a service difference
  ([run-a-comparative-lca.md](run-a-comparative-lca.md); ilcd-2010, chapter 9.3.4).
- **Leaving infrastructure out silently.** For electrified and low-utilisation modes it
  becomes visible ([../sectors/industrials.md](../sectors/industrials.md)).
- **Assuming a PEFCR covers the mode.** Only Aviation, Drones & eVTOLs touches this sector
  and it is in development (ef-pef-method).
- **Treating a commercial or professional service like a transport service.** For services
  inside 2020 Commercial & Professional Services there is often no inventory at all: the
  load is office energy, staff travel and purchased IT, none of which is a product in a
  database ([../sectors/industrials.md](../sectors/industrials.md);
  [../sectors/financials.md](../sectors/financials.md)).

## What this use case does not cover

- **The capital good half of the sector.** A machine assessed over a service life is the
  other study type in Industrials, where the levers are service life and utilisation
  rather than load factor ([../sectors/industrials.md](../sectors/industrials.md)).
- **Commercial and professional services.** Industry group 2020 often has no inventory at
  all, and studies fall back on organisational accounting
  ([../sectors/industrials.md](../sectors/industrials.md);
  [../sectors/financials.md](../sectors/financials.md)).
- **Infrastructure as the object of study.** Track, road, port and terminal appear here as
  an amortised input; assessed in their own right they are construction studies
  ([assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md)).
- **Modal shift questions.** Whether moving freight from one mode to another changes the
  wider system is a consequential question
  ([../concepts/attributional-vs-consequential.md](../concepts/attributional-vs-consequential.md)).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [reference flow](../../vocabulary.md#reference-flow)
- [allocation](../../vocabulary.md#allocation)
- [system expansion](../../vocabulary.md#system-expansion)
- [co-product](../../vocabulary.md#co-product)
- [system boundary](../../vocabulary.md#system-boundary)
- [uncertainty](../../vocabulary.md#uncertainty)

## Related pages

- [../sectors/industrials.md](../sectors/industrials.md) - what dominates, what is
  missing, which rules apply
- [assess-an-energy-carrier-in-energy.md](assess-an-energy-carrier-in-energy.md) - the
  fuel the operating phase burns
- [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md) -
  traction electricity
- [run-a-comparative-lca.md](run-a-comparative-lca.md) - comparing two modes honestly

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need real operations data for a
fleet, including observed load factors and empty running, a background release installed,
and a reviewer to confirm that the load factor curve and the allocation statement are
reproducible from the declared parameters.
