---
title: Foreground and background system
type: concept
summary: "Two different splits of a product system: by data specificity and by managerial control."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010]
related: [../standards/ilcd-handbook.md]
---

# Foreground and background system

The analysed system is usually split into a
[foreground system](../../vocabulary.md#foreground) and a
[background system](../../vocabulary.md#background). The ILCD Handbook makes an
unusual and useful point: there are two different purposes behind that split, and they
produce two different definitions. The first is the specificity perspective, which asks
where specific data should be used and where average or generic data will do. The second
is the management perspective, which asks which processes are under direct control or
decisive influence of the decision maker (ilcd-2010, chapter 6.6, terms box). For data
collection and compilation the handbook applies the specificity perspective.

## Why it matters

The two definitions do not coincide, and treating them as one is a common source of
argument. A contract manufacturer's process may be under the client's decisive influence
(management foreground) while being best represented by a market average data set
(specificity background). Saying which perspective is in use removes the argument.

## What the standards say

**Specificity perspective (ilcd-2010, chapter 6.6, terms box).** The foreground system is
those processes of the system that are specific to it, where data for the specific
technology or supplier is most appropriate. These are typically the producer's own
processes, but also processes at suppliers and downstream where only one or few operators
are involved and cannot be replaced by market average supply data, including suppliers
further up the chain where specific relations exist, such as certified green energy or
certified wood sources. The background system is then those processes where, thanks to
the averaging effect across suppliers, a homogeneous market with average or generic data
can be assumed to represent the process appropriately. From the producer's perspective,
use stage and end-of-life processes belong to the background system in so far as average
use and end-of-life management is depicted; but the specific characteristics of the
product being used and treated still apply, which combines specific properties with
average processes. Where specific use or end-of-life scenarios are investigated, they
become foreground.

**Management perspective (ilcd-2010, chapter 6.6, terms box).** The foreground system is
those processes whose selection or mode of operation is directly affected by the decisions
analysed in the study: the producer's in-house processes; under attributional modelling,
processes at suppliers of purchased made-to-order goods and services, as far as they can
be influenced by choice or specification; the product and waste flows crossing into the
background system, because it can be decided what is purchased even if not how it is
made; and the use phase in so far as the developer influences design-related use
characteristics. This variant is the relevant one for ecodesign studies.

**The split is indicative, not binding (ilcd-2010, chapter 6.6, terms box).** The handbook
warns that the specificity distinction is only indicative, because what matters is the
accuracy, precision and completeness of the data: generic data can in a given case be
more suitable for a foreground process. It also notes that under the management
perspective many processes cannot be clearly assigned, because they can only be partly
influenced.

**Consequential modelling changes the picture (ilcd-2010, chapter 6.6, footnote).**
Consequential modelling has no logic for depicting existing supply chains; it models the
marginal processes expected in consequence of the decision. A process under the direct
control of the producer can therefore end up in the background system, if it is changed
only as a consequence of a decision rather than being decided upon directly.

**Data collection follows the split (ilcd-2010, chapters 7.3.2 and 7.3.3).** The handbook
plans data collection differently for the two: foreground system data is specific,
average or generic depending on the case, while background data is obtained as unit
process or LCI result data sets from secondary sources, and differs between attributional
and consequential models.

## How it is decided in practice

1. Say which perspective the study uses, in the scope. The handbook's default for data
   collection is specificity (ilcd-2010, chapter 6.6).
2. Draw the foreground flow chart first and name each process's data source
   (ilcd-2010, chapter 6.6.2).
3. Where a supplier relation is exclusive or certified, treat it as foreground even if it
   is two tiers up (ilcd-2010, chapter 6.6, terms box).
4. Do not let the split override data quality: if generic data is better for a foreground
   process, use it and say so (ilcd-2010, chapter 6.6, terms box).

## Common pitfalls

- Equating foreground with "our factory" and background with "the database", then
  claiming supplier-specific accuracy the model does not have.
- Switching perspective mid-study, so that ecodesign conclusions rest on a boundary drawn
  for data collection.
- Carrying the attributional foreground and background split into a consequential model,
  where it does not apply in the same way (ilcd-2010, chapter 6.6, footnote).
- Treating the use phase as wholly background while the product's own characteristics
  drive its use-phase impact (ilcd-2010, chapter 6.6, terms box).

## Related terms

- [foreground system](../../vocabulary.md#foreground)
- [background system](../../vocabulary.md#background)
- [unit process](../../vocabulary.md#unit-processes)
- [system](../../vocabulary.md#system)
- [consequential modelling](../../vocabulary.md#consequential-modelling)

## Related pages

- [system-boundary.md](system-boundary.md) — the outer boundary this split sits inside
- [data-quality.md](data-quality.md) — why the split exists in the first place
- [attributional-vs-consequential.md](attributional-vs-consequential.md) — where the split
  behaves differently
- [life-cycle-inventory.md](life-cycle-inventory.md) — data collection planning
