**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.builder cfg.yml > registry.builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.builder"></a>

# registry.builder

``RegistryBuilder``: orchestrate every source ingester into ``registry/*.parquet``.

Each tier's mappings are deduplicated by ``(source_kind, source_name_lower,
source_top_bucket, source_unit, target_db, target_code, target_name,
priority_tier)`` so re-runs are idempotent and the harmonised-flows altLabel
explosion (≈1.6M rows) shrinks before write.

Sources are constructed once in ``_build_sources()`` so the builder owns
its dependency graph; callers pass only ``Settings``.

<a id="registry.builder._SourceBundle"></a>

## \_SourceBundle Objects

```python
@dataclass(frozen=True)
class _SourceBundle()
```

All concrete source instances bound to one ``Settings``.

<a id="registry.builder._SourceBundle.biosphere_mapping_sources"></a>

#### biosphere\_mapping\_sources

<a id="registry.builder._SourceBundle.technosphere_mapping_sources"></a>

#### technosphere\_mapping\_sources

<a id="registry.builder._SourceBundle.unmatchable_sources"></a>

#### unmatchable\_sources

<a id="registry.builder._SourceBundle.unit_conversion_sources"></a>

#### unit\_conversion\_sources

<a id="registry.builder._SourceBundle.unit_alias_sources"></a>

#### unit\_alias\_sources

<a id="registry.builder._SourceBundle.context_sources"></a>

#### context\_sources

<a id="registry.builder._SourceBundle.deletion_sources"></a>

#### deletion\_sources

<a id="registry.builder._SourceBundle.edge_label_sources"></a>

#### edge\_label\_sources

<a id="registry.builder._SourceBundle.ef_target_sources"></a>

#### ef\_target\_sources

<a id="registry.builder.RegistryBuilder"></a>

## RegistryBuilder Objects

```python
@dataclass(frozen=True)
class RegistryBuilder()
```

Build ``registry/*.parquet`` from every authoritative source.

<a id="registry.builder.RegistryBuilder.settings"></a>

#### settings

<a id="registry.builder.RegistryBuilder.build"></a>

#### build

```python
def build() -> dict[str, Any]
```

Materialise every parquet + write registry.meta.json. Idempotent.
