---
title: sentier-brightway
type: module
summary: The loader that installs Sentier data into a Brightway project or a folder of plain files.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-brightway-repo]
related: [../../platform.md, ../../commands.md, ../../../bafu/README.md]
---

# sentier-brightway

sentier-brightway is the customer-facing loader of the Sentier platform. One command
installs a Sentier-published life cycle inventory, an elementary-flow biosphere and the
matching impact assessment methods into a Brightway project, or writes the same build as
plain files that stock `bw2calc` can read without `bw2data`. Nothing ships inside the
package: the data is fetched from pinned commits of four Sentier data repositories on
first use. (source: sentier-brightway-repo)

**Version documented:** 0.1.0 · **obtained from:** `version = "0.1.0"` in `pyproject.toml`
of a clone of `github.com/sentier-dev/sentier-brightway` at commit `a9dba75`, dated
2026-09-17 · **as of:** 2026-09-21.

The package is **not on PyPI**: a request to `https://pypi.org/pypi/sentier-brightway/json`
on 2026-09-21 answered 404, so install it from git. The `CHANGELOG.md` heading for 0.1.0
still reads "unreleased". (source: sentier-brightway-repo)

## Install

Install it into the same Python environment as Brightway or the Activity Browser:

```bash
uv pip install git+https://github.com/sentier-dev/sentier-brightway
```

Python 3.10 or newer. The runtime dependencies are pandas, pyarrow, platformdirs,
numpy, openpyxl, `bw_processing` and `bw2calc`; `bw2data` is needed only for the project
install and is pulled in by the `testing` extra, and the `fast` extra adds `pypardiso`.
(source: sentier-brightway-repo)

## What it does

1. **Fetches and verifies the data.** A pinned, sha256-checked manifest names the four
   source repositories and every file taken from them; a local checkout can be used
   instead. See [classes.md](classes.md) and [datasets.md](datasets.md).
2. **Relinks the inventory onto the method nomenclature.** The ordered mapping packages
   of the bridge folder move source elementary flows onto EF 3.1 flows; what cannot be
   linked is kept in a residual database. See [gotchas.md](gotchas.md).
3. **Writes a Brightway project, or plain files.** `db` writes three databases and 25
   methods through `bw2data`; `files` writes a parquet registry, the mappings and
   `bw_processing` datapackages. See [commands.md](commands.md).
4. **Backtests the result.** `backtest` scores every process for all 25 categories and
   compares the scores with the published reference results, writing a static dashboard.
   See [commands.md](commands.md) and [status.md](status.md).

## Datasets

The package ships no data. It installs four published datasets, each fetched from a
pinned commit of its own repository. Broad descriptors only; the details are in
[datasets.md](datasets.md).

| Dataset | Version | Provenance | Where it is documented |
|---|---|---|---|
| BAFU-2026 life cycle inventory | v1, 11,947 processes in 11 sector folders | sentier-inventory | [../../../bafu/](../../../bafu/), [../sentier-inventory/](../sentier-inventory/) |
| EF 3.1 elementary flows (biosphere) | EF 3.1 shards of the vocabulary | sentier-vocab | [../sentier-vocab/](../sentier-vocab/) |
| EF 3.1 impact assessment methods | 25 impact categories, global factors | sentier-methods | [../sentier-methods/](../sentier-methods/) |
| BAFU to EF 3.1 flow bridge | four ordered mapping packages | sentier-mappings | [../sentier-mappings/](../sentier-mappings/) |

Licensing: the code is MIT, and the installed data keeps the licence of the repository it
came from. Work derived from the installed inventory must carry the citation
"Source: Life Cycle Inventory database of the Swiss Federal Administration, BAFU:2026."
(source: sentier-brightway-repo)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): public classes and functions, and what invokes them
- [commands.md](commands.md): command line and Python entry points
- [datasets.md](datasets.md): the data this module fetches and writes
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

The generated API reference lives in [api/](api/README.md).

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `sentier-brightway`
0.1.0: 22 markdown files, one per public submodule, each stamped with the package
version, the date and the command that produced it. It was produced by running
pydoc-markdown 4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in
the repository regenerates it. Signatures and docstrings live there; the names worth
knowing first are in [classes.md](classes.md).
