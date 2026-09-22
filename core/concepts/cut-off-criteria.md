---
title: Cut-off criteria
type: concept
summary: "The quantitative side of the system boundary: how much impact may be left out, and how that is declared."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-transitional-guidance-2026]
related: [../standards/iso-14040-14044.md, ../standards/ef-pef.md]
---

# Cut-off criteria

[Cut-off](../../vocabulary.md#cut-off) is the omission of life cycle stages, activity
types, specific processes and products, and
[elementary flows](../../vocabulary.md#elementary-flow) from the system model, because
they are not quantitatively relevant. Cut-offs are quantified against the percentage of
[environmental impact](../../vocabulary.md#environmental-impact) they exclude: a cut-off
of "95 %" means about 5 % of the total impact, or of a selected impact category, is left
out (ilcd-2010, chapter 6.6.3). The cut-off criterion is therefore stated as a
completeness target, not as a list of what was dropped.

## Why it matters

The handbook makes the epistemic point plainly: quantifying a cut-off requires an
approximation of what the 100 % is, because if the total were known exactly there would
be no need for a cut-off, and the total inventory is always unknown for all life cycle
approaches (ilcd-2010, chapter 6.6.3). The consequence is practical. The more is cut off,
the less precise the estimate of how much was cut off, so a large cut-off degrades the
result twice: once through incompleteness and once through the uncertainty of the
estimate itself (ilcd-2010, chapter 6.6.3).

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.2.3.3.3).** Cut-off criteria shall be stated and
justified, and the effect of the selection documented. ILCD's chapter 6.6.3 refers to
exactly this clause (ilcd-2010, chapter 6.6.3).

**ILCD Handbook (ilcd-2010, chapter 6.6.3).**

- *Cutting off versus estimating.* All processes and flows attributable to the system, or
  affected via consequences under consequential modelling, are in principle to be
  included. For the less relevant ones, lower-quality data estimates may be used; only
  the irrelevant ones are cut off entirely, and the effort saved goes into better data
  where it matters.
- *Two ways to define the criterion.* Either relate the cut-off to each of the included
  impact categories separately ("85 % of climate change AND 85 % of acidification AND
  ..."), which needs no normalisation data but forces data collection for categories that
  barely matter; or relate it to the normalised and weighted overall impact, which focuses
  effort but requires a normalisation basis and a weighting set to have been chosen in
  the scope phase.
- *Studies with a limited indicator set.* For carbon footprints and similar, the cut-off
  relates only to the considered indicators, for example "covering 90 % of the climate
  change impacts".
- *Application-unspecific data sets.* For background data sets the cut-off may in
  principle be set freely, but the exact cut-off shall be documented so that a data user
  can judge whether the data suits their study.
- *It interacts with everything else.* The data quality components interact
  multiplicatively, and typically the weakest component lowers the overall quality to its
  level or below. 90 % completeness reached with data estimates is not the same as 90 %
  reached with measured data (ilcd-2010, chapter 6.6.3).
- *Cut-off is a documented data quality criterion for an LCI data set*
  (ilcd-2010, chapters 6.6.3 and 12.3).

**EF/PEF (ef-transitional-guidance-2026).** The Environmental Footprint transitional
guidance of 14 July 2026 addresses a different kind of gap: processes for which no
EF-compliant data set exists. It sets a three-step hierarchy for studies carried out
without a valid PEFCR or OEFSR: use EF-compliant data sets where they exist, otherwise
ILCD-EL compliant data sets, and only if neither exists omit the process. A study may
still be considered EF compliant when non-EF-compliant data sets exceed 10 % of the
overall score, provided a disclaimer notes the resulting limits on comparability.

## How it is decided in practice

1. Derive the criterion from the goal. The handbook's example: in a comparative assertion
   where the alternatives differ by 60 to 90 % across midpoint categories and foreground
   data is measured and precise, a minimum completeness of about 80 % may already be
   enough to show the difference is real (ilcd-2010, chapter 6.6.3).
2. Choose the per-category or the normalised-and-weighted formulation, knowing that the
   second one commits you to normalisation and weighting for internal use.
3. Apply it systematically, so that the omissions are not just whatever was hard to find.
   The handbook stresses that the cut-off must be determined systematically to avoid
   inappropriately cutting off relevant parts (ilcd-2010, chapter 6.6.3).
4. Verify it in the completeness check during interpretation, and report the remaining
   gaps (ilcd-2010, chapter 9.3.2).

## Common pitfalls

- Stating a cut-off as a mass or cost percentage. The ILCD criterion is a share of
  environmental impact, which is a different quantity and often a very different set of
  flows (ilcd-2010, chapter 6.6.3).
- Adopting a background database's cut-off implicitly, then claiming the study's own,
  stricter cut-off.
- Cutting off a stage because no data was available, rather than estimating it, and then
  reporting a lower impact as if it were a result.
- Treating the EF transitional data hierarchy as a licence to omit processes. Omission is
  its third and last step (ef-transitional-guidance-2026).

## Related terms

- [cut-off](../../vocabulary.md#cut-off)
- [system boundary](../../vocabulary.md#system-boundary)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [environmental impact](../../vocabulary.md#environmental-impact)
- [normalisation](../../vocabulary.md#normalisation)

## Related pages

- [system-boundary.md](system-boundary.md) — the qualitative half of the same decision
- [data-quality.md](data-quality.md) — completeness as a data quality indicator
- [interpretation.md](interpretation.md) — the completeness check
- [../standards/ef-pef.md](../standards/ef-pef.md) — EF data availability rules
