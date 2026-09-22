---
title: sentier-inventory commands
type: module-page
summary: The validator, the inspection one-liner, and what continuous integration runs.
audience: [P1]
updated: 2026-09-21
sources: [sentier-inventory-repo]
---

# sentier-inventory commands

There is no command line interface and no package. Two commands are worth knowing, both
taken from the repository README and its workflow file, checked on 2026-09-21 against a
clone at commit `6fced18`. Run them from the repository root.
(source: sentier-inventory-repo)

| Command | What it does | Key options |
|---|---|---|
| `uv run --with "jsonschema[format],pyyaml,pyarrow" python scripts/validate.py` | validate every sector folder against the schema contracts; exits non-zero listing every violation | none; the script takes no arguments |
| `uv run --with pandas,pyarrow python -c "import pandas as pd; print(pd.read_parquet('data/01-agriculture/processes.parquet'))"` | read one delivered table | change the path for another sector or for `exchanges.parquet` |

`scripts/validate.py --help` is not available: the script has no argument parser, so
there are no flags to verify. Its docstring is the specification and says it is run from
the repository root as `python scripts/validate.py`. The workflow installs
`jsonschema[format]`, `pyyaml` and `pyarrow` with pip and runs exactly that command on
every pull request to the default branch, on every push to any other branch, and on
manual dispatch. (source: sentier-inventory-repo)

## Reading a sector without pandas

```bash
uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/02-electricity/exchanges.parquet'); print(t.num_rows, t.column_names)"
```

## Checking what a sector claims

```bash
cat data/05-energy/metadata.json
```

The declared row counts are validated against the files, so reading the metadata is a
cheap way to size a sector before loading it.

## Notebook entry points

None. The repository is read from a notebook the same way it is read from a shell, with
pyarrow or pandas. If you want the data inside an LCA tool rather than in a dataframe,
use the loader in [../sentier-brightway/](../sentier-brightway/) instead of writing your
own reader.
