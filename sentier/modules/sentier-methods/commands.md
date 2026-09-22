---
title: sentier-methods commands
type: module-page
summary: The validator, the read one-liner, and what continuous integration runs.
audience: [P1]
updated: 2026-09-21
sources: [sentier-methods-repo]
---

# sentier-methods commands

There is no command line interface and no package. Two commands matter, both from the
repository README and its workflow file, checked on 2026-09-21 against a clone at commit
`8d0f504`. Run them from the repository root. (source: sentier-methods-repo)

| Command | What it does | Key options |
|---|---|---|
| `uv run --with pyarrow --with pyyaml --with 'jsonschema[format]' python scripts/validate.py` | validate every datasource folder against the schemas; exits non-zero on any error | none; the script takes no arguments |
| `uv run --with pyarrow python -c "import pyarrow.parquet as pq; print(pq.read_table('data/01-ef-3.1/methods.parquet').num_rows)"` | read a delivered table | change the path for the factor table or another datasource |

`scripts/validate.py --help` is not available: the script has no argument parser, so
there are no flags to verify. Its docstring is the specification. Continuous integration
installs `jsonschema[format]`, `pyyaml` and `pyarrow` and runs that script on every pull
request and on every push to a non-default branch. (source: sentier-methods-repo)

## Listing what a datasource covers

```bash
uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/01-ef-3.1/methods.parquet', columns=['method_id','impact_category','unit']); print(t.to_pydict()['method_id'])"
```

Reading the method table is cheap. The factor table is large, so select the columns you
need and filter on `method_id` rather than loading it whole.

## Adding a datasource

The documented order is metadata first:

```bash
mkdir data/04-<datasource>
$EDITOR data/04-<datasource>/metadata.json
uv run --with pyarrow --with pyyaml --with 'jsonschema[format]' python scripts/validate.py
```

A folder with valid metadata and no parquet passes. The factors then arrive as a pull
request from the importers. No loaders or importers are added here.

## Notebook entry points

None. Read the parquet with pyarrow or pandas. To use the methods inside an LCA tool,
take the loader in [../sentier-brightway/](../sentier-brightway/) rather than writing a
registration step yourself.
