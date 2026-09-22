---
title: core/use-cases
type: readme
summary: "Tool-agnostic use cases: what a study needs, whichever software carries it out."
audience: [P1]
updated: 2026-09-22
sources: []
---

# core/use-cases

One file per use case that stays true whichever software runs it. Each one states the
persona and the GICS sector, the goal, the prerequisites, the steps in standard terms, the
expected output and the usual pitfalls, then links to the module use cases that carry the
steps out with real commands.

## What is here now

**Tool-agnostic study types and cross-cutting jobs.**

| Page | What it covers |
|---|---|
| [run-a-screening-lca.md](run-a-screening-lca.md) | the first, deliberately incomplete pass that finds the hot spots |
| [run-a-comparative-lca.md](run-a-comparative-lca.md) | comparing systems on one function, up to a public comparative assertion with a critical review |
| [prepare-an-epd.md](prepare-an-epd.md) | a construction product declaration under EN 15804: declared unit, modules A1 to D, verification |
| [run-a-pef-study.md](run-a-pef-study.md) | a Product Environmental Footprint under Recommendation (EU) 2021/2279: PEFCR, EF 3.1, 16 categories, single overall score |
| [choose-a-background-database.md](choose-a-background-database.md) | BAFU, ecoinvent and EF-compliant data sets compared on licence, coverage, system model and format |
| [map-flows-between-nomenclatures.md](map-flows-between-nomenclatures.md) | why two flow lists rarely combine, what a bridge is, and how one is built and applied |
| [document-data-quality-and-uncertainty.md](document-data-quality-and-uncertainty.md) | the six ILCD indicators and the three kinds of uncertainty, and what each is reported as |

**Sector use cases, one per GICS sector covered so far.**

| Page | GICS sector |
|---|---|
| [assess-a-building-product-in-real-estate.md](assess-a-building-product-in-real-estate.md) | Real Estate (60) |
| [assess-an-electricity-mix-in-utilities.md](assess-an-electricity-mix-in-utilities.md) | Utilities (55) |
| [assess-a-transport-service-in-industrials.md](assess-a-transport-service-in-industrials.md) | Industrials (20) |
| [assess-an-agricultural-product-in-consumer-staples.md](assess-an-agricultural-product-in-consumer-staples.md) | Consumer Staples (30) |
| [assess-a-material-in-materials.md](assess-a-material-in-materials.md) | Materials (15) |
| [assess-an-energy-carrier-in-energy.md](assess-an-energy-carrier-in-energy.md) | Energy (10) |

The five remaining GICS sectors, Consumer Discretionary, Health Care, Financials,
Information Technology and Communication Services, have sector pages in
[../sectors/](../sectors/) but no use case here yet; see [../roadmap.md](../roadmap.md).

## How these relate to the module use cases

Three layers, and a step of a study crosses all three. A page here is the **method**: it
names the decision, cites the standard that governs it, and links to the
[../concepts/](../concepts/) or [../standards/](../standards/) page that defines it. A
**sector** use case is the same method with the sector's levers and gaps filled in from
[../sectors/](../sectors/): it does not restate the method, it says which of its steps
decide the answer for that industry and what the industry's data usually lacks. A
**module** use case, in `sentier/modules/<name>/use-cases/`,
`brightway/modules/<name>/use-cases/`, `bafu/use-cases/` or `ecoinvent/use-cases/`, is the
same step carried out with a real command in a real package, and it is the only one of the
three that carries a command and a `verified: yes` from an actual run.

So a step here reads "install the background, and here is the folder that does it" rather
than reproducing the command, and a module use case reads "here is the command" rather
than re-deriving why the step exists. That keeps a command in exactly one place, next to
the version of the package it was run against, and lets the method survive a tool change.
Dependencies run one way: use cases cite concepts, concepts cite standards, and nothing in
`core/` cites a tool branch except to point at the folder that realises a step.

## What belongs here

Use cases that stay true whichever software runs them, and per-sector use cases that point
into the tool branches.

## What does not belong here

Anything with a command in it. A command belongs to the module that provides it, in that
module's `use-cases/` folder.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the tool:
`run-a-screening-lca.md`, `prepare-an-epd.md`, `assess-a-material-in-materials.md`.
A sector use case ends with `-in-<sector>`.

## How to add here

1. Copy [../../templates/pages/use-case.md](../../templates/pages/use-case.md).
2. Name the persona and the GICS sector in the frontmatter body, and link the sector page.
3. Make every step name the concept or standard page it rests on, and the module
   `use-cases/` folder that carries it out.
4. Set `verified:` honestly. For a methodological use case `no` is the correct answer,
   with the reason stated: verification means a reviewer following the steps on a real
   study.
5. Add the page to `index.md` and check by hand that every link and anchor resolves.
