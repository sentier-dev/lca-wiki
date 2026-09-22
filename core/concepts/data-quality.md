---
title: Data quality
type: concept
summary: "The six ILCD data quality indicators, what each measures, and how a data set is rated against them."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-compliant-data-guide-2.0, epd-pcr-2019-14]
related: [../standards/ilcd-handbook.md, ../standards/ef-pef.md]
---

# Data quality

Data quality in the ILCD sense is not a single grade but six indicators that describe the
key characteristics of an LCI data set. They are technological, geographical and
time-related representativeness, completeness, precision or uncertainty, and
methodological appropriateness and consistency (ilcd-2010, chapter 12.3). The ILCD
Handbook deliberately does not use proxy indicators such as the age of a data source,
arguing that proxies miss case-specific relevance: four-year-old data is fully
representative for slowly changing basic materials industries and quite outdated for most
IT products (ilcd-2010, chapter 12.3, footnote).

## Why it matters

Data quality requirements are what turn a goal into a testable specification. They are
also what a data user reads to decide whether someone else's data set fits their study.
Without them, "good data" means "the data I could get".

## What the standards say

**ISO 14044 (iso-14044-2006, clauses 4.2.3.6 and 4.3.2.1).** Data quality requirements
shall be specified, covering time-related, geographical and technological coverage,
precision, completeness, representativeness, consistency, reproducibility, sources and
uncertainty. ILCD's Annex A refers to these clauses
(ilcd-2010, chapters 12.2 and 12.3).

**ILCD Handbook (ilcd-2010, chapter 12).** The six indicators, in the handbook's own
wording (ilcd-2010, Table 5):

| Indicator | What it measures |
|---|---|
| Technological representativeness (TeR) | "Degree to which the data set reflects the true population of interest regarding technology, including for included background data sets" |
| Geographical representativeness (GR) | the same, "regarding geography" |
| Time-related representativeness (TiR) | the same, "regarding time / age of the data" |
| Completeness (C) | "Share of (elementary) flows that are quantitatively included in the inventory", judged on a system's level for product and waste flows |
| Precision / uncertainty (P) | "Measure of the variability of the data values for each data expressed (e.g. low variance = high precision)" |
| Methodological appropriateness and consistency (M) | whether the applied LCI methods and choices are in line with the goal and scope and applied consistently across all data |

Two of these, completeness and precision, can be quantified, for example "90 %
completeness" and "+/- 10 % on climate change". The other four are qualitative and are
judged semi-quantitatively by experts, typically during a critical review
(ilcd-2010, chapter 12.3).

**Representativeness versus appropriateness (ilcd-2010, chapter 12.2).** The handbook
separates two things that are easily confused. Representativeness asks how far the
inventory depicts the functional unit or reference flow of the process it claims to be.
Appropriateness asks how far a data set, placed in a particular system model, represents
the process that model actually needs. A 1995 UK production mix data set for low carbon
steel may be highly representative and still be inappropriate in a model that needs a
2005 global consumption mix of high carbon steel (ilcd-2010, chapter 12.2).

**Representativeness has three axes (ilcd-2010, chapters 6.8.2 to 6.8.4).** Technological
representativeness covers technology and operating conditions; geographical
representativeness covers site, region, country, market or continent; time-related
representativeness covers the year, and where applicable intra-annual or intra-daily
differences.

**EF/PEF (ef-compliant-data-guide-2.0).** The Environmental Footprint turns data quality
into a declared, per-data-set rating. An EF-compliant process data set documents its data
quality criteria and rating, its geographical representativeness and its reference year in
the metadata, and must cover all 16 EF impact categories
(ef-compliant-data-guide-2.0, sections 5.2.3, 5.2.4 and 5.2.17). The data set furthest
away from the declared result is reported in the EPD-style documentation
(epd-pcr-2019-14, section 5).

## How it is decided in practice

- Specify the required level per indicator in the scope phase, derived from the intended
  application, rather than grading the data after the fact
  (ilcd-2010, chapter 6.9.2).
- Remember the multiplicative interaction: the weakest indicator typically pulls the
  overall quality down to its level or below, so raising precision on one process while
  completeness is poor buys nothing (ilcd-2010, chapter 6.6.3).
- Document the rating with the data set, so downstream users can judge appropriateness
  for their own model (ilcd-2010, chapter 12.3).
- Use the quality levels and ratings in the handbook's Table 6 rather than inventing a
  local scale (ilcd-2010, chapter 12.3).

## Common pitfalls

- Reporting a single "data quality score" and losing the six dimensions that made it
  actionable.
- Confusing precision with accuracy. Precision is the variability of the data values;
  systematic error and modelling gaps are not captured by it
  (ilcd-2010, chapters 12.3 and 16.1).
- Assuming a highly representative background data set is automatically appropriate for
  the process your model needs (ilcd-2010, chapter 12.2).
- Judging a data set by the age of its source alone, which is the proxy approach ILCD
  explicitly rejects (ilcd-2010, chapter 12.3, footnote).

## Related terms

- [unit process](../../vocabulary.md#unit-processes)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [cut-off](../../vocabulary.md#cut-off)
- [background system](../../vocabulary.md#background)
- [uncertainty](../../vocabulary.md#uncertainty)

## Related pages

- [uncertainty.md](uncertainty.md) — the precision indicator in detail
- [cut-off-criteria.md](cut-off-criteria.md) — the completeness indicator in detail
- [foreground-and-background.md](foreground-and-background.md) — where specific data is
  expected
- [../standards/ef-pef.md](../standards/ef-pef.md) — the EF data set requirements
