**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.vocab_lcia_methods` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.vocab_lcia_methods cfg.yml > sentier_importers.sources.agribalyse.vocab_lcia_methods.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.vocab_lcia_methods"></a>

# sentier\_importers.sources.agribalyse.vocab\_lcia\_methods

Describe EF 3.1 as a Sentier ``LCIAMethod`` vocab term (the descriptive layer).

The numeric CF data lives in sentier-methods; here we mint the canonical method term and
link its impact categories. Reads the EF CF parquet only to enumerate the categories.

<a id="sentier_importers.sources.agribalyse.vocab_lcia_methods.AgribalyseEfLciaMethodSource"></a>

## AgribalyseEfLciaMethodSource Objects

```python
class AgribalyseEfLciaMethodSource(Source)
```

Emit the single EF 3.1 ``LCIAMethod`` term, linking its impact categories.

<a id="sentier_importers.sources.agribalyse.vocab_lcia_methods.AgribalyseEfLciaMethodSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.vocab_lcia_methods.AgribalyseEfLciaMethodSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
