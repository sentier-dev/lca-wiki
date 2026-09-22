---
title: Document data quality and uncertainty
type: use-case
summary: "Turn a study's data into a defensible quality statement: the six ILCD indicators, the three kinds of uncertainty, and what each one is reported as."
audience: [P1]
updated: 2026-09-22
sources: [ilcd-2010, iso-14044-2006, ef-compliant-data-guide-2.0, epd-pcr-2019-14, lca-wiki-editorial]
verified: no
related: [../concepts/data-quality.md, ../concepts/uncertainty.md, ../concepts/interpretation.md, run-a-comparative-lca.md]
---

# Document data quality and uncertainty

**Persona:** P1 practitioner writing the part of the report a reviewer reads first ·
**GICS sector:** any

## Goal

Produce the two statements that let a reader judge whether a result supports its
conclusion: a per-indicator data quality rating for the data the study used, and a
separated account of stochastic, choice and ignorance uncertainty. Both are specified in
the scope phase and filled in as the study runs, not written afterwards
(ilcd-2010, chapters 6.9.2 and 9.1).

An LCA result without an uncertainty statement invites a reader to treat a 3 % difference
as a finding (ilcd-2010, chapter 16.1). A rating without the six dimensions behind it
loses the information that made it actionable
([../concepts/data-quality.md](../concepts/data-quality.md)).

## Prerequisites

- **A goal that states the required accuracy**, because data quality requirements are
  derived from the intended application rather than graded after the fact
  (ilcd-2010, chapter 6.9.2).
- **A first complete iteration of the model**, so a contribution analysis can say which
  data matters ([run-a-screening-lca.md](run-a-screening-lca.md)).
- **The rating scale from the handbook's Table 6** rather than a local scale
  (ilcd-2010, chapter 12.3).
- **Distribution information with the inventory data**, where it exists, recorded with the
  data rather than as an afterthought at the end of the study
  (ilcd-2010, chapter 16.2).

## The six indicators

Data quality in the ILCD sense is not a single grade but six indicators that describe the
key characteristics of an LCI data set (ilcd-2010, chapter 12.3, Table 5):

| Indicator | What it measures | How it is reported |
|---|---|---|
| Technological representativeness (TeR) | how far the data set reflects the true population of interest regarding technology, including for included background data sets | qualitative, judged semi-quantitatively by experts |
| Geographical representativeness (GR) | the same, regarding geography | qualitative |
| Time-related representativeness (TiR) | the same, regarding time and age of the data | qualitative |
| Completeness (C) | the share of elementary flows quantitatively included in the inventory | quantifiable, for example "90 % completeness" |
| Precision / uncertainty (P) | the variability of the data values for each data expressed | quantifiable, for example "+/- 10 % on climate change" |
| Methodological appropriateness and consistency (M) | whether the applied LCI methods and choices follow the goal and scope and are applied consistently across all data | qualitative |

Two of the six can be quantified; the other four are judged semi-quantitatively by
experts, typically during a critical review (ilcd-2010, chapter 12.3). ISO 14044 stands
behind all of them: data quality requirements shall be specified, covering time-related,
geographical and technological coverage, precision, completeness, representativeness,
consistency, reproducibility, sources and uncertainty
(iso-14044-2006, clauses 4.2.3.6 and 4.3.2.1; ilcd-2010, chapters 12.2 and 12.3).

## The three kinds of uncertainty

The handbook separates three sources, and only the first is what most tools compute
(ilcd-2010, chapter 16.1):

- **Stochastic uncertainty.** The uncertainty of elementary flow data and of
  characterisation factors is statistical, described by a mean, a measure of variation
  around the mean, and the type of distribution the data follows; measured data is often
  assumed normal or lognormal (ilcd-2010, chapter 16.2).
- **Choice uncertainty.** Discrete: several specific options are possible and the values in
  between are not. The handbook's list of qualifying choices is the LCI modelling
  principle, the LCI method approaches with the normalisation basis and weighting set,
  cut-off decisions and other system boundary settings, the choice of background data
  sets, the choice of impact categories and LCIA methods, and other assumptions such as
  upper or lower calorific value; even within one LCIA methodology there may be a choice
  of time or cultural perspective (ilcd-2010, chapter 16.2).
- **Ignorance.** The error attributable to lack of knowledge about the system, leading to
  omitted data or incorrect assumptions. It behaves discretely but cannot be handled the
  way choices are, is not addressed by quantitative uncertainty assessment, and may be
  revealed by a qualified peer review (ilcd-2010, chapter 16.2).

## Steps

1. **Specify the required level per indicator in the scope phase**, derived from the
   intended application (ilcd-2010, chapter 6.9.2). Concept page:
   [../concepts/data-quality.md](../concepts/data-quality.md).

2. **Separate representativeness from appropriateness.** Representativeness asks how far
   the inventory depicts the functional unit or reference flow of the process it claims to
   be; appropriateness asks how far a data set, placed in a particular system model,
   represents the process that model actually needs. A 1995 UK production mix data set for
   low carbon steel may be highly representative and still inappropriate in a model that
   needs a 2005 global consumption mix of high carbon steel
   (ilcd-2010, chapter 12.2).

3. **Rate each background data set you used**, on the three representativeness axes:
   technology and operating conditions; site, region, country, market or continent; year,
   and where applicable intra-annual or intra-daily differences
   (ilcd-2010, chapters 6.8.2 to 6.8.4). The database branches carry what each source
   declares about itself: [../../bafu/](../../bafu/) and
   [../../ecoinvent/](../../ecoinvent/).

4. **Record distributions with the data, not at the end.** For stochastic uncertainty,
   distribution type, mean and variation belong on the exchange
   (ilcd-2010, chapter 16.2). Where a tool holds them, see
   [../../brightway/modules/bw2data/use-cases/](../../brightway/modules/bw2data/use-cases/).

