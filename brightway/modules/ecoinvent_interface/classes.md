---
title: ecoinvent_interface classes and functions
type: module-page
summary: The public surface of ecoinvent_interface 3.1, from settings to downloads.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
---

# ecoinvent_interface classes and functions

Hand-written companion to the generated `api/` folder. Names, enum members and method
lists were read by importing ecoinvent_interface 3.1 from PyPI and inspecting `__all__`
and the classes (source: pypi-ecoinvent-interface); the intent follows the repository
README (source: ecoinvent-interface-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `Settings` | class | Where credentials and the output path come from | `Settings()` or `Settings(username=..., password=...)` |
| `permanent_setting` | function | Write one setting into the secrets directory | `permanent_setting("username", "...")` |
| `EcoinventRelease` | class | List and download whole releases, reports and extra files | `EcoinventRelease(settings)` |
| `ReleaseType` | enum | Which kind of release file to fetch | `ReleaseType.ecospold` |
| `EcoinventProcess` | class | Work with one dataset: select it, describe it, download its files | `EcoinventProcess(settings)` |
| `ProcessFileType` | enum | Which file of a single process to fetch | `ProcessFileType.pdf` |
| `ProcessMapping` | class | Turn a filename or a set of attributes into a dataset index | used internally by `EcoinventProcess.select_process` |
| `CachedStorage` | class | The download cache and its catalogue | `CachedStorage()` |
| `get_excel_lcia_file_for_version` | function | Find the LCIA implementation workbook for a version, whose name varies | `get_excel_lcia_file_for_version(release, "3.10")` |

## Settings

`Settings` is a pydantic settings model with four fields: `username`, `password`,
`client_id` (defaulting to the identifier the Brightway integration registers) and
`output_path`. Values may be passed directly, read from the `EI_USERNAME` and
`EI_PASSWORD` environment variables, or read from a secrets directory written by
`permanent_setting`. Directly passed values win over environment variables, which win
over secrets files (source: ecoinvent-interface-repo).

Setting `output_path` overrides the platformdirs cache location.

## EcoinventRelease

Methods, read from the class: `login`, `refresh_tokens`, `list_versions`,
`list_system_models`, `list_report_files`, `list_extra_files`, `get_release`,
`get_release_files`, `get_report`, `get_extra`.

```python
from ecoinvent_interface import EcoinventRelease, ReleaseType, Settings

release = EcoinventRelease(Settings())
release.list_versions()
release.list_system_models("3.11")
release.get_release(version="3.11", system_model="cutoff", release_type=ReleaseType.ecospold)
```

`list_system_models` returns short names by default; pass `translate=False` for the
long official names. Either form is accepted by the other methods
(source: ecoinvent-interface-repo).

`get_release` returns the path to the downloaded and, by default, extracted directory.

## ReleaseType

The six members, with the filename pattern each stands for, read from the enum:

| Member | Release file |
|---|---|
| `ecospold` | the single-output unit process files in ecospold2 XML |
| `matrix` | the universal matrix export |
| `lci` | life cycle inventory results in ecospold2 XML |
| `lcia` | life cycle impact assessment results in ecospold2 XML |
| `cumulative_lci` | cumulative inventory results as a workbook |
| `cumulative_lcia` | cumulative impact results as a workbook |

Choose `ecospold` when you want a database to calculate with; the others are results
rather than inventories (source: ecoinvent-interface-repo).

## EcoinventProcess

Methods, read from the class: `login`, `refresh_tokens`, `list_versions`,
`list_system_models`, `set_release`, `select_process`, `get_basic_info`,
`get_documentation`, `get_file`.

```python
from pathlib import Path
from ecoinvent_interface import EcoinventProcess, ProcessFileType, Settings

process = EcoinventProcess(Settings())
process.set_release(version="3.11", system_model="cutoff")
process.select_process(attributes={"name": "...", "location": "...", "reference product": "..."})
process.get_basic_info()
process.get_file(file_type=ProcessFileType.pdf, directory=Path.cwd())
```

`select_process` takes a `dataset_id`, a `filename`, or an `attributes` dictionary
keyed by `name` or `activity_name`, `reference product` or `reference_product`, and
`location` or `geography`. Not all attributes are required, but an ambiguous set raises
an error (source: ecoinvent-interface-repo).

`ProcessFileType` has five members: `upr`, `lci`, `lcia`, `pdf` and `undefined`, the
last being the unlinked and multi-output dataset report. `get_file` requires an explicit
`directory` (source: ecoinvent-interface-repo).

## CachedStorage

`CachedStorage(cache_dir=None)` exposes the catalogue of what has already been
downloaded, with the path, whether it was extracted and when it was created, plus a
`clear` method. The catalogue is readable offline
(source: ecoinvent-interface-repo).

## Notes

- Dataset index values are the same across system models and versions, but not every
  version or system model contains every dataset
  (source: ecoinvent-interface-repo).
- Archives are extracted by default, which is why a download of a few hundred megabytes
  costs several times that on disk.
