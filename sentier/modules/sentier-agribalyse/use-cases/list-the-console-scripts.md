---
title: List the console scripts
type: use-case
summary: "See every command the adapter installs and read one command's own help, the two things you can do in a clone with no licensed inputs."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-agribalyse-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-agribalyse at version 0.3.0, no licensed inputs present"
---

# List the console scripts

**Persona:** P1 practitioner or P2 contributor sizing up the repository before deciding
whether to obtain the inputs · **GICS sector:** Consumer Staples, food products

## Goal

The full command surface of the adapter, in the order you would run it, from a clone
alone. This is the part of the repository that works without an Agribalyse export and
without a licensed background database, and it is the honest first step before
[understand-the-public-twin-workflow.md](understand-the-public-twin-workflow.md).

## Prerequisites

- Python 3.11 or newer, `uv`, and a clone of sentier-agribalyse with `uv sync`.
- No licensed inputs, no credentials and no network. Listing entry points and printing a
  command's help need none of them.

## Steps

1. List every command the package installs:

   ```bash
   uv run python -c "from importlib.metadata import entry_points; names = sorted({e.name for e in entry_points(group='console_scripts') if e.name.startswith('dds-')}); print(len(names)); print('\n'.join(names))"
   ```

2. Read one command's own help, which is the authority on its flags:

   ```bash
   uv run dds-list-parameters --help
   ```

3. Read another, to see the flags the scoring commands share:

   ```bash
   uv run dds-backtest --help
   ```

4. Cross-read the repository's own documented order, which the command list alone does
   not give you:

   ```bash
   sed -n '1,60p' README.md
   ```

## Expected output

Step 1 prints 24 distinct commands, all prefixed `dds-`. They group into six families:
one bootstrap command that snapshots a licensed background database, seven that build the
mapping registry and its catalogues, five that link and score, six that review and
report, four that manage process parameters, and two that export. The grouping and what
each command does are on [../commands.md](../commands.md).

Step 2 prints a short argument parser help: a usage line, a one-sentence description and
two optional filters. Step 3 prints the help of a scoring command, which is where the
shared flags show up: a solver choice, a worker count, a limit on how many products to
score, and a matching-strictness switch.

Step 4 shows the pipeline the commands belong to, which the entry point list does not
encode: regenerate the local inputs if you are licensed, build the registry and its
catalogues, link, backtest, build the dashboard tables, then serve the dashboard folder.

## Pitfalls

- **The entry points can appear twice.** In a clone that has been installed more than
  once, stale distribution metadata makes `entry_points` return duplicates; the command in
  step 1 takes a set for that reason. The real count is 24.
- **`--help` works, the command usually does not.** Printing help needs nothing. Almost
  every command then reads files under the repository's source or registry folders that a
  licensed user regenerates locally and that are gitignored and blocked by a pre-commit
  guard. Running one of those in a fresh clone fails on a missing input, which is the
  design working.
- **Some commands write into the clone.** The build commands write parquet into the
  repository's own registry folder. If you only want to look, stop after `--help`.
- **Activate the guard before touching a regenerated file.** `pre-commit install` once per
  clone; it is what keeps licensed data out of git.
- **The solver flag matters.** The scoring commands offer a choice, and the repository
  documents why the faster sparse solver is preferred: the matrix carries zero-diagonal
  placeholder activities that the default solver rejects as exactly singular.

## Related vocabulary

[LCIA method](../../../../vocabulary.md#lcia-method),
[impact category](../../../../vocabulary.md#impact-category),
[randonneur package](../../../../vocabulary.md#randonneur-package),
[datapackage](../../../../vocabulary.md#datapackage),
[background](../../../../vocabulary.md#background),
[foreground](../../../../vocabulary.md#foreground),
[linking](../../../../vocabulary.md#linking).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-agribalyse at version 0.3.0 with no licensed inputs present. Steps 1, 2 and 3
were executed as written and took 0.1 s, 2.2 s and about 2 s. Step 1 returned 41 raw
entry point names and 24 distinct ones, which is the duplication described under
Pitfalls. Steps 2 and 3 printed the argument parser help described above. Step 4 is a
read of a file in the clone.
