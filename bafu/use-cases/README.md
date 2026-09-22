---
title: bafu/use-cases
type: readme
summary: End-to-end things a practitioner does with the BAFU database.
audience: [P1]
updated: 2026-09-22
sources: []
---

# bafu/use-cases

One file per use case: persona and GICS sector, goal, prerequisites, steps with
commands, expected output, pitfalls, related vocabulary anchors, and whether the steps
were actually run.

## Pages here

- [download-and-verify-the-release.md](download-and-verify-the-release.md): get the
  components and record your own checksums.
- [open-the-release-in-openlca.md](open-the-release-in-openlca.md): load the openLCA
  package as a new database.
- [inspect-the-lcia-results-workbook-structure.md](inspect-the-lcia-results-workbook-structure.md):
  the shape of the published results workbook, without its numbers.
- [install-into-brightway.md](install-into-brightway.md): a pointer page, naming the
  supported route into Brightway and why it is the loader rather than your own importer.
  The commands are on the loader's pages in
  [../../sentier/modules/sentier-brightway/use-cases/](../../sentier/modules/sentier-brightway/use-cases/).

## What belongs here

Use cases whose subject is this database: obtaining a release, reading it, checking its
coverage, comparing a version with the previous one, taking it into an LCA tool through
a documented importer.

## What does not belong here

Descriptions of the database (they are [../knowledge/](../knowledge/)) and use cases
whose real subject is a tool (they belong to that tool's module folder).

## Naming rule

`lower-case-with-hyphens.md` naming the outcome, verb first:
`install-a-release.md`, `check-sector-coverage.md`.

## How to add here

1. Copy [../../templates/pages/use-case.md](../../templates/pages/use-case.md).
2. Run the steps yourself in a clean environment and set `verified: yes` with the date
   and the environment; otherwise set `verified: no` and say why.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
