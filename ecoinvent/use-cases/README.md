---
title: ecoinvent/use-cases
type: readme
summary: End-to-end things a licensed practitioner does with the ecoinvent database.
audience: [P1]
updated: 2026-09-22
sources: []
---

# ecoinvent/use-cases

One file per use case: persona and GICS sector, goal, prerequisites (a licence among
them), steps with commands, expected output, pitfalls, related vocabulary anchors, and
whether the steps were actually run.

## Pages here

- [get-access-and-credentials.md](get-access-and-credentials.md): which licence, where
  the credentials live, what may leave your machine.
- [download-a-release-with-ecoinvent-interface.md](download-a-release-with-ecoinvent-interface.md):
  the authenticated Python route to an extracted release.
- [import-ecospold2-into-brightway-with-bw2io.md](import-ecospold2-into-brightway-with-bw2io.md):
  an extracted release into a Brightway project, linked and checked.
- [map-ecoinvent-flows-to-ef-3-1.md](map-ecoinvent-flows-to-ef-3-1.md): build a flow
  bridge onto EF 3.1 and publish it as codes only.

## What belongs here

Use cases whose subject is this database: obtaining a release as a licensed user,
importing it into a tool, comparing system models, mapping its flows onto another
nomenclature.

## What does not belong here

Anything a reader without a licence could use to get at the data, and any output that
contains amounts. A use case shows the commands and describes the result; it does not
paste the numbers.

## Naming rule

`lower-case-with-hyphens.md` naming the outcome, verb first:
`import-a-release.md`, `compare-system-models.md`.

## How to add here

1. Copy [../../templates/pages/use-case.md](../../templates/pages/use-case.md).
2. State the licence prerequisite first, before any command.
3. Set `verified:` honestly, with the date and environment when yes.
4. Add the page to `index.md` and check by hand that every link and anchor resolves.
