**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.eaternity.mappings_biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.eaternity.mappings_biosphere cfg.yml > sentier_importers.sources.eaternity.mappings_biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.eaternity.mappings_biosphere"></a>

# sentier\_importers.sources.eaternity.mappings\_biosphere

bafu-2026-v1 -> EF 3.1 CF keys inferred from Eaternity's biosphere3 pair family.

Primary input: the ``ecoinvent-biosphere3 -> eaternity-bafu-ext`` package (Eaternity,
sentier-mappings PR #7). Named inputs:

- ``curated``: the ``bafu-2026-v1 -> ef-3.1`` curated package (biosphere-1-curated),
  whose source codes are excluded (the curated package keeps precedence; this bridge
  only fills its gaps);
- ``ecospold``: the BAFU-2026 v1 ecoSpold zip, the flow-identity authority;
- ``ef_flows``: sentier-methods' EF 3.1 CF table, for EF flow names and contexts;
- ``method_cfs``: a *directory* of ``<method>/cfs.parquet`` tables (<private>
  layout) holding the EF v3.1 factors matched onto both flow universes. Read from
  the local path directly, not through the fetch cache.

Emits ``biosphere-2-inferred.json`` of the ``bafu-2026-v1__ef-3.1`` pair. The sibling
:mod:`inference_review` source emits the withheld pairs. See ``inference.py``.

<a id="sentier_importers.sources.eaternity.mappings_biosphere.EaternityInferredBafuEfSource"></a>

## EaternityInferredBafuEfSource Objects

```python
class EaternityInferredBafuEfSource(Source)
```

Compose the ecoinvent-biosphere3 -> eaternity-bafu-ext bridge with CF identity
into ``bafu-2026-v1 -> ef-3.1`` replace entries.

<a id="sentier_importers.sources.eaternity.mappings_biosphere.EaternityInferredBafuEfSource.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData
```

<a id="sentier_importers.sources.eaternity.mappings_biosphere.EaternityInferredBafuEfSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

One record holding every parsed input; ``transform`` composes them.

<a id="sentier_importers.sources.eaternity.mappings_biosphere.EaternityInferredBafuEfSource.infer"></a>

#### infer

```python
def infer(records: Records) -> Inference
```

<a id="sentier_importers.sources.eaternity.mappings_biosphere.EaternityInferredBafuEfSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
