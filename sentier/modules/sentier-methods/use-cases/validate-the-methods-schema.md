---
title: Validate the methods schema
type: use-case
summary: "Run the methods repository's own validator over every datasource folder, the same command continuous integration runs."
audience: [P2]
updated: 2026-09-22
sources: [sentier-methods-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-methods, dependencies via uv --with"
---

# Validate the methods schema

**Persona:** P2 contributor opening a datasource or delivering factors ·
**GICS sector:** any

## Goal

A pass or a list of violations over every datasource folder, from the same script and the
same dependencies continuous integration uses.

## Prerequisites

- A clone of sentier-methods, and `uv`. Nothing to install: the three dependencies are
  supplied for the length of the command.
- Run it from the repository root. The script takes no arguments and has no argument
  parser, so there is no `--help`.

## Steps

1. Run the validator:

   ```bash
   uv run --with pyarrow --with pyyaml --with 'jsonschema[format]' python scripts/validate.py
   ```

2. Read the exit status, which is what continuous integration acts on:

   ```bash
   echo $?
   ```

3. To open a new datasource, write its
   [metadata](../../../../vocabulary.md#metadata) first and validate before any factors
   exist:

   ```bash
   mkdir data/04-<datasource> && $EDITOR data/04-<datasource>/metadata.json
   ```

4. Then run step 1 again. A folder with valid metadata and no parquet passes.

## Expected output

On success, one line saying how many datasources are valid, and exit status zero. Three
datasource folders exist today and all three pass, although only one carries factor data.

On failure, exit status non-zero and one line per error naming the folder and the
problem. What it checks is the shape of each folder's metadata, and, where the parquet
files exist, the column set and types of the methods table and of the
[characterisation factor table](../../../../vocabulary.md#characterisation-factor-table),
including that every factor's [method id](../../../../vocabulary.md#method-id) resolves to
a row of the methods table.

## Pitfalls

- **Metadata first is the documented order.** Creating the folder with a valid metadata
  file and no parquet is a legitimate, passing state, and it is how a datasource is
  reserved before its factors arrive as a delivery.
- **Install the format extra.** `jsonschema[format]` rather than plain `jsonschema`;
  without it the format checks are skipped silently.
- **Run it from the repository root.** The script resolves `data/` relative to the working
  directory.
- **Valid is not correct.** The validator checks shape and referential integrity between
  the two tables. Whether a factor value is the published one is a data question, and the
  way to answer it is a backtest against published results, as in
  [../../sentier-brightway/use-cases/run-the-backtest-against-bafu-results.md](../../sentier-brightway/use-cases/run-the-backtest-against-bafu-results.md).
- **No loaders live here.** This repository is data plus a validator; registering the
  methods in an LCA tool is the loader's job.

## Related vocabulary

[Schema](../../../../vocabulary.md#schema),
[LCIA method](../../../../vocabulary.md#lcia-method),
[method id](../../../../vocabulary.md#method-id),
[impact category](../../../../vocabulary.md#impact-category),
[characterisation factor table](../../../../vocabulary.md#characterisation-factor-table),
[metadata](../../../../vocabulary.md#metadata).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-methods. Steps 1 and 2 were executed as written and took 1.4 s; the validator
reported three valid datasources and exited zero. Steps 3 and 4 were not run, because
they create a folder in the clone.
