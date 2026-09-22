---
title: sentier-agribalyse status
type: module-page
summary: "Where the adapter stands: a complete public pipeline, a licensed bootstrap, and a backtest that has to be run to be believed."
audience: [P2]
updated: 2026-09-22
sources: [sentier-agribalyse-repo]
---

# sentier-agribalyse status

Version `0.3.0`, at commit `3d0df56` dated 2026-09-17.
(source: sentier-agribalyse-repo)

## Works today

- The full chain is implemented and driven by 24 console scripts: parse, transform,
  build the registry, link, register the headline EF 3.1 categories, score, backtest,
  decompose, export.
- The licence separation works structurally: an ignore file, a pre-commit guard naming
  five paths, a bootstrap document for a licensed user, and a strip command that
  produces a public-only skeleton.
- The Brightway export parity-checks itself against a stock calculation before it is
  written, with a configurable number of products or the whole set.
- The tiered mapping registry is data. Tier order, row counts per table and a hash per
  input are recorded in the committed registry metadata.
- The test suite runs on synthetic fixtures with no licensed data, no credentials and no
  network: 80 unit test modules and 13 integration ones, with lint, on every push and
  pull request.
- A static review interface ships with the repository, with no build step.

## In flight

- **Mapping coverage.** The residual unlinked exports are committed precisely so that
  the gap is visible, and two paths exist to close it: human review of the comparison
  spreadsheet and model-assisted suggestions that a human accepts.
- **The two factor sources.** The adapted and reference factor tables are compared and
  audited rather than reconciled.
- **Publishing the mappings outward.** The repository authors randonneur packages, and
  the corresponding pair in [../sentier-mappings/](../sentier-mappings/) that targets a
  licensed background database is still a reserved stub.

## Missing

- No public dataset. By construction, a licensed user is needed for a full run, and what
  can be shared is the skeleton, the mapping packages and the review artifacts.
- No use case here runs the pipeline end to end: without a licensed background only
  [use-cases/list-the-console-scripts.md](use-cases/list-the-console-scripts.md) can be
  verified, and
  [use-cases/understand-the-public-twin-workflow.md](use-cases/understand-the-public-twin-workflow.md)
  stays `verified: no`.
- The published design notes are internal, so the rationale behind the tier ladder is
  not publicly readable.

## Where help is welcome

Reviewing residual unlinked flows is the contribution with the clearest value and the
lowest barrier, because it needs the public inputs only. Anything larger belongs on
[../../roadmap.md](../../roadmap.md).
