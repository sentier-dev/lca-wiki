# API reference: sentier-agribalyse 0.3.0

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `sentier-agribalyse` 0.3.0. Generated files: do not edit them by
hand; each one carries the command that produced it and regenerating overwrites it.

The package source is a clone of `https://github.com/sentier-dev/sentier-agribalyse` at
commit `3d0df56`, the commit the module page documents. pydoc-markdown reads the source
statically, so no install and none of the package's dependencies were needed.

The run itself used a clone already on the generating machine, at that same commit, and
the command above names a fresh clone instead so that no path outside this repository
appears in a generated file.

The command, with the module name changed per file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m bw_export cfg.yml > bw_export.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `sentier-agribalyse` and stay under
that package's own licence: MIT for the code. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw_export](bw_export.md) — 1 KB
- [bw_export.bw_node_types](bw_export.bw_node_types.md) — 2 KB
- [bw_export.catalog_key_resolver](bw_export.catalog_key_resolver.md) — 3 KB
- [bw_export.correction_embedder](bw_export.correction_embedder.md) — 3 KB
- [bw_export.datapackage_writer](bw_export.datapackage_writer.md) — 2 KB
- [bw_export.metadata_emitter](bw_export.metadata_emitter.md) — 2 KB
- [bw_export.parity_verifier](bw_export.parity_verifier.md) — 3 KB
- [bw_import](bw_import.md) — 1 KB
- [bw_import.import_into_brightway](bw_import.import_into_brightway.md) — 4 KB
- [cli](cli.md) — 1 KB
- [cli.backtest](cli.backtest.md) — 1 KB
- [cli.build_biosphere_catalog](cli.build_biosphere_catalog.md) — 1 KB
- [cli.build_bw_package](cli.build_bw_package.md) — 2 KB
- [cli.build_cf_comparison_csv](cli.build_cf_comparison_csv.md) — 2 KB
- [cli.build_ecoinvent_catalog](cli.build_ecoinvent_catalog.md) — 1 KB
- [cli.build_ef_flows_registry](cli.build_ef_flows_registry.md) — 1 KB
- [cli.build_flow_decomp](cli.build_flow_decomp.md) — 2 KB
- [cli.build_method_cfs_registry](cli.build_method_cfs_registry.md) — 1 KB
- [cli.build_packages](cli.build_packages.md) — 1 KB
- [cli.build_parameters](cli.build_parameters.md) — 1 KB
- [cli.build_product_reasons](cli.build_product_reasons.md) — 2 KB
- [cli.build_registry](cli.build_registry.md) — 1 KB
- [cli.build_skeleton](cli.build_skeleton.md) — 2 KB
- [cli.clear_parameters](cli.clear_parameters.md) — 1 KB
- [cli.compare_cfs](cli.compare_cfs.md) — 10 KB
- [cli.decompose_score](cli.decompose_score.md) — 3 KB
- [cli.link_all](cli.link_all.md) — 1 KB
- [cli.list_parameters](cli.list_parameters.md) — 2 KB
- [cli.llm_suggest](cli.llm_suggest.md) — 2 KB
- [cli.mappings_comparison](cli.mappings_comparison.md) — 1 KB
- [cli.reset](cli.reset.md) — 2 KB
- [cli.run_end_to_end](cli.run_end_to_end.md) — 1 KB
- [cli.set_parameter](cli.set_parameter.md) — 2 KB
- [cli.snapshot_ecoinvent_exchanges](cli.snapshot_ecoinvent_exchanges.md) — 3 KB
- [config](config.md) — 1 KB
- [config.paths](config.paths.md) — 14 KB
- [config.settings](config.settings.md) — 3 KB
- [core](core.md) — 1 KB
- [core.logging](core.logging.md) — 2 KB
- [core.parquet_cache](core.parquet_cache.md) — 1 KB
- [core.parquet_io](core.parquet_io.md) — 1 KB
- [domain](domain.md) — 1 KB
- [domain.audit](domain.audit.md) — 4 KB
- [domain.bucket](domain.bucket.md) — 2 KB
- [domain.mapping](domain.mapping.md) — 6 KB
- [domain.match](domain.match.md) — 2 KB
- [domain.tier](domain.tier.md) — 4 KB
- [ef](ef.md) — 1 KB
- [ef.cf_flow_join](ef.cf_flow_join.md) — 11 KB
- [ef.cf_registry](ef.cf_registry.md) — 4 KB
- [ef.cf_simapro_filter](ef.cf_simapro_filter.md) — 6 KB
- [ef.cf_table](ef.cf_table.md) — 1 KB
- [ef.flows_registry](ef.flows_registry.md) — 2 KB
- [ef.methods](ef.methods.md) — 2 KB
- [ef.regional_cf](ef.regional_cf.md) — 6 KB
- [ef.regional_water_cf](ef.regional_water_cf.md) — 5 KB
- [ef.simapro_cf_table](ef.simapro_cf_table.md) — 3 KB
- [ef.simapro_jrc_delta](ef.simapro_jrc_delta.md) — 2 KB
- [ef.sp_regional_water_cf_loader](ef.sp_regional_water_cf_loader.md) — 3 KB
- [ef.subcomp_drift_audit](ef.subcomp_drift_audit.md) — 2 KB
- [ef.water_resource_augmenter](ef.water_resource_augmenter.md) — 3 KB
- [ef.water_use_bio3_bridge](ef.water_use_bio3_bridge.md) — 4 KB
- [exports](exports.md) — 1 KB
- [exports.cf_comparison](exports.cf_comparison.md) — 3 KB
- [exports.lca_flow_coverage](exports.lca_flow_coverage.md) — 4 KB
- [exports.mappings_comparison](exports.mappings_comparison.md) — 3 KB
- [exports.randonneur_packages](exports.randonneur_packages.md) — 2 KB
- [llm](llm.md) — 1 KB
- [llm.candidates](llm.candidates.md) — 2 KB
- [llm.client](llm.client.md) — 3 KB
- [llm.exporter](llm.exporter.md) — 2 KB
- [llm.suggester](llm.suggester.md) — 5 KB
- [matching](matching.md) — 1 KB
- [matching.audit](matching.audit.md) — 5 KB
- [matching.bio_catalog](matching.bio_catalog.md) — 4 KB
- [matching.bio_catalog_augmenter](matching.bio_catalog_augmenter.md) — 3 KB
- [matching.bio_registry](matching.bio_registry.md) — 2 KB
- [matching.biosphere](matching.biosphere.md) — 4 KB
- [matching.ecoinvent_catalog](matching.ecoinvent_catalog.md) — 5 KB
- [matching.regional_suffix](matching.regional_suffix.md) — 3 KB
- [matching.regional_suffix_applier](matching.regional_suffix_applier.md) — 4 KB
- [matching.strategy_runner](matching.strategy_runner.md) — 1 KB
- [matching.technosphere](matching.technosphere.md) — 3 KB
- [pipelines](pipelines.md) — 1 KB
- [pipelines.backtest](pipelines.backtest.md) — 2 KB
- [pipelines.end_to_end](pipelines.end_to_end.md) — 1 KB
- [pipelines.fast_rescore](pipelines.fast_rescore.md) — 2 KB
- [pipelines.link_all](pipelines.link_all.md) — 3 KB
- [pipelines.registry_build](pipelines.registry_build.md) — 1 KB
- [readers](readers.md) — 1 KB
- [readers.json_reader](readers.json_reader.md) — 2 KB
- [readers.parquet_reader](readers.parquet_reader.md) — 1 KB
- [readers.randonneur_loader](readers.randonneur_loader.md) — 2 KB
- [readers.xlsx_reader](readers.xlsx_reader.md) — 1 KB
- [registry](registry.md) — 1 KB
- [registry.builder](registry.builder.md) — 2 KB
- [registry.indexes](registry.indexes.md) — 5 KB
- [registry.registry](registry.registry.md) — 3 KB
- [registry.schema](registry.schema.md) — 4 KB
- [registry.sources](registry.sources.md) — 1 KB
- [registry.sources.agribalyse_assets](registry.sources.agribalyse_assets.md) — 4 KB
- [registry.sources.curated](registry.sources.curated.md) — 5 KB
- [registry.sources.ef_target](registry.sources.ef_target.md) — 2 KB
- [registry.sources.harmonised](registry.sources.harmonised.md) — 2 KB
- [registry.sources.placeholder](registry.sources.placeholder.md) — 5 KB
- [registry.sources.randonneur_packages](registry.sources.randonneur_packages.md) — 7 KB
- [reporting](reporting.md) — 1 KB
- [reporting.backtest_dashboard_csv](reporting.backtest_dashboard_csv.md) — 2 KB
- [reporting.cf_comparison_csv](reporting.cf_comparison_csv.md) — 7 KB
- [reporting.coverage](reporting.coverage.md) — 2 KB
- [reporting.flow_decomposition](reporting.flow_decomposition.md) — 3 KB
- [reporting.near_zero_floor](reporting.near_zero_floor.md) — 2 KB
- [reporting.product_reasons](reporting.product_reasons.md) — 7 KB
- [reporting.run_report](reporting.run_report.md) — 3 KB
- [reporting.simapro_cf_lookup](reporting.simapro_cf_lookup.md) — 3 KB
- [reporting.unlinked_exporter](reporting.unlinked_exporter.md) — 1 KB
- [scoring](scoring.md) — 1 KB
- [scoring.activity_location_overrides](scoring.activity_location_overrides.md) — 4 KB
- [scoring.activity_location_parser](scoring.activity_location_parser.md) — 3 KB
- [scoring.allocator](scoring.allocator.md) — 4 KB
- [scoring.aware_consumption_correction](scoring.aware_consumption_correction.md) — 6 KB
- [scoring.dangling_edge_auditor](scoring.dangling_edge_auditor.md) — 4 KB
- [scoring.dangling_edge_pruner](scoring.dangling_edge_pruner.md) — 2 KB
- [scoring.decomposer](scoring.decomposer.md) — 7 KB
- [scoring.ecoinvent_exchanges](scoring.ecoinvent_exchanges.md) — 2 KB
- [scoring.exchange_frame](scoring.exchange_frame.md) — 4 KB
- [scoring.exchange_frame_builder](scoring.exchange_frame_builder.md) — 4 KB
- [scoring.matrix_builder](scoring.matrix_builder.md) — 5 KB
- [scoring.method_slug](scoring.method_slug.md) — 2 KB
- [scoring.native_scorer](scoring.native_scorer.md) — 4 KB
- [scoring.perennial_lifecycle_filter](scoring.perennial_lifecycle_filter.md) — 3 KB
- [scoring.product_catalog](scoring.product_catalog.md) — 5 KB
- [scoring.product_deduplicator](scoring.product_deduplicator.md) — 2 KB
- [scoring.regional_correction](scoring.regional_correction.md) — 2 KB
- [scoring.scorer](scoring.scorer.md) — 1 KB
- [scoring.scoring_package](scoring.scoring_package.md) — 6 KB
- [scoring.scoring_package_locator](scoring.scoring_package_locator.md) — 2 KB
- [scoring.skeleton_extractor](scoring.skeleton_extractor.md) — 3 KB
- [transforms](transforms.md) — 1 KB
- [transforms.biosphere_flowmap](transforms.biosphere_flowmap.md) — 2 KB
- [transforms.biosphere_prelinker](transforms.biosphere_prelinker.md) — 3 KB
- [transforms.deletions](transforms.deletions.md) — 3 KB
- [transforms.edge_labels](transforms.edge_labels.md) — 1 KB
- [transforms.importer](transforms.importer.md) — 1 KB
- [transforms.linked_cache](transforms.linked_cache.md) — 3 KB
- [transforms.normalisers](transforms.normalisers.md) — 4 KB
- [transforms.orphan_activity_purger](transforms.orphan_activity_purger.md) — 3 KB
- [transforms.orphan_product_relinker](transforms.orphan_product_relinker.md) — 3 KB
- [transforms.parameter_extraction](transforms.parameter_extraction.md) — 3 KB
- [transforms.parameter_overrides](transforms.parameter_overrides.md) — 4 KB
- [transforms.parameter_reevaluator](transforms.parameter_reevaluator.md) — 6 KB
- [transforms.production_reclassifier](transforms.production_reclassifier.md) — 1 KB
- [transforms.regional_source_name_snapshotter](transforms.regional_source_name_snapshotter.md) — 2 KB
- [transforms.sp_csv_parser](transforms.sp_csv_parser.md) — 4 KB
- [transforms.strategies](transforms.strategies.md) — 1 KB
- [transforms.strategies.biosphere](transforms.strategies.biosphere.md) — 7 KB
- [transforms.strategies.internal](transforms.strategies.internal.md) — 5 KB
- [transforms.strategies.labels](transforms.strategies.labels.md) — 2 KB
- [transforms.strategies.units](transforms.strategies.units.md) — 2 KB
- [transforms.waste_treatment_dummy_fixer](transforms.waste_treatment_dummy_fixer.md) — 3 KB
- [transforms.waste_treatment_functional_promoter](transforms.waste_treatment_functional_promoter.md) — 3 KB
- [utils](utils.md) — 1 KB
- [utils.unmatched_diagnostic](utils.unmatched_diagnostic.md) — 7 KB

Total: 163 files, 542 KB.
