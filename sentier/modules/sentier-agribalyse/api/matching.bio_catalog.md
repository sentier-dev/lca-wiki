**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.bio_catalog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.bio_catalog cfg.yml > matching.bio_catalog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.bio_catalog"></a>

# matching.bio\_catalog

``BiosphereCatalog`` — parquet-backed in-memory index of biosphere DBs.

The matcher uses this to resolve target codes when a registry row says
"map to flow X by name" without a UUID. Biosphere DBs (``biosphere3``,
``ecoinvent-3.9.1-biosphere``, ``ef``) are indexed by
``(db, name_lower, bucket) → [(code, unit)]``.

The source of truth is ``registry/biosphere_catalog.parquet``, written by
``BiosphereRegistryBuilder`` at build time. ``load(path)`` reads that
parquet and returns an immutable catalog. Reading from parquet (not
SQLite) keeps the runtime path off ``bw2data`` — see
``docs/REFACTOR_LINKING.md`` Phase L1 for the design rationale.

<a id="matching.bio_catalog.BioFlowRef"></a>

## BioFlowRef Objects

```python
@dataclass(frozen=True)
class BioFlowRef()
```

<a id="matching.bio_catalog.BioFlowRef.db"></a>

#### db

<a id="matching.bio_catalog.BioFlowRef.code"></a>

#### code

<a id="matching.bio_catalog.BioFlowRef.name"></a>

#### name

<a id="matching.bio_catalog.BioFlowRef.unit"></a>

#### unit

<a id="matching.bio_catalog.BioFlowRef.bucket"></a>

#### bucket

<a id="matching.bio_catalog.BioFlowRef.cas"></a>

#### cas

<a id="matching.bio_catalog.BioFlowRef.categories"></a>

#### categories

<a id="matching.bio_catalog.BiosphereCatalog"></a>

## BiosphereCatalog Objects

```python
@dataclass(frozen=True)
class BiosphereCatalog()
```

Parquet-backed snapshots of biosphere/EF databases keyed for fast lookup.

<a id="matching.bio_catalog.BiosphereCatalog.db_names"></a>

#### db\_names

<a id="matching.bio_catalog.BiosphereCatalog.flows"></a>

#### flows

<a id="matching.bio_catalog.BiosphereCatalog.load"></a>

#### load

```python
@classmethod
def load(cls,
         path: Path,
         db_names: Iterable[str] | None = None) -> BiosphereCatalog
```

Read ``biosphere_catalog.parquet`` into an in-memory catalog.

``db_names`` optionally filters the catalog down to a subset of
databases. ``None`` keeps every database present in the parquet.

<a id="matching.bio_catalog.BiosphereCatalog.by_name_bucket"></a>

#### by\_name\_bucket

```python
@cached_property
def by_name_bucket() -> dict[tuple[str, str, str], list[BioFlowRef]]
```

<a id="matching.bio_catalog.BiosphereCatalog.by_db_code"></a>

#### by\_db\_code

```python
@cached_property
def by_db_code() -> dict[tuple[str, str], BioFlowRef]
```

<a id="matching.bio_catalog.BiosphereCatalog.by_cas"></a>

#### by\_cas

```python
@cached_property
def by_cas() -> dict[tuple[str, str], list[BioFlowRef]]
```

``(db, cas) → flows``. CAS is sparse so this is small.

<a id="matching.bio_catalog.BiosphereCatalog.lookup_name_bucket"></a>

#### lookup\_name\_bucket

```python
def lookup_name_bucket(db: str, name: str,
                       bucket: Bucket | str) -> list[BioFlowRef]
```

<a id="matching.bio_catalog.BiosphereCatalog.get"></a>

#### get

```python
def get(db: str, code: str) -> BioFlowRef | None
```

<a id="matching.bio_catalog.BiosphereCatalog.lookup_cas"></a>

#### lookup\_cas

```python
def lookup_cas(db: str, cas: str) -> list[BioFlowRef]
```
