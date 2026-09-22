---
title: Life cycle interpretation
type: concept
summary: "Identifying the significant issues, checking completeness, sensitivity and consistency, and drawing conclusions."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006]
related: [../standards/iso-14040-14044.md]
---

# Life cycle interpretation

Interpretation is the fourth LCA phase, and the only one that runs alongside the other
three. It proceeds through three activities: identification of the significant issues,
evaluation by completeness, sensitivity and consistency checks, and conclusions,
limitations and recommendations (ilcd-2010, chapter 9.1, after ISO 14044 Figure).
Interpretation should present the results in an understandable way and help the reader
appraise the robustness of the conclusions and understand the limitations of the study
(ilcd-2010, chapter 9.1).

## Why it matters

Completeness and sensitivity analysis are not only end-of-study activities. The handbook
states that they are applied throughout the study, together with quality checks on unit
process data and LCI results, as part of the iterative loops used in drawing the system
boundary and collecting inventory data; only conclusions and recommendations are done at
the end (ilcd-2010, chapter 9.1). A study that runs its checks once, at the end, has
lost the mechanism that was supposed to steer it.

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.5).** Identification of significant issues,
evaluation by completeness check, sensitivity check and consistency check, and
conclusions, limitations and recommendations. The ILCD chapters map onto clauses 4.5.2
and aspects of 4.4.4 (ilcd-2010, chapter 9.2).

**ILCD Handbook (ilcd-2010, chapter 9).**

- *Significant issues have two faces.* The first is the main contributors: the most
  relevant life cycle stages, processes, elementary flows and impact categories,
  identified through a contribution analysis, also called gravity or weak point analysis,
  by quantifying who contributes how much to the total
  (ilcd-2010, chapter 9.2). Contribution analysis is typically done on three levels: the
  individual elementary flows, the individual impact categories, and the overall
  normalised and weighted impact, the third of which is called dominance analysis
  (ilcd-2010, chapter 9.2).
- *The second face is the choices.* The methodological choices, assumptions, foreground
  and background data, LCIA methods and any normalisation and weighting factors have the
  potential to influence the precision of the result. They are identified differently:
  by running the possible choices as scenarios and comparing the scenario results
  (ilcd-2010, chapter 9.2).
- *Completeness check.* Whether all relevant processes and elementary flows are covered,
  against the cut-off criterion set in the scope. Remaining data gaps shall be reported
  (ilcd-2010, chapter 9.3.2).
- *Sensitivity check.* Whether the achieved accuracy and precision support the
  conclusions (ilcd-2010, chapter 9.3.3).
- *Consistency check.* Whether methods, assumptions and data were applied consistently
  across the analysed alternatives (ilcd-2010, chapter 9.3.4).
- *Conclusions.* Conclusions, limitations and recommendations, with additional
  considerations where two or more systems are compared
  (ilcd-2010, chapter 9.4).

**Where interpretation is misleading.** Annex D of the handbook treats misleading
interpretation, reporting and communication as a separate failure mode from a misleading
goal and scope: a result can be correctly computed and still be presented so that the
reader draws a conclusion the data does not support (ilcd-2010, chapters 15.3 and 15.4).

## How it is decided in practice

1. Run a contribution analysis after the first complete iteration, before improving any
   data. It tells you where the next unit of effort belongs
   (ilcd-2010, chapter 9.2).
2. List the choices that could flip the conclusion, and run each as a scenario. This is
   the only way choice uncertainty becomes visible, because it is discrete rather than
   statistical (ilcd-2010, chapter 16.2).
3. Check completeness against the declared cut-off, not against a feeling of
   thoroughness (ilcd-2010, chapter 9.3.2).
4. For comparisons, check that identical parts of the compared systems were modelled
   identically before claiming a difference (ilcd-2010, chapter 6.10.6).
5. State the limitations in the same place as the conclusions, not in an annex.

## Common pitfalls

- Reporting a single aggregated score without the contribution analysis behind it, so the
  reader cannot see which process drives it.
- Running a Monte Carlo simulation and calling it the uncertainty of the study. It
  captures stochastic parameter uncertainty only, not choices or gaps, and its outcome
  should not be over-interpreted (ilcd-2010, chapter 16.1).
- Declaring a difference between two alternatives significant without a sensitivity check
  on the choices that produced it (ilcd-2010, chapters 9.3.3 and 6.10).
- Leaving the completeness check until the report is written, when the cut-off can no
  longer be changed.

## Related terms

- [comparative assertion](../../vocabulary.md#comparative-assertion)
- [cut-off](../../vocabulary.md#cut-off)
- [environmental impact](../../vocabulary.md#environmental-impact)
- [normalisation](../../vocabulary.md#normalisation)
- [weighting](../../vocabulary.md#weighting)

## Related pages

- [uncertainty.md](uncertainty.md) — the three kinds of uncertainty interpretation has to
  separate
- [data-quality.md](data-quality.md) — the indicators the checks are run against
- [cut-off-criteria.md](cut-off-criteria.md) — what the completeness check measures
- [../standards/iso-14040-14044.md](../standards/iso-14040-14044.md) — clause 4.5
