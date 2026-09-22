# API reference: sentier-vocab 0.0.2

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `sentier-vocab` 0.0.2. Generated files: do not edit them by hand;
each one carries the command that produced it and regenerating overwrites it.

The package source is a clone of `https://github.com/sentier-dev/sentier-vocab` at
commit `ef440c6`, the commit the module page documents. pydoc-markdown reads the source
statically, so no install and none of the package's dependencies were needed.

The run itself used a clone already on the generating machine, at that same commit, and
the command above names a fresh clone instead so that no path outside this repository
appears in a generated file.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-vocab repo && git -C repo checkout ef440c6
SP=repo/app
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
  -I "$SP" -m sentier_vocab cfg.yml > sentier_vocab.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `sentier-vocab` and stay under
that package's own licence: MIT. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [sentier_vocab](sentier_vocab.md) — 1 KB
- [sentier_vocab.add_terms](sentier_vocab.add_terms.md) — 2 KB
- [sentier_vocab.coverage](sentier_vocab.coverage.md) — 2 KB
- [sentier_vocab.errors](sentier_vocab.errors.md) — 1 KB
- [sentier_vocab.generate](sentier_vocab.generate.md) — 2 KB
- [sentier_vocab.graph_base](sentier_vocab.graph_base.md) — 2 KB
- [sentier_vocab.importers](sentier_vocab.importers.md) — 1 KB
- [sentier_vocab.importers.combined_nomenclature](sentier_vocab.importers.combined_nomenclature.md) — 1 KB
- [sentier_vocab.importers.custom_products](sentier_vocab.importers.custom_products.md) — 1 KB
- [sentier_vocab.importers.envo](sentier_vocab.importers.envo.md) — 2 KB
- [sentier_vocab.importers.generate_mrf_turtles](sentier_vocab.importers.generate_mrf_turtles.md) — 1 KB
- [sentier_vocab.importers.geonames_iri_terms](sentier_vocab.importers.geonames_iri_terms.md) — 1 KB
- [sentier_vocab.importers.input](sentier_vocab.importers.input.md) — 1 KB
- [sentier_vocab.importers.input.custom_products](sentier_vocab.importers.input.custom_products.md) — 1 KB
- [sentier_vocab.importers.input.electricity_model_terms](sentier_vocab.importers.input.electricity_model_terms.md) — 1 KB
- [sentier_vocab.importers.input.electricity_products](sentier_vocab.importers.input.electricity_products.md) — 1 KB
- [sentier_vocab.importers.input.printed_circuit_board](sentier_vocab.importers.input.printed_circuit_board.md) — 1 KB
- [sentier_vocab.importers.model_terms](sentier_vocab.importers.model_terms.md) — 1 KB
- [sentier_vocab.importers.open_energy_ontology](sentier_vocab.importers.open_energy_ontology.md) — 1 KB
- [sentier_vocab.importers.qudt](sentier_vocab.importers.qudt.md) — 5 KB
- [sentier_vocab.iris](sentier_vocab.iris.md) — 2 KB
- [sentier_vocab.loaders](sentier_vocab.loaders.md) — 3 KB
- [sentier_vocab.ordered_serialization](sentier_vocab.ordered_serialization.md) — 2 KB
- [sentier_vocab.paths](sentier_vocab.paths.md) — 1 KB
- [sentier_vocab.rdf_mapping](sentier_vocab.rdf_mapping.md) — 1 KB
- [sentier_vocab.schemas](sentier_vocab.schemas.md) — 2 KB
- [sentier_vocab.utils](sentier_vocab.utils.md) — 3 KB

Total: 27 files, 54 KB.
