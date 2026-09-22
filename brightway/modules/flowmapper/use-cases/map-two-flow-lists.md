---
title: Map two flow lists
type: use-case
summary: Match one elementary flow list against another with flowmapper, read the statistics and the unmatched flows, and write the result as a randonneur transformation.
audience: [P1]
updated: 2026-09-22
sources: [flowmapper-repo, pypi-flowmapper, randonneur-repo]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with flowmapper 0.4, Linux x86-64, on a four-flow toy pair
related: [../commands.md, ../classes.md, ../gotchas.md, ../../randonneur/use-cases/apply-a-migration-to-inventory-data.md]
---

# Map two flow lists

**Persona:** P1 practitioner joining an inventory written against one elementary flow
list to a method or database that uses another · **GICS sector:** any

## Goal

A mapping file between two elementary flow lists, plus explicit lists of what did not
match on either side, so the gap is visible rather than silently dropped.

## Prerequisites

- `flowmapper` 0.4.
- Two flow lists as JSON arrays, already in flowmapper's core shape: each flow a
  dictionary with `name`, `context`, `unit`, and optionally an identifier, a CAS number
  and synonyms. flowmapper does not sniff formats; the `extract-simapro-csv` and
  `extract-ecospold2` subcommands exist to produce that shape from those two formats
  (source: flowmapper-repo).
- No network access.

## Steps

1. Write or extract the two lists. The toy pair used here is four flows against four:
   two that differ only in unit spelling and context case, one whose units are in
   different dimensions, and one spelled *Sulphur* on one side and *Sulfur* on the
   other.

   ```json
   [
     {"name": "Carbon dioxide, fossil", "unit": "kg", "context": ["Air"], "CAS number": "000124-38-9"},
     {"name": "Methane, fossil", "unit": "kg", "context": ["Air"], "CAS number": "000074-82-8"},
     {"name": "Water, river", "unit": "litre", "context": ["Raw materials"]},
     {"name": "Sulphur dioxide", "unit": "kg", "context": ["Air"]}
   ]
   ```

2. Declare how each list labels its fields. This is randonneur's mapping block, and both
   the source and the target need one.

   ```python
   mapping = {
       "expression language": "like JSONPath",
       "labels": {"name": "name", "unit": "unit", "context": "context",
                  "CAS number": "CAS number", "uuid": "uuid"},
   }
   ```

3. Run the match and write the output.

   ```python
   from pathlib import Path
   from flowmapper.main import flowmapper, OutputFormat

   flowmap = flowmapper(
       source=Path("source-flows.json"),
       target=Path("target-flows.json"),
       mapping_source=mapping,
       mapping_target=mapping,
       source_id="toy-source-list",
       target_id="toy-target-list",
       contributors=[{"title": "your name", "path": "https://example.org",
                      "roles": ["wrangler"]}],
       output_dir=Path("out"),
       format=OutputFormat.randonneur,
   )
   ```

4. Read what matched and what did not.

   ```python
   [str(f.name) for f in flowmap.matched_source]
   [str(f.name) for f in flowmap.unmatched_source]
   [str(f.name) for f in flowmap.unmatched_target]
   ```

5. Read the transformation file it wrote, and apply it with `randonneur`; see
   [../../randonneur/use-cases/apply-a-migration-to-inventory-data.md](../../randonneur/use-cases/apply-a-migration-to-inventory-data.md).

   ```python
   import json

   written = json.load(open("out/source-flows-target-flows.json"))
   sorted(written)
   len(written["update"])
   ```

## Expected output

- The run prints `4 source flows...`, `4 target flows...`, then
  `2 mappings (50.00% of total).` and `Mappings cardinalities: {'1:1': 2}`.
- `out/` holds three files: the transformation `source-flows-target-flows.json`, plus
  `-unmatched-source.json` and `-unmatched-target.json`. Matched-flow files are off by
  default.
- The two carbon and methane flows match despite `kg` against `kilogram` and `Air`
  against `air`: unit harmonisation and context transformations are applied by default.
- `Water, river` appears in **both** unmatched lists. Litres against cubic metres is a
  unit the bundled harmonisation does not bridge here, and the contexts differ too.
  `Sulphur dioxide` and `Sulfur dioxide` also stay unmatched: flowmapper does not guess
  at spelling variants.
- The transformation file carries `name`, `description`, `version`, `created`,
  `contributors`, `licenses`, `mapping`, `graph_context`, `source_id`, `target_id` and
  one `update` list with two entries. Each entry has `source`, `target`, a `comment`
  explaining why they matched (`Identical names` for both here) and a
  `conversion_factor`, which is 1 when the units agree in magnitude.

## Pitfalls

- **`flowmapper map` on the command line is broken in 0.4.** The Typer command calls
  `flowmapper()` without `mapping_source`, `mapping_target`, `source_id`, `target_id` or
  `contributors`, and fails with `TypeError: flowmapper() missing 5 required positional
  arguments`. Verified on 2026-09-22. Use the Python function until it is fixed; the
  documented option list in [../commands.md](../commands.md) still describes what the
  command intends to do.
- **`format=OutputFormat.all` fails too,** on the GLAD workbook writer: it calls `len()`
  on a float column and raises `TypeError: object of type 'float' has no len()`.
  `OutputFormat.randonneur` writes cleanly. Verified on 2026-09-22.
- **Every field your flows carry must be in the `labels` mapping.** An unmapped key such
  as `CAS number` raises `randonneur.errors.UnmappedData` at write time, after the
  matching has already run.
- **Contributors are validated.** Each needs `title`, `path` and `roles`; `role`
  singular raises a pydantic error.
- **There are no partial matches.** A pair either matches or lands in the unmatched
  files. That makes the mapping file larger and the gap honest.
- **Units are checked, not compared.** After a match, flowmapper verifies the units share
  a dimension and converts with Pint. A dimension mismatch is a failed match, not a
  conversion problem (source: flowmapper-repo).
- **`-t` applies to the source side only.** Fixing the target list means fixing the file
  you pass as the target.
- **The distribution states no licence.** The PyPI metadata carries no licence field; the
  repository LICENSE is MIT. Cite the repository (source: pypi-flowmapper,
  flowmapper-repo).

## Related vocabulary

- [Flow mapper](../../../../vocabulary.md#flow-mapper)
- [Elementary flow](../../../../vocabulary.md#elementary-flow)
- [Context](../../../../vocabulary.md#compartment)
- [Sub-compartment](../../../../vocabulary.md#sub-compartment)
- [Nomenclature](../../../../vocabulary.md#nomenclature)
- [Flow code](../../../../vocabulary.md#flow-code)
- [Randonneur package](../../../../vocabulary.md#randonneur-package)
- [Bridge](../../../../vocabulary.md#bridge)
- [Unit normalisation](../../../../vocabulary.md#unit-normalisation)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`flowmapper` 0.4, Linux x86-64. The flow lists were written by hand for this page: no
public pair small enough to show ships with the package, and its bundled `data/` holds
transformation files rather than example flow lists.

Both failures under **Pitfalls** were reproduced: `flowmapper map source-flows.json
target-flows.json --output-dir out` exits with the `TypeError` quoted, and
`format=OutputFormat.all` raises inside `to_glad`. Everything under **Expected output**
is what the successful `OutputFormat.randonneur` run printed. Duration: under
4 seconds.
