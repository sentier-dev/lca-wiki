---
title: Assess a building product in Real Estate
type: use-case
summary: "Take a construction product from bill of materials to a declaration and then into a building study: modules A1 to D, the take-off, and the operational energy that competes with it."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, en-15804-2019, epd-pcr-2019-14, epd-international-pcr-library, ef-pef-method, bafu-2026-release, sentier-inventory-readme, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../sectors/real-estate.md, ../standards/en-15804.md, prepare-an-epd.md, assess-a-material-in-materials.md, ../concepts/functional-unit.md]
---

# Assess a building product in Real Estate

**Persona:** P1 practitioner working for a product manufacturer, a design team or an asset
owner · **GICS sector:** Real Estate, GICS code 60, industry groups 6010 Equity Real
Estate Investment Trusts and 6020 Real Estate Management & Development (gics-2023);
see [../sectors/real-estate.md](../sectors/real-estate.md)

## Goal

Produce an environmental profile of a construction product that is usable twice: as a
declaration in its own right under EN 15804, and as one line of a building assessment
where it competes with decades of operational energy.

The sector's [functional unit](../../vocabulary.md#functional-unit) at building level is
an area of floor over a reference study period, typically one square metre of net floor
area per year across an assumed service life; the service life and the area definition
are the two assumptions that decide comparability
([../sectors/real-estate.md](../sectors/real-estate.md)).

## Prerequisites

- **Data.** A quantity take-off of the building, or a bill of materials for the product,
  plus an energy model of operation where the study is at building level
  ([../sectors/real-estate.md](../sectors/real-estate.md)).
- **Standards.** EN 15804:2012+A2:2019 as the core product category rules
  (en-15804-2019), a programme operator's PCR such as PCR 2019:14 *Construction products*
  (epd-pcr-2019-14), and the programme's PCR library for the right category, which carries
  `Infrastructure & buildings` and `Construction products`
  (epd-international-pcr-library). No PEFCR in the Commission's current list covers
  buildings; the closest listed rule is Synthetic Turf, a landscaping product rather than
  a building one (ef-pef-method).
- **Tools and background data.** Sentier inventory folders `07-construction`, which
  carries the largest exchange count of any sector folder, `10-building-services` for
  installed technical equipment, `08-materials` for product content and `02-electricity`
  for operation (sentier-inventory-readme); BAFU:2026 top-level categories `building
  components`, `building processes`, `construction`, `construction materials`,
  `construction processes`, `construction waste`, `flooring`, `insulation materials` and
  `ventilation`, whose new and updated construction datasets, including construction
  machinery and infrastructure, heat pumps, cement and reinforcing steel, are the main
  content of the BAFU:2026 v1 release (bafu-2026-release).

## Two studies, two functional units

The sector page describes one object, the building, but a practitioner is nearly always
asked for one of two different studies, and the confusion between them is where most
review comments land (lca-wiki-editorial).

| | Product declaration | Building assessment |
|---|---|---|
| Reference | a declared unit, or a functional unit for a cradle-to-grave and module D EPD (epd-pcr-2019-14, sections 1.4 and 4.1) | an area of floor over a reference study period ([../sectors/real-estate.md](../sectors/real-estate.md)) |
| Boundary | the prescribed modules A1 to D (epd-pcr-2019-14, Table 2) | the whole building over its service life, operational energy included |
| Rule set | EN 15804 plus a programme PCR (en-15804-2019, epd-pcr-2019-14) | no single European core rule; the PCR library carries `Infrastructure & buildings` (epd-international-pcr-library) |
| Comparability | only at building level ([../standards/en-15804.md](../standards/en-15804.md)) | only at equal service, area definition and study period |
| Who reads it | a specifier choosing a product | a design team or an asset owner choosing a design |

A product declaration is an input to a building assessment and not a conclusion about a
building. Going the other way, a building result cannot be divided back into product
declarations, because the take-off mixes product-specific and generic data
([../sectors/real-estate.md](../sectors/real-estate.md)).

## Steps

1. **Decide which of the two studies you are doing.** A product declaration and a building
   assessment have different functional units and different audiences, and conflating them
   is the sector's commonest error
   ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md);
   [../concepts/functional-unit.md](../concepts/functional-unit.md)).

2. **For the product: follow the EPD route.** Declared unit, the module set required by
   the chosen EPD type, and third-party verification. The full walk-through is
   [prepare-an-epd.md](prepare-an-epd.md); the module table and the EPD types are on
   [../standards/en-15804.md](../standards/en-15804.md).

3. **Fix the reference study period and the service life at building level.** They belong
   in the goal and scope, not in a footnote, because everything scales with them
   ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md)).

4. **Build the quantity take-off as the foreground inventory.** One row per product, with
   quantity, unit and the data source used for it. Install the background and hold the
   model with
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/)
   and
   [../../brightway/modules/bw2data/use-cases/](../../brightway/modules/bw2data/use-cases/);
   the inventory folders themselves are documented in
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/)
   and the BAFU release in [../../bafu/use-cases/](../../bafu/use-cases/).

5. **Mark which take-off lines have a product-specific declaration and which do not.** A
   real take-off has hundreds of products and only some of them have an EPD, so the rest
   are filled with generic data and the mixture is rarely reported
   ([../sectors/real-estate.md](../sectors/real-estate.md)). Recording the mixture is what
   makes the result auditable
   ([../concepts/data-quality.md](../concepts/data-quality.md)).

