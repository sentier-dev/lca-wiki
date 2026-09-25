---
title: <community name>
type: branch
summary: "<One line: what this community is and what its branch covers.>"
audience: [P1, P2, P3]
updated: <YYYY-MM-DD>
sources: []
---

# <community name>

<What the community is: the tool, platform, network or database this branch documents,
who maintains it, and who its pages are for.>

Copy this folder to the root of the repository as `<name>/`, then replace every
placeholder. The branch starts with the same kit as every other: the schema in
`AGENTS.md` (with its `CLAUDE.md` symlink), the skills in `.claude/skills/` and the house
rules in `.claude/rules/`, which apply to this branch from the first commit.

## What belongs here

| Path | What it holds |
|---|---|
| `modules/` | one folder per module of this community |
| `../vocabulary.md` | the root vocabulary, where this community adds its own contexts |
| `roadmap.md` | what is missing and where a contributor can help |
| <other pages> | <what they hold> |

## What does not belong here

Methodology that is not specific to this community: that belongs in `core/`, and this
branch links to it. Another community's tooling: that gets its own branch.

## Naming rule

<How files and module folders are named here. The default: one folder per module, named
exactly as the module is named upstream; pages `lower-case-with-hyphens.md`.>

## How to add here

1. Register your sources in `sources.md` first.
2. Copy the right template from `templates/pages/` and fill it.
3. Add new terms to the root `../vocabulary.md`, one bullet per source and context.
4. Add the page to `index.md`, add any new terms to `vocabulary.md`, check by hand that
   your links resolve, then append one line to `log.md`.
