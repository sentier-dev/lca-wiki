---
title: ecoinvent_interface status
type: module-page
summary: "Where ecoinvent_interface stands on 2026-09-21: stable, low level, unofficial."
audience: [P2]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
---

# ecoinvent_interface status

## Release

- **Latest version:** 3.1, uploaded 2025-01-10 (source: pypi-ecoinvent-interface).
- **Stable or pre-release:** stable. All 14 PyPI releases are final
  (source: pypi-ecoinvent-interface).
- **Maintainer:** Chris Mutel, listed as author and maintainer; the repository is in
  the `brightway-lca` organisation (source: pypi-ecoinvent-interface,
  ecoinvent-interface-repo).
- **Python:** 3.8 and newer (source: pypi-ecoinvent-interface).
- **Licence:** MIT in the repository, with a BSD classifier in the distribution
  metadata; the LICENSE file is the one to cite
  (source: ecoinvent-interface-repo, pypi-ecoinvent-interface).
- **Dependencies:** lxml, platformdirs, py7zr, pydantic-settings, pyecospold, requests
  and tqdm (source: pypi-ecoinvent-interface).
- **Lineage:** started as a fork of the earlier ecoinvent downloader and was rewritten
  completely for version 2.0; only the authentication code remains from the original
  (source: ecoinvent-interface-repo).

## Works today

- Authenticating from direct arguments, environment variables or a secrets directory.
- Listing versions, system models, report files and extra files.
- Downloading and extracting any of the six release types.
- Downloading reports and extra files, including the LCIA implementation workbook whose
  name varies by version.
- Selecting a single process by index, filename or attributes, reading its basic
  information and documentation, and downloading its five file types.
- Caching downloads with a catalogue that is readable offline.
- Building process index mappings locally or remotely for versions beyond the bundled
  set.

## In flight

- Nothing announced in the repository. The library tracks an API that ecoinvent has
  not published, so its maintenance is reactive: it changes when the service does
  (source: ecoinvent-interface-repo).

## Missing

- Official support of any kind. This is an unofficial client
  (source: ecoinvent-interface-repo).
- A command line (source: pypi-ecoinvent-interface).
- Brightway integration, by policy. Importing a downloaded release is `bw2io`'s job;
  see [../bw2io/README.md](../bw2io/README.md)
  (source: ecoinvent-interface-repo).
- Helpers that return process LCI, LCIA data or scores: the maintainers state these
  will not be added (source: ecoinvent-interface-repo).

## Where help is welcome

Documentation of the ecoinvent release structure belongs in
[../../../ecoinvent/](../../../ecoinvent/), not here. For anything larger, see the
branch roadmap at [../../roadmap.md](../../roadmap.md).
