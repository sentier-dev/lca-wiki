**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.product_catalog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.product_catalog cfg.yml > scoring.product_catalog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.product_catalog"></a>

# scoring.product\_catalog

``ProductCatalogBuilder`` — emit one parquet row per linked activity.

Replaces ``BacktestPipeline._map_products``'s reliance on
``bw2data.Database(agb_db_name)`` (which won't exist after Phase L3
cuts the SQLite tail). The product catalog is a flat parquet of every
activity in ``sp.data`` keyed on ``(database, code)``, carrying the
fields backtests need to map a CIQUAL code → product id:

| col         | dtype  | notes                                              |
|-------------|--------|----------------------------------------------------|
| database    | string | source database for the activity                   |
| code        | string | activity code                                      |
| name        | string | activity name (post-RestoreSimaproNamesTransform)  |
| type        | string | ``process`` / ``product`` / ``multifunctional`` /…  |
| unit        | string | reference unit                                     |
| product_id  | int64  | ``ExchangeFrameBuilder.flow_id_for((db, code))``    |

Determinism: rows sorted by ``(database, code)`` before write. Atomic
write via ``ParquetAtomicWriter`` so a SIGKILL leaves no partial file
at the publish path.

<a id="scoring.product_catalog.ProductCatalogBuilder"></a>

## ProductCatalogBuilder Objects

```python
@dataclass(frozen=True)
class ProductCatalogBuilder()
```

Stateless builder. ``build(sp_data, target)`` writes the parquet.

<a id="scoring.product_catalog.ProductCatalogBuilder.build"></a>

#### build

```python
def build(sp_data: Iterable[dict], target: Path) -> Path
```

Project ``sp_data`` into the product catalog parquet.

One row per activity. ``product_id`` is the integer id assigned
by :meth:`ExchangeFrameBuilder.flow_id_for` so downstream
consumers can join directly against the technosphere row map.

<a id="scoring.product_catalog.ProductCatalogBuilder.build_from_columns"></a>

#### build\_from\_columns

```python
def build_from_columns(*, col_ids: Iterable[int], sp_data: Iterable[dict],
                       ei_catalog_df: pd.DataFrame,
                       synthetic_provenance: dict[int, tuple[int, int]],
                       target: Path) -> Path
```

Emit one catalog row per technosphere column, keyed by the
matrix's own ``activity_id`` (the column id).

Built from the *same run*'s ``ScoringPackage`` column set, so the
catalog and the matrix can never skew (the historic bug that left
column ids with no catalog row). Each column is labelled from, in
priority order:

  1. the SimaPro ``sp_data`` activity whose ``(database, code)``
     hashes to the column id (agribalyse foreground),
  2. the ecoinvent catalog row whose ``(database, code)`` hashes
     to it (ecoinvent background),
  3. the Allocator ``synthetic_provenance`` (multifunctional
     splits — their ids are *not* ``flow_id_for`` hashes, so they
     resolve against no source ``(database, code)``),
  4. a labelled ``unresolved`` fallback — surfaced and counted,
     never silently dropped.

<a id="scoring.product_catalog.ProductCatalog"></a>

## ProductCatalog Objects

```python
@dataclass(frozen=True)
class ProductCatalog()
```

Read-only view over ``registry/product_catalog.parquet``.

Provides a ``(database, code) → product_id`` lookup used by L4
scoring consumers that must not go through ``bw2data.Database``.

<a id="scoring.product_catalog.ProductCatalog.load"></a>

#### load

```python
@classmethod
def load(cls, path: Path) -> ProductCatalog
```

Load the product catalog from *path*.

<a id="scoring.product_catalog.ProductCatalog.product_id_for"></a>

#### product\_id\_for

```python
def product_id_for(database: str, code: str) -> int | None
```

Return the integer product_id for *(database, code)*, or None.

<a id="scoring.product_catalog.ProductCatalog.scoreable_entries"></a>

#### scoreable\_entries

```python
def scoreable_entries() -> pd.DataFrame
```

Return a DataFrame of all activities that can be scored.

Filters to the activity types that ``BacktestPipeline`` maps:
``process``, ``multifunctional``, ``product``, and
``processwithreferenceproduct``. Columns: database, code, name, type,
unit, product_id.
