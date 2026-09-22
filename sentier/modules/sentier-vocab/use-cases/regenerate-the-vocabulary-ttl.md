---
title: Regenerate the vocabulary TTL
type: use-case
summary: "Run the generator over every curated category and get one SKOS Turtle file per source file, which is what continuous integration checks."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-vocab-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.12.13, Ubuntu 22.04, sentier-vocab 0.0.2 from a clone, output into a throwaway directory"
---

# Regenerate the vocabulary TTL

**Persona:** P2 contributor who has just changed a term, a schema or a bulk delivery ·
**GICS sector:** any

## Goal

A regenerated `output/` that matches `data/` and `schemas/`, because continuous
integration fails when it does not. As a side effect you get the full published
vocabulary as SKOS Turtle, including the bulk shards that are gitignored and therefore
never visible in a pull request diff.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-vocab with `uv sync`.
- A few minutes and about 150 MB of free disk for the generated Turtle.
- Nothing from the network: the generator reads the repository's own `data/` folder. The
  transitional ontology importers are a separate script and do reach outside.

## Steps

1. Generate into a throwaway directory first, so you can look at the result before you
   touch the committed `output/`:

   ```bash
   uv run python -m sentier_vocab generate --output-dir /path/to/scratch
   ```

2. Check what was written:

   ```bash
   ls /path/to/scratch | wc -l && du -sh /path/to/scratch
   ```

3. When you are happy, regenerate in place, which is what the pull request needs:

   ```bash
   uv run python -m sentier_vocab generate
   ```

4. Regenerate the coverage matrix in the same change:

   ```bash
   uv run python -m sentier_vocab coverage
   ```

5. Format and lint as continuous integration does, including the added-file size guard:

   ```bash
   uv run --extra dev pre-commit run --all-files
   ```

## Expected output

Step 1 prints one `wrote <file> (from <source>)` line per source file, walking all
thirteen curated categories in turn and printing `skip <category>` for a category with no
source files. It ends with about fifty Turtle files and roughly 150 MB, most of it the
elementary-flow and process shards.

Two naming rules explain the file list. A source file whose stem is `core` or `water`
writes the bare `<category>.ttl`, and those are the files that are committed; any other
stem writes `<category>.<stem>.ttl`, which is gitignored and rebuilt at deploy time. And
the elementary-flows category writes files called `flows.*`, not `elementary-flows.*`, so
searching the output for "elementary" finds nothing.

Step 3 changes only the committed files, and only where the data did: the serialiser
orders statements deterministically, so a regeneration with no data change is a no-op in
git. Step 4 rewrites the coverage matrix, which is the honest picture of which term type
has a [schema](../../../../vocabulary.md#schema), which has data, and which layer
supplies it.

## Pitfalls

- **An unregistered concept scheme fails the whole source.** The generator checks the
  scheme a source declares against the namespace registry before it writes anything. A
  new category needs a namespace entry there first, and changing an existing one is a
  vocabulary migration, not an edit.
- **Regeneration is part of the pull request.** Continuous integration compares `output/`
  and the coverage matrix against `data/` and `schemas/`. Run both commands in the same
  change that touches the data.
- **Bulk deliveries are reviewed as parquet, not as Turtle.** Their Turtle is gitignored,
  so it never appears in a diff. Review the delivered file itself.
- **Bulk files are capped.** The pre-commit hook rejects an added file above 3 MB; shard a
  larger delivery with a numeric suffix. There is no git-LFS here and no release
  artifacts, by policy.
- **The generated models under the schema folder are not source.** They are derived from
  the LinkML schemas and are overwritten on the next build.

## Related vocabulary

[Nomenclature](../../../../vocabulary.md#nomenclature),
[elementary flow](../../../../vocabulary.md#elementary-flow),
[compartment](../../../../vocabulary.md#compartment),
[sub-compartment](../../../../vocabulary.md#sub-compartment),
[schema](../../../../vocabulary.md#schema),
[metadata](../../../../vocabulary.md#metadata),
[impact category](../../../../vocabulary.md#impact-category).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.12.13, in a clone of
sentier-vocab at version 0.0.2. Steps 1 and 2 were executed as written, into a throwaway
directory so the clone was left untouched; the generation took 270 s and wrote 50 Turtle
files totalling 139 MB, including eleven primary files and the flows, processes,
organisms and qualifiers shards. Steps 3 to 5 were not run, because they write into the
clone.
