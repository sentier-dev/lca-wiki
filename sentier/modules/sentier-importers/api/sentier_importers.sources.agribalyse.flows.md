**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.flows` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.flows cfg.yml > sentier_importers.sources.agribalyse.flows.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.flows"></a>

# sentier\_importers.sources.agribalyse.flows

Import the EF 3.1 harmonised elementary flows into ``sentier_vocab``.

Reads the license-free ``harmonised-flows-simple.json.gz`` (EF 3.1 = JRC public,
nomenclature only) and maps each ``source == "EF 3.1"`` flow to an ``ElementaryFlow``
SKOS row. Flows tagged ``ecoinvent algorithm addition`` are excluded pending review.

<a id="sentier_importers.sources.agribalyse.flows.FLOWS_SCHEME"></a>

#### FLOWS\_SCHEME

Base of every published Sentier flow IRI.

<a id="sentier_importers.sources.agribalyse.flows.ALLOWED_SOURCE"></a>

#### ALLOWED\_SOURCE

Only flows from this upstream source are imported (see plan §guardrails).

<a id="sentier_importers.sources.agribalyse.flows.compartment_for_context"></a>

#### compartment\_for\_context

```python
def compartment_for_context(context_iri: str | None) -> str | None
```

Coarse compartment for a brightway.one flow-context IRI, or ``None``.

<a id="sentier_importers.sources.agribalyse.flows.strip_html"></a>

#### strip\_html

```python
def strip_html(text: str) -> str
```

Remove HTML tags and collapse whitespace from a label.

<a id="sentier_importers.sources.agribalyse.flows.cas_number"></a>

#### cas\_number

```python
def cas_number(flow: Record) -> str | None
```

First CAS number, or ``None``.

<a id="sentier_importers.sources.agribalyse.flows.formula"></a>

#### formula

```python
def formula(flow: Record) -> str | None
```

Molecular formula from the chemrof properties, or ``None``.

The property is usually a scalar but is sometimes a list of candidate formulas
(isomers/salts); the schema wants a single string, so take the first.

<a id="sentier_importers.sources.agribalyse.flows.exact_matches"></a>

#### exact\_matches

```python
def exact_matches(flow: Record) -> list[str]
```

Crosswalk IRIs from exactMatch concept associations (source + target @ids).

<a id="sentier_importers.sources.agribalyse.flows.extra_notations"></a>

#### extra\_notations

```python
def extra_notations(flow: Record) -> list[str]
```

Preserved source identifiers: EC numbers and the raw brightway context slug.

<a id="sentier_importers.sources.agribalyse.flows.compartment_slug"></a>

#### compartment\_slug

```python
def compartment_slug(compartment: str) -> str
```

File-name slug of a compartment (``natural resource`` -> ``natural-resource``).

<a id="sentier_importers.sources.agribalyse.flows.AgribalyseFlowsSource"></a>

## AgribalyseFlowsSource Objects

```python
class AgribalyseFlowsSource(Source)
```

Map the EF 3.1 harmonised flow list into ``ElementaryFlow`` SKOS rows.

``emit_filename`` is the compartment slug (``air``, ``natural-resource``, …):
each registry entry emits only that compartment's flows, so the delivered
files are named by content, never by source. Without ``emit_filename`` the
source emits every flow. In a filtered run a flow whose compartment cannot
be resolved raises — it would otherwise silently vanish from every slice.

<a id="sentier_importers.sources.agribalyse.flows.AgribalyseFlowsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

Gunzip the ``.json.gz`` payload and return its ``flows`` list.

<a id="sentier_importers.sources.agribalyse.flows.AgribalyseFlowsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
