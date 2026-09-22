**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.agribalyse_provenance` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.agribalyse_provenance cfg.yml > sentier_importers.sources.agribalyse.agribalyse_provenance.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance"></a>

# sentier\_importers.sources.agribalyse.agribalyse\_provenance

Agribalyse 3.2 bibliographic provenance → a single Sentier ``Source`` record.

Registered as its own ``agribalyse-source`` block (category ``sources``). The IRI is
shared with :mod:`agribalyse.products`, which stamps it onto every product's ``source``
slot. One Source subclass per module (registry contract).

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AGRIBALYSE_PROVENANCE_IRI"></a>

#### AGRIBALYSE\_PROVENANCE\_IRI

The Source IRI every imported Agribalyse product links to.

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AGRIBALYSE_PROVENANCE"></a>

#### AGRIBALYSE\_PROVENANCE

Static bibliographic metadata for the ADEME Agribalyse 3.2 reference release.

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AgribalyseProvenance"></a>

## AgribalyseProvenance Objects

```python
class AgribalyseProvenance(Source)
```

Emit one ``Source`` row describing the Agribalyse 3.2 dataset. No fetch input.

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AgribalyseProvenance.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData | None
```

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AgribalyseProvenance.parse"></a>

#### parse

```python
def parse(raw: RawData | None) -> Records
```

<a id="sentier_importers.sources.agribalyse.agribalyse_provenance.AgribalyseProvenance.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
