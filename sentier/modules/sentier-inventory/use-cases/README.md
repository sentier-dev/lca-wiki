---
title: sentier-inventory use cases
type: readme
summary: End-to-end things a practitioner does with the Sentier inventory data.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-inventory use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [read-a-sector-folder-with-pandas.md](read-a-sector-folder-with-pandas.md): one sector's processes and exchanges in a dataframe.
- [validate-the-inventory-schema.md](validate-the-inventory-schema.md): run the repository's own validator, as CI does.

Further candidates, in the order they would help a reader: reading one sector into a
dataframe, validating a delivery before opening a pull request, merging two sector
folders under the rank rule, and finding the processes that produce a given reference
product.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `read-a-sector-into-a-dataframe.md`, not `run-pyarrow.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean clone and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
