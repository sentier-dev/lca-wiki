---
title: bw_timex use cases
type: readme
summary: End-to-end things a practitioner does with bw_timex.
audience: [P1]
updated: 2026-09-22
sources: []
---

# bw_timex use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a practitioner does end to end with bw_timex: assessing a long-lived product
against background databases of several vintages, comparing a static score with a
dynamic one, or comparing two configurations of the same model.

A use case here records the environment carefully. bw_timex needs Brightway 2.5, a
solver choice that depends on the platform, and dated background databases, so a run
that is not reproducible is not a use case.

## Pages here

- [Run the electric vehicle example](run-the-electric-vehicle-example.md) — Build bw_timex's bundled electric vehicle product system, date its databases and compare a static score with a time-explicit one. *(not verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `assess-a-long-lived-product-over-time.md`, not `run-timexlca.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, with the
   bw_timex version, the solver and the background vintages used.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
