**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `config.paths` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

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
  -I "$SP" -m config.paths cfg.yml > config.paths.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="config.paths"></a>

# config.paths

Filesystem layout. Frozen dataclass — single instance passed everywhere.

Layout::

    source/      authoritative inputs + the randonneur packages we publish
    cache/       derived parquet/pickle caches (gitignored)
    registry/    built MappingRegistry parquets (one per concern)
    dashboard/   run reports, audit logs, dashboards
    to_review/   human-review artifacts
    unlinked/    residual unlinked exports

REFACTOR_FINAL F6 removed ``.bw_projects/`` — the runtime is bw2data-free
and never bootstraps a Brightway project. There is no legacy ``inputs/``
(renamed to ``source/``) and no ``outputs/``.

<a id="config.paths.Paths"></a>

## Paths Objects

```python
@dataclass(frozen=True)
class Paths()
```

All filesystem locations the pipeline reads or writes.

<a id="config.paths.Paths.package_root"></a>

#### package\_root

<a id="config.paths.Paths.source"></a>

#### source

```python
@property
def source() -> Path
```

<a id="config.paths.Paths.randonneur_packages"></a>

#### randonneur\_packages

```python
@property
def randonneur_packages() -> Path
```

<a id="config.paths.Paths.bw2io_data"></a>

#### bw2io\_data

```python
@property
def bw2io_data() -> Path
```

Static reference data lifted from bw2io (migration JSON files).

<a id="config.paths.Paths.cache"></a>

#### cache

```python
@property
def cache() -> Path
```

<a id="config.paths.Paths.registry"></a>

#### registry

```python
@property
def registry() -> Path
```

<a id="config.paths.Paths.dashboard"></a>

#### dashboard

```python
@property
def dashboard() -> Path
```

<a id="config.paths.Paths.to_review"></a>

#### to\_review

```python
@property
def to_review() -> Path
```

<a id="config.paths.Paths.unlinked"></a>

#### unlinked

```python
@property
def unlinked() -> Path
```

<a id="config.paths.Paths.agribalyse_csv"></a>

#### agribalyse\_csv

```python
@property
def agribalyse_csv() -> Path
```

<a id="config.paths.Paths.placeholder_xlsx"></a>

#### placeholder\_xlsx

```python
@property
def placeholder_xlsx() -> Path
```

<a id="config.paths.Paths.harmonised_flows_gz"></a>

#### harmonised\_flows\_gz

```python
@property
def harmonised_flows_gz() -> Path
```

<a id="config.paths.Paths.ef_cf_parquet"></a>

#### ef\_cf\_parquet

```python
@property
def ef_cf_parquet() -> Path
```

<a id="config.paths.Paths.simapro_ef31_xlsx"></a>

#### simapro\_ef31\_xlsx

```python
@property
def simapro_ef31_xlsx() -> Path
```

SimaPro EF 3.1 (adapted) method export — the CF table ADEME used
to compute the AGRIBALYSE 3.2 reference scores. Source for cross-
checking our JRC-derived ``ef_cf_parquet`` (see FIX_DATA.md § 2).

<a id="config.paths.Paths.simapro_ef31_cache"></a>

#### simapro\_ef31\_cache

```python
@property
def simapro_ef31_cache() -> Path
```

<a id="config.paths.Paths.biosphere_flowmap_json"></a>

#### biosphere\_flowmap\_json

```python
@property
def biosphere_flowmap_json() -> Path
```

<a id="config.paths.Paths.edge_label_corrections_json"></a>

#### edge\_label\_corrections\_json

```python
@property
def edge_label_corrections_json() -> Path
```

<a id="config.paths.Paths.delete_aggregated_processes_json"></a>

#### delete\_aggregated\_processes\_json

```python
@property
def delete_aggregated_processes_json() -> Path
```

<a id="config.paths.Paths.delete_aggregated_products_json"></a>

#### delete\_aggregated\_products\_json

```python
@property
def delete_aggregated_products_json() -> Path
```

