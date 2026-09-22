**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.bw_node_types` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_export.bw_node_types cfg.yml > bw_export.bw_node_types.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.bw_node_types"></a>

# bw\_export.bw\_node\_types

Node key + resolved-label value types shared by the bw2 export path.

The label value types are produced by
:class:`bw_export.catalog_key_resolver.CatalogKeyResolver` and consumed by
:class:`bw_export.metadata_emitter.MetadataEmitter`, so they keep a small
dependency-free home here.

<a id="bw_export.bw_node_types.NodeKey"></a>

#### NodeKey

<a id="bw_export.bw_node_types.ActivityMeta"></a>

## ActivityMeta Objects

```python
@dataclass(frozen=True)
class ActivityMeta()
```

Resolved label metadata for one technosphere column.

<a id="bw_export.bw_node_types.ActivityMeta.key"></a>

#### key

<a id="bw_export.bw_node_types.ActivityMeta.name"></a>

#### name

<a id="bw_export.bw_node_types.ActivityMeta.unit"></a>

#### unit

<a id="bw_export.bw_node_types.ActivityMeta.location"></a>

#### location

<a id="bw_export.bw_node_types.ActivityMeta.reference_product"></a>

#### reference\_product

<a id="bw_export.bw_node_types.BioMeta"></a>

## BioMeta Objects

```python
@dataclass(frozen=True)
class BioMeta()
```

Resolved label metadata for one biosphere row.

<a id="bw_export.bw_node_types.BioMeta.key"></a>

#### key

<a id="bw_export.bw_node_types.BioMeta.name"></a>

#### name

<a id="bw_export.bw_node_types.BioMeta.categories"></a>

#### categories

<a id="bw_export.bw_node_types.BioMeta.unit"></a>

#### unit

<a id="bw_export.bw_node_types.BioMeta.is_synthetic_correction"></a>

#### is\_synthetic\_correction