5. **Propagate, knowing what propagation covers.** Monte Carlo varies each inventory value
   around its mean following its distribution, recalculates and repeats, with the
   distribution of results approaching the true distribution as the number of runs gets
   sufficiently high, often above 1000 (ilcd-2010, chapter 16.3). The analytical route
   develops an equation for the distribution of the final result but becomes very complex
   even for simple systems (ilcd-2010, chapter 16.3). Calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

6. **Handle co-variation deliberately.** Monte Carlo defaults to treating all processes
   and elementary flows as independent, which is often wrong: the same background process
   can occur at several places in a system, and both positive and negative correlation
   occur, so co-variation must be taken into account when setting up the simulation
   (ilcd-2010, chapter 16.3). In a comparison this is decisive; see
   [run-a-comparative-lca.md](run-a-comparative-lca.md).

7. **Run the choices as scenarios.** Because choice uncertainty is discrete, the
   significant choices are identified by running them as scenarios and comparing the
   results, not by widening a distribution
   (ilcd-2010, chapters 16.2 and 9.2). Concept page:
   [../concepts/uncertainty.md](../concepts/uncertainty.md).

8. **Rely on review for ignorance.** It is the only instrument the handbook names for it
   (ilcd-2010, chapter 16.2), which is one reason a critical review is a methodological
   step rather than an administrative one
   ([../concepts/interpretation.md](../concepts/interpretation.md)).

9. **Check completeness against the declared cut-off**, and report the remaining data gaps
   (ilcd-2010, chapter 9.3.2). See
   [../concepts/cut-off-criteria.md](../concepts/cut-off-criteria.md).

10. **Meet the rule set's own reporting form, where one applies.** An EF-compliant process
    data set documents its data quality criteria and rating, its geographical
    representativeness and its reference year in the metadata, and must cover all 16 EF
    impact categories (ef-compliant-data-guide-2.0, sections 5.2.3, 5.2.4 and 5.2.17); an
    EPD-style documentation reports the data set furthest away from the declared result
    (epd-pcr-2019-14, section 5). See [run-a-pef-study.md](run-a-pef-study.md) and
    [prepare-an-epd.md](prepare-an-epd.md).

## Expected output

- **A data quality table**: one row per data set or per group of data sets, six columns
  for the indicators, with the two quantifiable ones carrying numbers and the four
  qualitative ones carrying the handbook's rating levels
  (ilcd-2010, chapter 12.3).
- **An appropriateness note** per background data set: why this data set fits the process
  the model needs, not only what it represents (ilcd-2010, chapter 12.2).
- **A distribution inventory**: which exchanges carry a distribution, which carry a
  default, and where the defaults came from.
- **A propagation result**: the distribution of the indicator results per impact category,
  with the number of runs stated (ilcd-2010, chapter 16.3).
- **A scenario table** for choice uncertainty: one row per choice, one column per impact
  category (ilcd-2010, chapter 9.2).
- **A gap and limitation statement** covering ignorance, placed with the conclusions
  rather than in an annex (ilcd-2010, chapters 9.3.2 and 9.4).

Report the quality statement as a table of dimensions, not as a single score
(lca-wiki-editorial).

## Pitfalls

- **Reporting a single "data quality score"** and losing the six dimensions that made it
  actionable (ilcd-2010, chapter 12.3).
- **Confusing precision with accuracy.** Precision is the variability of the data values;
  systematic error and modelling gaps are not captured by it
  (ilcd-2010, chapters 12.3 and 16.1).
- **Reporting a Monte Carlo confidence interval as "the uncertainty of the study"** when
  choices and gaps dominate it. The handbook warns that the outcome of a stochastic
  uncertainty calculation may itself be highly uncertain and especially biased, because it
  does not capture systematic uncertainty and gaps in modelling and data
  (ilcd-2010, chapter 16.1).
- **Sampling shared background processes independently** in a comparative run
  (ilcd-2010, chapter 16.3).
- **Assigning default lognormal spreads to every flow** without knowing where they came
  from ([../concepts/uncertainty.md](../concepts/uncertainty.md)).
- **Raising precision on one process while completeness is poor.** The indicators interact
  multiplicatively and the weakest typically pulls the overall quality down to its level or
  below (ilcd-2010, chapters 6.6.3 and 12.3).
- **Judging a data set by the age of its source alone**, which is the proxy approach ILCD
  explicitly rejects: four-year-old data is fully representative for slowly changing basic
  materials industries and quite outdated for most IT products
  (ilcd-2010, chapter 12.3, footnote).
- **Writing the quality section last.** Completeness and sensitivity analysis are applied
  throughout the study as part of its iterative loops (ilcd-2010, chapter 9.1).

## Related vocabulary

- [data quality](../../vocabulary.md#data-quality)
- [uncertainty](../../vocabulary.md#uncertainty)
- [cut-off](../../vocabulary.md#cut-off)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [characterisation factors](../../vocabulary.md#characterization-factors)
- [background](../../vocabulary.md#background)
- [metadata](../../vocabulary.md#metadata)

## Related pages

- [../concepts/data-quality.md](../concepts/data-quality.md) - the six indicators in
  detail
- [../concepts/uncertainty.md](../concepts/uncertainty.md) - the three kinds in detail
- [run-a-comparative-lca.md](run-a-comparative-lca.md) - where co-variation decides the
  answer
- [choose-a-background-database.md](choose-a-background-database.md) - the choice this
  statement has to justify

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need a model with real distribution
data on its exchanges, a Monte Carlo implementation, a second reviewer to supply the
expert judgement the four qualitative indicators need, and a study long enough for the
iterative loops described here to actually run more than once.
