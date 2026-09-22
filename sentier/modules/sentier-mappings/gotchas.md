---
title: sentier-mappings gotchas
type: module-page
summary: "What surprises people: ordered packages, a zero-impact nomenclature package, a provisional datasource, and targets that are deliberately opaque."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-mappings-repo]
---

# sentier-mappings gotchas

Each bullet says what happens, why, and what to do instead. Checked against the
repository at commit `4a25ec3`, 2026-09-17. (source: sentier-mappings-repo)

- **Apply the packages of a pair in the declared order.** The order in `metadata.json`
  is the contract, and for a numbered filename the number repeats it. Loading a folder
  with a glob and applying the files in whatever order the filesystem returns is the
  most likely way to get a subtly wrong result, even though the validator proves the
  packages never disagree on a source key.

- **The order is per pair only.** A number in a filename says nothing about another
  pair. Different pairs never conflict, which is why pair folders carry no rank at all.
  Do not build a global precedence out of these numbers.

- **The fourth BAFU package maps names, not impact.** Its targets are EF flows that
  carry no characterisation factor in any of the 25 categories, so every entry
  contributes exactly zero to a score. It exists so that a flow has a recognised name
  rather than falling into a residual bucket. Counting it as coverage overstates how
  much of an inventory is actually characterised.

- **`eaternity-bafu-ext` is not the Swiss federal release.** It is a provisional
  datasource: one organisation's instance of that release with sub-compartments
  collapsed and extra substances added. Its metadata says it is to be re-pinned against
  a published, versioned flow list. Treat a bridge whose source or target is that
  identifier as provisional, and do not substitute it for `bafu-2026-v1`.

- **A stub pair has a package entry and no file.** The reserved ecoinvent pair declares
  one package with zero entries and ships no JSON. Zero is the only entry count allowed
  for an absent file, so code that iterates packages has to handle the missing file.

- **A proprietary target is opaque on purpose.** For a pair marked
  `target_proprietary`, a target carries only the database name and the code. There is
  no name to eyeball and no way to review the mapping without a licence. That is the
  condition under which the bridge can be public at all; a pull request that adds a
  readable field to such a target is refused by the validator.

- **Sidecars are not mappings.** The coverage and review files sit in the same folder
  and are listed in the metadata, but they are non-normative. An unlisted JSON file in a
  pair folder is a stray and fails validation, so add the listing in the same change.

- **Units are checked, not converted.** A cross-dimension entry must carry an explicit
  conversion factor, and a same-dimension magnitude change must carry exactly the right
  one, unless its comment names a mass fraction. Unit strings the validator does not
  recognise are skipped rather than guessed at, so an unusual unit is neither checked
  nor blocked.

- **The source key is code and context, or name and context.** Duplicate detection uses
  the code plus the context when a code exists, otherwise the name plus the context. An
  entry with neither is skipped, so it is not protected against shadowing. Give a source
  a code where you can.

- **Only `replace` is used today.** The profile allows `update`, `delete` and `create`
  per the randonneur specification, and no delivered package uses them. A consumer that
  only implements `replace` works today and will break the day one appears.

- **Nothing here applies a mapping.** This is a data layer. Application belongs to
  randonneur or to the loader in [../sentier-brightway/](../sentier-brightway/).
