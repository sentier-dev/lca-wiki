---
title: sentier-agribalyse use cases
type: readme
summary: End-to-end things a practitioner does with the Agribalyse adapter.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-agribalyse use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [understand-the-public-twin-workflow.md](understand-the-public-twin-workflow.md): what a licensed user does end to end, and what stays public.
- [list-the-console-scripts.md](list-the-console-scripts.md): the 24 commands the adapter installs, and one command's help.

Further candidates, in the order they would help a reader: backtesting the published
reference results, explaining why one product deviates, running a what-if on a process
parameter, and exporting the linked system for a tool that reads Brightway
datapackages. Each needs a licensed background database, which the use case has to state
in its environment.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `backtest-a-product-against-the-reference.md`, not `run-dds-backtest.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean clone and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
