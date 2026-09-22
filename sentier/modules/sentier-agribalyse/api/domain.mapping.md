**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `domain.mapping` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m domain.mapping cfg.yml > domain.mapping.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="domain.mapping"></a>

# domain.mapping

Registry row schema. One ``Mapping`` = one row of a ``mappings_*`` parquet.

<a id="domain.mapping.SourceKind"></a>

## SourceKind Objects

```python
class SourceKind(StrEnum)
```

<a id="domain.mapping.SourceKind.AGB_FLOW"></a>

#### AGB\_FLOW

Biosphere exchange (substance, compartment, unit).

<a id="domain.mapping.SourceKind.AGB_NODE"></a>

#### AGB\_NODE

Technosphere process or product.

<a id="domain.mapping.Mapping"></a>

## Mapping Objects

```python
@dataclass(frozen=True)
class Mapping()
```

One row of the mapping registry.

Schema mirrors REFACTOR.md §0.1. Fields shared across biosphere /
technosphere; the ``source_kind`` discriminator tells the matcher
which side the row applies to.

<a id="domain.mapping.Mapping.source_kind"></a>

#### source\_kind

<a id="domain.mapping.Mapping.source_name"></a>

#### source\_name

<a id="domain.mapping.Mapping.source_unit"></a>

#### source\_unit

<a id="domain.mapping.Mapping.source_context"></a>

#### source\_context

<a id="domain.mapping.Mapping.source_top_bucket"></a>

#### source\_top\_bucket

<a id="domain.mapping.Mapping.source_cas"></a>

#### source\_cas

<a id="domain.mapping.Mapping.source_formula"></a>

#### source\_formula

<a id="domain.mapping.Mapping.target_db"></a>

#### target\_db

<a id="domain.mapping.Mapping.target_code"></a>

#### target\_code

<a id="domain.mapping.Mapping.target_name"></a>

#### target\_name

<a id="domain.mapping.Mapping.target_unit"></a>

#### target\_unit

<a id="domain.mapping.Mapping.unit_conversion"></a>

#### unit\_conversion

Scalar multiplier ``source → target``. ``1.0`` means units already match.

<a id="domain.mapping.Mapping.priority_tier"></a>

#### priority\_tier

<a id="domain.mapping.Mapping.provenance"></a>

#### provenance

<a id="domain.mapping.Mapping.provenance_row"></a>

#### provenance\_row

<a id="domain.mapping.Mapping.is_unmatchable"></a>

#### is\_unmatchable

<a id="domain.mapping.Mapping.notes"></a>

#### notes

<a id="domain.mapping.Mapping.target_key"></a>

#### target\_key

```python
@property
def target_key() -> tuple[str, str]
```

``(db, code)`` — what bw2data uses to identify the target.

<a id="domain.mapping.Mapping.name_lower"></a>

#### name\_lower

```python
@property
def name_lower() -> str
```

<a id="domain.mapping.MAPPING_COLUMNS"></a>

#### MAPPING\_COLUMNS

<a id="domain.mapping.UnitConversion"></a>

## UnitConversion Objects

```python
@dataclass(frozen=True)
class UnitConversion()
```

One row of ``unit_conversions.parquet``.

<a id="domain.mapping.UnitConversion.source_unit"></a>

#### source\_unit

<a id="domain.mapping.UnitConversion.target_unit"></a>

#### target\_unit

<a id="domain.mapping.UnitConversion.multiplier"></a>

#### multiplier

<a id="domain.mapping.UnitConversion.provenance"></a>

#### provenance

<a id="domain.mapping.UnitAlias"></a>

## UnitAlias Objects

```python
@dataclass(frozen=True)
class UnitAlias()
```

One row of ``unit_aliases.parquet`` — case-insensitive.

<a id="domain.mapping.UnitAlias.alias"></a>

#### alias

<a id="domain.mapping.UnitAlias.canonical"></a>

#### canonical

<a id="domain.mapping.UnitAlias.provenance"></a>

#### provenance

<a id="domain.mapping.ContextNorm"></a>

## ContextNorm Objects

```python
@dataclass(frozen=True)
class ContextNorm()
```

One row of ``context_normalisation.parquet``.

<a id="domain.mapping.ContextNorm.source_context"></a>

#### source\_context

<a id="domain.mapping.ContextNorm.target_context"></a>

#### target\_context

<a id="domain.mapping.ContextNorm.provenance"></a>

#### provenance

<a id="domain.mapping.Deletion"></a>

## Deletion Objects

```python
@dataclass(frozen=True)
class Deletion()
```

One row of ``deletions.parquet`` — process or product to remove.

<a id="domain.mapping.Deletion.name"></a>

#### name

<a id="domain.mapping.Deletion.code"></a>

#### code

<a id="domain.mapping.Deletion.kind"></a>

#### kind

``process`` or ``product`` — which AGB graph element to delete.

<a id="domain.mapping.Deletion.provenance"></a>

#### provenance

<a id="domain.mapping.EdgeLabelCorrection"></a>

## EdgeLabelCorrection Objects

```python
@dataclass(frozen=True)
class EdgeLabelCorrection()
```

One row of ``edge_label_corrections.parquet``.

<a id="domain.mapping.EdgeLabelCorrection.source_name"></a>

#### source\_name

<a id="domain.mapping.EdgeLabelCorrection.target_name"></a>

#### target\_name

<a id="domain.mapping.EdgeLabelCorrection.edge_type"></a>

#### edge\_type

<a id="domain.mapping.EdgeLabelCorrection.categories"></a>

#### categories

<a id="domain.mapping.EdgeLabelCorrection.provenance"></a>

#### provenance

<a id="domain.mapping.EfTargetIndexRow"></a>

## EfTargetIndexRow Objects

```python
@dataclass(frozen=True)
class EfTargetIndexRow()
```

One row of ``target_index_ef.parquet`` — EF flow universe.

<a id="domain.mapping.EfTargetIndexRow.code"></a>

#### code

<a id="domain.mapping.EfTargetIndexRow.name"></a>

#### name

<a id="domain.mapping.EfTargetIndexRow.unit"></a>

#### unit

<a id="domain.mapping.EfTargetIndexRow.bucket"></a>

#### bucket

<a id="domain.mapping.EfTargetIndexRow.categories"></a>

#### categories

<a id="domain.mapping.EfTargetIndexRow.cas"></a>

#### cas

<a id="domain.mapping.EfTargetIndexRow.aliases"></a>

#### aliases
