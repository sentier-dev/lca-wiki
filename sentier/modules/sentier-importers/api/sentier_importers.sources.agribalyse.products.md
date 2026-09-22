**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.products` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.products cfg.yml > sentier_importers.sources.agribalyse.products.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.products"></a>

# sentier\_importers.sources.agribalyse.products

Import Agribalyse 3.2 (CIQUAL) products into ``sentier_vocab``.

Source: the ADEME *reference synthese* workbook (``AGRIBALYSE3.2_reference_synthese_raw``),
published as French open data (Licence Ouverte / Etalab). We import only the product
**nomenclature** — CIQUAL/AGB codes, French names, and the food-group hierarchy — never
the impact scores or any LCI amounts.

The raw parquet carries a two-row preamble; the real column header is at row index 2 and
data starts at row 3 (see the ship manifest). A three-level SKOS hierarchy is emitted:
food group → sub-group → product, linked by ``broader``.

<a id="sentier_importers.sources.agribalyse.products.PRODUCTS_SCHEME"></a>

#### PRODUCTS\_SCHEME

Base of every published Sentier product IRI.

<a id="sentier_importers.sources.agribalyse.products.SOURCE_PREFIX"></a>

#### SOURCE\_PREFIX

IRI path segment namespacing this source's codes.

<a id="sentier_importers.sources.agribalyse.products.parse_reference_synthese"></a>

#### parse\_reference\_synthese

```python
def parse_reference_synthese(raw: RawData) -> Records
```

Read the reference-synthese parquet, take the header from row 2, stream data rows.

Shared by the products and processes importers (both key off the same workbook).

<a id="sentier_importers.sources.agribalyse.products.group_iri"></a>

#### group\_iri

```python
def group_iri(name: str) -> str
```

IRI for a food-group grouping term.

<a id="sentier_importers.sources.agribalyse.products.subgroup_iri"></a>

#### subgroup\_iri

```python
def subgroup_iri(name: str) -> str
```

IRI for a food-subgroup grouping term.

<a id="sentier_importers.sources.agribalyse.products.product_iri"></a>

#### product\_iri

```python
def product_iri(agb_code: str) -> str
```

IRI for a product, keyed on its AGB code.

<a id="sentier_importers.sources.agribalyse.products.AgribalyseProductsSource"></a>

## AgribalyseProductsSource Objects

```python
class AgribalyseProductsSource(Source)
```

Map the Agribalyse reference synthese into ``Product`` SKOS rows.

<a id="sentier_importers.sources.agribalyse.products.AgribalyseProductsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.products.AgribalyseProductsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
