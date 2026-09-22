---
title: Run a screening LCA
type: use-case
summary: "A first, deliberately incomplete pass over a product system that finds the hot spots and tells you where the next unit of effort belongs."
audience: [P1]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, lca-wiki-editorial]
verified: no
related: [../concepts/goal-and-scope.md, ../concepts/cut-off-criteria.md, ../concepts/interpretation.md, run-a-comparative-lca.md, choose-a-background-database.md]
---

# Run a screening LCA

**Persona:** P1 practitioner, internal analyst with a product and no prior study ·
**GICS sector:** any

## Goal

Produce a first, complete-in-shape and deliberately imprecise model of a product system,
so that you know which life cycle stages, processes and
[impact categories](../../vocabulary.md#impact-category) carry the result before you
spend money on data. A screening result is a map of where the impact is, not a number
anyone may publish as a claim.

The ILCD Handbook supports this reading of the method rather than a separate "screening
standard": LCA is iterative, the scope settings made at the start are refined as
inventory and impact assessment reveal more, with a possible limited revision of goal and
scope, until the required accuracy and completeness are reached
(ilcd-2010, chapter 4). A screening study is the first turn of that loop, carried out
with the intention of turning it again (lca-wiki-editorial).

## Prerequisites

- **A decision the study has to inform.** Without it there is no criterion for "good
  enough" and the screening never terminates
  ([../concepts/goal-and-scope.md](../concepts/goal-and-scope.md)).
- **A bill of materials or a process flow diagram** of the foreground, at whatever
  precision exists today. A spreadsheet is enough.
- **A background database you are allowed to use** for the study's purpose, chosen with
  [choose-a-background-database.md](choose-a-background-database.md).
- **One impact assessment method** whose categories match the decision, plus the flow
  list it is written against
  ([../concepts/life-cycle-impact-assessment.md](../concepts/life-cycle-impact-assessment.md)).
- **No critical review.** A screening study is by definition not a
  [comparative assertion](../../vocabulary.md#comparative-assertion) disclosed to the
  public, and the moment it becomes one the requirements of
  [run-a-comparative-lca.md](run-a-comparative-lca.md) apply instead
  (ilcd-2010, chapters 6.10 and 8.4).

## Steps

1. **Write the goal before the model.** State the intended application, the reasons for
   the study, the intended audience, and explicitly that the results are not intended for
   comparative assertions disclosed to the public (ISO 14044 clause 4.2.2;
   ilcd-2010, chapter 5). Classify the decision context as ILCD Situation A, B or C,
   because it decides the modelling principle you are allowed to use later
   (ilcd-2010, chapter 5.3). Concept page:
   [../concepts/goal-and-scope.md](../concepts/goal-and-scope.md); standard:
   [../standards/iso-14040-14044.md](../standards/iso-14040-14044.md).

2. **Fix a functional unit you can defend for one iteration.** Answer the handbook's four
   questions, what, how much, how well and for how long
   (ilcd-2010, chapter 6.4.1), and name the location the
   [reference flow](../../vocabulary.md#reference-flow) refers to, because it decides
   which transport and storage steps are inside the system
   (ilcd-2010, chapter 6.4.1). Concept page:
   [../concepts/functional-unit.md](../concepts/functional-unit.md).

3. **Draw a generous system boundary and a loose cut-off.** Include everything you can
   name, then state the cut-off as a share of environmental impact rather than of mass or
   cost, since that is what the ILCD criterion measures
   (ilcd-2010, chapter 6.6.3). Concept pages:
   [../concepts/system-boundary.md](../concepts/system-boundary.md) and
   [../concepts/cut-off-criteria.md](../concepts/cut-off-criteria.md).

4. **Install a background database and its methods.** In this wiki's tooling the loader
   that installs a published inventory, its biosphere and its methods in one step is
   documented in
   [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/);
   the database itself is described in [../../bafu/](../../bafu/) or
   [../../ecoinvent/](../../ecoinvent/), whose own use-case folders are
   [../../bafu/use-cases/](../../bafu/use-cases/) and
   [../../ecoinvent/use-cases/](../../ecoinvent/use-cases/).

5. **Build the foreground as a handful of unit processes.** One node per step you can
   actually influence, each with its inputs, its energy carriers and its direct
   emissions; everything else is background
   ([../concepts/foreground-and-background.md](../concepts/foreground-and-background.md)).
   For the data structures a tool uses to hold them, see
   [../../brightway/modules/bw2data/use-cases/](../../brightway/modules/bw2data/use-cases/).

6. **Link the foreground onto the background.** Every input that leaves your foreground
   has to find a supplying dataset. Where the two sides use different flow lists, this is
   a mapping job, not a naming job:
   [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md).

7. **Calculate one score per impact category.** The mandatory LCIA elements are
   selection, classification and characterisation; normalisation and weighting are
   optional and are decided in the scope phase, not afterwards
   (ilcd-2010, chapters 8.2 to 8.4 and 6.7.7). Concept page:
   [../concepts/characterization-normalisation-weighting.md](../concepts/characterization-normalisation-weighting.md);
   calculation module:
   [../../brightway/modules/bw2calc/use-cases/](../../brightway/modules/bw2calc/use-cases/).

8. **Run a contribution analysis before improving any data.** Quantify who contributes
   how much to the total at three levels: individual
   [elementary flows](../../vocabulary.md#elementary-flow), individual impact categories,
   and, where normalisation and weighting were chosen, the overall impact, which the
   handbook calls dominance analysis (ilcd-2010, chapter 9.2). Concept page:
   [../concepts/interpretation.md](../concepts/interpretation.md); modules:
   [../../brightway/modules/bw2analyzer/use-cases/](../../brightway/modules/bw2analyzer/use-cases/)
   and
   [../../brightway/modules/bw_graph_tools/use-cases/](../../brightway/modules/bw_graph_tools/use-cases/).

9. **List the choices that could flip the answer and run them as scenarios.** Choice
   uncertainty is discrete, so it is modelled as distinct scenarios rather than as a
   distribution: the modelling principle, the cut-off, the background datasets, the LCIA
   method, the calorific basis (ilcd-2010, chapter 16.2). Concept page:
   [../concepts/uncertainty.md](../concepts/uncertainty.md).

10. **Decide what the second iteration buys.** Rank the data improvements by how much
    they could move the contribution analysis, not by how easy they are, and write that
    ranking into the report as the study's recommendation
    (ilcd-2010, chapter 9.2).

## Expected output

- **A goal and scope document** of one to three pages that can be read back as a set of
  testable requirements: functional unit, boundary, cut-off, method, data quality
  targets per indicator (ilcd-2010, chapters 5, 6 and 12.3).
- **An inventory table** with one row per exchange: process, flow, direction, amount,
  unit, and the dataset each background input was linked to. A screening foreground is
  typically tens of rows, not thousands.
- **An impact profile**: one characterised score per impact category, with the unit the
  method declares, plus the contribution of each life cycle stage to each category.
- **A hot spot list**: the processes and elementary flows above a stated share of each
  category, which is the actual deliverable.
- **A scenario table**: one row per choice tested, one column per impact category, so a
  reader can see which choices move the result and by how much.
- **A gap list**: what was cut off, what was estimated, and what the next iteration
  should measure (ilcd-2010, chapter 9.3.2).

Describe orders of magnitude and shares in the report rather than presenting a screening
number as a result; a screening total carries the uncertainty of everything that was
estimated to produce it (ilcd-2010, chapter 6.6.3).

## How much is enough

The handbook derives the completeness target from the intended application rather than
from a fixed percentage. Its own example is instructive: in a comparative assertion where
the alternatives differ by 60 to 90 % across midpoint categories and the foreground data
is measured and precise, a minimum completeness of about 80 % may already be enough to
show the difference is real (ilcd-2010, chapter 6.6.3). A screening study is usually well
below that, and it earns its keep by saying where the missing share probably sits.

Two facts bound the exercise. Quantifying a cut-off requires an approximation of what the
100 % is, because if the total were known exactly there would be no need for a cut-off,
and the total inventory is always unknown (ilcd-2010, chapter 6.6.3). And the data
quality components interact multiplicatively, so the weakest of the six indicators
typically pulls the overall quality down to its level or below: raising precision on one
process while completeness is poor buys nothing
(ilcd-2010, chapters 6.6.3 and 12.3). Both are reasons to spend the second iteration on
the weakest indicator rather than on the most interesting process.

## Related pages

- [run-a-comparative-lca.md](run-a-comparative-lca.md) - what changes when the result is
  published as a comparison
- [choose-a-background-database.md](choose-a-background-database.md) - picking the
  background the screening rests on
- [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md) -
  how to record what the screening does not know
- [../concepts/interpretation.md](../concepts/interpretation.md) - the contribution
  analysis this use case is built around

## Pitfalls

- **Publishing the screening.** A screening study has neither the data quality nor the
  review a public comparative claim requires (ilcd-2010, chapters 6.10 and 8.4).
- **Cutting off what was hard to find.** The handbook is explicit that the cut-off must be
  determined systematically, and that for less relevant processes a lower-quality estimate
  is preferred over omission (ilcd-2010, chapter 6.6.3).
- **Stating the cut-off in mass or cost.** The ILCD criterion is a share of
  [environmental impact](../../vocabulary.md#environmental-impact), which is a different
  quantity and often a very different set of flows (ilcd-2010, chapter 6.6.3).
- **Adding normalised results into one number.** That is weighting with equal weights,
  undeclared, and the handbook requires the weighting step to be explicit
  (ilcd-2010, chapter 8.3).
- **Running the completeness and sensitivity checks only at the end.** They are applied
  throughout the study as part of the iterative loops; a study that runs them once has
  lost the mechanism that was supposed to steer it (ilcd-2010, chapter 9.1).
- **Treating the background database's own cut-off as yours.** Background datasets
  document their cut-off precisely so a data user can judge the fit
  (ilcd-2010, chapter 6.6.3).
- **Letting the screening become the study.** The iteration you promised in step 10 is
  the difference between a screening and an unfinished LCA (lca-wiki-editorial).

## Related vocabulary

- [functional unit](../../vocabulary.md#functional-unit)
- [system boundary](../../vocabulary.md#system-boundary)
- [cut-off](../../vocabulary.md#cut-off)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [impact category](../../vocabulary.md#impact-category)
- [background](../../vocabulary.md#background)
- [foreground](../../vocabulary.md#foreground)
- [uncertainty](../../vocabulary.md#uncertainty)

## Verification

`verified: no`. This is a methodological use case; verification means a reviewer
following the steps on a real study. What a verifier would need: a product with a real
bill of materials, a background database licence or a free release, an LCIA method, and a
second reviewer to confirm that the hot spot list a follower produces matches the one the
steps imply. No command on this page was run, because the page contains none by design:
the commands live in the module use-case folders it links to.
