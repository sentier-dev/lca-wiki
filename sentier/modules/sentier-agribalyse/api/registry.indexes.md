**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.indexes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.indexes cfg.yml > registry.indexes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.indexes"></a>

# registry.indexes

Lookup indexes used by the matchers.

Built once per run from the loaded ``MappingRegistry``. Each index is a
small class with a ``.lookup(...)`` method, so swapping one out (e.g.
adding a CAS-based variant) is a single class addition rather than a
restructure of the matcher.

<a id="registry.indexes._IndexEntry"></a>

## \_IndexEntry Objects

```python
@dataclass(frozen=True)
class _IndexEntry()
```

One candidate target for a lookup hit.

<a id="registry.indexes._IndexEntry.target_db"></a>

#### target\_db

<a id="registry.indexes._IndexEntry.target_code"></a>

#### target\_code

<a id="registry.indexes._IndexEntry.target_name"></a>

#### target\_name

<a id="registry.indexes._IndexEntry.target_unit"></a>

#### target\_unit

<a id="registry.indexes._IndexEntry.unit_conversion"></a>

#### unit\_conversion

<a id="registry.indexes._IndexEntry.tier"></a>

#### tier

<a id="registry.indexes._IndexEntry.provenance"></a>

#### provenance

<a id="registry.indexes._IndexEntry.is_unmatchable"></a>

#### is\_unmatchable

<a id="registry.indexes._IndexEntry.source_unit"></a>

#### source\_unit

<a id="registry.indexes._IndexEntry.source_name"></a>

#### source\_name

<a id="registry.indexes._IndexEntry.from_row"></a>

#### from\_row

```python
@classmethod
def from_row(cls, r) -> _IndexEntry
```

<a id="registry.indexes.TieredNameBucketIndex"></a>

## TieredNameBucketIndex Objects

```python
@dataclass(frozen=True)
class TieredNameBucketIndex()
```

``(source_kind, name_lower, bucket) → [entry, …]`` ordered by tier ascending.

The biosphere matcher walks tiers ascending and grabs the first entry
whose constraints are satisfied. Same key ⇒ candidates list ordered
by tier, then by provenance for deterministic tie-breaks.

<a id="registry.indexes.TieredNameBucketIndex.df"></a>

#### df

<a id="registry.indexes.TieredNameBucketIndex.lookup"></a>

#### lookup

```python
def lookup(source_kind: str, name_lower: str,
           bucket: Bucket | str) -> list[_IndexEntry]
```

<a id="registry.indexes.CasIndex"></a>

## CasIndex Objects

```python
@dataclass(frozen=True)
class CasIndex()
```

``cas → [entry, …]`` for CAS-disambiguation lookups (fix 1.o).

<a id="registry.indexes.CasIndex.df"></a>

#### df

<a id="registry.indexes.CasIndex.lookup"></a>

#### lookup

```python
def lookup(cas: str) -> list[_IndexEntry]
```

<a id="registry.indexes.UnitConverter"></a>

## UnitConverter Objects

```python
@dataclass(frozen=True)
class UnitConverter()
```

Resolve a source unit → target unit multiplier from the registry.

Aliases (case-insensitive) are applied first so ``a`` → ``year`` →
canonical conversion happens transparently.

The two randonneur sources we ingest disagree on canonical naming:
``flowmapper-standard-units-harmonization`` uses snake_case
(``cubic_meter``, ``kilobecquerel``) while
``generic-brightway-unit-conversions`` (and Brightway itself) uses
space-separated forms (``cubic meter``, ``kilo Becquerel``). The
conversion table is keyed in the brightway convention; an alias that
rewrites a brightway-canonical unit to flowmapper's snake_case form
silently breaks every downstream lookup. ``_alias_to_canonical``
therefore (a) skips aliases whose alias is already a known canonical,
and (b) rewrites snake_case alias targets to their space-separated
brightway equivalent when that form is in the conversion table.

<a id="registry.indexes.UnitConverter.conversions_df"></a>

#### conversions\_df

<a id="registry.indexes.UnitConverter.aliases_df"></a>

#### aliases\_df

<a id="registry.indexes.UnitConverter.canonical"></a>

#### canonical

```python
def canonical(unit: str) -> str
```

Apply alias normalisation: ``a`` → ``year`` etc.

<a id="registry.indexes.UnitConverter.multiplier"></a>

#### multiplier

```python
def multiplier(source_unit: str, target_unit: str) -> float | None
```

Return ``multiplier`` such that ``target = source * multiplier``.

Returns ``1.0`` if the canonical units already match, ``None`` if
no conversion is registered.

<a id="registry.indexes.UnmatchableIndex"></a>

## UnmatchableIndex Objects

```python
@dataclass(frozen=True)
class UnmatchableIndex()
```

``(name_lower, bucket) → True`` for known-unmatchable AGB flows.

<a id="registry.indexes.UnmatchableIndex.df"></a>

#### df

<a id="registry.indexes.UnmatchableIndex.is_unmatchable"></a>

#### is\_unmatchable

```python
def is_unmatchable(name: str, bucket: Bucket | str) -> bool
```
