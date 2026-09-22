**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.regional_water_cf` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.regional_water_cf cfg.yml > ef.regional_water_cf.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.regional_water_cf"></a>

# ef.regional\_water\_cf

``RegionalWaterCfTable`` / ``RegionalWaterCfRegistryBuilder`` — JRC AWARE
regional water CFs as a per-location correction layer on top of the global
``cfs.parquet``.

The bw2io snapshot characterises 5 bio3 ``Water → air`` codes at the global
AWARE CF (+42.95 m³ deprivation / m³). ADEME's reference applies the *regional*
AWARE CF for each activity's location (e.g. Brazil: 2.43; Cyprus: 74.3;
Argentina: 47.1). That regional split is the dominant driver of the
backtest's water-use tail (464 outliers, median +107 %, top: Nectar de mangue
+1011 %).

The JRC source parquet (``EF-LCIAMethod_CF(EF-v3.1)``) carries the regional
factors at the ``LCIAMethod_location`` column (ISO 3166-1 alpha-2) for 208
locations, mirrored across 11 water FLOW_uuids with identical magnitudes —
sign differs only between *consumption-side* (positive) and
*emission-side* (negative) rows. We collapse those 11 flows into a single
``|CF|`` per location and reapply the sign of the global CF on the bio3 row
we're correcting.

The companion builder emits
``registry/method_cfs/<water-slug>/regional_cfs.parquet`` keyed by
``(database, code, location, amount)``. Downstream
``ScoringPackageBuilder`` resolves each row's bio3 flow row index +
joins activity locations from ``registry/ecoinvent_catalog.parquet`` to
pre-compute a per-activity-column correction vector, so scoring stays at
``q @ B @ supply + delta_vec @ supply`` — no location lookup at score time.

We deliberately do NOT re-enable ``WaterResourceCfAugmenter`` here. That
class adds resource-flow CFs (``Water [natural resource, in ground]`` …)
which the bw2io snapshot omitted; wiring it triggered the 2026-05-08
double-count regression that pushed water-use median to 34 100 %. The
regional correction we apply here scales the existing
``Water → air`` proxies that the inherited CF snapshot already attached
to bio3 — operationally aligned with how ADEME's published scores were
computed against the same proxy set.

<a id="ef.regional_water_cf.RegionalWaterCfTable"></a>

## RegionalWaterCfTable Objects

```python
@dataclass(frozen=True)
class RegionalWaterCfTable()
```

Per-location |AWARE CF| extracted from the JRC EF v3.1 parquet.

``cf_by_location`` returns ``{ISO_code: |regional_cf|}`` where the value
is the mean of ``|CF EF3.1|`` over the 11 JRC water FLOW_uuids that
share the same regional grid. The 2026-05-13 audit confirmed those
magnitudes are identical per location across all 11 flows (only sign
differs); the mean is a defensive collapse — should the JRC source
ever differentiate magnitudes between flow types we'd want to surface
it via a per-flow lookup instead.

<a id="ef.regional_water_cf.RegionalWaterCfTable.cf_table"></a>

#### cf\_table

<a id="ef.regional_water_cf.RegionalWaterCfTable.WATER_USE_METHOD_NAME"></a>

#### WATER\_USE\_METHOD\_NAME

<a id="ef.regional_water_cf.RegionalWaterCfTable.cf_by_location"></a>

#### cf\_by\_location

```python
@cached_property
def cf_by_location() -> dict[str, float]
```

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder"></a>

## RegionalWaterCfRegistryBuilder Objects

```python
@dataclass(frozen=True)
class RegionalWaterCfRegistryBuilder()
```

Emit ``regional_cfs.parquet`` rows for the water-use method.

Inputs:

* ``water_global_cfs`` — the per-(database, code, amount) rows
  ``MethodCfRegistryBuilder._cfs_for_method`` already builds for the
  water-use slug.
* ``regional_table`` — the per-location |CF| lookup.

Outputs: a list of dicts with columns
``(database, code, location, amount)``. The ``amount`` is
``sign(global_cf) × |regional_cf[location]|`` — same convention the
bw2io snapshot used for the global value, but per-location. Rows
where ``|regional - global| < EPS`` are skipped to avoid emitting
no-op corrections.

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder.regional_table"></a>

#### regional\_table

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder.DIFF_EPS"></a>

#### DIFF\_EPS

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder.SYNTHETIC_CODE_SEPARATOR"></a>

#### SYNTHETIC\_CODE\_SEPARATOR

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder.build_rows"></a>

#### build\_rows

```python
def build_rows(water_global_cfs: list[dict]) -> list[dict]
```

<a id="ef.regional_water_cf.RegionalWaterCfRegistryBuilder.to_dataframe"></a>

#### to\_dataframe

```python
@staticmethod
def to_dataframe(rows: list[dict]) -> pd.DataFrame
```
