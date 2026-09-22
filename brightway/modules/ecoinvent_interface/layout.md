---
title: ecoinvent_interface layout
type: module-page
summary: How the ecoinvent_interface package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
---

# ecoinvent_interface layout

The installed package tree of ecoinvent_interface 3.1, read from the wheel installed
from PyPI (source: pypi-ecoinvent-interface).

```
ecoinvent_interface/
├── __init__.py            the public surface, re-exported through __all__
├── settings.py            Settings and permanent_setting: where credentials come from
├── core.py                the shared HTTP client, login and token refresh
├── release.py             EcoinventRelease, ReleaseType and the LCIA Excel helper
├── process_interface.py   EcoinventProcess and ProcessFileType
├── mapping.py             ProcessMapping: filename or attributes to dataset index
├── storage.py             CachedStorage and the cache catalogue
├── string_distance.py     fuzzy comparison used when selecting a process by attributes
├── spold_versions.py      reading and fixing version metadata in ecospold files
└── data/mappings.zip      the bundled process index mappings, see datasets.md
```

## Key files

- `settings.py` is the first file to read. It defines the four settings the library
  knows about and the helper that writes them into a secrets directory.
- `core.py` holds the authentication and token refresh logic, and is the only place
  that talks to the network. The README notes that custom library headers are set so
  users of this library can be identified, and that no user information is transmitted
  (source: ecoinvent-interface-repo).
- `release.py` and `process_interface.py` are the two user-facing interfaces: whole
  releases and single processes respectively.
- `mapping.py` plus `data/mappings.zip` are what let you say "this filename" or "this
  name, product and location" instead of an opaque integer index.
- `storage.py` decides where downloads land. The default directory comes from
  platformdirs and is therefore operating-system dependent
  (source: ecoinvent-interface-repo).
- `string_distance.py` exists because attribute selection has to tolerate small
  differences in how a name is written.

## What is not here

No command line, no Brightway integration, and no code that turns a release into a
database. Importing a downloaded release into a project is `bw2io`'s job; see
[../bw2io/README.md](../bw2io/README.md).
