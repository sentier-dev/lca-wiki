---
title: Allocation and multifunctionality
type: concept
summary: "What to do when one process delivers more than one function: subdivision, system expansion, substitution, then partitioning."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-compliant-data-guide-2.0]
related: [../standards/iso-14040-14044.md, ../standards/ilcd-handbook.md]
---

# Allocation and multifunctionality

A [multifunctional process](../../vocabulary.md#multifunctional-process) performs more
than one function, for example a chloralkali electrolysis producing NaOH, Cl2 and H2, or a
waste incinerator treating mixed household waste while producing energy
(ilcd-2010, chapter 3). Only part of that process belongs to the system under study, and
the problem of deciding which part is the multifunctionality problem. ISO calls its
answer [allocation](../../vocabulary.md#allocation): partitioning the input or output
flows of a process or product system between the product system under study and one or
more other product systems (ilcd-2010, chapter 3, citing ISO 14044:2006).

The ILCD Handbook notes that ISO's hierarchy covers more than allocation and identifies
its first two steps as ways of avoiding allocation, so a clearer title would be "solving
multifunctionality of processes" (ilcd-2010, chapter 6.5.3.2, footnote).

## Why it matters

Multifunctionality decides results more often than data quality does. Whether steel
carries the burden of blast furnace slag, whether recycled aluminium is credited to the
product that discards it or the product that uses it, whether electricity from waste
incineration is free: all of these are the same decision, and it is made in the scope
phase, not discovered in the data.

## What the standards say

**The ISO hierarchy, as ILCD reads it (ilcd-2010, chapter 6.5.3.2).**

1. **Subdivision.** Collect data individually for the mono-functional processes inside a
   [black box unit process](../../vocabulary.md#unit-process-black-box), cutting free the
   processes that actually relate to the analysed system. The handbook is unusually firm:
   subdivision is the only correct and exact solution under attributional modelling for
   processes that can be further subdivided, and allocating a black box will often
   produce distorted inventories, because not all processes inside it relate to all
   co-functions to the same extent. Black boxes should be subdivided even when this does
   not fully solve the multifunctionality, because it makes the remaining problem smaller
   and the data reviewable (ilcd-2010, chapter 6.5.3.2). Partial and virtual subdivision
   are covered separately (ilcd-2010, chapter 7.4.2.2).
2. **System expansion, including substitution.**
   [System expansion](../../vocabulary.md#system-expansion) adds processes and their
   inventories to make systems with a partly different set of functions comparable.
   [Substitution](../../vocabulary.md#substitution), also called crediting or the avoided
   burden approach, solves multifunctionality by expanding the boundary and subtracting
   the inventory of the process that the unwanted co-function supersedes
   (ilcd-2010, chapters 3 and 6.5.3.2). The handbook's worked example is blast furnace
   slag, a joint co-product of steelmaking used in cement making, where obtaining an
   inventory for the steel alone means subtracting the inventory of the superseded
   Portland cement or primary aggregates (ilcd-2010, chapter 6.5.3.2).
3. **Allocation by a physical relationship.** ILCD's first criterion is "determining
   physical causality", which is not simply mass or energy but the property that actually
   drives the flows (ilcd-2010, chapter 7.9.3.2).
4. **Allocation by another relationship.** The second, general criterion is economic
   value, or a quality function deployment approach
   (ilcd-2010, chapter 7.9.3.3).

**Consequential modelling (ilcd-2010, chapter 7.2.4.6).** Multifunctionality in
consequential modelling is solved through the consequences themselves, typically by
substitution of the superseded marginal process. The handbook warns that substituting
co-functions of processes that could in principle be subdivided will distort results
there too, so subdivision or virtual subdivision should still be preferred
(ilcd-2010, chapter 6.5.3.2).

**Recycling (ilcd-2010, chapter 14).** Annex C treats reuse, recycling and energy
recovery as the special case they are. It separates closed-loop from open-loop recycling,
and open loop into the same primary route and a different primary route. In attributional
modelling the treatment depends on whether the market value of the end-of-life product is
above zero, in which case it is a co-product, or negative, in which case a treatment fee
is paid. In consequential modelling the recyclability substitution approach applies
(ilcd-2010, chapters 14.3 to 14.5). A "cut-off" recycling convention, where the
[secondary good](../../vocabulary.md#secondary-good) enters the next system burden-free,
is one point on this map rather than a separate method.

**EF/PEF (ef-compliant-data-guide-2.0).** The Environmental Footprint replaces the
choice with a formula. An EF-compliant data set documents its allocation in the metadata
and carries the Circular Footprint Formula parameters as declared modelling constants
(ef-compliant-data-guide-2.0, sections 5.2.8 and 5.2.10). EF is therefore not a place to
exercise judgement about allocation; it is a place to report which prescribed parameters
were used.

## How it is decided in practice

Work down the hierarchy and stop at the first step that works, and record why the earlier
steps did not. In practice the questions are: can I get separate data for the sub-process
I need; is there an identifiable process that my unwanted co-function displaces, and do I
know its inventory; if not, what physical property actually causes the flows; and only
then, what are the prices.

## Common pitfalls

- Allocating a plant-level data set by mass because mass is available, when the
  co-products underwent different processing steps inside the plant
  (ilcd-2010, chapter 6.5.3.2).
- Using substitution in an attributional study without noticing that it imports a
  consequential assumption about what is displaced.
- Crediting the same avoided burden twice, once in the producing system and once in the
  using system.
- Comparing two studies that used different multifunctionality solutions, which is a
  consistency failure rather than a data difference (ilcd-2010, chapter 9.3.4).

## Related terms

- [allocation](../../vocabulary.md#allocation)
- [substitution](../../vocabulary.md#substitution)
- [system expansion](../../vocabulary.md#system-expansion)
- [co-product](../../vocabulary.md#co-product)
- [multifunctional process](../../vocabulary.md#multifunctional-process)
- [secondary good](../../vocabulary.md#secondary-good)

## Related pages

- [attributional-vs-consequential.md](attributional-vs-consequential.md) — the modelling
  principle that constrains the choice
- [system-boundary.md](system-boundary.md) — system expansion is a boundary decision
- [goal-and-scope.md](goal-and-scope.md) — where the decision is made
- [../standards/ilcd-handbook.md](../standards/ilcd-handbook.md) — situations A, B and C
