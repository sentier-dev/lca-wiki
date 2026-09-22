# API reference: sentier-importers 0.0.1

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `sentier-importers` 0.0.1. Generated files: do not edit them by
hand; each one carries the command that produced it and regenerating overwrites it.

The package source is a clone of `https://github.com/sentier-dev/sentier-importers` at
commit `dac2e67`, the commit the module page documents. pydoc-markdown reads the source
statically, so no install and none of the package's dependencies were needed.

The run itself used a clone already on the generating machine, at that same commit, and
the command above names a fresh clone instead so that no path outside this repository
appears in a generated file.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
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
  -I "$SP" -m sentier_importers cfg.yml > sentier_importers.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `sentier-importers` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [sentier_importers](sentier_importers.md) — 1 KB
- [sentier_importers.core](sentier_importers.core.md) — 1 KB
- [sentier_importers.core.context](sentier_importers.core.context.md) — 2 KB
- [sentier_importers.core.dedup](sentier_importers.core.dedup.md) — 2 KB
- [sentier_importers.core.deliver](sentier_importers.core.deliver.md) — 2 KB
- [sentier_importers.core.errors](sentier_importers.core.errors.md) — 2 KB
- [sentier_importers.core.fetch](sentier_importers.core.fetch.md) — 1 KB
- [sentier_importers.core.parse](sentier_importers.core.parse.md) — 1 KB
- [sentier_importers.core.pipeline](sentier_importers.core.pipeline.md) — 1 KB
- [sentier_importers.core.randonneur](sentier_importers.core.randonneur.md) — 1 KB
- [sentier_importers.core.registry](sentier_importers.core.registry.md) — 2 KB
- [sentier_importers.core.schema_provider](sentier_importers.core.schema_provider.md) — 2 KB
- [sentier_importers.core.source](sentier_importers.core.source.md) — 4 KB
- [sentier_importers.core.targets](sentier_importers.core.targets.md) — 2 KB
- [sentier_importers.core.types](sentier_importers.core.types.md) — 1 KB
- [sentier_importers.core.validate](sentier_importers.core.validate.md) — 1 KB
- [sentier_importers.core.write](sentier_importers.core.write.md) — 3 KB
- [sentier_importers.matching](sentier_importers.matching.md) — 1 KB
- [sentier_importers.matching.bw_context](sentier_importers.matching.bw_context.md) — 7 KB
- [sentier_importers.matching.compartments](sentier_importers.matching.compartments.md) — 9 KB
- [sentier_importers.matching.ef_index](sentier_importers.matching.ef_index.md) — 19 KB
- [sentier_importers.matching.matchers](sentier_importers.matching.matchers.md) — 18 KB
- [sentier_importers.matching.pipeline](sentier_importers.matching.pipeline.md) — 16 KB
- [sentier_importers.sources](sentier_importers.sources.md) — 1 KB
- [sentier_importers.sources.agribalyse](sentier_importers.sources.agribalyse.md) — 1 KB
- [sentier_importers.sources.agribalyse.agribalyse_provenance](sentier_importers.sources.agribalyse.agribalyse_provenance.md) — 2 KB
- [sentier_importers.sources.agribalyse.cfs](sentier_importers.sources.agribalyse.cfs.md) — 2 KB
- [sentier_importers.sources.agribalyse.ef_cf_dedup](sentier_importers.sources.agribalyse.ef_cf_dedup.md) — 11 KB
- [sentier_importers.sources.agribalyse.ef_common](sentier_importers.sources.agribalyse.ef_common.md) — 4 KB
- [sentier_importers.sources.agribalyse.flows](sentier_importers.sources.agribalyse.flows.md) — 4 KB
- [sentier_importers.sources.agribalyse.mappings_biosphere](sentier_importers.sources.agribalyse.mappings_biosphere.md) — 2 KB
- [sentier_importers.sources.agribalyse.methods](sentier_importers.sources.agribalyse.methods.md) — 1 KB
- [sentier_importers.sources.agribalyse.processes](sentier_importers.sources.agribalyse.processes.md) — 2 KB
- [sentier_importers.sources.agribalyse.products](sentier_importers.sources.agribalyse.products.md) — 3 KB
- [sentier_importers.sources.agribalyse.provenance](sentier_importers.sources.agribalyse.provenance.md) — 2 KB
- [sentier_importers.sources.agribalyse.vocab_impact_categories](sentier_importers.sources.agribalyse.vocab_impact_categories.md) — 1 KB
- [sentier_importers.sources.agribalyse.vocab_lcia_methods](sentier_importers.sources.agribalyse.vocab_lcia_methods.md) — 2 KB
- [sentier_importers.sources.bafu](sentier_importers.sources.bafu.md) — 1 KB
- [sentier_importers.sources.bafu.ecospold](sentier_importers.sources.bafu.ecospold.md) — 4 KB
- [sentier_importers.sources.bafu.ef_units](sentier_importers.sources.bafu.ef_units.md) — 13 KB
- [sentier_importers.sources.bafu.inventory_exchanges](sentier_importers.sources.bafu.inventory_exchanges.md) — 2 KB
- [sentier_importers.sources.bafu.inventory_processes](sentier_importers.sources.bafu.inventory_processes.md) — 2 KB
- [sentier_importers.sources.bafu.mappings_biosphere](sentier_importers.sources.bafu.mappings_biosphere.md) — 3 KB
- [sentier_importers.sources.bafu.mappings_biosphere_coverage](sentier_importers.sources.bafu.mappings_biosphere_coverage.md) — 4 KB
- [sentier_importers.sources.bafu.mappings_biosphere_matched](sentier_importers.sources.bafu.mappings_biosphere_matched.md) — 16 KB
- [sentier_importers.sources.bafu.mappings_biosphere_nomenclature](sentier_importers.sources.bafu.mappings_biosphere_nomenclature.md) — 4 KB
- [sentier_importers.sources.bafu.packages](sentier_importers.sources.bafu.packages.md) — 1 KB
- [sentier_importers.sources.bafu.provenance](sentier_importers.sources.bafu.provenance.md) — 2 KB
- [sentier_importers.sources.bafu.vocab_flows](sentier_importers.sources.bafu.vocab_flows.md) — 2 KB
- [sentier_importers.sources.bafu.vocab_processes](sentier_importers.sources.bafu.vocab_processes.md) — 2 KB
- [sentier_importers.sources.eaternity](sentier_importers.sources.eaternity.md) — 1 KB
- [sentier_importers.sources.eaternity.bridge](sentier_importers.sources.eaternity.bridge.md) — 6 KB
- [sentier_importers.sources.eaternity.cf_identity](sentier_importers.sources.eaternity.cf_identity.md) — 7 KB
- [sentier_importers.sources.eaternity.inference](sentier_importers.sources.eaternity.inference.md) — 3 KB
- [sentier_importers.sources.eaternity.inference_review](sentier_importers.sources.eaternity.inference_review.md) — 2 KB
- [sentier_importers.sources.eaternity.mappings_biosphere](sentier_importers.sources.eaternity.mappings_biosphere.md) — 3 KB
- [sentier_importers.sources.example_csv](sentier_importers.sources.example_csv.md) — 1 KB
- [sentier_importers.sources.example_csv.source](sentier_importers.sources.example_csv.source.md) — 1 KB
- [sentier_importers.sources.foodex2](sentier_importers.sources.foodex2.md) — 1 KB
- [sentier_importers.sources.foodex2.provenance](sentier_importers.sources.foodex2.provenance.md) — 3 KB
- [sentier_importers.sources.foodex2.source](sentier_importers.sources.foodex2.source.md) — 5 KB

## Redactions

4 docstring mention(s) of a repository this wiki does not document were replaced by
`<private>`. The wiki documents public repositories only; the gap is deliberate.

Total: 61 files, 253 KB.
