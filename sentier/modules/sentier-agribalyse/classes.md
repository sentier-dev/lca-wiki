---
title: sentier-agribalyse classes and functions
type: module-page
summary: "The public surface by subpackage: the tier ladder, the mapping registry, the matchers, the transforms, the scoring path and the exports."
audience: [P1, P3]
updated: 2026-09-22
sources: [sentier-agribalyse-repo]
---

# sentier-agribalyse classes and functions

Hand-written companion to the generated [api/](api/README.md) folder. The
package is large, 165 modules, and is organised so that one class does one thing; this
page names the classes a reader needs to follow a run rather than all of them. Read from
the repository at commit `3d0df56`. (source: sentier-agribalyse-repo)

## Value objects

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `domain.tier.Tier` | integer enumeration | the priority ladder for mapping resolution, lower wins; from a documented tier onward the tiers are fill-only and may only place a link where none exists | the registry and every matcher |
| `domain.mapping.Mapping` | frozen dataclass | one row of a registry table: source kind, source identity, target, tier, provenance | the registry builder |
| `domain.mapping.UnitConversion`, `UnitAlias`, `ContextNorm`, `Deletion`, `EdgeLabelCorrection`, `EfTargetIndexRow` | frozen dataclasses | the other registry tables, one class per table | the registry builder |
| `domain.match.MatchOutcome`, `TierStats` | frozen dataclasses | what a matcher decided, and the per-tier tally | the matchers and the reports |
| `domain.bucket.Bucket` | enumeration | the compartment bucket, collapsing source and target compartment wordings | the biosphere matchers |
| `domain.audit.AuditEntry`, `OverrideKind`, `SuppressedStrategy`, `DropEvent` | frozen dataclasses | one row per override, drop or suppression | the audit log |

## Configuration and plumbing

| Name | Kind | What it is for |
|---|---|---|
| `config.paths.Paths` | frozen dataclass | every filesystem location the pipeline uses |
| `config.settings.Settings` | dataclass | run settings, read from the environment |
| `core.logging.Logging`, `StepTimer`, `IdleHeartbeat` | classes | structured logging and progress for long steps |
| `core.parquet_cache.ParquetCache`, `core.parquet_io.ParquetAtomicWriter` | classes | the derived-file cache and a crash-safe writer |
| `readers.JsonReader`, `GzJsonReader`, `JsonOrGzJsonReader`, `ParquetReader`, `XlsxReader`, `RandonneurDataLoader` | classes | one typed reader per input format, including stored mapping packages |

## The mapping registry

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `registry.builder.RegistryBuilder` | class | run every source ingester and write the registry parquets, deduplicating rows | the registry build command |
| `registry.sources.*` | modules | one ingester per source kind: the publisher's assets, curated overrides, harmonised flows, stored mapping packages, the factor target index and the placeholder sheet | the builder |
| `registry.registry.MappingRegistry` | class | the read interface every matcher uses: the tables in memory, indexes built lazily | the pipelines |
| `registry.indexes.TieredNameBucketIndex`, `CasIndex`, `UnitConverter`, `UnmatchableIndex` | classes | the lookups: by name and compartment bucket in tier order, by CAS number, by unit, and the known-unmatchable list | the matchers |
| `registry.schema.MappingTable` and its siblings | classes | column order and type coercion, one class per registry parquet | the builder |

## Transforms

The chain that turns the public export into a linkable system:
`transforms.sp_csv_parser.SimaProCsvParser` and `ParsedSimaProCsv`,
`transforms.importer.SimaProImporter`, `transforms.deletions.AggregateDeleter`,
`transforms.edge_labels.EdgeLabelCorrector`,
`transforms.normalisers.InternalAgbLinker`, `BiosphereLabelNormaliser`,
`StandardLabelNormaliser` and `BioStrategyChain`,
`transforms.biosphere_flowmap.BiosphereFlowmapApplier`,
`transforms.biosphere_prelinker.BiosphereCatalogPrelinker`,
`transforms.orphan_activity_purger.OrphanActivityPurger`,
`transforms.orphan_product_relinker.OrphanProductRelinker`,
`transforms.production_reclassifier.ProductionReclassifier`, the two waste-treatment
fixers, and the parameter trio
`ProcessParameterExtractor`, `ParameterOverridesStore` and `ParameterReevaluator`.
`transforms.linked_cache.LinkedSpCache` stores the linked result for the fast rescore
path and raises a typed error when the cache is missing, corrupt or stale.

