---
title: ecoinvent system models
type: database
summary: "The four system models ecoinvent publishes, what each one does with waste and by-products, and how to choose."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-kb-system-models, ecoinvent-kb-glossary, ecoinvent-kb-activities-products, ecoinvent-kb-impact-assessment]
related: [methodology.md, ../../vocabulary.md]
---

# ecoinvent system models

## What a system model is

A system model is "a model describing how activity datasets are linked to form product
systems", and it "may determine factors such as whether to use allocation (and which type
of allocation) or substitution to handle the multi-functionality problem, or whether to
use average or marginal suppliers" (source: ecoinvent-kb-glossary).

This is the structural difference between ecoinvent and a database that ships one linked
set. ecoinvent holds unlinked, multi-output unit processes as its base data, and the
linking into single-product supply chains is done by what the documentation calls the
database service layer, "a group of mathematical formulas, commands and validation rules
specific to a chosen system model" (source: ecoinvent-kb-glossary). Choose a different
system model and you get a different database out of the same base data.

## The three operations underneath

All four models are built from the same three operations (source:
ecoinvent-kb-system-models):

- **Subdivision**, applied first and in every system model: where an activity defines
  more than one reference product, inputs and emissions are split between them on
  physical characteristics.
- **Allocation**, the attributional method for turning a multi-product activity into
  single-product ones, used by the cut-off and APOS models. An allocation key decides the
  share of each input and emission that goes to the reference product and to the
  by-products that have economic value.
- **Substitution**, the consequential method: by-products move to the input side with a
  negative sign to keep the mass balance, and a by-product that displaces another
  production credits the activity that made it.

## Allocation, cut-off by classification

The cut-off system model, based on the recycled content approach. Primary production of
a material is always allocated to the primary user; a primary producer gets no credit for
providing recyclable material, so recyclable materials are available burden-free to
recycling processes and secondary materials carry only the burden of the recycling
(source: ecoinvent-kb-system-models). Waste is the producer's responsibility, on the
polluter-pays principle, and valuable by-products of waste treatment are cut off and
become burden-free.

The mechanism is a classification carried by every intermediate exchange, at product
level and consistently across every activity the exchange appears in: allocatable,
recyclable, or waste (source: ecoinvent-kb-system-models). Allocatable products are
ordinary products with economic value and go through allocation; recyclable materials
have little or no value but are worth collecting; waste products have no value and the
producer pays to have them taken away. Names can mislead, and the documentation says so
with the example of waste paper, which is classified recyclable (source:
ecoinvent-kb-system-models).

Cut-off applies the same modelling choices as ecoinvent versions 1 and 2, and it is the
model ecoinvent recommends for users new to version 3 and for anyone wanting continuity
with older work (source: ecoinvent-kb-system-models).

## Allocation, cut-off, EN15804

A variant of cut-off built for Environmental Product Declaration practitioners, compliant
with an attributional interpretation of EN15804, ISO21930 and ISO14025 (source:
ecoinvent-kb-system-models). It differs from plain cut-off in two ways:

- **Where the cut-off point sits.** It follows the end-of-waste criteria of
  EN15804&A2:2019, so the primary system extends further: in the worked example given by
  the documentation, the cut-off in the waste paper chain moves from just after the
  production of unsorted waste paper to after the sorting activity (source:
  ecoinvent-kb-system-models).
- **What it reports.** It provides the LCI indicators that EPDs require, covering
  secondary material use, secondary fuels, materials for recycling and for energy
  recovery, exported and recovered energy, primary energy resource use split several
  ways, net freshwater use, hazardous, non-hazardous and radioactive waste disposed, and
  biogenic carbon content in the product and its packaging (source:
  ecoinvent-kb-system-models).

The documentation adds a warning worth repeating: the EN15804 impact assessment methods
are meant to be used only with the EN15804 system model (source:
ecoinvent-kb-impact-assessment).

## Allocation at the point of substitution (APOS)

The APOS model is attributional, and it shares the responsibility for waste burdens
between the producer of the waste and the later users who benefit from the treatment
(source: ecoinvent-kb-system-models). Its purpose is to avoid having to find allocation
factors inside treatment chains, where steps such as collecting municipal waste and
driving it to a site resist sensible allocation keys.

Its classification is a different one: products are either material for treatment (mft)
or material not for treatment (non-mft) (source: ecoinvent-kb-glossary). An mft requires
treatment, either because it is waste or because it has to be processed before it becomes
valuable; a non-mft is valuable as it stands. During calculation, mft moves to the input
side with a negative sign, the treating activity's non-mft by-products move to the output
side of the producing activity, and the result is an ordinary joint production that
allocation can handle (source: ecoinvent-kb-system-models).

APOS was called "Allocation, ecoinvent default" until the name changed with version 3.2
(source: ecoinvent-kb-system-models). Old study reports use the old name.

## Substitution, consequential, long-term

The consequential model assesses the consequences of a change in an existing system
rather than attributing an existing system's burdens, which makes it the model for
prospective questions (source: ecoinvent-kb-system-models). Two assumptions define it:

- **Substitution instead of allocation.** All by-products move to the input side with a
  negative sign; the activity carries the full burden of its inputs and emissions, and
  by-products that displace other production bring a credit.
- **Marginal supply only.** A supplier is unconstrained if it can meet a rise in demand
  by producing more. By-products are constrained by definition, because increasing
  production of a by-product is not an economic decision. Supply is also constrained by
  technology level: every activity carries one of outdated, old, current, modern or new,
  and only the up-to-date levels count as unconstrained (source:
  ecoinvent-kb-system-models).

Markets can be constrained too. A constrained market is one where a change in demand is
not met by a change in supply but by a change in consumption somewhere else; such
datasets carry a conditional exchange with a direct activity link to the affected
consumption activity, and that exchange is activated only in system models that take
market constraints into account (source: ecoinvent-kb-glossary). Under cut-off, EN15804
and APOS the conditional exchange stays inactive and a constrained market behaves like
any other.

## Choosing

The choice is the user's responsibility, and ecoinvent says so explicitly: the model has
to serve the goal and scope of the study (source: ecoinvent-kb-system-models). In
practice:

- Continuity with earlier work, or a first contact with version 3: cut-off.
- An EPD under EN15804: the EN15804 variant, with its own impact methods.
- A study that wants end-of-life burdens shared rather than assigned to the producer:
  APOS.
- A prospective question about the consequences of a decision: consequential.

Cut-off and APOS differ only in how they treat waste and recyclables, and their results
are otherwise quite similar (source: ecoinvent-kb-system-models).

## Related pages

- [methodology.md](methodology.md): the activity and product model the system models operate on.
- [methods.md](methods.md): the impact methods, including the EN15804 restriction.
- [../../vocabulary.md](../../vocabulary.md): cut-off, APOS, mft, conditional exchange, constrained market.
