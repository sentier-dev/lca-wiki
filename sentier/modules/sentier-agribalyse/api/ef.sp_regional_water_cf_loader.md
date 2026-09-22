**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.sp_regional_water_cf_loader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.sp_regional_water_cf_loader cfg.yml > ef.sp_regional_water_cf_loader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.sp_regional_water_cf_loader"></a>

# ef.sp\_regional\_water\_cf\_loader

``SpRegionalWaterCfLoader`` — load per-region AWARE deprivation CFs.

Reads ``cache/simapro-EF31-adapted-cfs.parquet`` (the parsed SimaPro
EF v3.1 (adapted) export ADEME uses to compute the AGRIBALYSE 3.2
reference scores) and emits one row per ``(base_name, compartment,
sub_compartment, region, cf, flow_unit)`` tuple for the **Water use**
method.

Only the ``flow_unit = "m3"`` rows are kept. SimaPro carries two
parallel CF tables for every water flow — one in cubic metres, one in
kilograms (with CF re-scaled by 1/1000) — and our matrix-side
amounts are uniformly in m³, so the kg variant would 1000x under-count
on every linked edge. The kg variant was the root cause of the
``WaterUseBio3Bridge`` 337x over-count documented in the spec. This
loader hard-rejects it.

Regional suffixes are detected via
:class:`matching.regional_suffix.RegionalSuffixParser`, the same
parser the matcher uses, so the (base_name, region) tuples that come
out align with the synthetic codes the augmented biosphere catalog
carries.

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader"></a>

## SpRegionalWaterCfLoader Objects

```python
@dataclass(frozen=True)
class SpRegionalWaterCfLoader()
```

Per-region water-use CFs from the SimaPro EF v3.1 (adapted) parquet.

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.cache_path"></a>

#### cache\_path

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.parser"></a>

#### parser

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.SP_METHOD"></a>

#### SP\_METHOD

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.FLOW_UNIT_M3"></a>

#### FLOW\_UNIT\_M3

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.df"></a>

#### df

```python
@cached_property
def df() -> pd.DataFrame
```

Return cols: ``base_name``, ``compartment``, ``sub_compartment``,
``region``, ``cf``, ``flow_unit``.

One row per emitted (base_name, compartment, sub_compartment,
region) tuple. ``region`` is the empty string for the global /
non-regional rows that SimaPro keeps alongside the per-country
variants — callers can use those as the global fallback CF.

<a id="ef.sp_regional_water_cf_loader.SpRegionalWaterCfLoader.cf_for"></a>

#### cf\_for

```python
def cf_for(*, base_name: str, region: str, compartment: str,
           sub_compartment: str) -> float | None
```

Look up the CF for one (base, region, compartment, sub) tuple.

Returns ``None`` when no SimaPro row exists. Callers can fall
back to the global / inherited CF in that case.