## Matching

`matching.technosphere.TechnosphereMatcher` and
`matching.biosphere.BiosphereMatcher` place the links, helped by
`SubCompartmentNormaliser`, `matching.bio_catalog.BiosphereCatalog` and its augmenter,
`matching.ecoinvent_catalog.EcoinventCatalog` and its builder,
`matching.regional_suffix.RegionalSuffixParser` with its applier, and
`matching.strategy_runner.StrategyRunner`, which runs the strategies in order and
records what each one did. `matching.audit.AuditLog`, `SuppressedStrategyLog` and
`DropTallyTracker` keep the trail.

## Impact assessment

`ef.flows_registry.EfFlowsRegistryBuilder` builds the flow universe;
`ef.cf_registry.MethodCfRegistryBuilder` and `MethodCfRegistryLoader` build and read the
per-method factor tables; `ef.cf_table.EfCfTable` and `ef.simapro_cf_table.SimaProEFCfTable`
wrap the two factor sources; `ef.cf_flow_join` joins them per flow;
`ef.methods.EfMethodFilter` selects the headline categories;
`ef.regional_cf` and `ef.regional_water_cf` add the regionalised factors; and
`ef.simapro_jrc_delta.SimaProJrcDeltaAudit` plus `ef.subcomp_drift_audit` are audits of
the differences between the two sources.

## Scoring

`scoring.exchange_frame.ExchangeFrame` and its builder assemble the edges;
`scoring.allocator.Allocator` allocates upstream as a dataframe transform;
`scoring.dangling_edge_auditor` and `dangling_edge_pruner` deal with edges that go
nowhere; `scoring.matrix_builder.TechnosphereBuilder`, `BiosphereBuilder` and
`CharacterizationBuilder` produce the matrices; `scoring.native_scorer.NativeLciaScorer`
with its worker classes solves them; `scoring.decomposer.ScoreDecomposer` explains one
score as per-flow contributions; and `scoring.scoring_package.ScoringPackage` with its
builder, store and locator makes a run reproducible.
`scoring.skeleton_extractor.SkeletonExtractor` strips the licensed amounts out of a
scoring package.

## Pipelines and exports

`pipelines.registry_build.RegistryBuildPipeline`, `pipelines.link_all.LinkAllPipeline`,
`pipelines.backtest.BacktestPipeline`, `pipelines.end_to_end.EndToEndPipeline` and
`pipelines.fast_rescore.FastRescorePipeline` are what the commands call, each with an
options dataclass. `exports.randonneur_packages.RandonneurPackagesExporter` writes the
mapping packages, `exports.mappings_comparison` and `exports.cf_comparison` the review
spreadsheets, and `reporting.*` the run report, the coverage snapshot, the dashboard
tables, the flow decomposition and the residual unlinked exports.
`bw_export.DatapackageWriter`, `CatalogKeyResolver`, `CorrectionEmbedder`,
`MetadataEmitter` and `ParityVerifier` produce the Brightway export and check it against
a stock calculation; `bw_import.import_into_brightway` is the standalone importer that
ships with it.

## Notes

- Nothing here is imported as a library by another Sentier repository. The commands and
  the exported artifacts are the interface.
- Tiers are data. Adding a mapping source means adding an ingester and a tier row, not a
  branch in the matcher.
- The optional `llm` subpackage is behind flags on two commands and is not on the
  default path of a link or a score.
