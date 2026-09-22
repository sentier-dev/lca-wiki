---
title: sentier-vocab
type: module
summary: The controlled vocabulary of the Sentier platform, curated as data and published as TTL under vocab.sentier.dev.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-vocab-repo]
related: [../sentier-inventory/README.md, ../sentier-methods/README.md, ../../roadmap.md]
---

# sentier-vocab

sentier-vocab holds every term the rest of the platform points at: elementary flows,
units and unit groups, products, processes, LCIA methods, impact categories,
characterisation factors, bibliographic sources, contacts, model terms, organisms and
qualifiers. Each term gets one canonical IRI under `https://vocab.sentier.dev/`. The
curated terms live as human-authored YAML and as bulk parquet under `data/`, a LinkML
schema per term type describes their shape, and a generator validates the data and
writes SKOS Turtle into `output/`. On a push to `main` the repository's workflow copies
the generated Turtle to the triplestore that serves those IRIs.
(source: sentier-vocab-repo)

**Version documented:** `0.0.2`, from `__version__` in `app/sentier_vocab/__init__.py` ·
**obtained from:** a clone of `github.com/sentier-dev/sentier_vocab` at commit `ef440c6`,
dated 2026-09-17 · **as of:** 2026-09-21.

The package is **not on PyPI**: requests to `https://pypi.org/pypi/sentier_vocab/json`
and to the hyphenated spelling both answered 404 on 2026-09-21, and the README says so
as well. Install it from a clone. (source: sentier-vocab-repo)

## Install

```bash
git clone https://github.com/sentier-dev/sentier-vocab.git
uv sync
```

Python 3.10 or newer. The runtime dependencies are linkml, rdflib, skosify, pyarrow,
pyyaml, httpx, requests, orjson, platformdirs, rfc3987, loguru, structlog and tqdm; the
`testing` and `dev` extras add pytest, coverage, ruff, black and pre-commit.
(source: sentier-vocab-repo)

## What it does

1. **Registers the namespaces.** `app/sentier_vocab/iris.py` is the single registry of
   published `https://vocab.sentier.dev/` namespaces and the stability contract for
   them: they do not change without a vocabulary migration. See [classes.md](classes.md).
2. **Validates curated data against LinkML schemas.** One schema per term type in
   `schemas/`, with the shared SKOS building blocks in `common.yaml`. See
   [datasets.md](datasets.md).
3. **Writes ordered SKOS Turtle.** `sentier_vocab generate` turns every source file of
   every category into a `.ttl` file in `output/`, deterministically ordered so that
   diffs stay readable. See [commands.md](commands.md).
4. **Runs the transitional importers.** External ontologies (ENVO, QUDT, the Open Energy
   Ontology, the Combined Nomenclature, geonames) are fetched and converted by the
   importer layer, which writes its own Turtle. See [gotchas.md](gotchas.md).

## Datasets

The repository ships the vocabulary itself: thirteen `data/` categories of curated terms
and the Turtle generated from them. Descriptors stay broad here; the per-category detail
is in [datasets.md](datasets.md).

| What | Shape | Where |
|---|---|---|
| Curated native terms | one folder per term type, YAML for hand-authored terms, parquet for bulk deliveries | `data/<category>/` |
| Term schemas | one LinkML schema per term type, shared slots in `common.yaml` | `schemas/` |
| Published vocabulary | SKOS Turtle, one file per source file, eleven of them committed | `output/` |
| Coverage matrix | which term type has a schema, data and which layer supplies it | `docs/COVERAGE.md` |

Licence: MIT for the repository. Terms imported from external ontologies keep the
licence of the ontology they came from. (source: sentier-vocab-repo)

## Pages

- [layout.md](layout.md): the repository tree, one line per file or folder
- [classes.md](classes.md): public classes and functions, and what invokes them
- [commands.md](commands.md): every runnable entry point
- [datasets.md](datasets.md): the data this module curates and generates
- [gotchas.md](gotchas.md): what surprises people
- [status.md](status.md): what works, what is in flight, what is missing
- [use-cases/](use-cases/): end-to-end things a practitioner does with it

The generated API reference lives in [api/](api/README.md).

## API reference

[api/README.md](api/README.md) indexes a generated API reference for `sentier-vocab`
0.0.2: 27 markdown files, one per public submodule, each stamped with the package
version, the date and the command that produced it. It was produced by running
pydoc-markdown 4.8.2 by hand on 2026-09-22 in a throwaway environment, and nothing in
the repository regenerates it. Signatures and docstrings live there; the names worth
knowing first are in [classes.md](classes.md).
