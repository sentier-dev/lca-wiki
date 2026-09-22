---
title: activity-browser use cases
type: readme
summary: End-to-end things a practitioner does with Activity Browser.
audience: [P1]
updated: 2026-09-22
sources: []
---

# activity-browser use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a practitioner does end to end in the interface: setting up a project and
importing a database, building a product system by editing activities and exchanges,
running a calculation setup across several impact categories, or reading a contribution
analysis.

Say which line the steps were run on. Activity Browser 2 and the 3.0 beta differ enough
that a use case without that is not reproducible.

## Pages here

- [Install Activity Browser and open a project](install-and-open-a-project.md) — Install the graphical interface from conda-forge, start it, and open a Brightway project a Python session created. *(not verified)*
- [Run a scenario difference file](run-a-scenario-difference-file.md) — Sweep a set of scenarios through Activity Browser's superstructure layer by handing it a spreadsheet of changed exchange values. *(not verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `set-up-a-project-and-import-a-database.md`, not `use-the-import-wizard.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps yourself and record `verified:` honestly, with the version and the
   channel it came from. A graphical workflow cannot be verified by reading the source.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
