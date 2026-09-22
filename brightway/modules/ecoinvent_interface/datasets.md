---
title: ecoinvent_interface datasets
type: module-page
summary: The index mappings the package ships and the release types it can fetch.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
related: [../../../ecoinvent/README.md]
---

# ecoinvent_interface datasets

Structure only. No ecoinvent content is reproduced here: no activity records, no
amounts, no characterisation factors. What follows describes the shape of one bundled
index file and the kinds of files the library can fetch for a licensed user.

## Bundled: the process index mappings

- **What it is:** `ecoinvent_interface/data/mappings.zip`, a compressed archive of
  index files that let the library translate a filename or a set of attributes into the
  integer dataset index the ecoinvent API uses. Without it, a caller would have to know
  the index already (source: ecoinvent-interface-repo).
- **Version:** ships with ecoinvent_interface 3.1 (2025-01-10).
- **Coverage:** 29 index files plus a catalogue, one file per ecoinvent version and
  system model combination. The versions covered in 3.1 are 3.5, 3.6, 3.7.1, 3.8,
  3.9.1, 3.10, 3.10.1 and 3.11; the system models are cutoff, consequential and apos
  throughout, with EN15804 present from 3.8 onwards.
- **Schema:** each file is a JSON list of records with the keys `filename`,
  `activity_name`, `reference_product`, `geography`, `index`, `version` and
  `system_model`. There is no amount, no exchange and no impact value in this file: it
  is an index, in the library-catalogue sense.
- **Provenance:** assembled by the library maintainers from the releases; it is
  redistributed inside the package, so the ecoinvent naming vocabulary it carries is
  the vocabulary of the release it indexes.
- **Vocabulary:** ecoinvent activity names, reference products and geographies, plus
  the system model names. These are documented in
  [../../../ecoinvent/](../../../ecoinvent/).
- **Why it matters in practice:** dataset indices are stable across system models and
  versions, but a dataset present in one release may be absent from another, so a
  lookup can succeed for 3.10 and fail for 3.8 (source: ecoinvent-interface-repo).

The library can also build mappings itself. `ProcessMapping` exposes `add_mapping`,
`create_local_mapping` and `create_remote_mapping`, which is how a version newer than
the bundled set gets an index.

## Fetched: what a licensed user can download

Nothing below is shipped with the package. Each is retrieved from ecoinvent's servers
after authentication, under the user's own licence, and stays on the user's machine.

### Whole releases, by `ReleaseType`

| Release type | What the archive holds | Typical use |
|---|---|---|
| `ecospold` | single-output unit process datasets, ecospold2 XML | building a database to calculate with |
| `matrix` | the universal matrix export | matrix-level work without parsing XML |
| `lci` | inventory results per dataset, ecospold2 XML | reading precomputed inventories |
| `lcia` | impact assessment results per dataset, ecospold2 XML | reading precomputed scores |
| `cumulative_lci` | cumulative inventory results as a workbook | spreadsheet workflows |
| `cumulative_lcia` | cumulative impact results as a workbook | spreadsheet workflows |

- **Sectors:** ecoinvent is cross-sector; its own classification is described in
  [../../../ecoinvent/](../../../ecoinvent/), not here.
- **Methods:** the LCIA implementation workbook published beside a release carries the
  impact assessment methods. It is fetched as an extra file, and its name changes
  between versions, which is what `get_excel_lcia_file_for_version` exists to handle
  (source: ecoinvent-interface-repo).
- **Licence:** ecoinvent's own, accepted by the user on the ecoinvent website. It is
  not an open licence, which is why this wiki documents access and never content.

### Extra files and reports

- **Extra files** are listed per version, with a uuid, a size and a modification date
  per entry, and are downloaded by filename. The LCIA implementation archive is one of
  them (source: ecoinvent-interface-repo).
- **Reports** need a login but no version, and are listed with a description per file.
  They are PDFs describing system models and methodology
  (source: ecoinvent-interface-repo).

### Single-process files, by `ProcessFileType`

`upr` (unit process ecospold XML), `lci`, `lcia`, `pdf` (the dataset report) and
`undefined` (the unlinked and multi-output dataset report).

## Where it all lands

Downloads go into a cache directory chosen by platformdirs, which is therefore
operating-system dependent, unless `Settings(output_path=...)` says otherwise.
Archives are extracted by default, and the catalogue in `CachedStorage` records for
each entry the path, whether it was extracted and when
(source: ecoinvent-interface-repo).

- **Source branch:** [../../../ecoinvent/](../../../ecoinvent/).
