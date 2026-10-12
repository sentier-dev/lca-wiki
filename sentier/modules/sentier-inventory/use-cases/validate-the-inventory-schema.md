---
title: Validate the inventory schema
type: use-case
summary: "Run the repository's own validator over every source folder, the same command continuous integration runs on every pull request."
audience: [P2]
updated: 2026-10-12
sources: [sentier-inventory-repo, sentier-inventory-pr-5]
verified: yes
verified_on: 2026-10-12
verified_env: "uv 0.11.14, Python 3.9.25 as picked by uv, Ubuntu 22.04, a clone of sentier-inventory at commit cf54f55 (schema version 0.3.0, pull request #5), dependencies via uv --with"
---

# Validate the inventory schema

**Persona:** P2 contributor about to propose an inventory delivery, or anyone checking a
clone is intact · **GICS sector:** any

## Goal

A pass or a list of violations, from the same script and the same dependencies
continuous integration uses, before a pull request rather than after it.

## Prerequisites

- A clone of sentier-inventory, and `uv`. There is nothing to install: the script's three
  dependencies are supplied for the length of the command.
- Run it from the repository root. The script takes no arguments and has no argument
  parser, so there is no `--help` and there are no flags.

## Steps

1. Run the validator:

   ```bash
   uv run --with "jsonschema[format],pyyaml,pyarrow" python scripts/validate.py
   ```

2. Read its exit status, which is what continuous integration acts on:

   ```bash
   echo $?
   ```

3. When it fails on a delivery you are preparing, compare the folder's declared counts
   and sectors with the files themselves:

   ```bash
   cat data/<source>-<source_version>/metadata.json
   ```

## Expected output

On success, one line saying how many [source folders](../../../../vocabulary.md#source-folder)
validate against the [schema](../../../../vocabulary.md#schema) contracts, and exit status
zero. There is one folder today, `bafu-2026-v1`.

On failure, exit status non-zero and one line per violation, each naming the folder and
what was wrong. The contracts it checks are the presence and shape of each folder's
[metadata](../../../../vocabulary.md#metadata), the declared schema version, the column
set, types and enumerations of the two parquet tables, the agreement between the declared
row counts and the files, that `source` and `source_version` each hold one value equal
to the metadata and to the folder name, and that the distinct `sector` values equal the
declared `sectors` list.

## Pitfalls

- **Run it from the repository root.** The script resolves `data/` relative to the working
  directory; from anywhere else it validates nothing or fails confusingly.
- **Install the format extra.** `jsonschema[format]` rather than plain `jsonschema`: the
  format checks are part of the contract, and without the extra they are silently
  skipped.
- **A passing validator is not a correct inventory.** It checks shape, not content. A
  process whose amounts are wrong, or whose flow identifiers point nowhere useful, passes.
- **Row counts and sectors are part of the contract.** Editing a parquet file without
  updating the folder's declared counts or its `sectors` list fails, which is deliberate:
  the metadata is how a reviewer sizes a delivery, and sees which sectors it holds,
  without loading it.
- **The folder name is part of the contract too.** A folder named anything other than
  `<source>-<source_version>` as its metadata and rows declare them fails, so a release
  cannot be delivered under the wrong name.
- **The same pattern, different dependencies, in the sibling repositories.** The methods
  and mappings repositories each carry their own `scripts/validate.py` with their own
  dependency list; do not copy this command between them.

## Related vocabulary

[Schema](../../../../vocabulary.md#schema),
[source folder](../../../../vocabulary.md#source-folder),
[metadata](../../../../vocabulary.md#metadata),
[data format](../../../../vocabulary.md#data-format),
[process](../../../../vocabulary.md#process),
[exchange](../../../../vocabulary.md#exchange).

## Verification

Run on 2026-10-12 on Ubuntu 22.04 with uv 0.11.14 and the Python 3.9.25 that uv picked,
in a clone of sentier-inventory at commit `cf54f55`, schema version 0.3.0. Steps 1 and 2
were executed as written and took 0.3 s with the dependencies already cached; the
validator reported that one source folder validates against the schema contracts and
exited zero. Step 3 was not needed, because nothing failed. A first run on 2026-09-22
against the former layout (schema 0.1.0) had reported eleven sector folders validating.
