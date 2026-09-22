**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.mappings_biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.sources.agribalyse.mappings_biosphere cfg.yml > sentier_importers.sources.agribalyse.mappings_biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.mappings_biosphere"></a>

# sentier\_importers.sources.agribalyse.mappings\_biosphere

Agribalyse 3.2 → EF 3.1 biosphere crosswalk as a randonneur mapping package.

Source: the built ``registry/mappings_biosphere.parquet``. Emits a randonneur ``replace``
package for the ``agribalyse-3.2__ef-3.1`` pair in ``sentier-mappings``.

Scope guardrail (2026-07-10 decision — ignore ecoinvent nomenclature):
- keep only ``target_db in {"ef", "biosphere3"}`` (no ecoinvent-biosphere targets exist);
- drop any row whose ``provenance`` mentions ``ecoinvent``;
- drop the ~1.56M ``harmonised-flows-simple`` identity rows (already shipped as the flow
  vocabulary). What remains: the hand-authored curated + LLM-reviewed AGB→EF crosswalks.

<a id="sentier_importers.sources.agribalyse.mappings_biosphere.AgribalyseBiosphereMappingsSource"></a>

## AgribalyseBiosphereMappingsSource Objects

```python
class AgribalyseBiosphereMappingsSource(Source)
```

Map the biosphere registry table into randonneur ``replace`` entries.

<a id="sentier_importers.sources.agribalyse.mappings_biosphere.AgribalyseBiosphereMappingsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.mappings_biosphere.AgribalyseBiosphereMappingsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
