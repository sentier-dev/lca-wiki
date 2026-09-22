---
title: sentier-importers status
type: module-page
summary: Where sentier-importers stands at version 0.0.1.
audience: [P2]
updated: 2026-09-22
sources: [sentier-importers-repo]
---

# sentier-importers status

As of 2026-09-21, from the repository README, `CONTRIBUTING.md`, `registry.yaml` and the
source tree at commit `dac2e67` (2026-09-17), version 0.0.1.
(source: sentier-importers-repo)

## Works today

- **The framework.** One staged pipeline drives every source: fetch, parse, transform,
  dedup, assemble, validate, emit, deliver. A source declares itself in the registry and
  implements one method.
- **Four targets.** The vocabulary, inventory, methods and mappings repositories are
  registered, each with the folder files land in and the validator that applies.
- **Validation before delivery.** Vocabulary rows are validated against the target's
  LinkML schema at a pinned reference, fetched through the same cache as the data, so a
  validation run is reproducible and works offline once the cache is warm.
- **Three output formats.** YAML and JSON for terms and mapping packages, parquet with an
  explicit Arrow schema for bulk tables.
- **Delivery by pull request**, or into a local checkout, or not at all: a run is a dry
  run unless asked otherwise.
- **Flow matching.** A tiered matcher maps inventory elementary flows onto method flows
  with compartment placement rules, curated aliases and label-defect corrections as data,
  and produces reviewable sidecars for what it infers.
- **66 registered sources** across five families, and a reference plugin to copy.
- **Tests offline.** The suite collected 722 tests on 2026-09-21; CI runs it and then the
  plugin tests, with no network access.

## In flight

- The version is 0.0.1 and the package is not published: every use is from a clone.
- 65 of the 66 sources are disabled by default, and the inventory, Agribalyse and EF
  families additionally need local input files, so a fresh clone can only run the
  reference plugin end to end.

## Missing

- No published library API: every entry point is a console script or an import from a
  clone.
- No use case that reviews what a mapping run inferred, and accepts or rejects an entry;
  [use-cases/](use-cases/) covers running a source and adding one.
- Sources that read local paths have no open fetch route, which is a documentation gap
  as much as a code one: what a contributor must obtain, and from where, belongs on the
  data-source branches.

## Where help is welcome

Adding a source is the smallest useful contribution: a folder under the sources package
with a class implementing one method, a registry block, and tests with a cached fetch
fixture. Anything larger is on [../../roadmap.md](../../roadmap.md).
