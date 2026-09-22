**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.catalog_key_resolver` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_export.catalog_key_resolver cfg.yml > bw_export.catalog_key_resolver.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.catalog_key_resolver"></a>

# bw\_export.catalog\_key\_resolver

``CatalogKeyResolver`` — integer node id → ``(database, code)`` + labels.

The technosphere/biosphere matrices carry only integer ids (63-bit SHA-256
hashes of ``(database, code)`` — see
:meth:`scoring.exchange_frame_builder.ExchangeFrameBuilder.flow_id_for`). A
``bw2data`` project keys every node by ``(database, code)``, so the bw2 export
must recover those string keys. We do it by hashing each catalog row's
``(database, code)`` forward and indexing by the resulting id — the same join
the metadata emitter performs.

Ids absent from the catalogs (the label join is best-effort) fall back to a
synthetic ``(fallback_db, str(id))`` key so every matrix node stays addressable
and the project remains importable; only the human-readable label is lost.

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver"></a>

## CatalogKeyResolver Objects

```python
@dataclass
class CatalogKeyResolver()
```

Builds id→key maps once, then resolves O(1) per node.

``synthetic_flow_codes`` maps a synthetic AWARE correction flow id to a
stable code (e.g. ``"aware-<method-slug>"``) so those flows get meaningful,
collision-free keys instead of an opaque integer.

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.product_catalog"></a>

#### product\_catalog

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.biosphere_catalog"></a>

#### biosphere\_catalog

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.ecoinvent_catalog"></a>

#### ecoinvent\_catalog

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.synthetic_flow_codes"></a>

#### synthetic\_flow\_codes

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.activity_catalog"></a>

#### activity\_catalog

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.activity"></a>

#### activity

```python
def activity(col_id: int) -> ActivityMeta
```

<a id="bw_export.catalog_key_resolver.CatalogKeyResolver.biosphere"></a>

#### biosphere

```python
def biosphere(bioflow_id: int) -> BioMeta
```