6. **Model the operational energy.** Which of embodied and operational load leads depends
   on the grid and on the building standard: as operational energy falls the embodied
   share rises, and in a low-energy building on a clean grid the structure dominates
   ([../sectors/real-estate.md](../sectors/real-estate.md)). The grid mix itself is a
   Utilities study: [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md).

7. **Add the refurbishment cycles.** They are the third lever over the study period and
   the one most often left out
   ([../sectors/real-estate.md](../sectors/real-estate.md)). Each cycle is a scenario, so
   it belongs in the scenario table rather than in the base case alone
   (ilcd-2010, chapter 9.2).

8. **Calculate per module and per stage.** Keep module D separate from the product result,
   as the programme rules require (epd-pcr-2019-14, Table 2). Calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

9. **Run the contribution analysis across products and stages.** Concrete, steel and
   insulation carry most of the embodied result, so a building study is largely an
   assembly of material results from
   [../sectors/materials.md](../sectors/materials.md); the material-level route is
   [assess-a-material-in-materials.md](assess-a-material-in-materials.md). Concept page:
   [../concepts/interpretation.md](../concepts/interpretation.md); modules:
   [../../brightway/modules/bw2analyzer/use-cases/](../../brightway/modules/bw2analyzer/use-cases/)
   and
   [../../brightway/modules/bw_graph_tools/use-cases/](../../brightway/modules/bw_graph_tools/use-cases/).

10. **State the data quality and the gaps.** Measured operational energy, as opposed to
    calculated demand, is the standing gap, and the difference between the two is not
    something a database can close
    ([../sectors/real-estate.md](../sectors/real-estate.md)). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

## Expected output

- **An inventory table** shaped as the take-off: product, quantity, unit, data source,
  declaration status, and the life cycle module each quantity belongs to.
- **An impact profile per module**, with A1 to A3 declared aggregated and module D
  reported separately (epd-pcr-2019-14, sections 1.4 and Table 2), and at building level a
  profile per square metre of net floor area per year.
- **An embodied versus operational split** per impact category over the reference study
  period, which is the finding a design team acts on.
- **A report** with sections for the functional unit and reference study period, the
  take-off and its data sources, the operational model, refurbishment scenarios, results
  by module and by stage, the contribution analysis, and the data quality statement.

## Pitfalls

- **Comparing two declared-unit EPDs.** They are not automatically comparable and the
  comparison only holds at building level
  ([../standards/en-15804.md](../standards/en-15804.md); epd-pcr-2019-14, section 4.1).
- **Hiding the generic-data share of the take-off**, which is the sector's usual gap
  ([../sectors/real-estate.md](../sectors/real-estate.md)).
- **Reporting calculated demand as measured operational energy**
  ([../sectors/real-estate.md](../sectors/real-estate.md)).
- **Leaving refurbishment out**, which systematically favours short-lived finishes
  ([../sectors/real-estate.md](../sectors/real-estate.md)).
- **Adding module D into the building total** (epd-pcr-2019-14, Table 2).
- **Looking for a PEFCR that does not exist.** No PEFCR in the Commission's current list
  covers buildings (ef-pef-method); the EF route for a building is not available, so the
  declaration path is EN 15804 ([prepare-an-epd.md](prepare-an-epd.md)).
- **Assuming the grid stays put.** The embodied share rises as operational energy falls
  ([../sectors/real-estate.md](../sectors/real-estate.md)), so a single grid year makes
  the split look more stable than it is.

## What this use case does not cover

- **Whole-portfolio reporting.** A REIT reporting across an asset portfolio is doing
  organisational accounting, not a product LCA; the note on that route is in
  [../sectors/financials.md](../sectors/financials.md).
- **Infrastructure other than buildings.** Roads, bridges and networks fall to
  [../sectors/industrials.md](../sectors/industrials.md) even though they share the
  construction background folders (sentier-inventory-readme).
- **Circularity indicators beyond module D.** Module D is the reporting slot EN 15804
  provides (epd-pcr-2019-14, Table 2); anything else is a separate framework.
- **The energy model itself.** Building energy simulation is its own discipline; this page
  consumes its output and asks only that calculated and measured demand are not confused
  ([../sectors/real-estate.md](../sectors/real-estate.md)).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [reference flow](../../vocabulary.md#reference-flow)
- [system boundary](../../vocabulary.md#system-boundary)
- [PCR](../../vocabulary.md#pcr)
- [recycling, reuse, recovery](../../vocabulary.md#recycling-reuse-recovery)
- [data quality](../../vocabulary.md#data-quality)

## Related pages

- [../sectors/real-estate.md](../sectors/real-estate.md) - what dominates, what is
  missing, which rules apply
- [prepare-an-epd.md](prepare-an-epd.md) - the declaration itself
- [assess-a-material-in-materials.md](assess-a-material-in-materials.md) - the results a
  building study assembles
- [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md) -
  the operational energy input

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a real quantity take-off, an
energy model with both calculated and measured consumption, a programme PCR in force, and
a background release installed, and would have to confirm that the embodied and
operational split a follower obtains is reproducible from the stated assumptions.
