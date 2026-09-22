---
title: Add a new source plugin
type: use-case
summary: "Add an external data source to the import framework: a Source subclass with a transform, a registry block, and offline tests."
audience: [P2]
updated: 2026-09-22
sources: [sentier-importers-repo]
verified: no
---

# Add a new source plugin

**Persona:** P2 contributor bringing a new external LCA data source into the platform ·
**GICS sector:** any

## Goal

A new source that the framework can list, validate and run like any other, with its own
tests, ready to propose as a pull request. The framework owns fetching, parsing,
deduplication, validation, writing and delivery; you own the
[transform](../../../../vocabulary.md#importer) and nothing else.

## Prerequisites

- Python 3.10 or newer, `uv`, a clone of sentier-importers with `uv sync --extra dev`,
  and `pre-commit install`.
- A decision about the target: which of the four data repositories the source writes
  into, and which category inside it.
- A small, stable sample of the upstream input you can commit as a fetch fixture. Tests
  never touch the network.

## Steps

1. Read the reference plugin first. It is the only enabled source and it is short:

   ```bash
   sed -n '1,60p' app/sentier_importers/sources/example_csv/source.py
   ```

2. Create the plugin folder and write a `Source` subclass implementing `transform`.
   Override `fetch` or `parse` only when the input needs it:

   ```bash
   mkdir -p app/sentier_importers/sources/<name>/tests
   ```

3. Declare the source in the registry: a block naming the module path, the target, the
   category, the fetch URL and format, the output format, what it validates against, and
   `enabled: false` unless it is small enough to belong in the smoke test:

   ```bash
   $EDITOR app/sentier_importers/registry.yaml
   ```

4. Check that the framework can see it:

   ```bash
   uv run sentier-importers list
   ```

5. Run the pipeline up to validation, which writes nothing:

   ```bash
   uv run sentier-importers validate <name>
   ```

6. Add tests beside the plugin, with a cached fetch fixture so they run offline, and run
   them:

   ```bash
   uv run --extra testing pytest app/sentier_importers/sources/<name>/tests/
   ```

7. Stage a dry run into a checkout of the target repository and read the diff there
   before proposing anything:

   ```bash
   uv run sentier-importers run <name> --deliver-local /path/to/<target-repository>
   ```

8. Format and lint as continuous integration does:

   ```bash
   uv run --extra dev pre-commit run --all-files
   ```

## Expected output

Step 4 lists your source with its target, its category and its enabled flag. Step 5
prints the source name and a count of valid rows, or a validation error naming the field
and the row. Step 6 passes offline. Step 7 leaves files in the target checkout that
`git diff` shows; that diff is the review surface, and for a bulk delivery it is the
parquet, not any generated Turtle.

## Pitfalls

- **Keep the logic in `transform`.** Everything the framework already supplies (cached
  fetch, parsers, dedup, validation, writers, delivery) is shared for a reason; a plugin
  that re-implements one of them will diverge from the others.
- **Identifiers must be stable.** A source slugifies a stable upstream key into the IRI,
  so re-running must produce byte-identical identifiers. Changing the slug input
  silently mints a second term rather than updating the first.
- **Deduplication distinguishes two failures.** Two rows with the same identifier and
  different content are an error, because that is a transform bug. A row whose identifier
  is already in the target is skipped, refused or overwritten according to your declared
  setting, and the default is to skip.
- **A [mapping](../../../../vocabulary.md#randonneur-package) that targets licensed data
  carries codes only.** Mark the package as targeting proprietary data; the target
  repository's validator enforces that it holds nothing but a database name and an opaque
  code, no names and no amounts.
- **Mapping packages have an order.** Within one source-and-target pair the packages are
  numbered and an earlier package wins on a shared source key. Adding an entry to the
  wrong package changes which mapping applies.
- **Never emit Turtle.** RDF is an input concern here; the vocabulary repository
  generates its own from what it receives.
- **Leave it disabled unless it is tiny.** `run --all` is the smoke test, and it is fast
  only because large imports are opt-in.

## Related vocabulary

[Importer](../../../../vocabulary.md#importer),
[schema](../../../../vocabulary.md#schema),
[randonneur package](../../../../vocabulary.md#randonneur-package),
[ordered pair](../../../../vocabulary.md#ordered-pair),
[flow code](../../../../vocabulary.md#flow-code),
[nomenclature](../../../../vocabulary.md#nomenclature).

## Verification

`verified: no`. The steps are the repository's own contributing instructions plus the
shape of the reference plugin and its registry block, read on 2026-09-22 in a clone at
version 0.0.1; steps 1, 4 and 5 were exercised against the reference plugin while writing
[run-an-importer-end-to-end.md](run-an-importer-end-to-end.md). Nothing here was verified
by authoring a real new source, because that needs an upstream dataset worth importing
and a pull request to the framework. A verifier would write one small plugin against a
public input, run steps 2 to 8 in a clean clone, and record what the registry block and
the test fixture had to contain.
