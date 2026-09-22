---
title: Functional unit
type: concept
summary: "The quantified function an LCA is anchored in, and the reference flow that realises it."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, epd-pcr-2019-14]
related: [../standards/iso-14040-14044.md, ../standards/en-15804.md]
---

# Functional unit

The functional unit names and quantifies the function that the analysed system provides.
The ILCD Handbook defines it along four questions, "what", "how much", "how well" and
"for how long", giving as an example "Complete coverage of 1 m2 primed outdoor wall for
10 years at 99.9 % opacity" (ilcd-2010, chapter 6.4.1). The
[reference flow](../../vocabulary.md#reference-flow) is the flow, or flows for a
[multifunctional process](../../vocabulary.md#multifunctional-process), to which all
other input and output flows quantitatively relate; it realises the functional unit, and
can be expressed either in direct relation to it or in a product-oriented way, such as
"0.67 l paint A" (ilcd-2010, chapter 6.4.1).

## Why it matters

The ILCD Handbook states the point bluntly: the system's function and functional unit are
central elements of an LCA, and without them a meaningful and valid comparison,
especially of products, is not possible (ilcd-2010, chapter 6.4.1). Everything in the
result scales with the functional unit, so a functional unit that quietly favours one
alternative produces a result that is arithmetically correct and substantively wrong.
Annex D of the handbook lists the functional unit first among the ways a goal and scope
definition misleads (ilcd-2010, chapter 15.2.1).

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.2.3.2).** The functional unit defines the
quantified performance of a product system for use as a reference unit, and the reference
flow is derived from it. The ILCD chapter on function, functional unit and reference flow
refers to exactly this clause and to aspects of 4.2.3.3.1 (ilcd-2010, chapter 6.4).

**ILCD Handbook (ilcd-2010, chapters 6.4.2 to 6.4.7).** The handbook adds practical
structure that ISO does not:

- *Quantitative aspects.* Identify and quantify the relevant properties and the technical
  performance. For many products two different extents have to be separated, the duration
  of use and the quantity of function actually delivered: a car may last 12 years, but for
  comparing car models the driven kilometres are the functional information
  (ilcd-2010, chapter 6.4.2).
- *Qualitative aspects and positioning properties.* Obligatory properties are those a
  product must have to be in the comparison at all; positioning properties differentiate
  products inside it (ilcd-2010, chapters 6.4.3 and 6.4.4).
- *Technical standards.* Definitions and quantification of the functional unit often draw
  on technical measurement standards (ilcd-2010, chapter 6.4.1).
- *Functional unit or reference flow?* For a product with one relevant function either
  can carry the reference; for a product with several alternative functions, such as
  "1 kg steel sheet, type XY", a measured amount with its technical specification is more
  useful, because a functional reference in m2 complicates reuse of the data set
  (ilcd-2010, chapter 6.4.6).
- *Location.* One aspect of both the functional unit and the reference flow is where the
  product is available, for instance "1 l beverage carton packed fresh milk at point of
  sale" in Germany, which identifies which transport and storage steps are included
  (ilcd-2010, chapter 6.4.1).

**EN 15804 and its programme rules (epd-pcr-2019-14).** Construction EPDs distinguish a
*declared unit* from a functional unit. An EPD based on the construction products PCR
alone uses a declared unit; a functional unit is used for "cradle to grave and module D"
EPDs, and an EPD with a functional unit needs a complementary PCR
(epd-pcr-2019-14, sections 1.4, 2.2 and 4.1). The declared unit exists because a
construction product often has no single function until it is placed in a building.

## How it is decided in practice

1. Describe the function in words, then quantify each of the four aspects: what, how
   much, how well, for how long (ilcd-2010, chapter 6.4.1).
2. Separate obligatory from positioning properties, so the comparison set is honest
   (ilcd-2010, chapter 6.4.4).
3. Choose between a function-shaped and a product-shaped reference flow, with reuse of
   the resulting data set in mind (ilcd-2010, chapter 6.4.6).
4. Name the location and the point in the value chain the reference flow refers to
   (ilcd-2010, chapter 6.4.1).
5. For construction products, check whether the programme requires a declared unit
   instead (epd-pcr-2019-14, section 4.1).

## Common pitfalls

- Using mass or volume as the functional unit when the products differ in performance.
  A kilogram of two paints is not the same function if their opacity differs.
- Using the duration a product is kept rather than the service delivered. The handbook
  names clothes, mobile phones and TV sets as cases where possession time is unsuitable
  for comparison (ilcd-2010, chapter 6.4.2).
- Leaving the location out of the reference flow, so that it is unclear which transport
  and storage steps are inside the inventory.
- Confusing a declared unit with a functional unit in a construction EPD and then
  comparing two EPDs that were never comparable (epd-pcr-2019-14, section 4.1).

## Related terms

- [functional unit](../../vocabulary.md#functional-unit)
- [reference flow](../../vocabulary.md#reference-flow)
- [co-function](../../vocabulary.md#co-function)
- [multifunctional process](../../vocabulary.md#multifunctional-process)
- [comparative assertion](../../vocabulary.md#comparative-assertion)

## Related pages

- [goal-and-scope.md](goal-and-scope.md) — where the functional unit is fixed
- [system-boundary.md](system-boundary.md) — what the functional unit is measured across
- [allocation-and-multifunctionality.md](allocation-and-multifunctionality.md) — when a
  system delivers more than one function
- [../standards/en-15804.md](../standards/en-15804.md) — declared unit and functional unit
  in construction EPDs
