---
title: bw2io datasets
type: module-page
summary: What bw2io ships in its data directory and what it downloads from the Brightway file server.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw2io, bw2io-docs, brightway-cheatsheet]
related: [README.md, commands.md, ../ecoinvent_interface/README.md]
---

# bw2io datasets

Two kinds of data: what the wheel contains, and what the package fetches over the network
when you ask it to. Both are described here by name, coverage and provenance only. No
amounts and no characterisation factors are reproduced in this wiki.

## Shipped in the package

Read by walking `bw2io/data/` in the installed 0.9.17 on 2026-09-21.

### Migration and mapping tables

- **What they are:** JSON and spreadsheet tables that rename flows, activities and units
  between nomenclature versions: `biosphere-2-3.json`, `ecoinvent22.json`,
  `ecoinvent-3.01-3.1.json`, `simapro-biosphere.json`, `simapro-water.json`,
  `us-lci.json`, `exiomigration.json`, and under `lci/` the SimaPro to ecoinvent mapping
  files for ecoinvent 3.1 through 3.5, the ecoinvent version-to-version workbooks and
  `ecoinvent_pre35_migration.json`.
- **Provenance:** assembled by the Brightway maintainers, distributed under the package's
  BSD 3-Clause licence (source: pypi-bw2io).
- **Schema:** the `Migration` format, a list of field-matching rules and replacements,
  registered in the project by `create_core_migrations()`.
- **Vocabulary:** ecoinvent and SimaPro flow and activity naming, plus Brightway's own
  normalised unit names.
- **Used by:** the `migrate_datasets` and `migrate_exchanges` strategies.

### Elementary flow lists

- **What they are:** the new-biosphere lists for ecoinvent 3.3 to 3.9 as JSON, the
  ecoinvent 3.9 elementary flow master file as XML (about 4.8 MB), an older
  `previous elementary flows.json`, and `ecoinvent elementary flows 2-3.xlsx`.
- **Provenance:** derived from the ecoinvent elementary flow nomenclature, which is
  published separately from the licensed inventory data
  (source: bw2io-docs; see [../../../ecoinvent/](../../../ecoinvent/)).
- **Schema:** flow name, categories, unit and UUID, which is what
  `link_biosphere_by_flow_uuid` matches on.
- **Used by:** `Ecospold2BiosphereImporter`, called by `create_default_biosphere3()`.

### Impact assessment methods

- **What it is:** `data/lcia/lcia_39_ecoinvent.zip`, about 700 kB, holding a `data.json`
  of impact categories with their characterisation factors, plus
  `lcia/categoryUUIDs.csv`.
- **Version:** the method set distributed with ecoinvent 3.9.
- **Provenance:** read directly by `create_default_lcia_methods(shortcut=True)`, which
  unpacks the archive and writes the methods; with `shortcut=False` the same data is
  imported through `EcoinventLCIAImporter` instead (read from the installed 0.9.17).
- **Methods:** the full ecoinvent 3.9 impact category list, including ILCD, ReCiPe,
  EF and the others in that release.
- **Licensing:** the factors are data. This wiki names the file and what it covers and
  does not reproduce any factor values.

### Geography and units

- `lci/geodata.json`, the location codes and their relationships, used by
  `update_ecoinvent_locations`; `units.py` carries the unit normalisation tables in code.

### Examples

- `data/examples/example.csv`, `example.xlsx` and
  `sample_parameterized_database.xlsx`: small workbooks used by the documentation and by
  `get_csv_example_filepath()` and `get_xlsx_example_filepath()`.

## Fetched over the network

### Prepared project archives

- **What they are:** whole Brightway projects packed as `.tar.gz`, containing elementary
  flows and, for the ecoinvent biosphere projects, impact categories as well
  (source: brightway-cheatsheet).
- **Where from:** `https://files.brightway.dev/`, the value of `bw2io.remote.BASE_URL`;
  `install_project` accepts another URL so an organisation can run its own repository.
- **Catalogue in 0.9.17:** the 2.5 list is `ecoinvent-3.8-biosphere`,
  `ecoinvent-3.9.1-biosphere`, `USEEIO-1.1` and `forwast`; a separate Brightway 2 list
  adds `ecoinvent-3.10-biosphere` (read from `remote.PROJECTS_BW25` and
  `remote.PROJECTS_BW2`). The cheat sheet also lists `ecoinvent-3.10-biosphere` as a
  usable tag, so check `get_projects()` rather than this page before assuming
  (source: brightway-cheatsheet).
- **Provenance:** published by the Brightway maintainers. The biosphere projects contain
  nomenclature and characterisation data, not licensed inventory data.

### Licensed ecoinvent releases

- `import_ecoinvent_release` downloads an actual ecoinvent release for a licensed user,
  through `ecoinvent_interface`. Nothing about that data is reproduced in this wiki:
  see [../../../ecoinvent/](../../../ecoinvent/) for what a licensed user may share, and
  [../ecoinvent_interface/](../ecoinvent_interface/) for the client.

### EXIOBASE and USEEIO

- `exiobase_monetary(...)` and `useeio20(...)` fetch those databases directly. Both are
  published under their own terms by their own projects, not by Brightway.

## Licensing note

The package's BSD 3-Clause licence covers the code and the mapping tables it ships. It
does not cover the databases it downloads on your behalf, each of which keeps its own
licence. A project directory built with `bw2io` is exactly as licensed as the data you
told it to fetch.
