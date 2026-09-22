---
title: sentier-importers gotchas
type: module-page
summary: What surprises people about sentier-importers, and what to do about it.
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-importers-repo]
---

# sentier-importers gotchas

One bullet per surprise, as the repository documents them at commit `dac2e67`.
(source: sentier-importers-repo)

- **Most sources are disabled.** 65 of the 66 registered sources carry `enabled: false`;
  only the reference plugin runs by default. Large imports are opt-in so that the
  run-everything smoke test stays fast. Name the source explicitly to run it.

- **Several sources need local input files.** The inventory, Agribalyse and EF sources
  read local paths, so they only run on a machine that already holds those files. A
  clone alone is not enough.

- **A run is a dry run.** Without `--deliver` nothing leaves the staging folder, and
  `--deliver` additionally needs an authenticated `gh`. Use `--deliver-local` to inspect
  the diff in a checkout of the target first.

- **Validation is pinned to the target's schema reference.** The vocabulary target's
  LinkML schema is fetched at its pinned reference and cached, so a schema change that
  is not merged yet will not be picked up. Pass `--schema-dir` while the schema change is
  in flight.

- **Deduplication distinguishes two failures.** Two rows with the same identifier and
  different content are an error, because that is a transform bug. A row whose identifier
  is already in the target is skipped, refused or overwritten according to the source's
  declared setting; the default is to skip.

- **Identifiers are minted, not copied.** A source slugifies a stable upstream key into
  the IRI, so re-running a source must produce byte-identical identifiers. Changing the
  slug input silently produces a second term rather than an update.

- **The matcher answers "no" with a reason.** An unmatched flow comes back with the
  reason it failed, and one reason, a missing sub-compartment, does not stop the search:
  a later tier may still place the same substance correctly. Read the review sidecars
  before treating an unmatched flow as a gap in the upstream data.

- **Mapping packages have an order.** Within one source-and-target pair the packages are
  numbered, and an earlier package wins on a shared source key. Adding an entry to the
  wrong package changes which mapping applies.

- **A bridge that targets a licensed database carries codes only.** Those packages are
  marked as targeting proprietary data and may carry nothing but a database name and an
  opaque code, no names, no amounts. The target repository's validator enforces it on
  every pull request.

- **Tests never touch the network.** A source ships cached fetch fixtures, and the
  offline flag makes a cache miss an error rather than a download. A test that needs new
  input needs a new fixture.

- **The framework never emits Turtle.** If you expect RDF out of a run, you are looking
  at the wrong repository: the vocabulary repository generates it from what was
  delivered.
