---
title: Assess an agricultural product in Consumer Staples
type: use-case
summary: "Model a food or beverage product where primary production decides the answer: field emissions, the crop and residue allocation, the milk and meat split, and the PEFCR that governs it."
audience: [P1]
updated: 2026-09-22
sources: [gics-2023, ef-pef-method, eu-recommendation-2021-2279, epd-international-pcr-library, sentier-inventory-readme, bafu-2026-release, ilcd-2010, lca-wiki-editorial]
verified: no
related: [../sectors/consumer-staples.md, ../concepts/allocation-and-multifunctionality.md, run-a-pef-study.md, ../concepts/functional-unit.md, document-data-quality-and-uncertainty.md]
---

# Assess an agricultural product in Consumer Staples

**Persona:** P1 practitioner at a food or beverage producer, a retailer or a consultancy
answering a PEFCR · **GICS sector:** Consumer Staples, GICS code 30, industry groups 3010
Consumer Staples Distribution & Retail, 3020 Food, Beverage & Tobacco and 3030 Household
& Personal Products (gics-2023); see
[../sectors/consumer-staples.md](../sectors/consumer-staples.md)

## Goal

Produce a profile for a mass of agri-food product at a named gate, often qualified by a
nutritional or functional basis, in a sector where the agricultural stage decides almost
everything and where a category rule usually already exists
([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).

This is the sector with the most developed rule set, and the one where allocation between
a crop and its residues, and between milk and meat, is a recurring and contested
decision, which is precisely why the sector has category rules
([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).

## Prerequisites

- **Data.** A farm or a factory inventory: yields, inputs, energy, and the emission model
  behind the field emissions
  ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).
- **Standards.** Check the PEFCR list first: five of the six PEFCRs the Commission lists
  as in revision sit in this sector, Feed for Food-Producing Animals, Beer, Pasta, Pet
  Food and Dairy Products, with Marine Fish in development (ef-pef-method). If a PEFCR exists, it
  should be used (eu-recommendation-2021-2279, section 2). The International EPD System's
  PCR library carries `Food & beverages` (epd-international-pcr-library).
- **Tools and background data.** Sentier inventory folder `01-agriculture`, which holds
  the highest-precedence rank in the inventory, with `03-chemicals` for fertiliser and
  crop protection and `06-waste` for residues and packaging waste
  (sentier-inventory-readme); BAFU:2026 top-level categories `agricultural`,
  `food industry` and `landfarming` (bafu-2026-release).

## Which rule set governs

This sector has more rule sets than most, and they do not stack. Establishing which one
governs is the first hour of the project (lca-wiki-editorial).

| Situation | Rule set | Consequence for the study |
|---|---|---|
| The product sits under a listed PEFCR | that PEFCR, under Recommendation (EU) 2021/2279 | scope, benchmark, data quality and reporting are prescribed; the work is conformity (eu-recommendation-2021-2279, section 2) |
| A PEF claim without a valid PEFCR | the PEF method plus the 2026 transitional data guidance | the three-step data hierarchy and the 10 % disclaimer apply ([run-a-pef-study.md](run-a-pef-study.md)) |
| A programme EPD | the `Food & beverages` PCR family of the programme operator | declared unit and template come from the PCR (epd-international-pcr-library) |
| An internal or customer study | ISO 14040/44 and the ILCD Handbook | every decision on this page is the practitioner's, and is documented ([../standards/iso-14040-14044.md](../standards/iso-14040-14044.md)) |

Five PEFCRs in revision sit in this sector, Feed for Food-Producing Animals, Beer, Pasta,
Pet Food and Dairy Products, with Marine Fish in development (ef-pef-method), so a product
that was outside the system last year may be inside it this year.

## Steps

1. **Check for a PEFCR before writing any scope.** Where one exists it fixes the
   functional unit, the boundary, the benchmark and the reporting template, and the study
   becomes a conformity exercise (eu-recommendation-2021-2279, section 2). The whole route
   is [run-a-pef-study.md](run-a-pef-study.md); the standard page is
   [../standards/ef-pef.md](../standards/ef-pef.md).

2. **Fix the functional unit and its basis.** A mass of product at a named gate, often
   qualified by a nutritional or functional basis, per kg, per serving, or per litre of a
   defined product ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).
   Mass alone is not a function when the products differ in what they deliver
   ([../concepts/functional-unit.md](../concepts/functional-unit.md)).

3. **Build the field emission model explicitly.** Field emissions of nitrous oxide,
   enteric methane, manure management and land use are what an agri-food result is made
   of ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)), and they come
   from an emission model rather than from a measurement, so the model and its tier are
   part of the method statement
   ([../concepts/life-cycle-inventory.md](../concepts/life-cycle-inventory.md)).

4. **Settle the allocation between crop and residues, and between milk and meat.** Follow
   the ISO hierarchy, avoid allocation by subdivision or system expansion, then partition
   by a physical relationship, then by another relationship
   (ilcd-2010, chapter 6.5.3.2), unless the PEFCR prescribes a key, in which case the
   PEFCR wins (eu-recommendation-2021-2279, section 2). Concept page:
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

