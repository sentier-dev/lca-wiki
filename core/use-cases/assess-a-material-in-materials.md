---
title: Assess a material in Materials
type: use-case
summary: "Produce a cradle-to-gate result for a bulk material: the electricity mix that decides the ranking, the scrap and recycled-content rules, and the declaration that follows."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, epd-pcr-2019-14, en-15804-2019, ef-pef-method, sentier-inventory-readme, bafu-2026-release, ecoinvent-kb-system-models, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../sectors/materials.md, ../concepts/allocation-and-multifunctionality.md, prepare-an-epd.md, assess-an-electricity-mix-in-utilities.md, choose-a-background-database.md]
---

# Assess a material in Materials

**Persona:** P1 practitioner at a producer of a bulk material, or a buyer auditing one ·
**GICS sector:** Materials, GICS code 15, a single industry group 1510 holding Chemicals,
Construction Materials, Containers & Packaging, Metals & Mining, and Paper & Forest
Products (gics-2023); see [../sectors/materials.md](../sectors/materials.md)

## Goal

Produce a cradle-to-gate result for a mass or a volume of material at the factory gate,
1 kg of steel, 1 t of cement, 1 m3 of sawn timber, that another practitioner can put into
their own study without being misled about what is inside it.

An LCA here is almost always cradle-to-gate, and its result is an input to somebody else's
study, which makes the declared unit look simple; the hard part is the system boundary,
because most material chains have co-products, scrap loops and recycled input, and each of
those is an allocation decision that changes the number
([../sectors/materials.md](../sectors/materials.md)).

## Prerequisites

- **Data.** The process recipe: inputs per unit of output, energy carriers, direct
  emissions and the fate of by-products
  ([../sectors/materials.md](../sectors/materials.md)).
- **Standards.** This is the sector with the densest programme-rule coverage: the
  International EPD System's PCR library carries `Chemical products`,
  `Construction products`, `Metal, mineral, plastic & glass products` and
  `Paper and plastic products` (epd-international-pcr-library), and construction products
  additionally sit under the EN 15804 core rules (en-15804-2019;
  [../standards/en-15804.md](../standards/en-15804.md)). No PEFCR in the Commission's
  current list covers bulk materials (ef-pef-method).
- **Tools and background data.** Sentier inventory folder `08-materials`, with
  `03-chemicals` for feedstocks and `07-construction` for the construction-bound
  materials; sector folders carry a rank prefix and the lower rank wins when records
  overlap (sentier-inventory-readme). BAFU:2026 top-level categories `metals`, `minerals`,
  `chemicals`, `plastics`, `glass`, `ceramics`, `wood`, `paper+ board`, `cardboard`,
  `construction materials` and `insulation materials` (bafu-2026-release).

## The three loops that decide the number

A bulk material chain almost never produces one product from one input, and three
recurring structures are where a materials result is made or lost
([../sectors/materials.md](../sectors/materials.md)).

| Loop | The question | Where it is answered |
|---|---|---|
| Co-products of the conversion step | how the burden splits between the reference product and the saleable by-products | the ISO hierarchy, subdivision and system expansion before partitioning (ilcd-2010, chapter 6.5.3.2) |
| Scrap and recycled input | whether recyclable material enters burden-free and whether the producer is credited for it | the system model; the cut-off model makes recyclable materials available burden-free and gives the primary producer no credit (ecoinvent-kb-system-models) |
| End-of-life of the material itself | whether a recycling benefit is claimed, and where it is reported | outside a cradle-to-gate boundary; under EN 15804 it is module D, declared separately (epd-pcr-2019-14, Table 2) |

The three are not independent: a system model that fixes the second, such as ecoinvent's
cut-off by classification, has already made part of the first
(ecoinvent-kb-system-models). Recording which loops the chosen background answered, and
which the study answered itself, is what lets a downstream user avoid counting a credit
twice (lca-wiki-editorial).

## Steps

1. **State the gate and the declared unit together.** "1 kg of steel" is incomplete until
   the study names the grade, the route and the gate it is measured at; the handbook's
   point that the reference flow carries the location and the technical specification
   applies directly (ilcd-2010, chapters 6.4.1 and 6.4.6). Concept page:
   [../concepts/functional-unit.md](../concepts/functional-unit.md).

2. **Choose and record the system model before anything else.** For ecoinvent it is an
   explicit choice among "Allocation, cut-off by classification", "Allocation, cut-off,
   EN15804", "Allocation at the point of substitution" and "Substitution, consequential,
   long-term" (ecoinvent-kb-system-models), and it decides how the scrap loop is treated.
   See [choose-a-background-database.md](choose-a-background-database.md) and
   [../../ecoinvent/knowledge/system-models.md](../../ecoinvent/knowledge/system-models.md).

3. **Settle the co-product allocation.** Most material chains have co-products, and each
   is an allocation decision that changes the number
   ([../sectors/materials.md](../sectors/materials.md)). ISO's hierarchy applies: avoid
   allocation by subdivision or system expansion, then partition by a physical
   relationship, then by another relationship (ilcd-2010, chapter 6.5.3.2). Concept page:
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

