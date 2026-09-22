---
title: sentier-mappings package profile and validator
type: module-page
summary: "The public surface of a data-only repository: the randonneur package profile, the pair metadata schema, and the eleven checks the validator enforces."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-mappings-repo, randonneur-repo]
---

# sentier-mappings package profile and validator

No Python package, so no classes. What a consumer depends on is the package profile, the
identity file, and what the validator refuses. Read from the repository at commit
`4a25ec3`. (source: sentier-mappings-repo)

## The package profile

A package file is a randonneur datapackage restricted by
`schema/randonneur-package.schema.json`.

| Key | Required | What it holds |
|---|---|---|
| `name` | yes | the package name, conventionally `<source>__<target>-<kind>` |
| `version` | yes | the package version, independent of the mapping schema version |
| `description` | no | prose about how the package was built |
| `replace` | no | entries that rewrite a source edge's target |
| `update` | no | entries that adjust fields in place without changing identity |
| `delete`, `create` | no | available per the randonneur specification, unused today |

An entry requires a `source` dictionary of open identifiers and usually carries a
`target` dictionary, an optional numeric `conversion_factor` applied when the units
differ, and an optional `comment`. In the delivered biosphere packages a source or
target is a flow identified by name, code, unit and context.
(source: sentier-mappings-repo, randonneur-repo)

## The three mapping kinds

| Kind | Bridges | File | Target encoding |
|---|---|---|---|
| foreground to background | an inventory source to a licensed background database | `technosphere.json` | only a database and a code, an opaque pointer |
| process to process | an inventory source to another inventory source | `technosphere.json` | full open identifiers |
| elementary flow to factor key | inventory flows to method flow keys | `biosphere.json` | full open identifiers |

## The pair identity file

`metadata.json` is validated against `schema/metadata.schema.json`, which allows no
unknown keys. It requires `source`, `target`, `title`, `target_proprietary`,
`schema_version` fixed at `0.2.0`, and `packages`: an ordered list where each entry
names the file, the kind, its one-based order and its entry count, and may add a title,
a description, the generator that produced it and package-scoped sidecars. A pair may
also declare sidecars of its own.

## What the validator guarantees

`scripts/validate.py` walks every pair folder and fails on any of the following.

| Check | Why it matters |
|---|---|
| metadata validates against its schema | no stray keys, and the schema version is pinned |
| folder name equals `source__target` | the folder name is a reliable key |
| every listed package validates against the package profile | a package is always readable as randonneur |
| declared entries equal the real entry count | counts can be trusted; zero is the only count allowed for an absent file |
| `order` equals the position in the list, and the `<n>` in a numbered filename equals it | file order and declared order cannot drift apart |
| a single package of a kind uses the bare name, several use the numbered form | naming is unambiguous |
| when the target is proprietary, every target carries only a database and a code | licensed nomenclature cannot leak into a public repository |
| unit consistency | a cross-dimension pair must carry an explicit conversion factor, and a same-dimension magnitude change must carry the right one, unless the comment names a mass fraction |
| no duplicate source key inside a package or across the packages of a pair | randonneur applies entries in order, so a duplicate would silently shadow |
| every JSON file is the metadata, a listed package or a listed sidecar | no stray or orphaned files |
| malformed JSON is reported as an error line | a broken file gives a message, not a traceback |

The source key is the code and context when a code is present, otherwise the name and
context. An entry with neither is skipped rather than guessed at, and unit strings the
validator does not recognise are skipped rather than guessed at.

## Precedence

Precedence is per pair, never global. Package `n` was built over what packages one to
`n` minus one left unmapped, so applying the packages in file order and letting the
earlier file win reproduces the intended result. Because the validator proves the
packages of a pair never disagree on a source key, the order records provenance and
confidence rather than resolving live conflicts.

## Notes

- Nothing in this repository applies a mapping. Reading a package and applying it is the
  consumer's job, through randonneur or through the loader documented in
  [../sentier-brightway/](../sentier-brightway/).
- A sidecar is non-normative by definition: review notes and coverage reports live
  beside the packages, are listed in the metadata, and must never be read as mappings.
