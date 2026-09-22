**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.provenance` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.provenance cfg.yml > sentier_importers.sources.bafu.provenance.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.provenance"></a>

# sentier\_importers.sources.bafu.provenance

BAFU-2026 bibliographic provenance -> a single Sentier ``Source`` record.

Every BAFU vocab term links here via its ``source`` slot.

<a id="sentier_importers.sources.bafu.provenance.BAFU_PROVENANCE_IRI"></a>

#### BAFU\_PROVENANCE\_IRI

The Source IRI every imported BAFU term links to.

<a id="sentier_importers.sources.bafu.provenance.BAFU_PROVENANCE"></a>

#### BAFU\_PROVENANCE

Static bibliographic metadata for the BAFU:2026 v1 release.

<a id="sentier_importers.sources.bafu.provenance.BafuProvenance"></a>

## BafuProvenance Objects

```python
class BafuProvenance(Source)
```

Emit one ``Source`` row describing the BAFU:2026 database. No fetch input.

<a id="sentier_importers.sources.bafu.provenance.BafuProvenance.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData | None
```

<a id="sentier_importers.sources.bafu.provenance.BafuProvenance.parse"></a>

#### parse

```python
def parse(raw: RawData | None) -> Records
```

<a id="sentier_importers.sources.bafu.provenance.BafuProvenance.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
