**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.cfs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.cfs cfg.yml > sentier_importers.sources.agribalyse.cfs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.cfs"></a>

# sentier\_importers.sources.agribalyse.cfs

EF 3.1 characterization factors for sentier-methods (one row per CF).

Keyed to the vocab flow IRIs (``flows/<FLOW_uuid>``) and the EF methods table
(``method_id``). CF values are JRC-public and uncapped; no ecoinvent involvement.

The JRC source table lists TWO rows with different values for 182 (flow, method)
pairs at the global level (``LCIAMethod_location`` empty): 171 Land use flows and 11
Water use flows. These are resolved deterministically before emission rather than
kept first-row-wins -- see :mod:`sentier_importers.sources.agribalyse.ef_cf_dedup` for
the full rule (water: the AWARE 42.95-family default; land: symmetric ``from X``/
``to X`` pairs, arbitrated by the SimaPro "EF 3.1 adapted" export when ambiguous or
partnerless, else the larger ``|value|``). Country-level rows are never touched.

<a id="sentier_importers.sources.agribalyse.cfs.AgribalyseEfCfsSource"></a>

## AgribalyseEfCfsSource Objects

```python
class AgribalyseEfCfsSource(Source)
```

Emit ``characterization-factors.parquet`` rows (method+impact+flow -> value).

<a id="sentier_importers.sources.agribalyse.cfs.AgribalyseEfCfsSource.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData
```

Fetch the JRC CF table, then the optional SimaPro arbiter (best-effort).

The arbiter is a local reference input, never emitted. When it cannot be
fetched (missing file, offline with no cache entry, ...) the import still
runs: :mod:`ef_cf_dedup` falls back to the larger-``|value|`` rule for any
land-use duplicate the arbiter would otherwise have resolved.

<a id="sentier_importers.sources.agribalyse.cfs.AgribalyseEfCfsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.agribalyse.cfs.AgribalyseEfCfsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
