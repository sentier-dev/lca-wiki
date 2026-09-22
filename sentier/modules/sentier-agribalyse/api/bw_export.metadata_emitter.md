**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_export.metadata_emitter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_export.metadata_emitter cfg.yml > bw_export.metadata_emitter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_export.metadata_emitter"></a>

# bw\_export.metadata\_emitter

``MetadataEmitter`` — importer-sufficient metadata + manifest + examples.

Writes ``metadata/{activities,products,biosphere}.parquet``,
``metadata/{methods,parity_samples}.json``, ``metadata/manifest.json``, and the
self-contained ``run_example.py`` + ``README.md`` into the output root.

The activities and biosphere tables are **load-bearing** for
``import_into_brightway.py``: every technosphere column is fully resolved to
``(database, code, name, unit, location, reference_product)`` plus the
``production_product_id`` (the reference-product row that pins its production
exchange), and every biosphere row carries its ``(database, code)`` key. The
emit fails loudly if any column cannot be named, because a nameless column would
produce an unusable Brightway database rather than a silently degraded one.

<a id="bw_export.metadata_emitter.ActivityResolver"></a>

#### ActivityResolver

<a id="bw_export.metadata_emitter.BioResolver"></a>

#### BioResolver

<a id="bw_export.metadata_emitter.MetadataEmitter"></a>

## MetadataEmitter Objects

```python
@dataclass(frozen=True)
class MetadataEmitter()
```

<a id="bw_export.metadata_emitter.MetadataEmitter.emit"></a>

#### emit

```python
def emit(*, out_root: Path, embedded: EmbeddedInventory, written: WriteResult,
         activity_resolver: ActivityResolver, bio_resolver: BioResolver,
         product_catalog: pd.DataFrame,
         parity_scores: dict[int, dict[tuple[str, ...],
                                       float]], parity_tolerance: float,
         manifest_extra: dict[str, Any], parity: dict[str, Any]) -> None
```
