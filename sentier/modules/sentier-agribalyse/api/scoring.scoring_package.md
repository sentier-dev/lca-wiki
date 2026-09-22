**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.scoring_package` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.scoring_package cfg.yml > scoring.scoring_package.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.scoring_package"></a>

# scoring.scoring\_package

``ScoringPackage`` — content-addressable, parquet/numpy-native handoff.

Phase 4 of the SQLite refactor. Replaces the ``bw_processing`` zip
format as the on-disk artifact that scoring workers consume. The zip
format works fine, but it carries baggage: a JSON manifest, a fixed
file layout, and a ``ZipFileSystem`` indirection that costs ~50 ms per
worker on cold load. With 6 workers that's 300 ms of pure loading
overhead per backtest, every backtest.

This format is a directory keyed by content hash::

    cache/scoring_packages/<hash>/
        technosphere.csr.npz   # row, col, data, shape — scipy CSR
        biosphere.csr.npz
        characterization/
            <method-tuple-slug>.csr.npz
        ids.parquet            # row_id_to_idx, col_id_to_idx, ...

The hash is the SHA-256 of the input ``ExchangeFrame`` parquet bytes.
That gives us idempotency: two pipelines that produce the same frame
share one cached package directory. Scoring loads the .npz files
directly into ``scipy.sparse`` matrices — no zip seek, no JSON parse,
no bw2calc indirection.

<a id="scoring.scoring_package.ScoringPackage"></a>

## ScoringPackage Objects

```python
@dataclass(frozen=True)
class ScoringPackage()
```

Materialised matrices + id maps. In-memory representation.

``corrections`` holds an optional per-method ``(1, n_activities)``
sparse row whose ``correction @ supply`` is added to the
characterisation score. Methods without a regional split simply
omit a key (no correction). See ``RegionalCorrectionBuilder``.

<a id="scoring.scoring_package.ScoringPackage.technosphere"></a>

#### technosphere

<a id="scoring.scoring_package.ScoringPackage.biosphere"></a>

#### biosphere

<a id="scoring.scoring_package.ScoringPackage.methods"></a>

#### methods

<a id="scoring.scoring_package.ScoringPackage.corrections"></a>

#### corrections

<a id="scoring.scoring_package.ScoringPackage.content_hash"></a>

#### content\_hash

<a id="scoring.scoring_package.ScoringPackage.n_products"></a>

#### n\_products

```python
@property
def n_products() -> int
```

<a id="scoring.scoring_package.ScoringPackage.n_activities"></a>

#### n\_activities

```python
@property
def n_activities() -> int
```

<a id="scoring.scoring_package.ScoringPackage.n_biosphere_flows"></a>

#### n\_biosphere\_flows

```python
@property
def n_biosphere_flows() -> int
```

<a id="scoring.scoring_package.ScoringPackageBuilder"></a>

## ScoringPackageBuilder Objects

```python
@dataclass(frozen=True)
class ScoringPackageBuilder()
```

One-shot builder. Takes an ExchangeFrame + per-method CF tables,
produces a ``ScoringPackage`` in memory.

Optional ``regional_cfs`` + ``col_id_to_location`` enable per-activity
correction rows (currently used for the water-use AWARE regional
split). Methods absent from ``regional_cfs`` simply don't get a
correction; the standard ``Q @ B @ supply`` path stays intact.

Optional ``biosphere_catalog`` + ``aware_regional_cf_by_location``
enable the AWARE net-consumption correction for the water-use
method (see :class:`AwareConsumptionCorrectionBuilder`). When both
are supplied, the per-activity correction is summed into the
water-use correction row.

<a id="scoring.scoring_package.ScoringPackageBuilder.WATER_USE_METHOD"></a>

#### WATER\_USE\_METHOD

<a id="scoring.scoring_package.ScoringPackageBuilder.technosphere_builder"></a>

#### technosphere\_builder

<a id="scoring.scoring_package.ScoringPackageBuilder.biosphere_builder"></a>

#### biosphere\_builder

<a id="scoring.scoring_package.ScoringPackageBuilder.cf_builder"></a>

#### cf\_builder

<a id="scoring.scoring_package.ScoringPackageBuilder.correction_builder"></a>

#### correction\_builder

<a id="scoring.scoring_package.ScoringPackageBuilder.aware_consumption_builder"></a>

#### aware\_consumption\_builder

<a id="scoring.scoring_package.ScoringPackageBuilder.build"></a>

#### build

```python
def build(
    frame: ExchangeFrame,
    method_cfs: dict[tuple[str, ...], pd.DataFrame],
    regional_cfs: dict[tuple[str, ...], pd.DataFrame] | None = None,
    col_id_to_location: dict[int, str] | None = None,
    biosphere_catalog: pd.DataFrame | None = None,
    aware_regional_cf_by_location: dict[str, float] | None = None
) -> ScoringPackage
```

<a id="scoring.scoring_package.ScoringPackageStore"></a>

## ScoringPackageStore Objects

```python
@dataclass(frozen=True)
class ScoringPackageStore()
```

Directory-backed cache for ``ScoringPackage``.

``write(pkg)`` lays out the per-package directory, ``read(hash)``
rehydrates an in-memory ScoringPackage. The store is content-
addressable: the same package can be written by multiple producers
and they all collide on the same directory deterministically.

Crash safety: writes go to ``<dir>.partial/`` first and are renamed
into place atomically once every file has landed. Readers never see
a half-finished directory.

<a id="scoring.scoring_package.ScoringPackageStore.root"></a>

#### root

<a id="scoring.scoring_package.ScoringPackageStore.MAX_PACKAGES"></a>

#### MAX\_PACKAGES

What-if parameter overrides fork a new content-hashed package per
distinct value; without eviction, iterating what-ifs accumulates
multi-GB package dirs without bound. Keep the most-recently-used N.

<a id="scoring.scoring_package.ScoringPackageStore.path_for"></a>

#### path\_for

```python
def path_for(content_hash: str) -> Path
```

<a id="scoring.scoring_package.ScoringPackageStore.write"></a>

#### write

```python
def write(package: ScoringPackage) -> Path
```

<a id="scoring.scoring_package.ScoringPackageStore.read"></a>

#### read

```python
def read(content_hash: str) -> ScoringPackage
```
