---
title: Characterisation, normalisation and weighting
type: concept
summary: "The mandatory and optional LCIA steps, what each one adds, and what ISO forbids publishing."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-methods-lca, ef-compliant-data-guide-2.0, eu-recommendation-2021-2279]
related: [../standards/iso-14040-14044.md, ../standards/ef-pef.md]
---

# Characterisation, normalisation and weighting

Impact assessment runs in steps of decreasing objectivity. Classification assigns each
[elementary flow](../../vocabulary.md#elementary-flow) to the
[impact categories](../../vocabulary.md#impact-category) it contributes to;
characterisation multiplies each flow by its
[characterisation factor](../../vocabulary.md#characterization-factors) and sums per
category; [normalisation](../../vocabulary.md#normalisation) expresses the result relative
to a reference; [weighting](../../vocabulary.md#weighting) multiplies the categories by
relative importance factors so they can be summed
(ilcd-2010, chapters 8.2 to 8.4). The first two are mandatory under ISO 14044, the last
two optional.

## Why it matters

Each step buys readability and spends objectivity. Characterised results are defensible
per category but hard to compare across categories; a single weighted score is easy to
read and carries a value judgement that is not scientific. ISO draws the line by
forbidding weighting in studies leading to
[comparative assertions](../../vocabulary.md#comparative-assertion) intended to be
disclosed to the public (ilcd-2010, chapter 8.4).

## What the standards say

**Classification and characterisation (ilcd-2010, chapter 8.2).** All elementary flows of
the inventory shall be assigned to the impact categories they contribute to, and
characterised with the factors of the chosen method. The handbook adds the rule for
missing factors: check the potential importance of the flow, estimate the factor if the
contribution could be significant, and if estimation is impossible, report the missing
factor and consider its potential influence in the interpretation.

**Normalisation (ilcd-2010, chapter 8.3, referring to ISO 14044 clause 4.4.3.2).**
Normalised results are obtained by dividing the LCIA results by the normalisation basis,
separately for each impact category at midpoint level or for each area of protection at
endpoint level. They give the relative share of the analysed system's impact in the total
impact of that category, per average citizen, globally or per country, so it becomes
visible which topics the system contributes relatively more to. Normalisation is optional
under ISO, but it is a required step under ILCD whenever the cut-off criterion was
expressed against the normalised and weighted overall impact
(ilcd-2010, chapters 8.3 and 6.6.3).

**Why normalised results must not simply be added (ilcd-2010, chapter 8.3).** Different
midpoint topics are typically judged to be of different absolute relevance; normalised
results reflect only the contribution of the system to a total impact potential, not the
severity of that total. Summing them directly is equivalent to choosing equal weights, so
a weighting is always at least implicitly involved. If summing or comparison across
normalised results is intended, it shall include an explicit weighting step with equal
weights. The same holds at endpoint level.

**Weighting (ilcd-2010, chapter 8.4, referring to ISO 14044 clause 4.4.3.4).** Weighting
assigns distinct quantitative weights to the impact categories expressing their relative
importance, and the normalised and weighted results may then be summed across categories
or areas of protection. Under ISO 14044 weighting shall not be used in studies leading to
comparative assertions intended to be disclosed to the public. Where normalisation and
weighting are used only as an interim step to quantify the cut-off, the resulting figures
need not stay in the data set or report (ilcd-2010, chapter 8.2).

**Binding scope decisions (ilcd-2010, chapters 6.7.6 and 6.7.7).** Whether normalisation
and weighting are included, which normalisation basis and which weighting set are used,
is decided and documented in the first scope definition, and shall not be changed later
during the study.

**EF/PEF (ef-methods-lca, eu-recommendation-2021-2279).** The Environmental Footprint
methods include normalisation and weighting as part of the method rather than as an
option, a change introduced during the pilot phase
(eu-recommendation-2021-2279, recital 6). The method fixes 16 impact categories with
their indicators and units (ef-methods-lca), and an EF-compliant data set must cover all
16, with weighted shares used in the data quality rating
(ef-compliant-data-guide-2.0, sections 5.2.17 and 4). The EF reference package ships the
characterisation factors, with the normalisation and weighting configuration in the
package's configuration file (ef-compliant-data-guide-2.0, chapter 2).

## How it is decided in practice

- Decide at scope time whether the study will normalise and weight at all, and record the
  basis and the set (ilcd-2010, chapter 6.7.7).
- For an internal study, using several weighting approaches and value perspectives helps
  demonstrate robustness (ilcd-2010, chapter 8.2).
- For a public comparison, present characterised results per category and stop there
  (ilcd-2010, chapter 8.4).
- Under a PEFCR or OEFSR, take the method, normalisation and weighting from the EF
  reference package rather than choosing (ef-compliant-data-guide-2.0, chapter 2).

## Common pitfalls

- Adding normalised results into a single number and calling it a footprint. That is
  weighting with equal weights, undeclared (ilcd-2010, chapter 8.3).
- Publishing a weighted single score alongside a public comparative claim
  (ilcd-2010, chapter 8.4).
- Changing the normalisation basis after seeing the results, which the handbook forbids
  as a binding scope decision (ilcd-2010, chapter 6.7.6).
- Comparing normalised results computed against different normalisation bases, for
  example a global and a European one.

## Related terms

- [characterisation factor](../../vocabulary.md#characterization-factors)
- [impact category](../../vocabulary.md#impact-category)
- [normalisation](../../vocabulary.md#normalisation)
- [weighting](../../vocabulary.md#weighting)
- [comparative assertion](../../vocabulary.md#comparative-assertion)

## Related pages

- [life-cycle-impact-assessment.md](life-cycle-impact-assessment.md) — the phase these
  steps belong to
- [cut-off-criteria.md](cut-off-criteria.md) — where normalisation becomes mandatory
- [interpretation.md](interpretation.md) — what the results are used for
- [../standards/ef-pef.md](../standards/ef-pef.md) — the EF category set and reference
  package
