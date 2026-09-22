**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.foodex2.provenance` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.foodex2.provenance cfg.yml > sentier_importers.sources.foodex2.provenance.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.foodex2.provenance"></a>

# sentier\_importers.sources.foodex2.provenance

FoodEx2 bibliographic provenance → a single Sentier ``Source`` record.

Registered as its own ``foodex2-source`` block (category ``sources``) so re-running the
importer regenerates ``data/sources/foodex2.yaml`` rather than it being hand-maintained.
The IRI is shared with :mod:`sentier_importers.sources.foodex2.source`, which stamps it
onto every product's ``source`` slot.

<a id="sentier_importers.sources.foodex2.provenance.PROVENANCE_IRI"></a>

#### PROVENANCE\_IRI

The Source IRI products link to. Lives under the ``sources`` ConceptScheme.

<a id="sentier_importers.sources.foodex2.provenance.CATALOGUE_VERSION"></a>

#### CATALOGUE\_VERSION

--- Pinned EFSA primary source (the MTX = FoodEx2 catalogue) -------------------
We import directly from EFSA's official distribution (openefsa/efsa-catalogues),
NOT a third-party repackaging. The catalogue is pinned to a specific commit so a
re-import is a deliberate, reviewed bump (see the 2026-06-23 MTX-primary-source spec).
Imported MTX catalogue version (``<catalogueVersion><version>``), validFrom 2026-04-28.

<a id="sentier_importers.sources.foodex2.provenance.CATALOGUE_COMMIT"></a>

#### CATALOGUE\_COMMIT

Pinned commit of ``openefsa/efsa-catalogues`` holding that version.

<a id="sentier_importers.sources.foodex2.provenance.MTX_URL"></a>

#### MTX\_URL

The pinned download URL for ``MTX.ecf`` (a ZIP wrapping ``MTX.xml``).

<a id="sentier_importers.sources.foodex2.provenance.PROVENANCE"></a>

#### PROVENANCE

Static bibliographic metadata for the FoodEx2 (revision 2) publication.

<a id="sentier_importers.sources.foodex2.provenance.Foodex2Provenance"></a>

## Foodex2Provenance Objects

```python
class Foodex2Provenance(Source)
```

Emit one ``Source`` row describing the FoodEx2 dataset. Needs no fetch input.

<a id="sentier_importers.sources.foodex2.provenance.Foodex2Provenance.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData | None
```

<a id="sentier_importers.sources.foodex2.provenance.Foodex2Provenance.parse"></a>

#### parse

```python
def parse(raw: RawData | None) -> Records
```

<a id="sentier_importers.sources.foodex2.provenance.Foodex2Provenance.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
