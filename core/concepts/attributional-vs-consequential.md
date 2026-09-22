---
title: Attributional and consequential modelling
type: concept
summary: "The two LCI modelling principles, what each one models, and which decision context calls for which."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010]
related: [../standards/ilcd-handbook.md, ../standards/iso-14040-14044.md]
---

# Attributional and consequential modelling

Two modelling principles are in use in LCA practice, and the ILCD Handbook notes that the
attributional one is more widely used for historical and practical reasons
(ilcd-2010, chapter 6.5.2).

[Attributional modelling](../../vocabulary.md#attributional-modelling) inventories the
input and output flows of all processes of a system as they occur; the handbook's
one-line definition calls it descriptive or book-keeping
(ilcd-2010, chapter 3). The attributional model depicts the actual or forecasted specific
or average supply chain plus the use and end-of-life value chain, with the system embedded
in a static technosphere (ilcd-2010, chapter 6.5.2).

[Consequential modelling](../../vocabulary.md#consequential-modelling) identifies and
models all processes in the background system of a system in consequence of decisions
made in the foreground system (ilcd-2010, chapter 3). The consequential model depicts the
generic supply chain theoretically expected as a consequence of the analysed decision,
with the system interacting with markets in a dynamic technosphere reacting to the
additional demand (ilcd-2010, chapter 6.5.2).

## Why it matters

The choice is not a matter of taste; it follows from what question the study answers.
The handbook also points out that ISO 14044 covers allocation well but does not address
the more fundamental question of the LCI modelling framework in any detail, so there is
no ISO clause to defer to (ilcd-2010, chapter 6.5.2, footnote). That gap is exactly what
the ILCD situations A, B and C fill.

## What the standards say

**Other names for the same things (ilcd-2010, chapter 6.5.2).** Attributional modelling
is also called accounting, book-keeping, retrospective or descriptive, and sometimes,
confusingly, average or non-marginal. Consequential modelling is also called
change-oriented, effect-oriented, decision-based or market-based, and, older and
misleadingly, marginal or prospective.

**What attributional modelling uses (ilcd-2010, chapter 6.5.2).** Historical, fact-based,
measurable data of known or at least knowable uncertainty, including all processes
identified as relevantly contributing. Producer-specific data is used where specific
producers supply a good; average or generic data is used where goods come from a wide mix
of producers, for example a national electricity consumption mix with its actual shares
of hydro, gas, coal, oil, nuclear and biomass, including imports and exports. The
handbook is explicit that the move from specific to average data is a practicality-driven
simplification, justified by the averaging effect several steps up and down the chain.

**What consequential modelling requires (ilcd-2010, chapters 6.5.2 and 7.2.4).** A key
step is identifying the marginal processes, that is the generic supply chain, starting
from the decision and building the process chain around it. Some practitioners identify a
single marginal process, others a combination of the most likely ones for a more robust
estimate. Market constraints are modelled explicitly: existing supply contracts, planned
suppliers, policy measures such as green taxes or material bans. Multifunctionality is
solved through the consequences, typically by substitution
(ilcd-2010, chapter 7.2.4.6).

**The ILCD decision contexts (ilcd-2010, chapters 5.3 and 6.5.4).** The handbook attaches
the modelling principle to the decision context rather than leaving it open:

- **Situation A, micro-level decision support.** Decisions with limited and no structural
  consequences outside the decision context, assumed not to change available production
  capacity.
- **Situation B, meso/macro-level decision support.** Decisions at a strategic level, such
  as raw material strategies, technology scenarios or policy options, assumed to have
  structural consequences outside the decision context and to change available production
  capacity.
- **Situation C, accounting.** Purely descriptive documentation of a system's life cycle,
  without interest in consequences on other parts of the economy.

Chapter 6.5.4 then gives LCI modelling provisions per situation, which is where the
choice between the two principles is actually made.

## How it is decided in practice

Ask what the reader will do with the number. If the answer is "record it", Situation C
and an attributional model. If it is "choose between two products without changing what
the market produces", Situation A. If it is "decide a policy or a capacity investment",
Situation B and a consequential model. Where classification between A and B is not clear,
the handbook gives explicit guidance for differentiating them
(ilcd-2010, chapters 5.3.6 and 5.3.8).

Mixing the two inside one study is where most trouble starts. A substitution credit in an
otherwise attributional model imports a consequential assumption; the handbook treats
substitution as a way of solving multifunctionality rather than as an attributional
default (ilcd-2010, chapter 6.5.3.2).

## Common pitfalls

- Calling a study consequential because it uses marginal electricity, without modelling
  any other market response.
- Calling a study attributional while crediting avoided burdens throughout.
- Comparing an attributional result with a consequential one. They answer different
  questions and the difference between them is not a finding.
- Choosing the principle after the data was collected, which the handbook's iterative
  approach permits for scope refinement but not for the modelling framework
  (ilcd-2010, chapters 4 and 6.5.4).

## Related terms

- [attributional modelling](../../vocabulary.md#attributional-modelling)
- [consequential modelling](../../vocabulary.md#consequential-modelling)
- [substitution](../../vocabulary.md#substitution)
- [foreground system](../../vocabulary.md#foreground)
- [system](../../vocabulary.md#system)

## Related pages

- [goal-and-scope.md](goal-and-scope.md) — where the decision context is classified
- [allocation-and-multifunctionality.md](allocation-and-multifunctionality.md) — how each
  principle solves multifunctionality
- [foreground-and-background.md](foreground-and-background.md) — the split behaves
  differently under each principle
- [../standards/ilcd-handbook.md](../standards/ilcd-handbook.md) — situations A, B and C
