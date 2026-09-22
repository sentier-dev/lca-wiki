**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.aware_consumption_correction` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.aware_consumption_correction cfg.yml > scoring.aware_consumption_correction.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.aware_consumption_correction"></a>

# scoring.aware\_consumption\_correction

``AwareConsumptionCorrectionBuilder`` — per-activity AWARE net-consumption
correction for the water-use method.

The bw2io snapshot characterises 5 bio3 ``Water → air`` codes at the global
AWARE CF (+42.95 m³ deprivation/m³). That captures evaporative consumption
that AGB's foreground encodes via a Water-to-air proxy. But the underlying
ecoinvent unit-process activities for water-intensive products (irrigation,
fish farming, tropical-fruit production) record their consumption as
resource extraction (``Water, river [natural resource]`` etc.) with no
matching air emission — so the AGB → Water[air] path under-counts those
products by 50–100x against ADEME's reference.

This builder fills that gap **per-activity, only where the LCI signal is
unambiguous**:

* Apply ``regional_AWARE × (res − ret)`` per activity column j when:

  1. ``asymmetry = |res − ret| / max(res, ret) ≥ 0.95`` — i.e. the
     activity carries an essentially one-sided water flow rather than
     a closed-loop withdrawal/return pair.
  2. ``net = res − ret ≥ 0.05 m³`` per reference unit — filters
     numerical noise.
  3. ``res > ret`` — only POSITIVE net consumption qualifies. The
     opposite direction (return without matching withdrawal) is the
     signature of dehydration / drying / wastewater outputs whose
     physical reality is evaporation (already captured by the
     Water[air] proxy); characterising it would double-count.

* ``res`` and ``ret`` sum over the SimaPro EF v3.1 (adapted) flow set:

  - Resource side (positive): ``Water, lake / river / turbine use``
  - Return side (negative-signed in AWARE; positive in inventory):
    ``Water [water, *]`` for unspecified / fossil well / ground- /
    ground- long-term / surface water sub-compartments. Ocean is
    excluded (saltwater not characterised).

  These are the same flows SimaPro's adapted EF v3.1 export
  characterises (3 resource + 5 emission bio3 codes; see
  ``SimaProCfFilter`` and ``cache/simapro-EF31-adapted-cfs.parquet``).

* The CF is the activity's *regional* AWARE value (per ISO country from
  the JRC parquet) when the activity location is known, falling back
  to ``7.0 m³/m³`` (≈ FR / European median) for activities at
  aggregate locations (GLO / RoW / RER). The bidirectional bio-row
  approach (``Q @ B``) blows up fleet-wide because residual ~2 %
  imbalances across thousands of nominally balanced activities (e.g.
  ``market for electricity FR``) accumulate into ±300 m³eq cumulative
  errors per kg. The asymmetric gate isolates the consumption signal
  from the noise.

Output: a ``(1, n_activities)`` sparse correction row added to
``ScoringPackage.corrections`` for the water-use method, summed with the
existing :class:`RegionalCorrectionBuilder` output. At score time the
sum is ``q @ B @ supply + correction @ supply`` — same shape, same fast
path, no per-activity logic at scoring time.

The asymmetry threshold (0.95), minimum net (0.05 m³), and fallback CF
(7.0) are the configuration triple proven against the 2026-05-14 fleet
backtest: median ``|Δ|`` 29 % → 18 %, outliers 324 → 202, median signed
−10.8 % → −0.2 %. See docs/FIX_WATER_USE_AUGMENTATION.md (revised) for
the derivation.

Known residual: dehydrated soups (~50 products) over-count because
their LCI records process water as ``Water [water, surface water]``
emission when it physically evaporates. That's an inventory bookkeeping
issue addressed in a separate workstream — see
docs/IMPROVEMENT_ROADMAP.md.

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder"></a>

## AwareConsumptionCorrectionBuilder Objects

```python
@dataclass(frozen=True)
class AwareConsumptionCorrectionBuilder()
```

Compose the water-use AWARE net-consumption correction row.

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.RESOURCE_TARGETS"></a>

#### RESOURCE\_TARGETS

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.RETURN_TARGETS"></a>

#### RETURN\_TARGETS

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.ASYMMETRY_THRESHOLD"></a>

#### ASYMMETRY\_THRESHOLD

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.MIN_NET_M3"></a>

#### MIN\_NET\_M3

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.FALLBACK_CF"></a>

#### FALLBACK\_CF

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.SYNTHETIC_CODE_SEPARATOR"></a>

#### SYNTHETIC\_CODE\_SEPARATOR

<a id="scoring.aware_consumption_correction.AwareConsumptionCorrectionBuilder.build"></a>

#### build

```python
def build(*, biosphere: BuiltMatrix, technosphere: BuiltMatrix,
          biosphere_catalog: pd.DataFrame,
          regional_cf_by_location: dict[str, float],
          col_id_to_location: dict[int, str]) -> sp.csr_matrix
```

Return a ``(1, n_activities)`` sparse correction row.

``biosphere_catalog`` must carry the columns ``database``,
``code``, ``name``, ``categories`` (list of two strings: top
then sub). ``regional_cf_by_location`` maps ISO-3166 alpha-2 to
the regional AWARE CF magnitude. ``col_id_to_location`` maps
technosphere column ids (the ``output_id`` hash) to the
activity's location string.

Empty (no nonzero entries) if no bio rows resolve or no
activities pass the inclusion gate.
