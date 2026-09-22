---
title: Uncertainty
type: concept
summary: "Stochastic, choice-related and ignorance uncertainty in LCA, and how each is handled."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006]
related: [../standards/ilcd-handbook.md]
---

# Uncertainty

The ILCD Handbook separates three main sources of uncertainty in LCA: stochastic
uncertainty, choice uncertainty, and lack of knowledge of the studied system
(ilcd-2010, chapter 16.1). They behave differently, they are found differently, and only
the first one is what most tools compute.

## Why it matters

An LCA result without an uncertainty statement invites a reader to treat a 3 % difference
as a finding. The handbook warns in the other direction too: the outcome of a stochastic
uncertainty calculation should not be over-interpreted, because it may itself be highly
uncertain and especially biased, as it does not capture systematic uncertainty and gaps
in modelling and data (ilcd-2010, chapter 16.1).

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.5.3.3 and the data quality requirements of
4.2.3.6).** Uncertainty analysis is part of the evaluation in interpretation, and
uncertainty of information is among the data quality requirements that shall be
specified. The ILCD Handbook treats it in Annex E and in the precision indicator of
Annex A (ilcd-2010, chapters 16 and 12.3).

**Where uncertainty comes from (ilcd-2010, chapter 16.2).** Four origins are named: the
inventory data representing elementary flows; the impact assessment data translating
flows into impact scores; the assumptions made when constructing the system, which relate
to the representativeness of the processes used; and the choices made on central
decisions such as the allocation key, the LCIA methodology, or which future developments
are considered.

**Stochastic uncertainty (ilcd-2010, chapter 16.2).** The uncertainty of elementary flow
data and of characterisation factors is statistical. It is described by a mean, a measure
of variation around the mean, and the type of distribution the data follows. Measured
data is often assumed to follow a normal or a lognormal distribution.

**Choice uncertainty (ilcd-2010, chapter 16.2).** The variation that accompanies choices
is discrete: several specific options are possible and the values in between are not.
The handbook lists the methodological choices that qualify: the LCI modelling principle,
the LCI method approaches (and the normalisation basis and weighting set, if included),
cut-off decisions and other system boundary settings, the choice of background data sets,
the choice of impact categories and LCIA methods, and other assumptions such as upper or
lower calorific value. Even within one LCIA methodology there may be a choice of time or
cultural perspective. Because the variation is discrete, it is modelled as distinct
scenarios rather than as a distribution, and the significant choices are identified by
running them as scenarios and comparing the results
(ilcd-2010, chapters 16.2 and 9.2).

**Ignorance (ilcd-2010, chapter 16.2).** The third source is the error attributable to
lack of knowledge about the system, leading to omitted data or incorrect assumptions.
It behaves discretely like choice uncertainty, but because it is not realised it cannot
be handled the way choices are. It is not addressed by quantitative uncertainty
assessment and may be revealed by a qualified peer review.

**Propagating uncertainty (ilcd-2010, chapter 16.3).** Two routes exist. The analytical
solution develops an equation for the distribution of the final result as a function of
the distributions of the process data, which can be approximated by a Taylor expansion
but becomes very complex even for simple systems. Simulation, typically Monte Carlo,
varies each inventory value around its mean following its distribution, recalculates, and
repeats, with the distribution of the results approaching the true distribution as the
number of runs gets sufficiently high, often above 1000. Monte Carlo defaults to treating
all processes and elementary flows as independent, which is often wrong: the same
background process can occur at several places in a system, and both positive and
negative correlation occur, so co-variation must be taken into account when setting up
the simulation (ilcd-2010, chapter 16.3).

## How it is decided in practice

1. Treat the three kinds separately. A distribution is not an answer to a choice, and a
   scenario is not an answer to measurement variability.
2. For stochastic uncertainty, record distribution type, mean and variation with the data,
   not as an afterthought at the end of the study.
3. For choice uncertainty, list the choices that could change the conclusion and run each
   as a scenario (ilcd-2010, chapter 9.2).
4. For ignorance, rely on review. It is the only instrument the handbook names for it
   (ilcd-2010, chapter 16.2).
5. When comparing two systems, check whether the same background process appears in both.
   Independent sampling of a shared process overstates the difference
   (ilcd-2010, chapter 16.3).

## Common pitfalls

- Reporting a Monte Carlo confidence interval as "the uncertainty of the study" when
  choices and gaps dominate it (ilcd-2010, chapter 16.1).
- Sampling shared background processes independently in a comparative Monte Carlo run
  (ilcd-2010, chapter 16.3).
- Assigning default lognormal spreads to every flow without knowing where they came from.
- Confusing precision with representativeness. A precise data set for the wrong
  technology is still the wrong data set (ilcd-2010, chapter 12.2).

## Related terms

- [uncertainty](../../vocabulary.md#uncertainty)
- [characterisation factor](../../vocabulary.md#characterization-factors)
- [background system](../../vocabulary.md#background)
- [allocation](../../vocabulary.md#allocation)
- [cut-off](../../vocabulary.md#cut-off)

## Related pages

- [data-quality.md](data-quality.md) — precision as one of the six indicators
- [interpretation.md](interpretation.md) — the sensitivity check
- [allocation-and-multifunctionality.md](allocation-and-multifunctionality.md) — a large
  source of choice uncertainty
- [../standards/ilcd-handbook.md](../standards/ilcd-handbook.md) — Annex E
