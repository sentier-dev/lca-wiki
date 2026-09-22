**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.processes` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.processes cfg.yml > sentier_importers.sources.agribalyse.processes.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.processes"></a>

# sentier\_importers.sources.agribalyse.processes

Import the Agribalyse 3.2 process catalog into ``sentier_vocab`` (processes).

Each CIQUAL product has one associated LCI process (its "LCI Name"). We describe those
processes as ``Process`` terms — **nomenclature only** (name, code, type; no geography IRI
and no exchanges, since the exchange amounts are the licensed LCI). One process per AGB code,
linked to its product term via ``related``.

<a id="sentier_importers.sources.agribalyse.processes.PROCESSES_SCHEME"></a>

#### PROCESSES\_SCHEME

Base of every published Sentier process IRI.

<a id="sentier_importers.sources.agribalyse.processes.SOURCE_PREFIX"></a>

#### SOURCE\_PREFIX

IRI path segment namespacing this source's codes.

<a id="sentier_importers.sources.agribalyse.processes.process_iri"></a>

#### process\_iri

```python
def process_iri(agb_code: str) -> str
```

IRI for an Agribalyse process, keyed on its AGB code.

<a id="sentier_importers.sources.agribalyse.processes.AgribalyseProcessesSource"></a>

## AgribalyseProcessesSource Objects

```python
class AgribalyseProcessesSource(Source)
```

Map each Agribalyse product's LCI process into a ``Process`` term.

<a id="sentier_importers.sources.agribalyse.processes.AgribalyseProcessesSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.processes.AgribalyseProcessesSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
