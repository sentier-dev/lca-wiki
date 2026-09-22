---
title: Goal and scope definition
type: concept
summary: "The first phase of an LCA: why the study is done, for whom, and what exactly is modelled and how."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14040-2006, iso-14044-2006, eu-recommendation-2021-2279]
related: [../standards/iso-14040-14044.md, ../standards/ilcd-handbook.md]
---

# Goal and scope definition

Goal and scope definition is the first of the four LCA phases. The goal says why the
study is carried out, for which application and for which audience; the scope says what
is modelled and how, from the [functional unit](../../vocabulary.md#functional-unit) and
the [system boundary](../../vocabulary.md#system-boundary) down to the data quality that
has to be reached. The ILCD Handbook treats the two as separate chapters and adds
guidance that ISO 14044 leaves to the practitioner (ilcd-2010, chapters 5 and 6).

## Why it matters

Almost every later dispute in an LCA is a goal and scope dispute that was not settled
early. Whether two products may be compared at all, whether a co-product is credited or
partitioned, whether 5 % of the impact may be cut off: all of this follows from the goal.
The ILCD Handbook is explicit that LCA is iterative, so the scope settings made at the
start are refined as inventory and impact assessment reveal more, with a possible limited
revision of goal and scope, until the required accuracy and completeness are reached
(ilcd-2010, chapter 4).

The goal also decides who may read the result. A study that supports a
[comparative assertion](../../vocabulary.md#comparative-assertion) disclosed to the
public is bound by stricter rules than an internal screening, including the ISO
prohibition on publishing weighted results (ilcd-2010, chapter 8.4).

## What the standards say

**ISO 14040 and 14044 (iso-14040-2006, iso-14044-2006).** The goal shall state the
intended application, the reasons for carrying out the study, the intended audience and
whether the results are intended to be used in comparative assertions disclosed to the
public. The scope shall state the product system, its functions, the functional unit, the
system boundary, allocation procedures, impact categories and methodology,
interpretation, data requirements, assumptions, limitations, data quality requirements,
the type of critical review and the report format. The ILCD Handbook cross-references
these clauses chapter by chapter (ilcd-2010, chapters 5 and 6).

**ILCD Handbook (ilcd-2010).** The general guide breaks the goal into six aspects:
intended applications; method, assumption and impact limitations; the reasons for the
study and the decision context; the target audience; whether comparisons will be
disclosed to the public; and the commissioner and other influential actors
(ilcd-2010, chapter 5.2). It then adds a step ISO does not have: classifying the
decision context as Situation A ("micro-level decision support"), Situation B
("meso/macro-level decision support") or Situation C ("accounting"). Situation A covers
decisions with limited and no structural consequences outside the decision context;
Situation B covers decisions assumed to change available production capacity; Situation C
is purely descriptive documentation of a system's life cycle, without interest in
consequences elsewhere (ilcd-2010, "Approach taken and key issues addressed in this
document" and chapter 5.3). The situation then drives the LCI modelling provisions,
including how multifunctionality is solved (ilcd-2010, chapter 6.5.4).

**EF/PEF (eu-recommendation-2021-2279).** The Environmental Footprint methods fix much of
the scope in advance. Where a Product Environmental Footprint Category Rule (PEFCR)
exists, it "should be used for calculating the environmental footprint of a product
belonging to that product category", and the same holds for an Organisation Environmental
Footprint Sector Rule (OEFSR) at sector level (eu-recommendation-2021-2279, section 2).
A PEF practitioner therefore spends far less time defining scope and far more time
demonstrating conformity with a rule someone else wrote.

## How it is decided in practice

The practitioner has to answer, in writing and before modelling:

- **What decision is this study meant to inform, and by whom?** This fixes the ILCD
  situation, and through it the modelling principle
  ([attributional](../../vocabulary.md#attributional-modelling) or
  [consequential](../../vocabulary.md#consequential-modelling)) and the treatment of
  multifunctionality (ilcd-2010, chapters 5.3 and 6.5.4).
- **Will results be disclosed publicly as a comparison?** If yes, the study needs a
  critical review by interested parties, a functional unit that genuinely makes the
  alternatives comparable, and no published weighting (ilcd-2010, chapters 6.10 and 8.4).
- **Is there a PEFCR, OEFSR or product category rule that applies?** If so, most of the
  scope is already written (eu-recommendation-2021-2279, section 2).
- **What accuracy does the conclusion need?** This sets the cut-off and the data quality
  requirements, which the ILCD Handbook explicitly derives from the intended application
  rather than from a fixed percentage (ilcd-2010, chapter 6.6.3).

A goal and scope that cannot be read back as a set of testable requirements is not
finished. The ILCD Handbook's Annex D is a catalogue of the ways a goal and scope
definition misleads: a functional unit that hides a performance difference, a system
boundary drawn to favour one alternative, an LCIA method chosen after the results were
seen (ilcd-2010, chapter 15).

## Common pitfalls

- Writing the goal after the model exists, so that the scope describes what was done
  rather than what was needed.
- Treating "accounting" and "decision support" as the same question. ILCD separates them
  precisely because they take different LCI models (ilcd-2010, chapter 5.3).
- Leaving the decision on normalisation and weighting open. Under ILCD it is taken in the
  scope phase and is binding for the rest of the study (ilcd-2010, chapters 6.7.7 and 8.3).
- Deferring the data quality requirements, which then become whatever the data happened
  to be.

## Related terms

- [functional unit](../../vocabulary.md#functional-unit)
- [system boundary](../../vocabulary.md#system-boundary)
- [comparative assertion](../../vocabulary.md#comparative-assertion)
- [attributional modelling](../../vocabulary.md#attributional-modelling)
- [consequential modelling](../../vocabulary.md#consequential-modelling)

## Related pages

- [functional-unit.md](functional-unit.md) — the quantitative anchor the scope has to fix
- [system-boundary.md](system-boundary.md) — what the scope includes and excludes
- [attributional-vs-consequential.md](attributional-vs-consequential.md) — the modelling
  principle the goal selects
- [../standards/iso-14040-14044.md](../standards/iso-14040-14044.md) — the clauses behind
  this page
- [../standards/ilcd-handbook.md](../standards/ilcd-handbook.md) — the situations A, B, C
