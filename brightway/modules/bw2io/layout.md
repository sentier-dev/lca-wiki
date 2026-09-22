---
title: bw2io layout
type: module-page
summary: "How the bw2io package is organised: extractors, strategies, importers, exporters and data."
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw2io, bw2io-docs]
related: [README.md, classes.md, datasets.md]
---

# bw2io layout

The tree below is the installed package of version 0.9.17, walked on disk on 2026-09-21.
Directories are summarised by what they contain rather than file by file.

```
bw2io/
├── __init__.py            re-exports the importers, the setup functions and the exporters
├── extractors/            format readers, one per input format: ecospold1, ecospold1_lcia,
│                          ecospold2, simapro_csv, simapro_lcia_csv,
│                          simapro_lcia_95project_csv, excel, csv, json_ld, exiobase
├── strategies/            the 108 transformation functions, grouped by subject: biosphere,
│                          csv, ecospold1_allocation, ecospold2, exiobase, generic, json_ld,
│                          json_ld_allocation, json_ld_lcia, lcia, locations, migrations,
│                          parameterization, products, simapro, special, useeio, sentier
├── importers/             one class per format, each a list of strategies plus a write step:
│                          base.py, base_lci.py, base_lcia.py, ecospold1.py, ecospold2.py,
│                          ecospold2_biosphere.py, ecoinvent_lcia.py, excel.py, excel_lcia.py,
│                          csv-based and simapro modules, exiobase3_hybrid.py,
│                          exiobase3_monetary.py, json_ld.py, json_ld_lcia.py
├── export/                csv.py, excel.py, ecospold1.py, gexf.py, matlab.py
├── data/                  the shipped tables: biosphere and unit migrations, geography,
│                          lci/ flow lists and mapping files, lcia/ bundled methods,
│                          examples/ two small workbooks
├── remote.py              the catalogue of downloadable projects and install_project
├── ecoinvent.py           import_ecoinvent_release, the one-call licensed ecoinvent route
├── backup.py              backup and restore of a project or the whole data directory
├── migrations.py          the migrations registry and create_core_migrations
├── package.py             BW2Package, the bzip2 JSON serialisation of a data store
├── compatibility.py       the pre-3.5 ecoinvent fixes and other legacy helpers
├── modified_database.py   diffing a database against what was imported
├── unlinked_data.py       the store of unlinked edges left after an import
├── units.py               unit normalisation tables
├── utils.py               activity_hash, es2_activity_hash and other identity helpers
├── validation.py          voluptuous schemas for imported data
├── chemidplus.py          a chemical synonym lookup against an external API
├── download_utils.py      the progress-bar downloader
├── errors.py              the exception types
└── tests.py               fixtures exported for downstream test suites
```

## Key files

- `importers/base_lci.py`: the class every LCI importer inherits: `apply_strategies`,
  `match_database`, `statistics`, `write_database`, `randonneur` and the unlinked-edge
  helpers all live here.
- `strategies/__init__.py`: the flat namespace of every strategy; reading the names is
  the fastest way to see what an import can be made to do.
- `remote.py`: the project catalogue: `BASE_URL`, `PROJECTS_BW25`, `PROJECTS_BW2`,
  `install_project` and `get_projects`.
- `ecoinvent.py`: `import_ecoinvent_release`, which wraps `ecoinvent_interface` for
  licensed users; see [../ecoinvent_interface/](../ecoinvent_interface/).
- `data/`: the only directory in the core packages that ships data; see
  [datasets.md](datasets.md).
