# templates/pages

One template per page type, and the written-out reference for every page's
frontmatter.

## What belongs here

| File | For |
|---|---|
| [frontmatter.schema.yaml](frontmatter.schema.yaml) | the frontmatter reference: required fields, allowed page types, when `sources:` may be empty |
| [concept.md](concept.md) | a concept of LCA methodology |
| [standard.md](standard.md) | a standard, guidance document or data format |
| [sector.md](sector.md) | a GICS sector |
| [use-case.md](use-case.md) | an end-to-end thing a practitioner does |
| [vocab-entry.md](vocab-entry.md) | the shape of one entry inside the root `vocabulary.md` |
| [module-codebase/](module-codebase/) | a module you install and import |
| [module-database/](module-database/) | an external database documented as a root branch |

## Naming rule

A template is named after the page type. A copy is named after its subject.

## How to add a template

Add it when a page type exists that no template covers, and add that type to
[frontmatter.schema.yaml](frontmatter.schema.yaml) and to the page-type table in
[../../AGENTS.md](../../AGENTS.md) in the same
change.
