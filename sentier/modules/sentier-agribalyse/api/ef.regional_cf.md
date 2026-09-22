**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.regional_cf` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.regional_cf cfg.yml > ef.regional_cf.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.regional_cf"></a>

# ef.regional\_cf

``RegionalCfTable`` / ``RegionalCfRegistryBuilder`` — per-bio3-row, per-location
regional CFs for non-water LCIA methods.

Generalises the water-use regional pattern (:mod:`ef.regional_water_cf`) to
every method that ships per-``LCIAMethod_location`` rows in the JRC EF v3.1
parquet. The matrix carries one row per ``(database, code)`` from the AGB +
ecoinvent biosphere link, which means **bio3 / ecoinvent-3.9.1-biosphere**
codes — not the JRC EF ``FLOW_uuid`` the regional data is keyed against.
A regional sidecar must therefore also be keyed by bio3 (db, code) to
have any effect at scoring time; rows keyed against the EF FLOW_uuid would
map to rows the matrix doesn't carry and contribute nothing.

The build path:

1. :class:`RegionalCfTable.regional_rows` returns a tidy DataFrame of every
   per-location row for the method (``flow_uuid, flow_name, top_class,
   location, cf``).
2. :class:`RegionalCfRegistryBuilder.build_rows`:

   a. Folds JRC rows by ``(flow_name_lower, top_class_bio3, location)``
      taking the mean of ``|cf|``. Multiple JRC FLOW_uuids that share a
      name + top compartment (e.g. the 11 water uuids for water-use, or
      the 5 ammonia sub-compartment uuids for acidification) collapse to
      a single magnitude per location, matching the convention water-use
      already established.
   b. Iterates the bio3 / ecoinvent-3.9.1-biosphere rows in the post-SimaPro
      global CF set and looks up each one's ``(name, top)`` in the
      biosphere catalog.
   c. For each matched location, emits ``(bio3_db, bio3_code, location,
      sign(global) × |regional_cf|)`` so the bw2io snapshot's sign
      convention on bio3 is preserved. Rows within :attr:`DIFF_EPS` of
      ``|global|`` are dropped.

EF-coded global CFs (``database == ef``) are ignored: those rows are inert
in the matrix (no AGB/ecoinvent activity emits onto them for non-water
methods), so emitting regional siblings would be wasted bytes.

Downstream consumers (:class:`MethodCfRegistryLoader.load_regional_all`
→ :class:`scoring.scoring_package.ScoringPackageBuilder` →
:class:`scoring.regional_correction.RegionalCorrectionBuilder`) are
already method-agnostic; existence of ``regional_cfs.parquet`` next to
``cfs.parquet`` is all they need.

<a id="ef.regional_cf.RegionalCfTable"></a>

## RegionalCfTable Objects

```python
@dataclass(frozen=True)
class RegionalCfTable()
```

Tidy DataFrame view of per-location CF rows for a method.

<a id="ef.regional_cf.RegionalCfTable.cf_table"></a>

#### cf\_table

<a id="ef.regional_cf.RegionalCfTable.REGIONAL_COLUMNS"></a>

#### REGIONAL\_COLUMNS

<a id="ef.regional_cf.RegionalCfTable.regional_rows"></a>

#### regional\_rows

```python
def regional_rows(method_name: str) -> pd.DataFrame
```

Return regional rows for ``method_name`` with normalised columns.

``top_class`` is read from ``FLOW_class1`` because that's where
the actual compartment label lives ("Emissions to air"); ``FLOW_class0``
is the parent kingdom that doesn't discriminate compartments.

Empty DataFrame (with the right schema) when the method has no
per-location rows.

<a id="ef.regional_cf.RegionalCfRegistryBuilder"></a>

## RegionalCfRegistryBuilder Objects

```python
@dataclass(frozen=True)
class RegionalCfRegistryBuilder()
```

Emit per-(bio3 db, bio3 code, location, amount) rows for any non-water method.

See module docstring for the algorithm. The builder owns one fixed
dependency — the biosphere catalog path — and is called per method
via :meth:`build_rows`.

Opt-in allowlist (``enabled_methods``): a method receives regional
sidecars **only** if its ``(category, indicator)`` tuple is in this
set. JRC ships per-location CFs for ~10 methods, but ADEME's
AGRIBALYSE reference applies regional CFs only for a subset (water-use
via AWARE; ecotoxicity freshwater). Emitting regional sidecars for
methods ADEME treats as site-generic (e.g. acidification, where the
JRC global is much higher than national averages) makes our scores
diverge from the reference even though they're scientifically
defensible — see backtest 2026-05-21 for the +20%-median bias on
acidification + eutrophication terrestrial when those were enabled.
Default is an empty set; the build CLI passes the audited allowlist.

<a id="ef.regional_cf.RegionalCfRegistryBuilder.regional_table"></a>

#### regional\_table

<a id="ef.regional_cf.RegionalCfRegistryBuilder.biosphere_catalog_path"></a>

#### biosphere\_catalog\_path

<a id="ef.regional_cf.RegionalCfRegistryBuilder.enabled_methods"></a>

#### enabled\_methods

<a id="ef.regional_cf.RegionalCfRegistryBuilder.DIFF_EPS"></a>

#### DIFF\_EPS

<a id="ef.regional_cf.RegionalCfRegistryBuilder.BIO_DATABASES"></a>

#### BIO\_DATABASES

<a id="ef.regional_cf.RegionalCfRegistryBuilder.build_rows"></a>

#### build\_rows

```python
def build_rows(*, method_key: tuple[str, str], method_name: str,
               global_cfs: list[dict]) -> list[dict]
```

<a id="ef.regional_cf.RegionalCfRegistryBuilder.to_dataframe"></a>

#### to\_dataframe

```python
@staticmethod
def to_dataframe(rows: list[dict]) -> pd.DataFrame
```
