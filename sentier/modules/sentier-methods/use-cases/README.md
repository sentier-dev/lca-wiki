---
title: sentier-methods use cases
type: readme
summary: End-to-end things a practitioner does with the Sentier method data.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-methods use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [read-ef-3-1-categories-and-units.md](read-ef-3-1-categories-and-units.md): the 25 EF 3.1 categories with their method ids and units.
- [validate-the-methods-schema.md](validate-the-methods-schema.md): run the repository's own validator, as CI does.

Further candidates, in the order they would help a reader: listing the impact categories a
datasource offers, extracting the factors of one category, choosing a non-overlapping
set of categories to report, and deciding how to treat regionalised factors.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `list-the-impact-categories.md`, not `read-methods-parquet.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean clone and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