4. **Settle the recycled input and scrap credit rule.** For recycled routes the credit
   rule for scrap carries the result
   ([../sectors/materials.md](../sectors/materials.md)). Under an EN 15804 declaration
   the programme rules apply, and they note that EN 15804 and ISO 21930 allocation
   requirements for production scrap from A1 to A3 are not fully compatible
   (epd-pcr-2019-14, section 5.4.5).

5. **Model the conversion step in detail.** Process energy and the direct process
   emissions of the conversion step dominate; for primary metals and for clinker the
   calcination and smelting emissions plus the electricity mix carry the result
   ([../sectors/materials.md](../sectors/materials.md)).

6. **Declare the electricity mix, because it decides the ranking.** The electricity mix is
   the single lever that most often changes the ranking between two producers of the same
   material, which is why a materials study usually reports which grid it assumed
   ([../sectors/materials.md](../sectors/materials.md)). Build or select it with
   [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md).

7. **For paper and forest products, move to the forestry model and biogenic carbon.**
   Those are the questions that replace smelting and calcination
   ([../sectors/materials.md](../sectors/materials.md)), and biogenic carbon accounting is
   a scope decision reported with the result
   ([../concepts/system-boundary.md](../concepts/system-boundary.md)).

8. **Install the background and calculate.** Loader:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the `08-materials` folder and the rank rule in
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/);
   BAFU release in [../../bafu/use-cases/](../../bafu/use-cases/); a licensed ecoinvent
   release through
   [../../brightway/modules/ecoinvent_interface/use-cases/](../../brightway/modules/ecoinvent_interface/use-cases/);
   calculation in
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

9. **Run the contribution analysis and the grid sweep together.** Report the result across
   a plausible range of grid mixes rather than at one, so a downstream user can see how
   portable the number is ([../concepts/interpretation.md](../concepts/interpretation.md));
   modules:
   [../../brightway/modules/bw2analyzer/use-cases/](../../brightway/modules/bw2analyzer/use-cases/)
   and
   [../../brightway/modules/bw_graph_tools/use-cases/](../../brightway/modules/bw_graph_tools/use-cases/).

10. **Decide what the result is for.** A sector average is defensible for a screening
    study and not defensible for a comparative assertion
    ([../sectors/materials.md](../sectors/materials.md)). If the result is to be declared,
    continue with [prepare-an-epd.md](prepare-an-epd.md); if it is to be compared, with
    [run-a-comparative-lca.md](run-a-comparative-lca.md).

## Expected output

- **An inventory table** shaped as the recipe: input, amount per declared unit, unit,
  supplying dataset, plus energy carriers, direct process emissions and by-product
  outputs with their fate.
- **An impact profile per declared unit**, cradle to gate, with the grid mix, the system
  model and the allocation key printed alongside it.
- **A grid sensitivity table**: the same profile across a range of electricity mixes,
  which is what makes the number reusable
  ([../sectors/materials.md](../sectors/materials.md)).
- **An allocation and scrap statement**: co-product key, recycled content or end-of-life
  approach, and the ISO step each sits at (ilcd-2010, chapter 6.5.3.2).
- **A representativeness note**: whether the result is producer-specific or a sector
  average, and for which region and year
  ([../concepts/data-quality.md](../concepts/data-quality.md)).
- **A report** with sections for the declared unit and gate, the system model, the recipe,
  the allocation, the results, the grid sweep and the data quality statement.

## Pitfalls

- **Publishing a sector average as a producer claim.** Producer-specific data is what an
  EPD needs and what an aggregated database cannot supply
  ([../sectors/materials.md](../sectors/materials.md)).
- **Not saying which grid was assumed**, which makes the single most decisive lever
  invisible ([../sectors/materials.md](../sectors/materials.md)).
- **Mixing system models.** Four ecoinvent system models produce four different databases
  out of the same base data (ecoinvent-kb-system-models).
- **Assuming EN 15804 and ISO 21930 treat production scrap the same way.** Their
  allocation requirements for scrap from A1 to A3 are not fully compatible
  (epd-pcr-2019-14, section 5.4.5).
- **Treating mine-site variability as noise.** Ore grade, overburden ratio and tailings
  management vary per deposit and rarely reach a public inventory
  ([../sectors/materials.md](../sectors/materials.md)), so they belong in the scenario
  table (ilcd-2010, chapter 16.2).
- **Looking for a PEFCR.** None in the Commission's current list covers bulk materials
  (ef-pef-method).
- **Letting a cradle-to-gate result be read as cradle-to-grave.** The gate is part of the
  declaration ([../concepts/system-boundary.md](../concepts/system-boundary.md)).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [system model](../../vocabulary.md#system-model)
- [allocation](../../vocabulary.md#allocation)
- [co-product](../../vocabulary.md#co-product)
- [substitution](../../vocabulary.md#substitution)
- [recycling, reuse, recovery](../../vocabulary.md#recycling-reuse-recovery)
- [secondary good](../../vocabulary.md#secondary-good)

## Related pages

- [../sectors/materials.md](../sectors/materials.md) - what dominates, what is missing,
  which rules apply
- [prepare-an-epd.md](prepare-an-epd.md) - declaring the result
- [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md) -
  the mix that decides the ranking
- [assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md) -
  where the result is consumed

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a real process recipe with
measured direct emissions, a background release installed under a licence permitting the
intended use, and a reviewer to confirm that the grid sensitivity table and the allocation
statement reproduce from the declared system model and keys.
