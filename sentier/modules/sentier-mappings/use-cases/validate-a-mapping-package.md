---
title: Validate a mapping package
type: use-case
summary: "Run the mappings repository's validator over every pair folder and its own test suite, the two commands continuous integration runs."
audience: [P2]
updated: 2026-09-22
sources: [sentier-mappings-repo, randonneur-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-mappings, dependencies from scripts/requirements.txt via uv"
---

# Validate a mapping package

**Persona:** P2 contributor adding or editing a
[randonneur package](../../../../vocabulary.md#randonneur-package) ·
**GICS sector:** any

## Goal

A pass or a list of errors over every [ordered pair](../../../../vocabulary.md#ordered-pair)
folder, plus the validator's own test suite, before a pull request rather than after it.

## Prerequisites

- A clone of sentier-mappings, and `uv`. Nothing to install: the dependency list is a
  requirements file in the repository and `uv run --with-requirements` supplies it for
  the length of the command.
- Run both commands from the repository root. The script takes no arguments on the
  command line and has no argument parser, so there is no `--help`; its module entry
  point accepts a data directory when called from Python, which is what its own tests
  use.

## Steps

1. Validate every pair folder:

   ```bash
   uv run --with-requirements scripts/requirements.txt python scripts/validate.py
   ```

2. Read the exit status, which is what continuous integration acts on:

   ```bash
   echo $?
   ```

3. Run the validator's own test suite, which continuous integration also runs:

   ```bash
   uv run --with-requirements scripts/requirements.txt pytest -q tests
   ```

4. When you are editing one pair, read its metadata first: the packages list there is the
   authoritative order, and the order is part of what is validated:

   ```bash
   cat data/<source>__<target>/metadata.json
   ```

## Expected output

Step 1 prints one line saying how many pairs are valid, and exits zero. Five pair folders
exist today. On failure it exits non-zero and lists every error, each naming the pair and
the package.

What it checks is the package profile, that each file is a valid randonneur package with
the verbs and entry shapes the format allows; the metadata [schema](../../../../vocabulary.md#schema),
that the pair declares its source, its target, its schema version and an ordered packages
list that matches the files on disk; that the ordered packages never conflict on the same
source key, which is what makes applying them in order well defined; and that a pair
declared as targeting proprietary data carries nothing but a database name and an opaque
code, no names and no amounts.

Step 3 runs more than twenty cases built on temporary directories, so it validates
synthetic trees rather than the repository's own data, and passes in a couple of seconds.

## Pitfalls

- **Use the requirements file.** The dependency set is pinned there for a reason; a
  hand-picked `--with` list drifts from what continuous integration installs.
- **Run from the repository root.** The script resolves `data/` relative to the working
  directory.
- **The conflict check is the valuable one.** Two packages of the same pair mapping the
  same source key differently is the failure mode that silently changes results, and it
  is why the packages are numbered rather than merged.
- **A bridge onto licensed data is codes only.** If a pair is marked as targeting
  proprietary data, adding a readable name or an amount to it fails validation. That is
  deliberate, and it is enforced on every pull request.
- **Valid is not correct.** The validator checks the format and the internal consistency
  of a pair. Whether a mapping points at the right target flow is a review question; the
  pair's non-normative coverage sidecar, which names for every source flow the package
  that covers it or the reason none does, is where that review starts.
- **There is no apply command here.** Applying is randonneur's job, or the loader's; see
  [apply-a-mapping-package-with-randonneur.md](apply-a-mapping-package-with-randonneur.md).

## Related vocabulary

[Randonneur package](../../../../vocabulary.md#randonneur-package),
[ordered pair](../../../../vocabulary.md#ordered-pair),
[bridge](../../../../vocabulary.md#bridge),
[schema](../../../../vocabulary.md#schema),
[flow code](../../../../vocabulary.md#flow-code),
[metadata](../../../../vocabulary.md#metadata),
[nomenclature](../../../../vocabulary.md#nomenclature).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-mappings. Steps 1 to 3 were executed as written. The validator reported five
valid pairs and exited zero in 3.8 s; the test suite ran 23 tests, all passing, in 3.2 s
including the dependency resolution. Step 4 was read while writing
[apply-a-mapping-package-with-randonneur.md](apply-a-mapping-package-with-randonneur.md).
