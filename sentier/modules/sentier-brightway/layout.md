---
title: sentier-brightway layout
type: module-page
summary: How the sentier-brightway repository is organised, file by file.
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-brightway-repo]
---

# sentier-brightway layout

The tree below is the clone of `github.com/sentier-dev/sentier-brightway` at commit
`a9dba75` (2026-09-17), read on 2026-09-21. Only the files a reader would open are
listed. (source: sentier-brightway-repo)

```
src/sentier_brightway/
  __init__.py        the public API: assemble, coverage, import_bafu_db, import_bafu_files
  cli.py             the argparse entry point behind the sentier-brightway command
  constants.py       every shared name: database names, method prefix, IRIs, citation
  fetch.py           resolve the data root: local checkout, or verified download cache
  sources.toml       the pinned manifest: repository, commit, file, sha256
  inventory.py       read the inventory sector folders into two flat frames
  flows.py           read elementary-flow terms from the vocabulary, split by source
  methods.py         read the impact methods and their global characterisation factors
  bridge.py          read the ordered mapping packages that relink source flows
  _frames.py         shared frame validation: required columns, codes from IRIs
  units.py           map source unit spellings onto the names Brightway uses
  build.py           turn the frames into the node dictionaries a database write takes
  report.py          the coverage report and the citation the user must carry
  writer.py          the only module that imports bw2data; writes databases and methods
  registry.py        the parquet registry: the file-mode twin of the databases
  datapackage.py     bw_processing datapackages, plus a bw2data-free scoring helper
  files.py           write the file-mode output folder and its manifest
  _version.py        the installed distribution version, with a source-tree fallback
  backtest/
    __init__.py      run_backtest: the whole backtest, from files export to dashboard data
    scorer.py        one adjoint solve per category scores every process
    reference.py     read the published reference workbook into a comparable frame
    compare.py       align the two score sets, reconcile units, compute differences
    boxes.py         box-plot statistics per category and sector, and the worst-N rows
    categories.py    the 25 categories: method ids, short ids, labels, reference headers
    emit.py          write the dashboard CSV, JSON, parquet and report files
scripts/pin_sources.py   regenerate sources.toml from the data repositories
tests/                   the pytest suite, one module per source module
dashboard/               a built backtest dashboard, page and data files
CHANGELOG.md             what 0.1.0 contains
pyproject.toml           metadata, dependencies, extras, the console script
```

## Key files

- `src/sentier_brightway/__init__.py`: the four functions a user calls. Everything else
  is reachable from them.
- `src/sentier_brightway/constants.py`: the database names, the method key prefix, the
  bridge folder name and the citation string live here and nowhere else, so a rename is
  a one-file change.
- `src/sentier_brightway/sources.toml`: the reproducibility contract. It pins a commit
  per data repository and a sha256 per file, and it is generated, never hand-edited.
- `src/sentier_brightway/writer.py`: the only module that touches `bw2data`, which is
  why file mode works without Brightway installed.
- `src/sentier_brightway/backtest/categories.py`: the single source of truth for the 25
  categories; the dashboard's category list is generated from it and a test asserts the
  page carries exactly that text.

## Conventions

- `src/` layout, package `sentier_brightway`, distribution `sentier-brightway`.
- Private modules carry a leading underscore (`_frames.py`, `_version.py`).
- A module's docstring states what it reads and what it guarantees; `registry.py` and
  `datapackage.py` document the row conventions the two modes share.
- Line length 99, formatted with black and isort, linted with ruff, all configured in
  `pyproject.toml` and run through pre-commit.

(source: sentier-brightway-repo)
