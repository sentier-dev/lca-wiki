---
title: flowmapper datasets
type: module-page
summary: The reference data flowmapper bundles and the mapping files it writes.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-flowmapper, flowmapper-repo, randonneur-repo]
---

# flowmapper datasets

Descriptors stay broad: no per-datapoint content, no amounts, no characterisation
factors. Everything here is name, context, unit and identifier correspondence.

## Bundled reference data (`flowmapper/data/`)

Present in the flowmapper 0.4 wheel, listed by opening the installed package
(source: pypi-flowmapper).

| File | Shape | What it is for |
|---|---|---|
| `units.txt` | Pint definition file | unit aliases and spellings Pint does not know, such as the capitalised becquerel abbreviation |
| `standard-units-harmonization.json` | randonneur transformation package | normalises unit spellings across flow lists; applied by default |
| `simapro-2023-ecoinvent-3-contexts.json` | randonneur transformation package | maps SimaPro context strings onto ecoinvent compartments; applied by default |
| `places.json` | list of place codes | 576 entries, used by the location-code matching rules |
| `names_and_locations.json` | small list of source and target name pairs | a handful of name fixups, such as a well-water name gaining its ground qualifier |
| `manual_name_match_simapro_ecoinvent_3.8.json`, `..._3.9.json` | name-to-name lists | manual matches for SimaPro against those two ecoinvent biosphere lists |

- **Version:** ships with flowmapper 0.4 (2025-03-03).
- **Provenance:** the two randonneur packages carry their own `contributors` and
  `licenses` blocks inside the file; read those rather than assuming the package
  licence applies to them.
- **Schema:** the two randonneur packages follow the randonneur transformation file
  schema, documented in [../randonneur/datasets.md](../randonneur/datasets.md).
- **Vocabulary:** the core ontology of the library: `name`, `identifier`, `context`,
  `unit`, sector-specific labels such as CAS number, and `synonyms`
  (source: flowmapper-repo).

## Bundled manual matching material (`flowmapper/manual_matching/`)

- `data/simapro_ecoinvent_310/` holds the curated input for the SimaPro to
  ecoinvent 3.10 exercise, split by the reason a pair needed a human: names that are
  simply different, land use flows absent from ecoinvent, regionalised flows,
  unit conversions, and water miscellany.
- `results/simapro-2024-ecoinvent-3.10-biosphere.json` is the prepared output of that
  exercise, a ready-to-use biosphere mapping.
- `simapro_ecoinvent_310.py` is the script that produced the result from the data.
- **Sectors:** cross-sector; these are elementary flows, not activities.
- **Source branch:** the ecoinvent flow lists these correspondences point at are
  documented in [../../../ecoinvent/](../../../ecoinvent/).

## What flowmapper writes

One run of `flowmapper map` produces, in `--output-dir`:

| Output | Format | Contents |
|---|---|---|
| the mapping | GLAD format, randonneur transformation format, or both | one record per matched pair, with the fields that identify each side and a conversion factor where units differ |
| unmatched source flows | the input flow-list shape | the source flows no rule matched, written by default |
| unmatched target flows | the input flow-list shape | the target flows nothing matched to, written by default |
| matched source and target flows | the input flow-list shape | the matched flows, only when the corresponding switch is turned on |

- **Methods:** none. flowmapper does not produce or carry impact assessment methods.
- **Why the diagnostics matter:** the unmatched files are the working list for the next
  iteration. A mapping run is finished when what remains unmatched is understood, not
  when the tool stops.
- **Downstream:** a randonneur-format output is applied with
  `randonneur.migrate_edges`, and can be contributed to the `randonneur_data` registry
  so other people get it by name (source: randonneur-repo).
