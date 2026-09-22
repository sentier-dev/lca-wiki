**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.schema` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.schema cfg.yml > registry.schema.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.schema"></a>

# registry.schema

Schema helpers: turn lists of frozen-dataclass rows into pandas DataFrames.

Class-based: ``MappingTable`` / ``UnitConversionTable`` etc. wrap the
column ordering and type coercion for one parquet file.

<a id="registry.schema.MappingTable"></a>

## MappingTable Objects

```python
@dataclass(frozen=True)
class MappingTable()
```

Materialise ``Mapping`` rows into a DataFrame with stable column order.

<a id="registry.schema.MappingTable.columns"></a>

#### columns

<a id="registry.schema.MappingTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[Mapping]) -> pd.DataFrame
```

<a id="registry.schema.UnitConversionTable"></a>

## UnitConversionTable Objects

```python
@dataclass(frozen=True)
class UnitConversionTable()
```

<a id="registry.schema.UnitConversionTable.columns"></a>

#### columns

<a id="registry.schema.UnitConversionTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[UnitConversion]) -> pd.DataFrame
```

<a id="registry.schema.UnitAliasTable"></a>

## UnitAliasTable Objects

```python
@dataclass(frozen=True)
class UnitAliasTable()
```

<a id="registry.schema.UnitAliasTable.columns"></a>

#### columns

<a id="registry.schema.UnitAliasTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[UnitAlias]) -> pd.DataFrame
```

<a id="registry.schema.ContextNormTable"></a>

## ContextNormTable Objects

```python
@dataclass(frozen=True)
class ContextNormTable()
```

<a id="registry.schema.ContextNormTable.columns"></a>

#### columns

<a id="registry.schema.ContextNormTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[ContextNorm]) -> pd.DataFrame
```

<a id="registry.schema.DeletionTable"></a>

## DeletionTable Objects

```python
@dataclass(frozen=True)
class DeletionTable()
```

<a id="registry.schema.DeletionTable.columns"></a>

#### columns

<a id="registry.schema.DeletionTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[Deletion]) -> pd.DataFrame
```

<a id="registry.schema.EdgeLabelTable"></a>

## EdgeLabelTable Objects

```python
@dataclass(frozen=True)
class EdgeLabelTable()
```

<a id="registry.schema.EdgeLabelTable.columns"></a>

#### columns

<a id="registry.schema.EdgeLabelTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[EdgeLabelCorrection]) -> pd.DataFrame
```

<a id="registry.schema.EfTargetIndexTable"></a>

## EfTargetIndexTable Objects

```python
@dataclass(frozen=True)
class EfTargetIndexTable()
```

<a id="registry.schema.EfTargetIndexTable.columns"></a>

#### columns

<a id="registry.schema.EfTargetIndexTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[EfTargetIndexRow]) -> pd.DataFrame
```

<a id="registry.schema.AuditTable"></a>

## AuditTable Objects

```python
@dataclass(frozen=True)
class AuditTable()
```

<a id="registry.schema.AuditTable.columns"></a>

#### columns

<a id="registry.schema.AuditTable.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(rows: Sequence[AuditEntry]) -> pd.DataFrame
```
