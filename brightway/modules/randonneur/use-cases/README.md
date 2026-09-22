---
title: randonneur use cases
type: readme
summary: End-to-end things a practitioner does with randonneur.
audience: [P1]
updated: 2026-09-22
sources: []
---

# randonneur use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a practitioner does end to end with randonneur: relinking an inventory to a
newer background release, moving a SimaPro export into ecoinvent nomenclature,
normalising units across a project, or turning a spreadsheet of matches into a
reusable transformation package.

## Pages here

- [Apply a migration to inventory data](apply-a-migration-to-inventory-data.md) — Rewrite the edge names of an inventory with a randonneur transformation, and find the published transformation for your database pair in the registry. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `relink-an-inventory-to-a-newer-release.md`, not `run-migrate-edges.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
