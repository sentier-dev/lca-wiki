**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.vocab_processes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.vocab_processes cfg.yml > sentier_importers.sources.bafu.vocab_processes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.vocab_processes"></a>

# sentier\_importers.sources.bafu.vocab\_processes

BAFU-2026 process terms -> ``sentier_vocab`` (processes).

One ``Process`` term per dataset, keyed on the dataset UUID. Obsolete datasets
are kept — live processes link into them — and marked in the definition.

<a id="sentier_importers.sources.bafu.vocab_processes.PROCESSES_SCHEME"></a>

#### PROCESSES\_SCHEME

Base of every published Sentier process IRI.

<a id="sentier_importers.sources.bafu.vocab_processes.SOURCE_PREFIX"></a>

#### SOURCE\_PREFIX

IRI path segment namespacing this source's ids.

<a id="sentier_importers.sources.bafu.vocab_processes.process_iri"></a>

#### process\_iri

```python
def process_iri(dataset_uuid: str) -> str
```

IRI for a BAFU process, keyed on its dataset UUID.

<a id="sentier_importers.sources.bafu.vocab_processes.BafuVocabProcessesSource"></a>

## BafuVocabProcessesSource Objects

```python
class BafuVocabProcessesSource(Source)
```

Map BAFU datasets into ``Process`` terms, one content-named file per sector.

``emit_filename`` is the sector slug (``agriculture`` … ``obsolete``): each
registry entry emits only the datasets routing to that sector, so the
delivered files are named by content, never by source. Without
``emit_filename`` the source emits every dataset.

<a id="sentier_importers.sources.bafu.vocab_processes.BafuVocabProcessesSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.bafu.vocab_processes.BafuVocabProcessesSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
