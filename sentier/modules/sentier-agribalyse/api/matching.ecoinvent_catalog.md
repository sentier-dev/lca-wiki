**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.ecoinvent_catalog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.ecoinvent_catalog cfg.yml > matching.ecoinvent_catalog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.ecoinvent_catalog"></a>

# matching.ecoinvent\_catalog

``EcoinventCatalog`` — parquet-backed in-memory index of ecoinvent activities.

The technosphere matcher uses this to resolve ``(name, unit, location,
reference product)`` to an ``(database, code)`` activity reference. Built
once into ``registry/ecoinvent_catalog.parquet`` by ``EcoinventCatalogBuilder``;
read at runtime via ``EcoinventCatalog.load(path)`` — no SQLite, no bw2data.

Schema (one row per ecoinvent activity):

| col              | dtype  | notes                                          |
|------------------|--------|------------------------------------------------|
| database         | string | ``settings.ecoinvent_db_name`` (e.g. cutoff)   |
| code             | string | ecoinvent activity uuid                        |
| name             | string | activity name (lowercased on lookup)           |
| unit             | string | reference unit                                 |
| location         | string | RoW / GLO / FR / ...                           |
| reference_product| string | reference product name (lowercased on lookup)  |

Determinism: rows sorted by ``(database, code)`` before write so two builds
against the same project produce byte-equal parquets.

Disambiguation: ``match_full`` and ``match_relaxed`` return ``None`` when
the lookup key resolves to more than one activity — same behavior as
``bw2io.SimaProBlockCSVImporter.match_database``, which leaves ambiguous
exchanges unlinked rather than picking arbitrarily.

<a id="matching.ecoinvent_catalog.EcoinventActivityRef"></a>

## EcoinventActivityRef Objects

```python
@dataclass(frozen=True)
class EcoinventActivityRef()
```

One ecoinvent activity, the slim subset the technosphere matcher needs.

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.db"></a>

#### db

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.code"></a>

#### code

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.name"></a>

#### name

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.unit"></a>

#### unit

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.location"></a>

#### location

<a id="matching.ecoinvent_catalog.EcoinventActivityRef.reference_product"></a>

#### reference\_product

<a id="matching.ecoinvent_catalog.EcoinventCatalog"></a>

## EcoinventCatalog Objects

```python
@dataclass(frozen=True)
class EcoinventCatalog()
```

Parquet-backed snapshot of an ecoinvent database keyed for fast lookup.

<a id="matching.ecoinvent_catalog.EcoinventCatalog.db_names"></a>

#### db\_names

<a id="matching.ecoinvent_catalog.EcoinventCatalog.activities"></a>

#### activities

<a id="matching.ecoinvent_catalog.EcoinventCatalog.load"></a>

#### load

```python
@classmethod
def load(cls,
         path: Path,
         db_names: Iterable[str] | None = None) -> EcoinventCatalog
```

Read ``ecoinvent_catalog.parquet`` into an in-memory catalog.

``db_names`` optionally filters the catalog down to a subset of
databases. ``None`` keeps every database present in the parquet.

<a id="matching.ecoinvent_catalog.EcoinventCatalog.by_db_code"></a>

#### by\_db\_code

```python
@cached_property
def by_db_code() -> dict[tuple[str, str], EcoinventActivityRef]
```

<a id="matching.ecoinvent_catalog.EcoinventCatalog.get"></a>

#### get

```python
def get(db: str, code: str) -> EcoinventActivityRef | None
```

<a id="matching.ecoinvent_catalog.EcoinventCatalog.match_full"></a>

#### match\_full

```python
def match_full(db: str, name: str, unit: str, location: str,
               reference_product: str) -> EcoinventActivityRef | None
```

Strict 4-field match. Returns the unique activity, or ``None`` if 0 or >1.

Mirrors ``sp.match_database(ei_db, fields=["name","unit","location","reference product"])``:
ambiguous keys leave the exchange unlinked.

<a id="matching.ecoinvent_catalog.EcoinventCatalog.match_relaxed"></a>

#### match\_relaxed

```python
def match_relaxed(db: str, name: str, unit: str,
                  location: str) -> EcoinventActivityRef | None
```

3-field match (drops ``reference product``). Returns unique activity or ``None``.

<a id="matching.ecoinvent_catalog.EcoinventCatalogBuilder"></a>

## EcoinventCatalogBuilder Objects

```python
@dataclass(frozen=True)
class EcoinventCatalogBuilder()
```

Build ``registry/ecoinvent_catalog.parquet`` from a JSON snapshot.

REFACTOR_FINAL F6: bw2data is no longer queried at build time. The
ecoinvent activities are snapshotted once into
``source/ecoinvent-3.9.1-cutoff-activities.json`` (or whatever
``ecoinvent_activities_json`` resolves to) and the builder converts
that JSON to the parquet shape the runtime catalog reads.

<a id="matching.ecoinvent_catalog.EcoinventCatalogBuilder.settings"></a>

#### settings

<a id="matching.ecoinvent_catalog.EcoinventCatalogBuilder.build"></a>

#### build

```python
def build() -> Path
```
