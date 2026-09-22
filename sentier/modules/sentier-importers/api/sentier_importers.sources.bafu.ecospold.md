**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.ecospold` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.ecospold cfg.yml > sentier_importers.sources.bafu.ecospold.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.ecospold"></a>

# sentier\_importers.sources.bafu.ecospold

Shared EcoSpold1 reader + helpers for the BAFU-2026 v1 source family.

The zip holds one ``process_<uuid>.xml`` per dataset; the dataset-level
``number`` attribute is an export-wide key (every technosphere input's
``number`` resolves to a dataset), so linking is exact and needs no name
matching.

Every source in this family is opt-in (``enabled: false``) and run locally
against the downloaded export.

<a id="sentier_importers.sources.bafu.ecospold.CITATION"></a>

#### CITATION

Required source quotation for the 2026 release.

<a id="sentier_importers.sources.bafu.ecospold.BAFU_FLOW_NS"></a>

#### BAFU\_FLOW\_NS

Fixed namespace for deterministic elementary-flow ids (public recipe: locally
regenerated data is bit-identical across users).

<a id="sentier_importers.sources.bafu.ecospold.SECTORS"></a>

#### SECTORS

Sector folder -> BAFU ``referenceFunction`` categories (covers all 59 observed).

<a id="sentier_importers.sources.bafu.ecospold.sector_for"></a>

#### sector\_for

```python
def sector_for(category: str) -> str
```

Sector folder for a BAFU category; raises ``ParseError`` on unknown categories.

<a id="sentier_importers.sources.bafu.ecospold.sector_slug"></a>

#### sector\_slug

```python
def sector_slug(sector: str) -> str
```

Rank-free sector name (``01-agriculture`` -> ``agriculture``).

Vocab payload files are content-named per sector without the inventory
folder's rank prefix.

<a id="sentier_importers.sources.bafu.ecospold.compartment_slug"></a>

#### compartment\_slug

```python
def compartment_slug(compartment: str) -> str
```

File-name slug of a biosphere compartment (``emissions to air`` -> ``emissions-to-air``).

<a id="sentier_importers.sources.bafu.ecospold.flow_id"></a>

#### flow\_id

```python
def flow_id(name: str, category: str | None, subcategory: str | None,
            unit: str | None) -> str
```

Deterministic elementary-flow id over the (name, category, subCategory, unit) tuple.

Unit is part of flow identity: BAFU-2026 carries twin flows differing only in
unit (58 radionuclides in both Bq and kBq) which must not share an id.

<a id="sentier_importers.sources.bafu.ecospold.bw_uncertainty"></a>

#### bw\_uncertainty

```python
def bw_uncertainty(
        amount: float, uncertainty_type: str | None,
        sd95: float | None) -> tuple[int | None, float | None, float | None]
```

EcoSpold1 uncertainty -> Brightway ``(uncertainty_type, loc, scale)``.

EcoSpold 1 (lognormal, ``standardDeviation95`` = square of the geometric SD)
maps to Brightway 2 with ``loc = ln(|amount|)``, ``scale = ln(√SD95)``;
EcoSpold 2 (normal) maps to Brightway 3 with ``loc = amount``,
``scale = SD95 / 2``. Anything else — including a missing/non-positive SD95
or a zero amount for the lognormal case — is undefined (all ``None``).

<a id="sentier_importers.sources.bafu.ecospold.parse_ecospold_zip"></a>

#### parse\_ecospold\_zip

```python
def parse_ecospold_zip(raw: RawData) -> Records
```

One record per ``process_<uuid>.xml`` dataset in the zip. Memoized by content.
