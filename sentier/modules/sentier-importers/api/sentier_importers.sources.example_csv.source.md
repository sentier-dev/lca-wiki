**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.example_csv.source` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.example_csv.source cfg.yml > sentier_importers.sources.example_csv.source.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.example_csv.source"></a>

# sentier\_importers.sources.example\_csv.source

A minimal reference source.

Demonstrates the override hook: it reads a bundled CSV via the cached fetcher so the
pipeline runs fully offline (in CI). A typical real source would instead just declare
a ``fetch_url`` in ``registry.yaml`` and rely on the default ``fetch``.

<a id="sentier_importers.sources.example_csv.source.ExampleCsvSource"></a>

## ExampleCsvSource Objects

```python
class ExampleCsvSource(Source)
```

Normalize a small CSV of widgets into ``{id, label, region}`` rows.

<a id="sentier_importers.sources.example_csv.source.ExampleCsvSource.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData
```

<a id="sentier_importers.sources.example_csv.source.ExampleCsvSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
