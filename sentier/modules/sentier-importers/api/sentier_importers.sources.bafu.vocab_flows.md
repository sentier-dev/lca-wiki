**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.vocab_flows` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.vocab_flows cfg.yml > sentier_importers.sources.bafu.vocab_flows.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.vocab_flows"></a>

# sentier\_importers.sources.bafu.vocab\_flows

BAFU-2026 elementary flows -> ``sentier_vocab`` (elementary-flows).

The distinct biosphere flows across all exchanges (name × category ×
subCategory), with the deterministic uuid5 id shared with the inventory
``exchanges.flow`` column. Dedup is ``on_existing: skip`` in the registry so
curated EF 3.1/ENVO terms are never clobbered.

<a id="sentier_importers.sources.bafu.vocab_flows.FLOWS_SCHEME"></a>

#### FLOWS\_SCHEME

Base of every published Sentier flow IRI.

<a id="sentier_importers.sources.bafu.vocab_flows.BafuVocabFlowsSource"></a>

## BafuVocabFlowsSource Objects

```python
class BafuVocabFlowsSource(Source)
```

Map distinct BAFU biosphere flows into ``ElementaryFlow`` terms, one file per compartment.

``emit_filename`` is the compartment slug (``emissions-to-air``,
``resources``, …): each registry entry emits only that compartment's flows,
so the delivered files are named by content, never by source. Without
``emit_filename`` the source emits every distinct flow.

<a id="sentier_importers.sources.bafu.vocab_flows.BafuVocabFlowsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.bafu.vocab_flows.BafuVocabFlowsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
