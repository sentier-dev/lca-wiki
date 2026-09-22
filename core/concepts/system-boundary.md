---
title: System boundary
type: concept
summary: "Which processes and flows belong to the analysed system, qualitatively and quantitatively."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, epd-pcr-2019-14, ef-compliant-data-guide-2.0]
related: [../standards/iso-14040-14044.md, ../standards/en-15804.md]
---

# System boundary

The system boundary separates the analysed system from the rest of the technosphere and
from the ecosphere. Flows that cross it into or out of nature are
[elementary flows](../../vocabulary.md#elementary-flow); flows that cross it to or from
other human activities are [product flows](../../vocabulary.md#product-flow) and
[waste flows](../../vocabulary.md#waste-flow) (ilcd-2010, chapter 6.6 and Figure 13).
The ILCD Handbook splits the boundary into a qualitative part, which processes belong to
the system at all, and a quantitative part, the
[cut-off](../../vocabulary.md#cut-off) criteria (ilcd-2010, chapters 6.6.2 and 6.6.3).

## Why it matters

The handbook concedes that in reality, even for simple products, all economic activities
globally are somehow part of the system; what saves the practitioner is that the number of
processes contributing in a quantitatively relevant degree is typically rather limited
(ilcd-2010, chapter 6.6.1). Drawing the boundary is therefore not a matter of principle
but of demonstrable irrelevance, and a boundary drawn without that demonstration is the
classic way to make a comparison come out the way the commissioner wanted
(ilcd-2010, chapter 15.2.3).

## What the standards say

**ISO 14044 (iso-14044-2006, clauses 4.2.3.3.1 to 4.2.3.3.3).** The system boundary
determines which unit processes are included, and the criteria used shall be identified
and justified. ILCD's chapter 6.6 maps onto these clauses directly
(ilcd-2010, chapter 6.6).

**ILCD Handbook (ilcd-2010).** Three distinctions structure the boundary:

- *System versus technosphere.* The analysed system is the exact sum of its
  [foreground system](../../vocabulary.md#foreground) and its
  [background system](../../vocabulary.md#background); quantitatively irrelevant
  flows may be excluded, that is cut off (ilcd-2010, Figure 13).
- *Attributional versus consequential.* In attributional modelling all processes
  attributable to the system are included; in consequential modelling the processes
  affected via consequences are included, which is a different set
  (ilcd-2010, chapters 6.6.3 and 7.2.4).
- *Completeness of the life cycle.* Where the boundary stops defines the data set type:
  cradle to grave, cradle to gate and gate to gate data sets are parts of a complete life
  cycle, each serving as a module for other studies (ilcd-2010, Figure 12). The ILCD data
  format encodes this distinction as separate process data set types, including
  "LCI result" and "Partly terminated system", the latter being an aggregated data set
  with at least one product flow still to be modelled
  (ef-compliant-data-guide-2.0, chapter 1).
- *Multifunctionality sits on the boundary.* Where the system boundary is expanded to
  subtract an unwanted co-function, the boundary and the
  [substitution](../../vocabulary.md#substitution) decision are the same decision
  (ilcd-2010, chapter 6.5.3.2).

**EN 15804 and construction EPDs (epd-pcr-2019-14).** The boundary is prescribed as a set
of information modules rather than described in prose. The minimum for a construction
product EPD is modules A1 to A3 (product stage), C1 to C4 (end of life) and module D
(benefits and loads beyond the system boundary), with A4 to A5 and B1 to B7 optional or
mandatory depending on the EPD type (epd-pcr-2019-14, Table 2). Module D is by
construction outside the system boundary and is reported separately.

## How it is decided in practice

1. Draw the flow chart of the foreground system first, then name the background processes
   it needs (ilcd-2010, chapter 6.6.2 and Figure 14).
2. State which life cycle stages are in and which are out, and why. The handbook provides
   a system boundary template in Annex F for exactly this
   (ilcd-2010, chapter 17).
3. Decide the boundary between foreground and background on the specificity perspective:
   foreground processes are those specific to the system, where supplier- or
   technology-specific data is appropriate (ilcd-2010, chapter 6.6 terms box).
4. Set the quantitative boundary as a completeness criterion, not as a list of omissions;
   see [cut-off-criteria.md](cut-off-criteria.md).
5. Re-check the boundary after the first inventory iteration. The handbook expects the
   scope to be refined once the contribution analysis shows where the impact actually
   sits (ilcd-2010, chapter 4).

## Common pitfalls

- Excluding capital goods, infrastructure or storage silently, instead of declaring them
  as a cut-off with an estimated share of impact (ilcd-2010, chapter 6.6.3).
- Drawing a cradle-to-gate boundary and then comparing against a cradle-to-grave result.
- Applying one boundary to one alternative and a different one to the other. The handbook
  requires identical parts of compared systems to be treated consistently
  (ilcd-2010, chapter 6.10.6).
- Treating module D of an EN 15804 EPD as part of the product result. It is explicitly
  beyond the system boundary (epd-pcr-2019-14, Table 2).

## Related terms

- [system boundary](../../vocabulary.md#system-boundary)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [product flow](../../vocabulary.md#product-flow)
- [cut-off](../../vocabulary.md#cut-off)
- [foreground system](../../vocabulary.md#foreground)

## Related pages

- [cut-off-criteria.md](cut-off-criteria.md) — the quantitative half of the boundary
- [foreground-and-background.md](foreground-and-background.md) — the internal split
- [elementary-and-intermediate-flows.md](elementary-and-intermediate-flows.md) — what
  crosses the boundary
- [../standards/en-15804.md](../standards/en-15804.md) — the module-based boundary
