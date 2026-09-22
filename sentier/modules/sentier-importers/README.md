---
title: sentier-importers
type: module
summary: The pipelines that turn external LCA databases into the Sentier data format.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-importers-repo]
related: [../../platform.md, ../../commands.md, ../sentier-brightway/README.md]
---

# sentier-importers

sentier-importers is the import side of the Sentier platform: a plugin framework that
reads an external LCA data source and delivers it, validated, into the platform's data
repositories as a pull request. Every source is a plugin, and every plugin runs through
the same staged pipeline, so the framework owns fetching, parsing, deduplication,
schema validation, writing and delivery, while a source owns only its own transform.
(source: sentier-importers-repo)

**Version documented:** 0.0.1 · **obtained from:** `__version__` in
`app/sentier_importers/__init__.py`, which `pyproject.toml` reads as the dynamic
version, in a clone of `github.com/sentier-dev/sentier-importers` at commit `dac2e67`,
dated 2026-09-17 · **as of:** 2026-09-21.

The package is **not on PyPI**: a request to `https://pypi.org/pypi/sentier-importers/json`
on 2026-09-21 answered 404, so work from a clone. (source: sentier-importers-repo)

## Install

Python 3.10 or newer, and `uv`:

```bash
git clone https://github.com/sentier-dev/sentier-importers
uv sync --extra dev
```

The dependencies are httpx, linkml and linkml-runtime, loguru, openpyxl, orjson,
platformdirs, pyarrow, pyyaml and rdflib. (source: sentier-importers-repo)

## What it does

1. **Runs one staged pipeline for every source**: fetch, parse, transform, dedup,
   assemble, validate, emit, deliver. See [classes.md](classes.md).
2. **Keeps the source list declarative.** A source is one block in the registry file plus
   one module implementing `transform`; the framework supplies the rest. See
   [layout.md](layout.md).
3. **Validates before it delivers.** Vocabulary rows are validated against the target
   repository's LinkML schema at a pinned reference; bulk targets are validated by their
   own repository's checker instead. See [gotchas.md](gotchas.md).
4. **Delivers by pull request, never by push.** A run is a dry run unless delivery is
   asked for, and files then land in the target repository's data folder on a branch.
   See [commands.md](commands.md).

## Datasets

The repository ships no datasets. It carries the code that produces them and two small
curated data files used for flow matching: a list of label defects and a list of curated
aliases. What a run produces is written to the four target repositories.
(source: sentier-importers-repo)

| It reads | It writes into | Documented in |
|---|---|---|
| the published Swiss federal inventory, in its exchange format | [../sentier-inventory/](../sentier-inventory/), [../sentier-vocab/](../sentier-vocab/), [../sentier-mappings/](../sentier-mappings/) | [../../../bafu/](../../../bafu/) |
| the Agribalyse export and the EF 3.1 reference package | [../sentier-vocab/](../sentier-vocab/), [../sentier-methods/](../sentier-methods/), [../sentier-mappings/](../sentier-mappings/) | [../sentier-agribalyse/](../sentier-agribalyse/) |
| the FoodEx2 food classification | [../sentier-vocab/](../sentier-vocab/) | this module, [datasets.md](datasets.md) |
| an extension flow list used to infer further mappings | [../sentier-mappings/](../sentier-mappings/) | [datasets.md](datasets.md) |

More detail, target by target, is in [datasets.md](datasets.md). The data as published
is documented on the data-repository module pages, not here.

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): the plugin contract and the pipeline services
- [commands.md](commands.md): command line and Python entry points
- [datasets.md](datasets.md): what the registered sources read and write
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

The generated API reference lives in [api/](api/README.md).

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `sentier-importers`
0.0.1: 61 markdown files, one per public submodule, each stamped with the package
version, the date and the command that produced it. It was produced by running
pydoc-markdown 4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in
the repository regenerates it. Signatures and docstrings live there; the names worth
knowing first are in [classes.md](classes.md).
