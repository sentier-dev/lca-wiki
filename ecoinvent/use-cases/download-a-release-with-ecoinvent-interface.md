---
title: Download a release with ecoinvent_interface
type: use-case
summary: "The authenticated Python route to a release: list versions and system models, pick a release type, and get the extracted directory from the cache."
audience: [P1]
updated: 2026-09-22
sources: [ecoinvent-interface-repo, ecoinvent-kb-releases, ecoinvent-licences, ecoinvent-v3.12-release-notes]
verified: no
---

# Download a release with ecoinvent_interface

**Persona:** P1 practitioner with a licence who wants a release on disk reproducibly,
rather than by clicking · **GICS sector:** any

## Goal

An extracted release directory on your own machine, chosen by version,
[system model](../../vocabulary.md#system-model) and
[release component](../../vocabulary.md#release-component), with the client's cache
keeping you from downloading it twice.

## Prerequisites

- A licence and working credentials, as in
  [get-access-and-credentials.md](get-access-and-credentials.md).
- `ecoinvent_interface`, which `uv run --with` supplies. Version 3.1 was the one checked
  for this page.
- Several gigabytes of free disk: a release is large, and the client extracts it.

## Steps

1. See which versions your licence gives you:

   ```python
   from ecoinvent_interface import EcoinventRelease, Settings

   release = EcoinventRelease(Settings())
   release.list_versions()
   ```

2. See which system models exist for the version you chose:

   ```python
   release.list_system_models("3.11")
   ```

3. Choose the release type. The client exposes six:
   [ecoSpold](../../vocabulary.md#ecospold-format) documents, the matrix form, and the
   [LCI](../../vocabulary.md#lci) and LCIA forms each in a plain and a cumulative
   variant:

   ```python
   from ecoinvent_interface import ReleaseType

   [member.name for member in ReleaseType]
   ```

4. Download and extract it. The call returns the path of the extracted directory inside
   the cache:

   ```python
   path = release.get_release(version="3.11", system_model="cutoff",
                              release_type=ReleaseType.ecospold)
   ```

5. Record what you took, because a version plus a system model plus a release type is the
   provenance of everything you compute afterwards:

   ```python
   print(path)
   ```

## Expected output

Steps 1 and 2 return short lists: version labels, and the system model keys your licence
covers, typically the allocation-at-the-point-of-substitution, the
[cut-off](../../vocabulary.md#cut-off) and the consequential models. Step 4 downloads
once, caches, and returns a directory path; a second call with the same arguments returns
the cached path without downloading again.

Which of the six release types you want depends on what comes next. The ecoSpold documents
are what an importer reads, and they are the input to
[import-ecospold2-into-brightway-with-bw2io.md](import-ecospold2-into-brightway-with-bw2io.md).
The matrix form is what a calculation library wants. The cumulative forms carry
already-aggregated results and are the wrong input for anything that needs
[unit processes](../../vocabulary.md#unit-processes).

## Pitfalls

- **Nothing works without credentials, and it fails early.** The client refuses before it
  makes a request, with a `ValueError` naming the missing username, rather than returning
  an empty list. That is the first thing to check.
- **The cache is real and it is large.** The client keeps a catalogue of what it has
  downloaded; inspect it before assuming a download is needed, and before assuming your
  disk is fine.
- **A system model is not a filter you apply later.** It is baked into the release, and
  mixing two of them in one study is a methodological error, not an inconvenience.
- **Do not commit or share what you downloaded.** The extracted directory is licensed
  data. Record the version, the system model and the release type; ship neither the files
  nor tables of their amounts.
- **The cumulative forms look convenient and usually are not.** They are results, not
  inventory, and they cannot be recalculated against a different method.
- **The newest release is newer than the bundled index.** The steps above use 3.11 as the
  example because that is the newest version the mapping archive inside
  `ecoinvent_interface` 3.1 covers; the current database version is 3.12, released on
  5 November 2025 (ecoinvent-v3.12-release-notes). Downloading 3.12 works, but resolving a
  filename or a set of attributes to a dataset index for it needs
  `ProcessMapping.create_remote_mapping` first. See
  [../../brightway/modules/ecoinvent_interface/gotchas.md](../../brightway/modules/ecoinvent_interface/gotchas.md)
  and
  [../../brightway/modules/ecoinvent_interface/datasets.md](../../brightway/modules/ecoinvent_interface/datasets.md)
  (ecoinvent-interface-repo).

## Related vocabulary

[System model](../../vocabulary.md#system-model),
[cut-off](../../vocabulary.md#cut-off),
[APOS](../../vocabulary.md#apos),
[release component](../../vocabulary.md#release-component),
[ecoSpold format](../../vocabulary.md#ecospold-format),
[LCI](../../vocabulary.md#lci),
[unit processes](../../vocabulary.md#unit-processes),
[activity](../../vocabulary.md#activity).

## Verification

`verified: no`: no ecoinvent licence or credentials were available in this environment, so
steps 1, 2, 4 and 5 could not be run. What was run on 2026-09-22 with `uv` 0.11.14 and
Python 3.11.15 on Ubuntu 22.04, in a clean home directory with no credentials, is step 3
and the negative check: `ecoinvent_interface` 3.1 exposes exactly the six release types
listed above, constructs its settings and release objects fine, and raises `ValueError:
Missing username; see configurations docs` on the first authenticated call. A verifier
with a licence would run steps 1, 2 and 4 and record only the version labels, the system
model keys and the wall-clock time, never any dataset content.
