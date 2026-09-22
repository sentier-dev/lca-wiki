---
title: sentier-methods status
type: module-page
summary: "Where the methods repository stands: one full datasource, two reserved scaffolds, no normalisation sets."
audience: [P2]
updated: 2026-09-21
sources: [sentier-methods-repo]
---

# sentier-methods status

As of commit `8d0f504`, dated 2026-09-17. (source: sentier-methods-repo)

## Works today

- EF 3.1 is delivered in full: 25 impact categories and 319,393 characterisation
  factors, including regionalised rows, validating against the schema contract.
- The schema contract is stable enough to be read by the importers as the cast and
  validate target before a delivery.
- Continuous integration validates metadata, required columns, dtypes, the primary key
  and the foreign key on every pull request.
- The delivery convention, metadata first and parquet by pull request, works: two
  datasources are already reserved with valid metadata and no data.
- Downstream registration works through the loader documented in
  [../sentier-brightway/](../sentier-brightway/).

## In flight

- **IPCC 2021** and **ReCiPe 2016** are declared and empty. Their metadata has no
  licence, no source URL and no retrieval date yet, which is the first thing a delivery
  would fill in.
- **Schema version `0.1.0`.** The contract is young: the optional `indicator` column and
  the normalisation and weighting table are defined and unused.

## Missing

- No normalisation or weighting sets for any datasource.
- No row count check in the validator, so the counts in metadata are advisory.
- No characterisation of anything: turning these factors into scores is out of scope
  here, by design.
- No generated API reference in this wiki: there is no package, so `api/` stays absent.

## Where help is welcome

Delivering IPCC 2021 or ReCiPe 2016 through the importers is the obvious contribution,
and adding a row count check to the validator is a small self-contained one. Anything
bigger belongs on [../../roadmap.md](../../roadmap.md).