<a id="config.paths.Paths.llm_reviewed_xlsx"></a>

#### llm\_reviewed\_xlsx

```python
@property
def llm_reviewed_xlsx() -> Path
```

<a id="config.paths.Paths.curated_overrides_json"></a>

#### curated\_overrides\_json

```python
@property
def curated_overrides_json() -> Path
```

<a id="config.paths.Paths.extra_unit_conversions_json"></a>

#### extra\_unit\_conversions\_json

```python
@property
def extra_unit_conversions_json() -> Path
```

<a id="config.paths.Paths.activity_location_overrides_json"></a>

#### activity\_location\_overrides\_json

```python
@property
def activity_location_overrides_json() -> Path
```

Per-activity ISO-2 location overrides for AGB stand-ins whose
aggregate location (GLO / RoW / RER) hides ADEME's intended
regional context. Consumed by ``ActivityLocationOverrides`` →
``_col_id_to_location`` in the link pipeline.

<a id="config.paths.Paths.water_use_bio3_bridge_json"></a>

#### water\_use\_bio3\_bridge\_json

```python
@property
def water_use_bio3_bridge_json() -> Path
```

Curated EF v3.1 (adapted) water-use CF mapping to ecoinvent-
3.9.1-biosphere flow codes. Replaces the broken SimaPro per-kg /
per-m³ augmentation logic with explicit m³-normalised CFs.
Consumed by ``MethodCfRegistryBuilder`` for the water-use method.

<a id="config.paths.Paths.ademe_reference_synthese_raw"></a>

#### ademe\_reference\_synthese\_raw

```python
@property
def ademe_reference_synthese_raw() -> Path
```

<a id="config.paths.Paths.custom_technosphere_fixes_json"></a>

#### custom\_technosphere\_fixes\_json

```python
@property
def custom_technosphere_fixes_json() -> Path
```

<a id="config.paths.Paths.biosphere3_flows_json"></a>

#### biosphere3\_flows\_json

```python
@property
def biosphere3_flows_json() -> Path
```

One-time snapshot of biosphere3 flows lifted from bw2io (F6).

<a id="config.paths.Paths.ecoinvent_biosphere_flows_json"></a>

#### ecoinvent\_biosphere\_flows\_json

```python
@property
def ecoinvent_biosphere_flows_json() -> Path
```

One-time snapshot of the ecoinvent biosphere database (F6).

<a id="config.paths.Paths.ef_methods_snapshot_json"></a>

#### ef\_methods\_snapshot\_json

```python
@property
def ef_methods_snapshot_json() -> Path
```

One-time snapshot of EF v3.1 method tuples and their inherited CFs (F6).

<a id="config.paths.Paths.ecoinvent_exchanges_parquet"></a>

#### ecoinvent\_exchanges\_parquet

```python
@property
def ecoinvent_exchanges_parquet() -> Path
```

One-time snapshot of ecoinvent-3.9.1-cutoff exchanges (REFACTOR_FINAL F7).

Required so the ScoringPackage carries the full ecoinvent supply
chain — ``Database.process()``'s dependency walker is gone, so the
exchanges have to live in the ``source/`` snapshot just like the
biosphere/EF flow snapshots.

<a id="config.paths.Paths.importer_cache_pkl"></a>

#### importer\_cache\_pkl

```python
@property
def importer_cache_pkl() -> Path
```

<a id="config.paths.Paths.linked_cache_pkl"></a>

#### linked\_cache\_pkl

```python
@property
def linked_cache_pkl() -> Path
```

Fully linked graph snapshot for the fast rescore path.

<a id="config.paths.Paths.parameter_overrides_csv"></a>

#### parameter\_overrides\_csv

```python
@property
def parameter_overrides_csv() -> Path
```

Local what-if parameter overrides (gitignored; cleared by ``dds-reset``).

<a id="config.paths.Paths.registry_meta"></a>

#### registry\_meta

```python
@property
def registry_meta() -> Path
```

<a id="config.paths.Paths.registry_parameters"></a>

#### registry\_parameters

