---
title: sentier-inventory commands
type: module-page
summary: The validator, the inspection one-liners, and what continuous integration runs.
audience: [P1]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
---

# sentier-inventory commands

There is no command line interface and no package. Two commands are worth knowing, both
taken from the repository README and its workflow file, checked on 2026-10-12 against a
clone at commit `cf54f55` (pull request #5, not yet merged). Run them from the repository
root. (source: sentier-inventory-pr-5)

| Command | What it does | Key options |
|---|---|---|
| `uv run --with "jsonschema[format],pyyaml,pyarrow" python scripts/validate.py` | validate every source folder against the schema contracts; exits non-zero listing every violation | none; the script takes no arguments |
| `uv run --with pandas,pyarrow python -c "import pandas as pd; print(pd.read_parquet('data/bafu-2026-v1/processes.parquet'))"` | read one delivered table | change the path for another source folder or for `exchanges.parquet` |

`scripts/validate.py --help` is not available: the script has no argument parser, so
there are no flags to verify. Its docstring is the specification and says it is run from
the repository root as `python scripts/validate.py`. The workflow installs
`jsonschema[format]`, `pyyaml` and `pyarrow` with pip and runs exactly that command on
every pull request to the default branch, on every push to any other branch, and on
manual dispatch. On success it prints one line saying how many source folders validate,
one today. (source: sentier-inventory-pr-5)

## Reading a source folder without pandas

```bash
uv run --with pyarrow python -c "import pyarrow.parquet as pq; t = pq.read_table('data/bafu-2026-v1/exchanges.parquet'); print(t.num_rows, t.column_names)"
```

## Reading one sector

The sector is a column, so a sector is a filter rather than a path. Parquet predicate
pushdown reads only the matching row groups:

```bash
uv run --with pandas,pyarrow python -c "import pandas as pd; p = pd.read_parquet('data/bafu-2026-v1/processes.parquet', filters=[('sector', '==', 'electricity')]); print(p.shape)"
```

## Checking what a source folder claims

```bash
cat data/bafu-2026-v1/metadata.json
```

The declared row counts and the `sectors` list are validated against the files, so
reading the metadata is a cheap way to size a source and see which sectors it holds
before loading it.

## Notebook entry points

None. The repository is read from a notebook the same way it is read from a shell, with
pyarrow or pandas. If you want the data inside an LCA tool rather than in a dataframe,
use the loader in [../sentier-brightway/](../sentier-brightway/) instead of writing your
own reader.
