---
title: sentier-mappings use cases
type: readme
summary: End-to-end things a practitioner does with the Sentier mapping packages.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-mappings use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [apply-a-mapping-package-with-randonneur.md](apply-a-mapping-package-with-randonneur.md): relink a toy frame onto EF 3.1 flows, and see what an unmapped flow does.
- [validate-a-mapping-package.md](validate-a-mapping-package.md): run the repository's own validator and its test suite, as CI does.

Further candidates, in the order they would help a reader: relinking an inventory onto EF
3.1 flow keys, reading a pair's coverage sidecar to see what is unmapped, contributing a
package by pull request, and resolving an opaque code against a licensed database you
already hold.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `relink-an-inventory-to-ef-flows.md`, not `apply-randonneur.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean clone and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
