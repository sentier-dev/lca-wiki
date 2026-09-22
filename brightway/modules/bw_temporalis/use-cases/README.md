---
title: bw_temporalis use cases
type: readme
summary: End-to-end things a practitioner does with bw_temporalis.
audience: [P1]
updated: 2026-09-22
sources: []
---

# bw_temporalis use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a practitioner does end to end with bw_temporalis: giving a foreground model
timing, checking that the distributions are consistent with the exchange amounts,
building a timeline of dated emissions, and characterising it as radiative forcing over
a horizon.

## Pages here

- [Run a temporal LCA on a toy system](run-a-temporal-lca-on-a-toy-system.md) — Attach temporal distributions to the edges of a two-process system, traverse it with TemporalisLCA, and read the emissions timeline year by year. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `spread-emissions-over-time.md`, not `use-temporaldistribution.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, including the
   traversal cutoffs, since a timeline cannot be read without them.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
