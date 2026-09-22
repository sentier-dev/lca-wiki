---
title: core/concepts
type: readme
summary: One page per LCA concept, defined from the standards rather than from any tool.
audience: [P1, P3]
updated: 2026-09-21
sources: []
---

# core/concepts

One page per concept of LCA methodology: what it means, why it exists, what a
practitioner decides when they meet it, and which standard says so.

## What belongs here

Goal and scope definition, functional unit, reference flow, system boundary, cut-off,
allocation and substitution, life cycle inventory, life cycle impact assessment,
interpretation, data quality, uncertainty, sensitivity, normalisation and weighting.
A concept page is prose plus links: it defines, it does not instruct. Instructions are
use cases.

## What is here now

| Page | Subject |
|---|---|
| [goal-and-scope.md](goal-and-scope.md) | why the study is done and what is modelled |
| [functional-unit.md](functional-unit.md) | the quantified function and the reference flow |
| [system-boundary.md](system-boundary.md) | what is inside the analysed system |
| [cut-off-criteria.md](cut-off-criteria.md) | how much impact may be left out |
| [foreground-and-background.md](foreground-and-background.md) | the two ways the system is split |
| [attributional-vs-consequential.md](attributional-vs-consequential.md) | the two LCI modelling principles |
| [allocation-and-multifunctionality.md](allocation-and-multifunctionality.md) | subdivision, system expansion, substitution, partitioning |
| [life-cycle-inventory.md](life-cycle-inventory.md) | collecting flows and modelling the system |
| [elementary-and-intermediate-flows.md](elementary-and-intermediate-flows.md) | the flow types an inventory contains |
| [life-cycle-impact-assessment.md](life-cycle-impact-assessment.md) | from flows to indicator results |
| [characterization-normalisation-weighting.md](characterization-normalisation-weighting.md) | the mandatory and optional LCIA steps |
| [interpretation.md](interpretation.md) | significant issues, checks, conclusions |
| [data-quality.md](data-quality.md) | the six ILCD data quality indicators |
| [uncertainty.md](uncertainty.md) | stochastic, choice-related and ignorance uncertainty |

What is still missing is listed in [../roadmap.md](../roadmap.md).

## What does not belong here

Tool behaviour (that is a module page), standard summaries (that is
[../standards/](../standards/)) and definitions of single terms (they belong in
[../../vocabulary.md](../../vocabulary.md)).

## Naming rule

`lower-case-with-hyphens.md`, singular, named after the concept:
`functional-unit.md`, `system-boundary.md`, `allocation.md`.

## How to add here

1. Copy [../../templates/pages/concept.md](../../templates/pages/concept.md).
2. Cite at least one source that defines the concept; ILCD first when it does.
3. Link at least three vocabulary anchors in [../../vocabulary.md](../../vocabulary.md)
   so a reader can jump from the concept to the contested terms inside it.
4. Add the page to `index.md` and check by hand that every link and anchor resolves.
