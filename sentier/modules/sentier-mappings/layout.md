---
title: sentier-mappings layout
type: module-page
summary: "The repository tree: five pair folders, two JSON Schemas, one validator with its own test suite."
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-mappings-repo]
---

# sentier-mappings layout

The whole repository, as of commit `4a25ec3` dated 2026-09-17.
(source: sentier-mappings-repo)

```
data/                                   the bridges, one folder per pair
  README.md                             the naming convention and a worked example
  agribalyse-3.2__ecoinvent-3.9.1/      stub: .gitkeep and a metadata.json declaring
                                        a zero-entry technosphere package
  agribalyse-3.2__ef-3.1/               biosphere.json plus metadata.json
  bafu-2026-v1__ef-3.1/                 four ordered biosphere packages, metadata.json,
                                        a pair-level coverage sidecar and three review
                                        sidecars
  eaternity-bafu-ext__ef-3.1/           biosphere.json, metadata.json, one review sidecar
  ecoinvent-biosphere3__eaternity-bafu-ext/
                                        biosphere.json, metadata.json, one candidate
                                        sidecar
schema/                                 the contract, read by the importers before delivery
  README.md                             the three mapping kinds, the verbs, precedence
  randonneur-package.schema.json        the profile a package file must follow
  metadata.schema.json                  the identity file of a pair, schema version 0.2.0
scripts/
  validate.py                           the CI validator
  requirements.txt                      jsonschema[format] and pytest
tests/test_validate.py                  the validator's own pytest suite
.github/workflows/ci.yml                runs the validator and its tests on every pull request
LICENSE                                 MIT
README.md                               what the repository is, the pair table, the rules
```

A populated pair folder looks like this:

```
data/<source>__<target>/
  metadata.json          source, target, title, target_proprietary, schema_version,
                         the ordered packages list, optional pair-level sidecars
  <kind>.json            the only package of that kind in the pair
  <kind>-<n>-<slug>.json one of several packages of that kind, numbered from 1
  <anything else>.json   a sidecar, and only if metadata.json lists it
```

## Key files

- `schema/metadata.schema.json` is the identity contract: it requires the source, the
  target, the title, the `target_proprietary` flag, the schema version and a non-empty
  ordered `packages` list, and it forbids unknown keys, which is how an obsolete field
  such as a folder rank is caught.
- `schema/randonneur-package.schema.json` is the package profile: a name, a version and
  any of the four randonneur verbs, each an array of entries with an open `source`
  identifier dictionary, an optional `target`, an optional numeric conversion factor and
  an optional comment.
- `schema/README.md` states the three mapping kinds and the precedence rule in prose.
- `scripts/validate.py` is the only code, and `tests/test_validate.py` pins its
  behaviour with more than twenty cases, including the proprietary leak check.

## Naming

`data/<source>__<target>/`, both identifiers lower-kebab and version-suffixed, joined by
a double underscore. There is no rank prefix on a pair folder: different pairs never
conflict, so no global tie break is needed. Within a pair, a single package of a kind is
`<kind>.json` and several are `<kind>-<n>-<slug>.json` numbered from one.
