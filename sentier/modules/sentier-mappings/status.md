---
title: sentier-mappings status
type: module-page
summary: "Where the mapping repository stands: four populated pairs, one reserved, biosphere bridges only."
audience: [P2]
updated: 2026-09-21
sources: [sentier-mappings-repo]
---

# sentier-mappings status

As of commit `4a25ec3`, dated 2026-09-17. (source: sentier-mappings-repo)

## Works today

- Four populated pairs, 24,307 entries in total, all validating.
- The ordered multi-package pattern works end to end on the Swiss federal to EF 3.1
  bridge, including a pair-level coverage sidecar and three review sidecars.
- The proprietary-target rule is enforced structurally, with test cases for both a leak
  and a clean target, which is what makes a bridge to a licensed database publishable.
- The validator has its own pytest suite covering naming, ordering, entry counts,
  duplicate source keys, unit consistency, stray files and malformed JSON.
- Contribution by pull request works: several packages here were contributed from
  outside the core team.

## In flight

- **The ecoinvent pair is reserved and empty.** `agribalyse-3.2__ecoinvent-3.9.1`
  declares a zero-entry technosphere package. Populating it is the open piece of the
  foreground to background story.
- **The provisional Eaternity datasource.** Two pairs depend on an instance that the
  metadata says must be re-pinned to a published, versioned flow list.
- **Mapping schema `0.2.0`.** The metadata schema pins the version exactly, so a change
  is a coordinated migration rather than an addition.

## Missing

- No technosphere package anywhere: every delivered package is a biosphere bridge.
- No `update`, `delete` or `create` entries, so those verbs are untested in practice.
- No recorded randonneur specification version. The schema README says the targeted
  version is recorded in `schema/`, and the files state a package profile rather than a
  version number.
- No coverage sidecar for pairs other than the Swiss federal one, so coverage is only
  measurable for that bridge.

## Where help is welcome

A technosphere bridge, a coverage sidecar for another pair, and pinning the provisional
datasource are the three tractable contributions. Anything bigger belongs on
[../../roadmap.md](../../roadmap.md).
