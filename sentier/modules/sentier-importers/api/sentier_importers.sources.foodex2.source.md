**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.foodex2.source` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.foodex2.source cfg.yml > sentier_importers.sources.foodex2.source.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.foodex2.source"></a>

# sentier\_importers.sources.foodex2.source

FoodEx2 (EFSA food classification) imported from the EFSA *primary* source.

The catalogue is EFSA's **MTX** (the FoodEx2 matrix), published at
``openefsa/efsa-catalogues`` as ``MTX.ecf`` — a ZIP wrapping a single ``MTX.xml``
(~95 MB). We pin a specific commit (catalogue v17.1) so a re-import is a deliberate,
reviewed bump rather than silent drift. This **replaces** the former third-party
``esfc-glossary`` pull (AGPL, opaque AI mapping). See
``docs/specs/2026-06-23-foodex2-mtx-primary-source.md``.

**Routing.** Each term's ``termType`` attribute decides its Sentier category:

    n           biological source taxa            -> organisms
    r d s c g   commodities & grouping nodes       -> products
    f           facet descriptors                  -> qualifiers

Nothing is dropped — every term lands in exactly one category. A term's IRI is
category-namespaced (``<root>/<category>/foodex2/<code>``), so a cross-reference
(``broader``, ``related``) can point into another category. ``transform`` therefore
builds a global ``code -> category`` index over *all* terms first, so any referenced
code resolves to the right namespace regardless of which slice is being emitted.

**Parity.** The emitted row shape is identical to the previous importer's: the same
slots, derived field-for-field from MTX (see the spec's mapping table). No schema or
downstream change — the rows still feed the Parquet/TTL pipeline unchanged.

<a id="sentier_importers.sources.foodex2.source.IRI_ROOT"></a>

#### IRI\_ROOT

Root of every published Sentier IRI; a category scheme is ``<ROOT>/<category>/``.

<a id="sentier_importers.sources.foodex2.source.SOURCE_PREFIX"></a>

#### SOURCE\_PREFIX

IRI path segment that namespaces this source's codes.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source"></a>

## Foodex2Source Objects

```python
class Foodex2Source(Source)
```

Map EFSA's MTX (FoodEx2) catalogue into Sentier SKOS ``Concept`` rows.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.__init__"></a>

#### \_\_init\_\_

```python
def __init__(config) -> None
```

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

Unzip the ``.ecf`` and stream every ``<term>`` out of ``MTX.xml``.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.classify"></a>

#### classify

```python
def classify(term: Record) -> str
```

Sentier category for ``term``, from its ``termType`` attribute.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.notation"></a>

#### notation

```python
def notation(term: Record) -> str | None
```

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.pref_label"></a>

#### pref\_label

```python
def pref_label(term: Record) -> str
```

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.definition"></a>

#### definition

```python
def definition(term: Record) -> str | None
```

Scope note with the trailing ``£``-delimited source URLs stripped off.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.alt_labels"></a>

#### alt\_labels

```python
def alt_labels(term: Record) -> list[str]
```

Synonyms: short name + common names (A02) + scientific names (A01).

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.broader"></a>

#### broader

```python
def broader(term: Record) -> str | None
```

Parent IRI, from the master-hierarchy ``parentCode`` (``None`` if unresolved).

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.related"></a>

#### related

```python
def related(term: Record) -> list[str]
```

FoodEx2 facet links -> ``related`` IRIs (drop self-refs and unknown codes).

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.additional_notations"></a>

#### additional\_notations

```python
def additional_notations(term: Record) -> list[str]
```

Legacy/external identifiers kept verbatim with a namespace prefix.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.iri_for_code"></a>

#### iri\_for\_code

```python
def iri_for_code(code: str | None) -> str | None
```

Category-namespaced IRI for a code, or ``None`` if the code is unknown.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.make_iri"></a>

#### make\_iri

```python
def make_iri(term: Record) -> str
```

Stable IRI: code-based when available, else a label slug.

<a id="sentier_importers.sources.foodex2.source.Foodex2Source.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```

Route each term, then mint a ``Concept``-shaped row for the matching slice.

Optional slots are emitted only when present so closed-world LinkML validation
passes. Terms without a ``pref_label`` (schema-required) are skipped.
