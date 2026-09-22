---
title: sentier-importers use cases
type: readme
summary: End-to-end things a practitioner does with sentier-importers.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-importers use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [run-an-importer-end-to-end.md](run-an-importer-end-to-end.md): the reference plugin through the full staged pipeline, offline.
- [add-a-new-source-plugin.md](add-a-new-source-plugin.md): the skeleton a new source needs, from transform to tests.

## What belongs here

An end-to-end thing a practitioner does with this module, run start to finish, with the
commands as they were actually typed and the result as it actually came back.
Candidates, in the order a newcomer meets them: run the reference plugin as a dry run
and read what it staged, add a source for a small external list, validate a source
against an unmerged schema, and review what a mapping run inferred before proposing it.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `import-a-small-vocabulary-list.md`, not `run-pipeline.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, with the date
   and the environment when the answer is yes.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
