---
title: Run a comparative LCA
type: use-case
summary: "Compare two or more systems on one function, up to and including a comparative assertion disclosed to the public, with the critical review ISO requires."
audience: [P1]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, iso-14040-2006, lca-wiki-editorial]
verified: no
related: [../concepts/functional-unit.md, ../concepts/interpretation.md, ../standards/iso-14040-14044.md, run-a-screening-lca.md, document-data-quality-and-uncertainty.md]
---

# Run a comparative LCA

**Persona:** P1 practitioner producing a study that names a winner ·
**GICS sector:** any

## Goal

Compare two or more product systems that deliver the same function and state, defensibly,
whether one is environmentally preferable. The output is either an internal comparison or
a [comparative assertion](../../vocabulary.md#comparative-assertion)
[disclosed to the public](../../vocabulary.md#disclosed-to-the-public), and the second
carries obligations the first does not: a critical review by interested parties, and a
prohibition on publishing weighted results
(ilcd-2010, chapters 6.10, 8.4, 10 and 11).

This page is the methodological spine. The commands that build and score the alternatives
live in the module use-case folders it links to (lca-wiki-editorial).

## Prerequisites

- **A screening pass on each alternative**, so you know before you commit that the
  alternatives are distinguishable at all
  ([run-a-screening-lca.md](run-a-screening-lca.md)).
- **One function, quantified**, that every alternative genuinely delivers
  ([../concepts/functional-unit.md](../concepts/functional-unit.md)).
- **One background database and one LCIA method for every alternative.** Mixing
  backgrounds between the compared systems destroys the consistency check before it is
  run ([choose-a-background-database.md](choose-a-background-database.md)).
- **A reviewer, or a review panel,** identified before the modelling starts if the result
  will be a public comparative assertion (ilcd-2010, chapter 11).
- **A decision on normalisation and weighting**, taken in the scope phase and binding for
  the rest of the study (ilcd-2010, chapters 6.7.6 and 6.7.7).

## Steps

1. **Declare the comparative intent in the goal.** ISO 14044 clause 4.2.2 requires the
   goal to state whether the results are intended for comparative assertions disclosed to
   the public; that single sentence pulls in the review requirement and the weighting
   prohibition (ilcd-2010, chapters 5 and 8.4). Concept page:
   [../concepts/goal-and-scope.md](../concepts/goal-and-scope.md); standard:
   [../standards/iso-14040-14044.md](../standards/iso-14040-14044.md).

2. **Build the functional unit so the comparison is honest.** Separate obligatory
   properties, the ones a product must have to be in the comparison at all, from
   positioning properties, which differentiate products inside it
   (ilcd-2010, chapters 6.4.3 and 6.4.4). Separate duration of use from quantity of
   function delivered: the handbook names clothes, mobile phones and TV sets as cases
   where possession time is unsuitable for comparison
   (ilcd-2010, chapter 6.4.2). Concept page:
   [../concepts/functional-unit.md](../concepts/functional-unit.md).

3. **Draw the same boundary around every alternative.** The parts the alternatives share
   are modelled identically or they are left out of both; the parts that differ are where
   the study lives ([../concepts/system-boundary.md](../concepts/system-boundary.md)).

4. **Use one modelling principle throughout.** Attributional modelling inventories the
   flows of all processes of a system as they occur; consequential modelling depicts the
   consequences of a decision. The ILCD decision situation chosen in step 1 selects one of
   them, and the choice then drives how multifunctionality is solved
   (ilcd-2010, chapters 6.5.2 and 6.5.4). Concept pages:
   [../concepts/attributional-vs-consequential.md](../concepts/attributional-vs-consequential.md)
   and
   [../concepts/allocation-and-multifunctionality.md](../concepts/allocation-and-multifunctionality.md).

5. **Solve multifunctionality the same way on both sides.** The ISO hierarchy is to avoid
   allocation by subdivision or system expansion, then to partition by a physical
   relationship, then by another relationship (ilcd-2010, chapter 6.5.3.2). Applying
   substitution to one alternative and partitioning to the other is a difference in method
   reported as a difference in product.

6. **Build both inventories against the same background.** Install the inventory, the
   biosphere and the methods once and reuse them:
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/).
   Where an alternative needs a dataset from a second source, bridge it rather than
   mixing nomenclatures:
   [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md).

7. **Characterise, and stop there if the result will be published.** Classification and
   characterisation are mandatory; normalisation and weighting are optional, and under
   ISO 14040 and 14044 no form of numerical, value-based weighting may be published for a
   study supporting a public comparative assertion
   (ilcd-2010, chapters 8.2 and 8.4). Concept page:
   [../concepts/characterization-normalisation-weighting.md](../concepts/characterization-normalisation-weighting.md);
   calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

8. **Run the three evaluation checks.** Completeness against the declared cut-off,
   sensitivity on whether the achieved accuracy supports the conclusions, and consistency
   on whether methods, assumptions and data were applied consistently across the
   alternatives (ilcd-2010, chapters 9.3.2 to 9.3.4). Concept page:
   [../concepts/interpretation.md](../concepts/interpretation.md).

9. **Treat shared background processes correctly in the uncertainty analysis.** Monte
   Carlo defaults to treating all processes and elementary flows as independent, which is
   often wrong, because the same background process can occur at several places in a
   system; co-variation must be taken into account when setting up the simulation, and
   independent sampling of a shared process overstates the difference between the
   alternatives (ilcd-2010, chapter 16.3). Concept page:
   [../concepts/uncertainty.md](../concepts/uncertainty.md); see also
   [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md).

10. **Decide whether the difference is a finding.** A difference smaller than the spread
    the sensitivity and scenario analyses produce is not a result. The handbook's own
    illustration of the other direction: where alternatives differ by 60 to 90 % across
    midpoint categories and foreground data is measured and precise, about 80 %
    completeness may already be enough to show the difference is real
    (ilcd-2010, chapter 6.6.3).

11. **Commission the critical review.** For comparative assertions disclosed to the
    public, ISO requires a critical review by interested parties, and the ILCD Handbook
    carries the reporting and review requirements in its chapters 10 and 11
    (ilcd-2010, chapters 10 and 11). The review is part of the study, not a stamp applied
    to a finished one: the reviewer's questions typically land on the functional unit, the
    allocation choice and the data quality rating.

12. **Report so the comparison cannot be lifted out of context.** Annex D of the handbook
    treats misleading interpretation, reporting and communication as a failure mode
    distinct from a misleading goal and scope: a result can be correctly computed and
    still be presented so that the reader draws a conclusion the data does not support
    (ilcd-2010, chapters 15.3 and 15.4).

## Expected output

- **A goal and scope document** naming the comparative intent, the shared functional
  unit, the obligatory and positioning properties, and the review type
  (ilcd-2010, chapters 5, 6.4 and 6.10).
- **One inventory table per alternative**, same columns, same background, with the shared
  parts visibly shared: process, flow, direction, amount, unit, supplying dataset.
- **An impact profile per alternative**, characterised, one column per impact category,
  reported side by side and never summed into one figure for publication
  (ilcd-2010, chapter 8.4).
- **A difference table**: per impact category, the absolute and relative difference, and
  the contribution of each life cycle stage to that difference.
- **A scenario matrix**: one row per methodological choice tested, showing whether the
  ranking survives it (ilcd-2010, chapter 9.2).
- **A consistency statement**: what was modelled identically in both systems and what was
  not (ilcd-2010, chapter 9.3.4).
- **A critical review report** with the reviewers named, their comments and the
  practitioner's responses, for a public comparative assertion
  (ilcd-2010, chapter 11).

## Pitfalls

- **A functional unit that hides a performance difference.** Annex D lists the functional
  unit first among the ways a goal and scope definition misleads
  (ilcd-2010, chapter 15.2.1).
- **Comparing a declared unit with a functional unit**, which is the construction-product
  version of the same error; see [prepare-an-epd.md](prepare-an-epd.md) and
  [../standards/en-15804.md](../standards/en-15804.md).
- **Publishing a single weighted score next to a public comparative claim**
  (ilcd-2010, chapter 8.4).
- **Different backgrounds on the two sides**, which converts a database difference into a
  product difference.
- **Independent Monte Carlo sampling of a shared background process**, which manufactures
  a difference (ilcd-2010, chapter 16.3).
- **Declaring a difference significant without a sensitivity check on the choices that
  produced it** (ilcd-2010, chapters 9.3.3 and 6.10).
- **Choosing the LCIA method after seeing the results**, another Annex D failure mode
  (ilcd-2010, chapter 15).
- **Treating the critical review as a final formality.** It has to be able to change the
  study, or it is not a review (ilcd-2010, chapter 11).

## Related vocabulary

- [comparative assertion](../../vocabulary.md#comparative-assertion)
- [comparative life cycle assessment](../../vocabulary.md#comparative-life-cycle-assessment)
- [disclosed to the public](../../vocabulary.md#disclosed-to-the-public)
- [functional unit](../../vocabulary.md#functional-unit)
- [allocation](../../vocabulary.md#allocation)
- [system expansion](../../vocabulary.md#system-expansion)
- [weighting](../../vocabulary.md#weighting)
- [uncertainty](../../vocabulary.md#uncertainty)

## Related pages

- [run-a-screening-lca.md](run-a-screening-lca.md) - the pass that comes first
- [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md) -
  what the reviewer will ask for
- [prepare-an-epd.md](prepare-an-epd.md) - a declaration, which is not a comparison
- [../standards/iso-14040-14044.md](../standards/iso-14040-14044.md) - the clauses behind
  the review and the weighting prohibition

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. A verifier would need two real alternatives
delivering one function, a single background database installed once, an LCIA method, and
an independent reviewer willing to say whether the resulting comparison would pass a
critical review under ISO 14044. Nothing on this page was executed, and the page contains
no commands by design.
