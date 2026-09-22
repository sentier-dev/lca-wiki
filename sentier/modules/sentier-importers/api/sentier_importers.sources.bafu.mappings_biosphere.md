**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.mappings_biosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.mappings_biosphere cfg.yml > sentier_importers.sources.bafu.mappings_biosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.mappings_biosphere"></a>

# sentier\_importers.sources.bafu.mappings\_biosphere

BAFU-2026 elementary flows → EF 3.1 CF keys, as a randonneur package.

Source: ``<private>/registry/mappings_biosphere_ef.parquet``, the
de-bridged crosswalk. carbonminds resolves BAFU flows to whatever code the EF
v3.1 factor sits on, which for 98.7% of matched flows is an
``ecoinvent-3.9.1-biosphere`` code; the de-bridger re-expresses each link as the
EF flow carrying the identical factor, so nothing ecoinvent-shaped reaches this
public repo. See ``docs/specs/2026-08-06-bafu-ef-debridged-mappings.md``.

Each entry asserts one thing: *this BAFU flow receives this EF characterization
factor*. The upstream parquet is already filtered to shippable rows — flows
whose target carries no CF, or for which no CF-compatible EF flow exists, are
withheld there with a reason rather than guessed at by name here.

Two defects in the sibling ``agribalyse-3.2__ef-3.1`` package are deliberately
not repeated: stringified ``"nan"`` field values, and name-only targets. A
target without a ``code`` cannot be resolved to a factor, so it is not shipped.

Decision 2026-09-14: ``EXCLUDED_SOURCE_NAMES`` withholds a handful of BAFU source
flows the upstream crosswalk resolves onto the wrong substance entirely -- carbonminds
pairs BAFU ``Metiram`` with EF ``Zineb``, a different dithiocarbamate fungicide, although
EF 3.1 carries its own ``Metiram`` flow (CAS 9006-42-2). Shipping that row would assert a
factor for the wrong substance, so it is dropped here rather than trusted from upstream;
the matched package then lands Metiram on EF's own flow by name and CAS.

<a id="sentier_importers.sources.bafu.mappings_biosphere.EXCLUDED_SOURCE_NAMES"></a>

#### EXCLUDED\_SOURCE\_NAMES

BAFU source flow names withheld regardless of what the upstream crosswalk
resolved them onto (decision 2026-09-14), keyed by lowercased BAFU name. Every
entry names the actual EF substance carbonminds paired the flow with, so a
reviewer can see at a glance why the row is missing rather than just that it is.

<a id="sentier_importers.sources.bafu.mappings_biosphere.BafuBiosphereMappingsSource"></a>

## BafuBiosphereMappingsSource Objects

```python
class BafuBiosphereMappingsSource(Source)
```

Map the de-bridged registry table into randonneur ``replace`` entries.

<a id="sentier_importers.sources.bafu.mappings_biosphere.BafuBiosphereMappingsSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

<a id="sentier_importers.sources.bafu.mappings_biosphere.BafuBiosphereMappingsSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```
