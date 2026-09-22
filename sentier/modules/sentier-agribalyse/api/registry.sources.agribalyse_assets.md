**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `registry.sources.agribalyse_assets` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m registry.sources.agribalyse_assets cfg.yml > registry.sources.agribalyse_assets.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="registry.sources.agribalyse_assets"></a>

# registry.sources.agribalyse\_assets

Source ingesters for the AGB-specific JSON files in ``source/``.

These are the agribalyse-3.2-* files we ship locally:

* ``agribalyse-3.2-ecoinvent-3.10-biosphere.json`` → biosphere mappings (tier 4)
* ``agribalyse-3.2-correct-ecoinvent-edge-labels.json`` → edge_label_corrections
* ``agribalyse-3.2-delete-aggregated-ecoinvent-{processes,products}.json`` → deletions

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource"></a>

## AGB32FlowmapperBiosphereSource Objects

```python
@dataclass(frozen=True)
class AGB32FlowmapperBiosphereSource()
```

``agribalyse-3.2-ecoinvent-3.10-biosphere.json`` — Flowmapper-generated
SimaPro-9 → ecoinvent-3.10-biosphere mappings (~4 039 rows, ``update`` key).

UUID-pinned (``target.identifier`` always present); ``target_db`` is left
empty because the JSON only declares the identifier. ``BiosphereMatcher``
walks the configured biosphere DBs (configured bio + EF + biosphere3) to
resolve the UUID, both in ``_resolve_target`` (final pick) and in
``_sub_rank`` (sub-compartment-aware tie-break). Wired to tier
``AGRIBALYSE_EI_BIOSPHERE`` (4).

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.path"></a>

#### path

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.json"></a>

#### json

type: ignore[assignment]

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.tier"></a>

#### tier

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.provenance"></a>

#### provenance

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="registry.sources.agribalyse_assets.AGB32FlowmapperBiosphereSource.read"></a>

#### read

```python
def read() -> list[Mapping]
```

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource"></a>

## AgbDeleteAggregatedSource Objects

```python
@dataclass(frozen=True)
class AgbDeleteAggregatedSource()
```

Combines the two ``delete-aggregated-ecoinvent-*.json`` files into ``Deletion`` rows.

Fix 1.m: the original linker matches by name only, which can collide.
The registry stores both ``name`` and ``code`` so the matcher can
tighten matching when both are present.

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.processes_path"></a>

#### processes\_path

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.products_path"></a>

#### products\_path

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.json"></a>

#### json

type: ignore[assignment]

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.provenance"></a>

#### provenance

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="registry.sources.agribalyse_assets.AgbDeleteAggregatedSource.read"></a>

#### read

```python
def read() -> list[Deletion]
```

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource"></a>

## AgbEdgeLabelsSource Objects

```python
@dataclass(frozen=True)
class AgbEdgeLabelsSource()
```

``agribalyse-3.2-correct-ecoinvent-edge-labels.json`` (~2 123 rows).

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource.path"></a>

#### path

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource.json"></a>

#### json

type: ignore[assignment]

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource.provenance"></a>

#### provenance

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="registry.sources.agribalyse_assets.AgbEdgeLabelsSource.read"></a>

#### read

```python
def read() -> list[EdgeLabelCorrection]
```
