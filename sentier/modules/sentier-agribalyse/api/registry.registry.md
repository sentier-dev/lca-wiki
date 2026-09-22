**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.registry` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.registry cfg.yml > registry.registry.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.registry"></a>

# registry.registry

Loaded ``MappingRegistry`` — the read API consumed by every matcher.

Construction::

    reg = MappingRegistry.load(settings)

The registry holds DataFrames in memory and lazily builds indexes on
first access. Indexes are ``cached_property`` on the index classes, so a
second matcher reuses the same index instance.

<a id="registry.registry.MappingRegistry"></a>

## MappingRegistry Objects

```python
@dataclass(frozen=True)
class MappingRegistry()
```

Loaded view of the ``registry/*.parquet`` files.

<a id="registry.registry.MappingRegistry.settings"></a>

#### settings

<a id="registry.registry.MappingRegistry.mappings_biosphere"></a>

#### mappings\_biosphere

<a id="registry.registry.MappingRegistry.mappings_technosphere"></a>

#### mappings\_technosphere

<a id="registry.registry.MappingRegistry.unmatchable"></a>

#### unmatchable

<a id="registry.registry.MappingRegistry.unit_conversions"></a>

#### unit\_conversions

<a id="registry.registry.MappingRegistry.unit_aliases"></a>

#### unit\_aliases

<a id="registry.registry.MappingRegistry.context_normalisation"></a>

#### context\_normalisation

<a id="registry.registry.MappingRegistry.deletions"></a>

#### deletions

<a id="registry.registry.MappingRegistry.edge_label_corrections"></a>

#### edge\_label\_corrections

<a id="registry.registry.MappingRegistry.target_index_ef"></a>

#### target\_index\_ef

<a id="registry.registry.MappingRegistry.meta"></a>

#### meta

<a id="registry.registry.MappingRegistry.load"></a>

#### load

```python
@classmethod
def load(cls, settings: Settings) -> MappingRegistry
```

<a id="registry.registry.MappingRegistry.biosphere_index"></a>

#### biosphere\_index

```python
@cached_property
def biosphere_index() -> TieredNameBucketIndex
```

<a id="registry.registry.MappingRegistry.technosphere_index"></a>

#### technosphere\_index

```python
@cached_property
def technosphere_index() -> TieredNameBucketIndex
```

<a id="registry.registry.MappingRegistry.biosphere_cas_index"></a>

#### biosphere\_cas\_index

```python
@cached_property
def biosphere_cas_index() -> CasIndex
```

<a id="registry.registry.MappingRegistry.unit_converter"></a>

#### unit\_converter

```python
@cached_property
def unit_converter() -> UnitConverter
```

<a id="registry.registry.MappingRegistry.unmatchable_index"></a>

#### unmatchable\_index

```python
@cached_property
def unmatchable_index() -> UnmatchableIndex
```

<a id="registry.registry.MappingRegistry.total_biosphere_mappings"></a>

#### total\_biosphere\_mappings

```python
@property
def total_biosphere_mappings() -> int
```

<a id="registry.registry.MappingRegistry.total_technosphere_mappings"></a>

#### total\_technosphere\_mappings

```python
@property
def total_technosphere_mappings() -> int
```
