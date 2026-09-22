**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.inventory_exchanges` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.inventory_exchanges cfg.yml > sentier_importers.sources.bafu.inventory_exchanges.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.inventory_exchanges"></a>

# sentier\_importers.sources.bafu.inventory\_exchanges

BAFU-2026 -> sentier-inventory ``exchanges.parquet``, one registry entry per sector.

Flow ids: the production flow is the process's own UUID; technosphere
inputs resolve through the export-wide ``number -> uuid`` map (exact — 0
unresolved of 114,369 in the real export); biosphere flows get the deterministic
uuid5 shared with the ``bafu-elementary-flows`` vocab terms, so inventory and
vocabulary stay joinable by construction.

<a id="sentier_importers.sources.bafu.inventory_exchanges.BafuInventoryExchangesSource"></a>

## BafuInventoryExchangesSource Objects

```python
class BafuInventoryExchangesSource(Source)
```

Emit the exchange table rows for one sector folder.

<a id="sentier_importers.sources.bafu.inventory_exchanges.BafuInventoryExchangesSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.bafu.inventory_exchanges.BafuInventoryExchangesSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
