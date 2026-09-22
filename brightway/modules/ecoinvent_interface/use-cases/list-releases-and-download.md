---
title: List releases and download one
type: use-case
summary: Authenticate against the ecoinvent API, list the versions and system models your licence covers, and download a release or a single process.
audience: [P1]
updated: 2026-09-22
sources: [ecoinvent-interface-repo, pypi-ecoinvent-interface, ecoinvent-licences, ecoinvent-eula, ecoinvent-kb-releases]
verified: no
related: [../commands.md, ../classes.md, ../gotchas.md, read-the-bundled-mapping-index.md]
---

# List releases and download one

**Persona:** P1 practitioner with an ecoinvent licence, automating what they would
otherwise click through on the website · **GICS sector:** any

## Goal

A release archive on disk, fetched by a script rather than a browser, so a pipeline can
be rebuilt from its code.

## Prerequisites

- **An ecoinvent licence, and both agreements accepted on the ecoinvent website for that
  account**: the licence itself and the personal identifying information agreement.
  Nothing in the library can accept them for you (source: ecoinvent-interface-repo).
  This page is `verified: no` because no such account was available.
- `ecoinvent_interface` 3.1. Versions below 3.0 stopped working in February 2025 and
  fail at authentication rather than at import (source: ecoinvent-interface-repo).
- Disk space for the archive and its extracted contents at the same time: archives are
  extracted by default.
- The library is **unofficial and unsupported**, and the API it reads is described by
  its maintainers as unpublished and under development (source:
  ecoinvent-interface-repo).

## Steps

1. Put your credentials somewhere outside the code. The library reads, in order, values
   passed to `Settings`, then the environment variables `EI_USERNAME` and `EI_PASSWORD`,
   then its secrets directory (source: ecoinvent-interface-repo). **No credential value
   appears in this wiki.**

   ```python
   from ecoinvent_interface import Settings

   settings = Settings()
   ```

   To store them once on a private machine:

   ```python
   from ecoinvent_interface import permanent_setting

   permanent_setting("username", "<your ecoinvent username>")
   permanent_setting("password", "<your ecoinvent password>")
   ```

2. Ask what your licence covers.

   ```python
   from ecoinvent_interface import EcoinventRelease

   release = EcoinventRelease(settings)
   release.list_versions()
   release.list_system_models("3.11")
   ```

3. Download a release. `ReleaseType.ecospold` is the one you import into Brightway;
   `lci` and `lcia` are results, not inventories (source: ecoinvent-interface-repo).

   ```python
   from ecoinvent_interface import ReleaseType

   path = release.get_release(
       version="3.11", system_model="cutoff", release_type=ReleaseType.ecospold
   )
   ```

4. Or fetch a report or an extra file rather than the whole release.

   ```python
   release.list_report_files()
   release.get_report("<report filename>")

   release.list_extra_files("3.11")
   release.get_extra(version="3.11", filename="<extra filename>")
   ```

5. Or work with one process. `get_file` requires an explicit directory
   (source: ecoinvent-interface-repo).

   ```python
   from pathlib import Path
   from ecoinvent_interface import EcoinventProcess, ProcessFileType

   process = EcoinventProcess(settings)
   process.set_release(version="3.11", system_model="cutoff")
   process.select_process(filename="<uuid pair>.spold")
   process.get_basic_info()
   process.get_file(file_type=ProcessFileType.upr, directory=Path.cwd())
   ```

6. Import what you downloaded into a project; see
   [../../bw2io/use-cases/import-ecospold2.md](../../bw2io/use-cases/import-ecospold2.md).

## Expected output

Described from the documentation and from the library's own types, not from a run:

- `list_versions()` returns the release version strings your licence covers, newest
  first. Which versions those are depends on the licence (source: ecoinvent-kb-releases).
- `list_system_models(version)` returns the short names by default, and the long
  official names with `translate=False`. The four the library knows are `cutoff`,
  `consequential`, `apos` and `EN15804`, confirmed by reading
  `ecoinvent_interface.mapping.SYSTEM_MODELS` on the installed 3.1.
- `ReleaseType` has six members: `ecospold`, `matrix`, `lci`, `lcia`, `cumulative_lci`
  and `cumulative_lcia`. `ProcessFileType` has five: `upr`, `lci`, `lcia`, `pdf` and
  `undefined`. Both confirmed by introspection on 3.1.
- `get_release` returns the path of the extracted directory inside the cache. The cache
  location comes from `platformdirs`, so it differs per operating system; set
  `Settings(output_path=...)` when a pipeline needs a predictable path.
- No counts, amounts or characterisation factors from an ecoinvent release appear on
  this page.

## Pitfalls

- **Never commit credentials.** Environment variables on a server, the secrets directory
  on a private machine, nothing in the notebook and nothing in version control.
- **The three credential sources have a fixed precedence,** so a stale secrets file is
  invisible while an environment variable masks it
  (source: ecoinvent-interface-repo).
- **Attribute-based process selection can be ambiguous.** `select_process` raises when
  the attributes do not identify exactly one dataset, and the fuzzy string comparison
  can match something you did not mean. Check `get_basic_info` before downloading.
- **The bundled index stops at the versions it knows.** A release newer than the bundled
  mappings needs `ProcessMapping.create_remote_mapping` first; see
  [read-the-bundled-mapping-index.md](read-the-bundled-mapping-index.md).
- **No Brightway integration here, by policy.** Fetching LCI or LCIA values for a process
  is out of scope for this library (source: ecoinvent-interface-repo).
- **What you download is licensed to you.** Do not put it in a shared repository, a
  container image or a project directory you send to someone else
  (source: ecoinvent-licences, ecoinvent-eula).

## Related vocabulary

- [System model](../../../../vocabulary.md#system-model)
- [Release component](../../../../vocabulary.md#release-component)
- [ecoSpold format](../../../../vocabulary.md#ecospold-format)
- [LCI](../../../../vocabulary.md#lci)
- [LCIA results](../../../../vocabulary.md#lcia-results)
- [Cut-off](../../../../vocabulary.md#cut-off)
- [APOS](../../../../vocabulary.md#apos)
- [Consequential modelling](../../../../vocabulary.md#consequential-modelling)
- [Unit process, single operation](../../../../vocabulary.md#unit-process-single-operation)

## Verification

`verified: no`. No ecoinvent credentials were available and none were sought: the
ecoinvent branch of this wiki documents structure only, never licensed data. Nothing
that needs authentication was run.

What **was** checked, on `ecoinvent_interface` 3.1 in a throwaway `uv` environment on
2026-09-22: that every call named above exists on `EcoinventRelease` and
`EcoinventProcess`, that `Settings` carries exactly the four fields `username`,
`password`, `client_id` and `output_path`, and that `ReleaseType` and `ProcessFileType`
have the members listed. The rest is from the repository README
(source: ecoinvent-interface-repo).

A verifier needs an ecoinvent account with both agreements accepted. Worth recording:
which versions the licence actually returns, and how long a full `ecospold` release takes
to download and extract.
