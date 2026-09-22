**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.provenance` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.provenance cfg.yml > sentier_importers.sources.agribalyse.provenance.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.provenance"></a>

# sentier\_importers.sources.agribalyse.provenance

EF 3.1 flow-list bibliographic provenance → a single Sentier ``Source`` record.

The harmonised elementary-flow list imported by :mod:`agribalyse.flows` is the
European Commission / JRC Environmental Footprint 3.1 reference package. This
module emits the one ``Source`` term every flow links to via its ``source`` slot,
and pins the URL of the published, license-free flow artifact.

<a id="sentier_importers.sources.agribalyse.provenance.PROVENANCE_IRI"></a>

#### PROVENANCE\_IRI

The Source IRI every imported flow links to. Lives under the ``sources`` scheme.

<a id="sentier_importers.sources.agribalyse.provenance.HARMONISED_FLOWS_URL"></a>

#### HARMONISED\_FLOWS\_URL

Pinned download URL of the license-free harmonised flow list (see plan Task 0).

<a id="sentier_importers.sources.agribalyse.provenance.PROVENANCE"></a>

#### PROVENANCE

Static bibliographic metadata for the EF 3.1 reference package.

<a id="sentier_importers.sources.agribalyse.provenance.AgribalyseEf31Provenance"></a>

## AgribalyseEf31Provenance Objects

```python
class AgribalyseEf31Provenance(Source)
```

Emit one ``Source`` row describing the EF 3.1 flow list. Needs no fetch input.

<a id="sentier_importers.sources.agribalyse.provenance.AgribalyseEf31Provenance.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData | None
```

<a id="sentier_importers.sources.agribalyse.provenance.AgribalyseEf31Provenance.parse"></a>

#### parse

```python
def parse(raw: RawData | None) -> Records
```

<a id="sentier_importers.sources.agribalyse.provenance.AgribalyseEf31Provenance.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
