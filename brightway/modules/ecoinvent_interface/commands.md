---
title: ecoinvent_interface commands
type: module-page
summary: ecoinvent_interface has no command line; everything runs from Python.
audience: [P1]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
---

# ecoinvent_interface commands

ecoinvent_interface 3.1 installs **no console script**. The wheel published on PyPI
contains no `entry_points.txt`, checked by reading the wheel's metadata directly
(source: pypi-ecoinvent-interface). The predecessor project had a browser-driven
interactive downloader; that was removed when this library was rewritten as
infrastructure (source: ecoinvent-interface-repo).

| Command | What it does | Key options |
|---|---|---|
| none | the library is called from Python only | not applicable |

## Notebook entry points

### Authenticating

```python
from ecoinvent_interface import Settings

settings = Settings()            # reads environment variables, then secrets files
```

The two environment variables the library reads are named `EI_USERNAME` and
`EI_PASSWORD`. Their values are yours and are never recorded here or anywhere in this
wiki. To store them once on a private machine:

```python
from ecoinvent_interface import permanent_setting

permanent_setting("username", "<your ecoinvent username>")
permanent_setting("password", "<your ecoinvent password>")
```

### Downloading a release

```python
from ecoinvent_interface import EcoinventRelease, ReleaseType, Settings

release = EcoinventRelease(Settings())
release.list_versions()
release.list_system_models("3.11")
path = release.get_release(version="3.11", system_model="cutoff", release_type=ReleaseType.ecospold)
```

`path` points at the extracted directory inside the cache.

### Downloading a report or an extra file

```python
release.list_report_files()
release.get_report("<report filename>")

release.list_extra_files("3.11")
release.get_extra(version="3.11", filename="<extra filename>")
```

### Working with one process

```python
from pathlib import Path
from ecoinvent_interface import EcoinventProcess, ProcessFileType, Settings

process = EcoinventProcess(Settings())
process.set_release(version="3.11", system_model="cutoff")
process.select_process(filename="<uuid pair>.spold")
process.get_basic_info()
process.get_file(file_type=ProcessFileType.upr, directory=Path.cwd())
```

### Inspecting the cache offline

```python
from ecoinvent_interface import CachedStorage

storage = CachedStorage()
list(storage.catalogue)
```

## What happens next

A downloaded ecospold2 release is imported into a Brightway project with `bw2io`; see
[../bw2io/README.md](../bw2io/README.md). Moving an existing project from one ecoinvent
release to another is a randonneur job; see
[../randonneur/datasets.md](../randonneur/datasets.md).