```python
@property
def registry_parameters() -> Path
```

Per-process parameter definitions (``dds-build-parameters``).

<a id="config.paths.Paths.registry_exchange_formulas"></a>

#### registry\_exchange\_formulas

```python
@property
def registry_exchange_formulas() -> Path
```

Exchange-formula table (``dds-build-parameters``).

<a id="config.paths.Paths.registry_mappings_biosphere"></a>

#### registry\_mappings\_biosphere

```python
@property
def registry_mappings_biosphere() -> Path
```

<a id="config.paths.Paths.registry_mappings_technosphere"></a>

#### registry\_mappings\_technosphere

```python
@property
def registry_mappings_technosphere() -> Path
```

<a id="config.paths.Paths.registry_unmatchable"></a>

#### registry\_unmatchable

```python
@property
def registry_unmatchable() -> Path
```

<a id="config.paths.Paths.registry_unit_conversions"></a>

#### registry\_unit\_conversions

```python
@property
def registry_unit_conversions() -> Path
```

<a id="config.paths.Paths.registry_unit_aliases"></a>

#### registry\_unit\_aliases

```python
@property
def registry_unit_aliases() -> Path
```

<a id="config.paths.Paths.registry_context_normalisation"></a>

#### registry\_context\_normalisation

```python
@property
def registry_context_normalisation() -> Path
```

<a id="config.paths.Paths.registry_deletions"></a>

#### registry\_deletions

```python
@property
def registry_deletions() -> Path
```

<a id="config.paths.Paths.registry_edge_label_corrections"></a>

#### registry\_edge\_label\_corrections

```python
@property
def registry_edge_label_corrections() -> Path
```

<a id="config.paths.Paths.registry_target_index_ef"></a>

#### registry\_target\_index\_ef

```python
@property
def registry_target_index_ef() -> Path
```

<a id="config.paths.Paths.registry_biosphere_catalog"></a>

#### registry\_biosphere\_catalog

```python
@property
def registry_biosphere_catalog() -> Path
```

<a id="config.paths.Paths.registry_ecoinvent_catalog"></a>

#### registry\_ecoinvent\_catalog

```python
@property
def registry_ecoinvent_catalog() -> Path
```

<a id="config.paths.Paths.registry_ef_flows"></a>

#### registry\_ef\_flows

```python
@property
def registry_ef_flows() -> Path
```

<a id="config.paths.Paths.registry_method_cfs_dir"></a>

#### registry\_method\_cfs\_dir

```python
@property
def registry_method_cfs_dir() -> Path
```

<a id="config.paths.Paths.registry_method_cfs_index"></a>

#### registry\_method\_cfs\_index

```python
@property
def registry_method_cfs_index() -> Path
```

<a id="config.paths.Paths.registry_product_catalog"></a>

#### registry\_product\_catalog

```python
@property
def registry_product_catalog() -> Path
```

<a id="config.paths.Paths.registry_activity_catalog"></a>

#### registry\_activity\_catalog

```python
@property
def registry_activity_catalog() -> Path
```

Label catalog keyed by the technosphere's own column id
(``activity_id``): one row per matrix column, covering agribalyse
foreground, ecoinvent background, and Allocator multifunctional
splits. Built from the same run's ScoringPackage so it can never
skew from the matrix. Consumed by the bundle's key resolver to
name every activity/technosphere-flow in exports (e.g. Activity
Browser); distinct from ``product_catalog`` (agribalyse-only,
backtest product mapping).

<a id="config.paths.Paths.registry_cf_comparison_join"></a>

#### registry\_cf\_comparison\_join

```python
@property
def registry_cf_comparison_join() -> Path
```

Complete per-flow join of SimaPro adapted EF 3.1 CFs against the built
registry CFs (one row per registry biosphere code × method, matched +
registry-only). Written by ``dds-compare-cfs`` via
:class:`reporting.CfComparisonJoinBuilder`; the matched rows are flattened
to the dashboard by :pyattr:`dashboard_cf_comparison_csv`.

