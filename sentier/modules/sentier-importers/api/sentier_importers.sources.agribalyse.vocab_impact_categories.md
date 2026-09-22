**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.vocab_impact_categories` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.vocab_impact_categories cfg.yml > sentier_importers.sources.agribalyse.vocab_impact_categories.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.vocab_impact_categories"></a>

# sentier\_importers.sources.agribalyse.vocab\_impact\_categories

Describe the 25 EF 3.1 impact categories as Sentier ``ImpactCategory`` vocab terms.

<a id="sentier_importers.sources.agribalyse.vocab_impact_categories.AgribalyseEfImpactCategoriesSource"></a>

## AgribalyseEfImpactCategoriesSource Objects

```python
class AgribalyseEfImpactCategoriesSource(Source)
```

Emit one ``ImpactCategory`` term per distinct EF 3.1 method name.

<a id="sentier_importers.sources.agribalyse.vocab_impact_categories.AgribalyseEfImpactCategoriesSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.vocab_impact_categories.AgribalyseEfImpactCategoriesSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
