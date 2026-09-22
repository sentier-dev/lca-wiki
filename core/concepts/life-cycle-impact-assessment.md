---
title: Life cycle impact assessment
type: concept
summary: "Turning an inventory of elementary flows into indicator results per impact category."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-methods-lca, ilcd-format-1.1-docs, ef-compliant-data-guide-2.0, ef-data-guide-3.1-addendum]
related: [../standards/iso-14040-14044.md, ../standards/ef-pef.md]
---

# Life cycle impact assessment

Life cycle impact assessment (LCIA) is the third LCA phase. It assigns each
[elementary flow](../../vocabulary.md#elementary-flow) in the inventory to the
[impact categories](../../vocabulary.md#impact-category) it contributes to
("classification"), multiplies it by a
[characterisation factor](../../vocabulary.md#characterization-factors)
("characterisation"), and sums the result per category
(ilcd-2010, chapter 8.2). Optional further steps are
[normalisation](../../vocabulary.md#normalisation) and
[weighting](../../vocabulary.md#weighting), each with its own page section below.

## Why it matters

LCIA is where an inventory of thousands of substances becomes a handful of numbers a
decision maker can read. It is also where a missing characterisation factor silently
removes a flow from the result. The ILCD Handbook requires that if a characterisation
factor is missing for a flow known to contribute to an impact category, its potential
importance is checked; if the contribution may be significant, an estimate should be
attempted, and if that is impossible the missing factor must be reported and its
potential influence considered in the interpretation (ilcd-2010, chapter 8.2).

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.4).** Selection of impact categories, category
indicators and models, then classification and characterisation as mandatory elements;
normalisation, grouping and weighting as optional elements. Weighting shall not be used
in studies leading to comparative assertions intended to be disclosed to the public
(ilcd-2010, chapters 8.2 and 8.4).

**ILCD Handbook (ilcd-2010).** The choice of LCIA methods, the impact level (midpoint or
endpoint), the normalisation basis and the weighting set are all scope decisions, taken
and documented before the inventory work and binding afterwards
(ilcd-2010, chapters 6.7.2, 6.7.6 and 6.7.7). The handbook also gives rules for flows the
inventory should not contain, because impact assessment cannot use them: process-specific
composed emissions, sum indicators such as "Metals", and unspecified flows such as
"Biomass" or "Renewable energy" shall be resolved into individual substances or estimated
from composition data (ilcd-2010, chapter 8.2). For emissions to a sub-compartment with
no specific factor, the factor of the parent compartment shall be assigned
(ilcd-2010, chapter 8.2).

**ILCD data format (ilcd-format-1.1-docs).** An LCIA method is itself an exchangeable
data set. The LCIA method data set carries `characterisationFactors` as a flow list with
the corresponding factors, an `impactCategory` from a fixed enumeration, an
`impactIndicator` describing what the indicator means, and an `areaOfProtection` with the
values "Natural resources", "Human health", "Natural environment" and "Man-made
environment"; the data set type distinguishes midpoint from damage indicators.

**EF/PEF (ef-methods-lca).** The Environmental Footprint methods fix a closed list of 16
impact categories with their indicators: climate change (kg CO2 eq), ozone depletion
(kg CFC-11 eq), human toxicity cancer and non-cancer (CTUh), particulate matter (disease
incidence), ionising radiation (kBq U-235 eq), photochemical ozone formation (kg NMVOC
eq), acidification (mol H+ eq), eutrophication terrestrial (mol N eq), freshwater (kg P
eq) and marine (kg N eq), ecotoxicity freshwater (CTUe), land use (points), water use
(m3 world eq related to local scarcity), resource use fossils (MJ) and resource use
minerals and metals (kg Sb eq). An EF-compliant data set shall cover all 16
(ef-compliant-data-guide-2.0, section 5.2.17). The EF reference package ships the
characterisation factors as ILCD `lciamethods` XML files, one per impact category
(ef-compliant-data-guide-2.0, chapter 2).

## How it is decided in practice

- Choose midpoint, endpoint or both, and say so in the scope. The handbook treats this as
  a scope decision, not a presentation choice (ilcd-2010, chapter 6.7.2).
- Check coverage: run the inventory against the chosen method and list the flows that
  received no factor, then judge whether any of them could matter
  (ilcd-2010, chapter 8.2).
- If the study follows a PEFCR or OEFSR, the method set is not a choice; the EF reference
  package supplies it (ef-compliant-data-guide-2.0, chapter 2).
- Decide normalisation and weighting in the scope phase. They may be needed as an interim
  step to express the cut-off criteria, in which case the figures do not have to stay in
  the report (ilcd-2010, chapter 8.2).

## Common pitfalls

- Comparing results computed with different method versions. An EF 3.0 result and an
  EF 3.1 result differ because characterisation factors changed, for example climate
  change updated to IPCC 2021 and a revision of ecotoxicity and toxicity factors
  (ef-data-guide-3.1-addendum).
- Summing normalised results across categories without declaring it as weighting with
  equal weights (ilcd-2010, chapter 8.3).
- Publishing weighted results for a public comparative assertion, which ISO forbids
  (ilcd-2010, chapter 8.4).
- Creating new flows in a tool that the method package does not know, then reading the
  missing impact as zero (ilcd-2010, chapter 8.2).

## Related terms

- [impact category](../../vocabulary.md#impact-category)
- [characterisation factor](../../vocabulary.md#characterization-factors)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [normalisation](../../vocabulary.md#normalisation)
- [weighting](../../vocabulary.md#weighting)

## Related pages

- [characterization-normalisation-weighting.md](characterization-normalisation-weighting.md)
  — the three steps in detail
- [life-cycle-inventory.md](life-cycle-inventory.md) — what LCIA consumes
- [interpretation.md](interpretation.md) — what happens to the indicator results
- [../standards/ef-pef.md](../standards/ef-pef.md) — the EF impact category set