<a id="config.paths.Paths.registry_cf_comparison_by_code"></a>

#### registry\_cf\_comparison\_by\_code

```python
@property
def registry_cf_comparison_by_code() -> Path
```

Per-registry-``code`` SimaPro CF sidecar ``(code, method, cf_simapro,
match_basis, name_simapro, name_registry)``. Written by ``dds-compare-cfs``
via :class:`reporting.CfComparisonByCodeBuilder` (all 19 methods); consumed
by :class:`reporting.SimaProCfLookup` to put SimaPro's properly-matched CF
beside ours in the flow-decomposition toggle.

<a id="config.paths.Paths.scoring_packages_root"></a>

#### scoring\_packages\_root

```python
@property
def scoring_packages_root() -> Path
```

<a id="config.paths.Paths.dashboard_run_report"></a>

#### dashboard\_run\_report

```python
@property
def dashboard_run_report() -> Path
```

<a id="config.paths.Paths.dashboard_override_log"></a>

#### dashboard\_override\_log

```python
@property
def dashboard_override_log() -> Path
```

<a id="config.paths.Paths.dashboard_suppressed_strategy_log"></a>

#### dashboard\_suppressed\_strategy\_log

```python
@property
def dashboard_suppressed_strategy_log() -> Path
```

<a id="config.paths.Paths.dashboard_drop_tally"></a>

#### dashboard\_drop\_tally

```python
@property
def dashboard_drop_tally() -> Path
```

<a id="config.paths.Paths.dashboard_link_log"></a>

#### dashboard\_link\_log

```python
@property
def dashboard_link_log() -> Path
```

<a id="config.paths.Paths.dashboard_backtest_dir"></a>

#### dashboard\_backtest\_dir

```python
@property
def dashboard_backtest_dir() -> Path
```

<a id="config.paths.Paths.dashboard_orphan_activities"></a>

#### dashboard\_orphan\_activities

```python
@property
def dashboard_orphan_activities() -> Path
```

<a id="config.paths.Paths.dashboard_cf_comparison_csv"></a>

#### dashboard\_cf\_comparison\_csv

```python
@property
def dashboard_cf_comparison_csv() -> Path
```

Flat CSV of the matched SimaPro-vs-registry per-flow comparisons,
consumed by the dashboard's CF-comparison tab. Written by
``CfComparisonCsvEmitter`` — directly from ``dds-compare-cfs``, or
re-flattened from :pyattr:`registry_cf_comparison_join` by
``dds-build-cf-comparison-csv``.

<a id="config.paths.Paths.dashboard_backtest_pass1_csv"></a>

#### dashboard\_backtest\_pass1\_csv

```python
@property
def dashboard_backtest_pass1_csv() -> Path
```

Per-product × method %-diff matrix the dashboard renders. Written by
``BacktestPass1Emitter``.

<a id="config.paths.Paths.dashboard_decomp_dir"></a>

#### dashboard\_decomp\_dir

```python
@property
def dashboard_decomp_dir() -> Path
```

Per-product flow-decomposition JSONs (``<code>.json``). Written by
``dds-build-flow-decomp``.

<a id="config.paths.Paths.dashboard_outlier_reasons"></a>

#### dashboard\_outlier\_reasons

```python
@property
def dashboard_outlier_reasons() -> Path
```

Per-impact-category outlier explanations (the column-header / cell
notes). Hand-curated; consumed by the dashboard's backtest tab.

<a id="config.paths.Paths.dashboard_product_reasons"></a>

#### dashboard\_product\_reasons

```python
@property
def dashboard_product_reasons() -> Path
```

Per-product × outlier-impact explanations, authored by an LLM pass
over the flow decomposition. Written by ``dds-build-product-reasons``;
rendered above the impact-level note in the cell tooltip.

<a id="config.paths.Paths.ensure_runtime_dirs"></a>

#### ensure\_runtime\_dirs

```python
def ensure_runtime_dirs() -> None
```

Create runtime directories if missing. ``source/`` is never created here.
