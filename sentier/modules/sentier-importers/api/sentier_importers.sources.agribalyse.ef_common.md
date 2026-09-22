**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.ef_common` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.ef_common cfg.yml > sentier_importers.sources.agribalyse.ef_common.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.ef_common"></a>

# sentier\_importers.sources.agribalyse.ef\_common

Shared helpers for the EF 3.1 LCIA import into ``sentier_methods``.

The methods (one per impact category) and characterization factors (one per CF) both come
from the JRC ``EF-LCIAMethod_CF(EF-v3.1)`` parquet. They land in
``sentier-methods/data/01-ef-3.1/{methods,characterization-factors}.parquet`` — the data
layer for LCIA methods, keyed by elementary flow (flows link to inventory via mappings).

CF values are JRC-public and uncapped. Flows are referenced by their vocab IRI
(``flows/<FLOW_uuid>``) so the CF table joins cleanly to the imported flow vocabulary.
No ecoinvent nomenclature is involved.

This module holds no ``Source`` subclass (registry contract: one Source per module).

<a id="sentier_importers.sources.agribalyse.ef_common.DATASOURCE"></a>

#### DATASOURCE

Datasource id (matches sentier-methods/data/01-ef-3.1/metadata.json).

<a id="sentier_importers.sources.agribalyse.ef_common.METHOD_NAME"></a>

#### METHOD\_NAME

Human-readable method name.

<a id="sentier_importers.sources.agribalyse.ef_common.METHOD_SOURCE"></a>

#### METHOD\_SOURCE

Citation stamped on every method row.

<a id="sentier_importers.sources.agribalyse.ef_common.FLOWS_SCHEME"></a>

#### FLOWS\_SCHEME

Base of the flow IRIs CFs reference (must match agribalyse.flows).

<a id="sentier_importers.sources.agribalyse.ef_common.EF31_SOURCE_IRI"></a>

#### EF31\_SOURCE\_IRI

Vocab term IRIs (the descriptive layer; the numeric CF data lives in sentier-methods).

<a id="sentier_importers.sources.agribalyse.ef_common.VOCAB_METHOD_IRI"></a>

#### VOCAB\_METHOD\_IRI

<a id="sentier_importers.sources.agribalyse.ef_common.VOCAB_IMPACT_SCHEME"></a>

#### VOCAB\_IMPACT\_SCHEME

<a id="sentier_importers.sources.agribalyse.ef_common.vocab_impact_iri"></a>

#### vocab\_impact\_iri

```python
def vocab_impact_iri(impact_category: str) -> str
```

Vocab IRI for an EF impact-category term.

<a id="sentier_importers.sources.agribalyse.ef_common.IMPACT_UNITS"></a>

#### IMPACT\_UNITS

EF 3.1 reference units per impact category (public JRC values; the CF parquet omits them).

<a id="sentier_importers.sources.agribalyse.ef_common.method_id"></a>

#### method\_id

```python
def method_id(impact_category: str) -> str
```

Stable ``<datasource>:<impact_category>`` primary key.

<a id="sentier_importers.sources.agribalyse.ef_common.flow_iri"></a>

#### flow\_iri

```python
def flow_iri(flow_uuid: str) -> str
```

Vocab flow IRI a CF points at — matches the agribalyse flow import.

<a id="sentier_importers.sources.agribalyse.ef_common.unit_for"></a>

#### unit\_for

```python
def unit_for(impact_category: str) -> str
```

EF reference unit for an impact category (empty string if unknown).

<a id="sentier_importers.sources.agribalyse.ef_common.parse_cf_table"></a>

#### parse\_cf\_table

```python
def parse_cf_table(raw: RawData) -> Records
```

Read the EF CF parquet into per-row records (uuid, name, method, cf, ctx, loc).

<a id="sentier_importers.sources.agribalyse.ef_common.distinct_method_names"></a>

#### distinct\_method\_names

```python
def distinct_method_names(records: Records) -> list[str]
```

Ordered distinct ``LCIAMethod_name`` values (the EF impact categories).