5. **Install the background and link the farm gate to processing.** Loader:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the `01-agriculture` folder and its rank precedence in
   [../../sentier/modules/sentier-inventory/use-cases/](../../sentier/modules/sentier-inventory/use-cases/);
   the BAFU release in [../../bafu/use-cases/](../../bafu/use-cases/). For Agribalyse-facing
   work in this sector, the public module is
   [../../sentier/modules/sentier-agribalyse/use-cases/](../../sentier/modules/sentier-agribalyse/use-cases/).

6. **Add processing, packaging and retail without expecting them to lead.** They are
   visible but rarely decisive next to primary production
   ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).

7. **For household and personal products, shift the model.** The picture moves to the
   chemical feedstock and, where the product is used with hot water, to the use phase
   ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)), which pulls in
   [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md).

8. **Characterise, and under a PEFCR report all 16 EF categories.** An EF study reports
   all of them (ef-pef-method via
   [../standards/ef-pef.md](../standards/ef-pef.md)). Calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

9. **Flag the currency of the agricultural background.** BAFU states that most of the data
   in the agricultural sector of BAFU:2026 will be updated over the following two years,
   and that inventories labelled for update are usable but flagged as needing one
   (bafu-2026-release). A study that rests on that part of the database should say so
   ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).

10. **Report the standing gaps.** Regionalised water and land use, and primary data from
    farms outside the study's own country, are the sector's persistent absences
    ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)). See
    [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

## Expected output

- **An inventory table** in two blocks: the farm gate, with yields, fertiliser and crop
  protection inputs, energy, manure management and the modelled field emissions; and the
  downstream, with processing, packaging, distribution and retail.
- **An allocation statement** naming the key used between crop and residues and between
  milk and meat, the ISO step it sits at, and whether the PEFCR prescribed it
  (ilcd-2010, chapter 6.5.3.2; eu-recommendation-2021-2279, section 2).
- **An impact profile** per functional unit, across all 16 EF categories under a PEFCR,
  with the normalised results and the single overall score where the method requires them
  ([../standards/ef-pef.md](../standards/ef-pef.md)).
- **A contribution split** between primary production, processing, packaging and retail,
  which is the finding a producer acts on.
- **A scenario table** over the allocation key, the emission model tier and the background
  vintage.
- **A data currency note** on the agricultural background used (bafu-2026-release).

## Pitfalls

- **Writing a scope when a PEFCR already exists.** If a PEFCR exists it should be used
  (eu-recommendation-2021-2279, section 2), and four in this sector are in revision
  (ef-pef-method).
- **Comparing per kilogram across products with different nutritional function**, which is
  the sector's version of a functional unit that hides a performance difference
  (ilcd-2010, chapter 15.2.1).
- **Treating the crop and residue allocation as a data problem.** It is a contested
  methodological decision and the reason the category rules exist
  ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).
- **Hiding the field emission model.** The model, its tier and its parameters are part of
  the result, not an implementation detail.
- **Using agricultural background data flagged for update without saying so**
  (bafu-2026-release).
- **Claiming regionalised water or land use results the data does not support**
  ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).
- **Using foreign farm averages for a local claim**, which is the other standing gap in
  the sector ([../sectors/consumer-staples.md](../sectors/consumer-staples.md)).

## What this use case does not cover

- **Retail and distribution as a subject in their own right.** GICS industry group 3010
  Consumer Staples Distribution & Retail is a different study: the object is a store or a
  logistics network, not a product (gics-2023;
  [../sectors/consumer-staples.md](../sectors/consumer-staples.md)).
- **Tobacco.** It sits in industry group 3020 (gics-2023) but shares neither the
  nutritional functional unit nor the category rules described here.
- **Land use change accounting.** It is decisive for several commodities and is governed
  by the applicable PEFCR or programme rule rather than by a generic procedure
  (eu-recommendation-2021-2279, section 2); this wiki has no sourced page on it yet.
- **The emission models themselves.** The tier and parameters of a field emission model
  come from the model's own documentation, which is outside this wiki
  (lca-wiki-editorial).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [allocation](../../vocabulary.md#allocation)
- [co-product](../../vocabulary.md#co-product)
- [multifunctional process](../../vocabulary.md#multifunctional-process)
- [PEFCR](../../vocabulary.md#pefcr)
- [single overall score](../../vocabulary.md#single-overall-score)
- [data quality](../../vocabulary.md#data-quality)

## Related pages

- [../sectors/consumer-staples.md](../sectors/consumer-staples.md) - what dominates, what
  is missing, which rules apply
- [run-a-pef-study.md](run-a-pef-study.md) - the rule set this sector most often falls
  under
- [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md) -
  the decision the sector is built around
- [assess-a-material-in-materials.md](assess-a-material-in-materials.md) - packaging and
  chemical feedstock

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a real farm inventory, an
emission model with its parameters, the applicable PEFCR in its current revision, a
background release installed, and a reviewer eligible under the EF data guide to confirm
that the allocation statement and the 16-category profile would be accepted.
