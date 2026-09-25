---
title: core
type: branch
summary: "The domain-neutral LCA wiki: concepts, standards, GICS sectors and tool-agnostic use cases."
audience: [P1, P2, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14040-2006, iso-14044-2006, eu-recommendation-2021-2279, en-15804-2019]
---

# core

LCA as the standards describe it, with no tool attached. This is the branch a
practitioner reads before, or instead of, a tool branch, and the branch every other
branch defers to when a term or a method is contested.

The reference document is the ILCD Handbook, *General guide for Life Cycle Assessment,
Detailed guidance*, 2010, which is based on and conforms to ISO 14040 and ISO 14044 and
further details their provisions (ilcd-2010, "Role of this document within the ILCD
Handbook"). Where the ILCD Handbook defines a term, its definition comes first here. ISO
14040 and 14044 stand behind it as the framework and the requirements
(iso-14040-2006, iso-14044-2006), and the European Environmental Footprint methods
(eu-recommendation-2021-2279) and EN 15804 (en-15804-2019) stand beside it as the two
rule sets that narrow the ISO freedom in practice.

## What belongs here

| Folder | What it holds |
|---|---|
| [concepts/](concepts/) | one page per LCA concept: goal and scope, functional unit, system boundary, LCI, LCIA, interpretation, allocation, cut-off, data quality, uncertainty, foreground and background, attributional and consequential, flow types, characterisation and weighting |
| [standards/](standards/) | one page per standard or format: ISO 14040/44, the ILCD Handbook, ILCD format 1.1 and eILCD, EF/PEF, EN 15804, GLAD and nomenclatures |
| [sectors/](sectors/) | the 11 GICS sector pages and the crosswalk to other sector taxonomies |
| [use-cases/](use-cases/) | tool-agnostic use cases: screening LCA, comparative LCA, EPD, PEF study |
| [../vocabulary.md](../vocabulary.md) | the whole controlled vocabulary: the ILCD glossary, the EF/PEF starter terms and the generic terms every branch reuses |
| [roadmap.md](roadmap.md) | what is missing here and where a contributor can help |

## How the folders relate

The four content folders answer four different questions, and a page in the wrong one is
the commonest kind of duplication:

- **[../vocabulary.md](../vocabulary.md) answers "what does this word mean, and to
  whom?"** One heading per term, one bullet per source and context, never merged. Every
  concept page links into it.
- **concepts/ answers "what is this thing, and what does a practitioner decide about
  it?"** Prose plus links. A concept page defines from the standards, shows where the
  standards differ, and names the decision. It does not instruct.
- **standards/ answers "what does this document require, and of whom?"** One page per
  normative document, with the edition fixed and the clause named. A standards page is
  the place where "the ILCD Handbook says X while EF says Y" is recorded once, so the
  concept pages can point at it.
- **sectors/ and use-cases/ answer "how does this play out for a given industry or a
  given job?"** A sector page is domain framing; a use case is an end-to-end procedure
  with a `verified:` marker saying whether it was actually run.

The dependency runs one way: use cases cite concepts, concepts cite standards, standards
and concepts cite the vocabulary, and nothing in `core/` cites a tool branch. Tool
branches cite back into `core/`.

## Read paths

**P1, the practitioner who wants to do or read an LCA.** Start with
[concepts/goal-and-scope.md](concepts/goal-and-scope.md), then
[concepts/functional-unit.md](concepts/functional-unit.md) and
[concepts/system-boundary.md](concepts/system-boundary.md), then the phase pages
[concepts/life-cycle-inventory.md](concepts/life-cycle-inventory.md),
[concepts/life-cycle-impact-assessment.md](concepts/life-cycle-impact-assessment.md) and
[concepts/interpretation.md](concepts/interpretation.md). Read
[concepts/allocation-and-multifunctionality.md](concepts/allocation-and-multifunctionality.md)
before touching a multi-output process, and
[concepts/data-quality.md](concepts/data-quality.md) before defending a result. If the
study is bound by a rule set, read
[standards/ef-pef.md](standards/ef-pef.md) or
[standards/en-15804.md](standards/en-15804.md) instead of choosing.

**P2, the contributor adding pages or data.** Read
[standards/ilcd-handbook.md](standards/ilcd-handbook.md) for the vocabulary precedence
rule, [standards/ilcd-format.md](standards/ilcd-format.md) for the data set types, and
[standards/glad-and-nomenclatures.md](standards/glad-and-nomenclatures.md) for how flow
lists relate. Then [../CONTRIBUTING.md](../CONTRIBUTING.md) and the folder READMEs below.

**P3, the wiki developer.** Read [../AGENTS.md](../AGENTS.md) first, then this page for
how `core/` is partitioned, then
[concepts/elementary-and-intermediate-flows.md](concepts/elementary-and-intermediate-flows.md)
and [standards/ilcd-format.md](standards/ilcd-format.md), which are the two pages an
importer is written against.

## What does not belong here

Anything that is true only of one tool, platform or database. A Brightway class, a
Sentier command, a BAFU file layout: those live in their own branch and link back to
the concept page here.

## Naming rule

One subject per file, `lower-case-with-hyphens.md`, named after the concept rather
than the document that defines it: `functional-unit.md`, not `iso-14044-3-2.md`.
Sector files carry the GICS sector name: `information-technology.md`.

## How to add here

1. Register the sources you will cite in [../sources.md](../sources.md) first; a page
   whose `sources:` ids do not resolve is not accepted.
2. Copy the matching template from [../templates/pages/](../templates/pages/) and fill
   the frontmatter.
3. Add the terms you introduce to [../vocabulary.md](../vocabulary.md), one
   bullet per source and context, never merged with an existing definition.
4. Add the page to `index.md`, add any new terms to `vocabulary.md`, check by hand that
   your links resolve, then append one line to [../log.md](../log.md).
