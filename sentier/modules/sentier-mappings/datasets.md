---
title: sentier-mappings datasets
type: module-page
summary: The five bridge pairs, what each one spans, how many packages it holds, and why a licensed target carries no proprietary data.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-mappings-repo]
related: [../sentier-inventory/datasets.md, ../sentier-methods/datasets.md, ../../../ecoinvent/README.md]
---

# sentier-mappings datasets

One section per pair. Descriptors stay broad: which identifier space is bridged to which,
how many packages a pair holds and how they relate. No mapped identifier lists and no
licensed nomenclature appear here. Counts are as declared in each pair's metadata at
commit `4a25ec3`, 2026-09-17. (source: sentier-mappings-repo)

## `bafu-2026-v1__ef-3.1`

- **Source:** the elementary flows of the Swiss federal inventory release carried in
  [../sentier-inventory/](../sentier-inventory/), whose codes are deterministic
  name-based identifiers over name, category, sub-category and unit.
- **Target:** the flow keys the EF 3.1 characterisation factors in
  [../sentier-methods/](../sentier-methods/) are indexed by.
- **Packages:** four, ordered, 2,566 entries in total. This is the pair that makes the
  shipped inventory scorable, and the worked example in the repository's own
  documentation.
- **How the four relate:** each package was built over what the earlier ones leave
  unmapped, so a later file holds only flows no earlier file maps.
  1. *curated*, the hand-reviewed reference bridge: every target is the EF 3.1 flow
     carrying the identical factor vector, derived by factor identity rather than by
     name, plus reviewed contributions landed by pull request.
  2. *inferred*: placed through the Eaternity flow family at sub-compartment level, then
     resolved to the EF flow carrying the identical factor vector in the same
     compartment.
  3. *matched*: public matching only, on names, synonyms taken from the vocabulary's
     alternative labels, CAS numbers, qualifier spellings, a land-use class rule, an ore
     composite rule and a curated alias table, against the EF flows that actually carry
     a factor.
  4. *nomenclature*: targets that exist in the EF nomenclature but carry no
     characterisation factor in any of the 25 categories. These entries align names, not
     scores: their impact contribution is zero by construction.
- **Sidecars:** a pair-level coverage file with one row per source flow saying which
  package covers it or why none does, and three package-level review files covering the
  land use pairs, the sub-compartment retargets and the inferred entries. Sidecars are
  non-normative.
- **Unit handling:** where a magnitude differs, for example an activity unit against its
  thousandfold, the entry carries an explicit conversion factor, which the validator
  checks.

## `agribalyse-3.2__ef-3.1`

- **Source:** the elementary flows of the public Agribalyse 3.2 release.
- **Target:** EF 3.1 characterisation flow keys.
- **Packages:** one, `biosphere.json`, 1,095 entries, keyed by flow name on the source
  side and naming the target flow by name, unit and code.
- **Related work:** the public Agribalyse adapter in
  [../sentier-agribalyse/](../sentier-agribalyse/) authors and consumes mapping packages
  of this shape.

## `eaternity-bafu-ext__ef-3.1`

- **Source:** a provisional datasource, Eaternity's extension of their instance of the
  same Swiss federal release, with sub-compartments collapsed and substances added
  beyond the official release. It is explicitly not the release itself.
- **Target:** EF 3.1 characterisation flow keys.
- **Packages:** one, 19,275 entries, by far the largest package here. The bulk is
  regionalised land-use pairs, one per flow and country code, contributed by pull
  request.
- **Caveat carried in the metadata:** the pair is to be re-pinned against a published,
  versioned Eaternity flow list.

## `ecoinvent-biosphere3__eaternity-bafu-ext`

- **Source:** the ecoinvent biosphere3 elementary flows, by name, code, unit and
  context.
- **Target:** the same provisional Eaternity datasource as above, in its own code space.
- **Packages:** one, 1,371 entries, contributed by pull request. The metadata records
  that most targets resolve by name, root compartment and unit to a flow of the official
  release and that the remainder are extension flows.
- **A biosphere bridge, not an inventory one:** it maps flow nomenclature. It carries no
  ecoinvent activity, no amount and no licensed inventory content.

## `agribalyse-3.2__ecoinvent-3.9.1`

- **Source:** Agribalyse 3.2 foreground processes.
- **Target:** ecoinvent 3.9.1 background activities. This pair is marked
  `target_proprietary`.
- **Packages:** one declared `technosphere.json` with zero entries and no file present,
  which is how a reserved but unpopulated pair is expressed.
- **Encoding when it is populated:** every target will carry only the database name and
  the activity code. Never a name, a reference product, a location, an amount or a flow.
  A licensed holder resolves the code against their own copy at link time, and the
  validator refuses a pull request that puts anything else in a proprietary target.
  See [../../../ecoinvent/](../../../ecoinvent/) for the database itself.

## Why a licensed target is safe to publish

The rule is structural rather than editorial. A pair declares `target_proprietary`, the
schema then constrains what a target may contain, and the validator enforces it on every
pull request with dedicated test cases for both a leak and a clean target. The result is
a bridge that is useless to someone without a licence and complete for someone with one,
which is what lets the mapping live in a public repository at all.

## Shape of the data

Every package is a randonneur JSON file: a name, a version, an optional description and
one array per verb. Today only `replace` entries are delivered. Each entry pairs an open
source identifier dictionary with a target dictionary, optionally a conversion factor
and a comment. Packages are committed directly as JSON; there is no git-LFS and there
are no release artifacts.
