# API reference: bw2io 0.9.17

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw2io` 0.9.17. Generated files: do not edit them by hand; each one
carries the command that produced it and regenerating overwrites it.

The package source is the `bw2io` 0.9.17 distribution from PyPI, installed without
dependencies into a throwaway environment; pydoc-markdown reads the source statically,
so nothing here required importing the package.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
cat > cfg.yml <<'YML'
processors:
  - type: filter
    documented_only: false
    expression: "type(obj).__name__ != 'Indirection' and default()"
  - type: smart
renderer:
  type: markdown
  render_toc: false
YML
uvx --python 3.11 --from pydoc-markdown==4.8.2 pydoc-markdown \
  -I "$SP" -m bw2io cfg.yml > bw2io.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw2io` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw2io](bw2io.md) — 1 KB
- [bw2io.backup](bw2io.backup.md) — 4 KB
- [bw2io.chemidplus](bw2io.chemidplus.md) — 3 KB
- [bw2io.compatibility](bw2io.compatibility.md) — 1 KB
- [bw2io.download_utils](bw2io.download_utils.md) — 2 KB
- [bw2io.ecoinvent](bw2io.ecoinvent.md) — 5 KB
- [bw2io.errors](bw2io.errors.md) — 2 KB
- [bw2io.export](bw2io.export.md) — 1 KB
- [bw2io.export.csv](bw2io.export.csv.md) — 5 KB
- [bw2io.export.ecospold1](bw2io.export.ecospold1.md) — 3 KB
- [bw2io.export.excel](bw2io.export.excel.md) — 4 KB
- [bw2io.export.gexf](bw2io.export.gexf.md) — 3 KB
- [bw2io.export.matlab](bw2io.export.matlab.md) — 1 KB
- [bw2io.extractors](bw2io.extractors.md) — 1 KB
- [bw2io.extractors.csv](bw2io.extractors.csv.md) — 2 KB
- [bw2io.extractors.ecospold1](bw2io.extractors.ecospold1.md) — 4 KB
- [bw2io.extractors.ecospold1_lcia](bw2io.extractors.ecospold1_lcia.md) — 3 KB
- [bw2io.extractors.ecospold2](bw2io.extractors.ecospold2.md) — 8 KB
- [bw2io.extractors.excel](bw2io.extractors.excel.md) — 4 KB
- [bw2io.extractors.exiobase](bw2io.extractors.exiobase.md) — 3 KB
- [bw2io.extractors.json_ld](bw2io.extractors.json_ld.md) — 2 KB
- [bw2io.extractors.simapro_csv](bw2io.extractors.simapro_csv.md) — 14 KB
- [bw2io.extractors.simapro_lcia_95project_csv](bw2io.extractors.simapro_lcia_95project_csv.md) — 3 KB
- [bw2io.extractors.simapro_lcia_csv](bw2io.extractors.simapro_lcia_csv.md) — 7 KB
- [bw2io.importers](bw2io.importers.md) — 1 KB
- [bw2io.importers.base](bw2io.importers.base.md) — 4 KB
- [bw2io.importers.base_lci](bw2io.importers.base_lci.md) — 17 KB
- [bw2io.importers.base_lcia](bw2io.importers.base_lcia.md) — 2 KB
- [bw2io.importers.ecoinvent_lcia](bw2io.importers.ecoinvent_lcia.md) — 2 KB
- [bw2io.importers.ecospold1](bw2io.importers.ecospold1.md) — 4 KB
- [bw2io.importers.ecospold1_lcia](bw2io.importers.ecospold1_lcia.md) — 1 KB
- [bw2io.importers.ecospold2](bw2io.importers.ecospold2.md) — 3 KB
- [bw2io.importers.ecospold2_biosphere](bw2io.importers.ecospold2_biosphere.md) — 2 KB
- [bw2io.importers.excel](bw2io.importers.excel.md) — 7 KB
- [bw2io.importers.excel_lcia](bw2io.importers.excel_lcia.md) — 2 KB
- [bw2io.importers.exiobase3_hybrid](bw2io.importers.exiobase3_hybrid.md) — 1 KB
- [bw2io.importers.exiobase3_monetary](bw2io.importers.exiobase3_monetary.md) — 2 KB
- [bw2io.importers.json_ld](bw2io.importers.json_ld.md) — 2 KB
- [bw2io.importers.json_ld_lcia](bw2io.importers.json_ld_lcia.md) — 2 KB
- [bw2io.importers.simapro_block_csv](bw2io.importers.simapro_block_csv.md) — 3 KB
- [bw2io.importers.simapro_csv](bw2io.importers.simapro_csv.md) — 2 KB
- [bw2io.importers.simapro_lcia_csv](bw2io.importers.simapro_lcia_csv.md) — 2 KB
- [bw2io.modified_database](bw2io.modified_database.md) — 4 KB
- [bw2io.package](bw2io.package.md) — 5 KB
- [bw2io.remote](bw2io.remote.md) — 2 KB
- [bw2io.strategies](bw2io.strategies.md) — 1 KB
- [bw2io.strategies.biosphere](bw2io.strategies.biosphere.md) — 4 KB
- [bw2io.strategies.csv](bw2io.strategies.csv.md) — 6 KB
- [bw2io.strategies.ecospold1_allocation](bw2io.strategies.ecospold1_allocation.md) — 6 KB
- [bw2io.strategies.ecospold2](bw2io.strategies.ecospold2.md) — 30 KB
- [bw2io.strategies.exiobase](bw2io.strategies.exiobase.md) — 7 KB
- [bw2io.strategies.generic](bw2io.strategies.generic.md) — 21 KB
- [bw2io.strategies.json_ld](bw2io.strategies.json_ld.md) — 16 KB
- [bw2io.strategies.json_ld_allocation](bw2io.strategies.json_ld_allocation.md) — 9 KB
- [bw2io.strategies.json_ld_lcia](bw2io.strategies.json_ld_lcia.md) — 6 KB
- [bw2io.strategies.lcia](bw2io.strategies.lcia.md) — 8 KB
- [bw2io.strategies.locations](bw2io.strategies.locations.md) — 2 KB
- [bw2io.strategies.parameterization](bw2io.strategies.parameterization.md) — 3 KB
- [bw2io.strategies.products](bw2io.strategies.products.md) — 3 KB
- [bw2io.strategies.sentier](bw2io.strategies.sentier.md) — 1 KB
- [bw2io.strategies.sentier.simapro_units](bw2io.strategies.sentier.simapro_units.md) — 2 KB
- [bw2io.strategies.simapro](bw2io.strategies.simapro.md) — 21 KB
- [bw2io.strategies.special](bw2io.strategies.special.md) — 2 KB
- [bw2io.strategies.useeio](bw2io.strategies.useeio.md) — 1 KB
- [bw2io.units](bw2io.units.md) — 1 KB
- [bw2io.unlinked_data](bw2io.unlinked_data.md) — 1 KB
- [bw2io.utils](bw2io.utils.md) — 3 KB
- [bw2io.validation](bw2io.validation.md) — 1 KB

Total: 68 files, 342 KB.
