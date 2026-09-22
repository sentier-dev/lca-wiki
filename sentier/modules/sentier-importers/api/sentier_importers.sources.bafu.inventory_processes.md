**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.inventory_processes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.inventory_processes cfg.yml > sentier_importers.sources.bafu.inventory_processes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.inventory_processes"></a>

# sentier\_importers.sources.bafu.inventory\_processes

BAFU-2026 -> sentier-inventory ``processes.parquet``, one registry entry per sector.

Each entry's ``category`` is the sector folder (``NN-<sector>``); ``transform``
keeps only the datasets whose BAFU category routes there. Rows follow the
sentier-inventory ``schema/process.yaml`` contract exactly.

<a id="sentier_importers.sources.bafu.inventory_processes.process_comment"></a>

#### process\_comment

```python
def process_comment(record: Record) -> str
```

Provenance comment: BAFU category path, obsolete marker, source citation.

<a id="sentier_importers.sources.bafu.inventory_processes.BafuInventoryProcessesSource"></a>

## BafuInventoryProcessesSource Objects

```python
class BafuInventoryProcessesSource(Source)
```

Emit the process table rows for one sector folder.

<a id="sentier_importers.sources.bafu.inventory_processes.BafuInventoryProcessesSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.bafu.inventory_processes.BafuInventoryProcessesSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
