---
title: ecoinvent_interface use cases
type: readme
summary: End-to-end things a licensed user does with ecoinvent_interface.
audience: [P1]
updated: 2026-09-22
sources: []
---

# ecoinvent_interface use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

Things a licensed ecoinvent user does end to end: setting up credentials on a private
machine, downloading a release of a chosen system model, fetching the impact assessment
workbook, or pulling the report for one dataset.

Access mechanics only. A use case here never reproduces ecoinvent content: no activity
records, no amounts, no characterisation factors. Where a step would show data, show
the shape and stop.

## Pages here

- [List releases and download one](list-releases-and-download.md) — Authenticate against the ecoinvent API, list the versions and system models your licence covers, and download a release or a single process. *(not verified)*
- [Read the bundled mapping index](read-the-bundled-mapping-index.md) — Open the mappings archive shipped inside ecoinvent_interface, without credentials, to see which releases and system models it indexes and what a record holds. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `download-a-release-for-a-project.md`, not `call-get-release.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly. A run needs a
   licence, so `verified: no` is the honest answer for anyone without one.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
