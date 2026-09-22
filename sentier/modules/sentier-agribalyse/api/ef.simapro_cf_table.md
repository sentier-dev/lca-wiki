**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.simapro_cf_table` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m ef.simapro_cf_table cfg.yml > ef.simapro_cf_table.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.simapro_cf_table"></a>

# ef.simapro\_cf\_table

``SimaProEFCfTable`` — parse the SimaPro EF 3.1 (adapted) XLSX export.

The XLSX file is the SimaPro 10.x export of the Environmental Footprint 3.1
method as adapted for the SimaPro substance database. ADEME computes its
AGRIBALYSE 3.2 reference scores against this exact CF table — so when our
backtest disagrees with the ADEME synthesis, the first thing to compare is
*these* CFs against ours.

The XLSX layout (one sheet ``Sheet1``):

* Rows 0..149 are header / metadata text.
* Each impact category begins with a header row whose first cell is
  ``Impact category`` and whose second cell is the SimaPro method name
  (e.g. ``Ionising radiation``); the third cell is the reference unit.
* Subsequent rows are CFs, with this column convention::

      A: compartment       (Air, Water, Soil, Raw, …)
      B: sub-compartment   ((unspecified), low. pop., ground-, …)
      C: flow name         (e.g. ``Radon-222``)
      D: CAS number        (zero-padded 9-digit string or empty)
      E: CF value          (float, in the method's reference unit)
      F: flow unit         (kg, kBq, m2a, …)
      G: CF unit           (e.g. ``kBq U-235 eq / kBq``)

  Blank rows separate categories.

This module reads that sheet into a flat DataFrame with one row per CF,
keyed by ``(simapro_method, compartment, sub_compartment, name)``.

No bw2 dependency. Lazily parsed and cached as a parquet next to the
source XLSX so subsequent reads are O(parquet) rather than O(XLSX).

<a id="ef.simapro_cf_table.SimaProEFCfTable"></a>

## SimaProEFCfTable Objects

```python
@dataclass(frozen=True)
class SimaProEFCfTable()
```

Parsed view of the SimaPro EF 3.1 (adapted) method export.

**Attributes**:

- `xlsx_path` - Path to the SimaPro export file.
- `cache_path` - Where to write/read the parquet cache.

<a id="ef.simapro_cf_table.SimaProEFCfTable.xlsx_path"></a>

#### xlsx\_path

<a id="ef.simapro_cf_table.SimaProEFCfTable.cache_path"></a>

#### cache\_path

<a id="ef.simapro_cf_table.SimaProEFCfTable.HEADER_SKIP"></a>

#### HEADER\_SKIP

<a id="ef.simapro_cf_table.SimaProEFCfTable.COLUMNS"></a>

#### COLUMNS

<a id="ef.simapro_cf_table.SimaProEFCfTable.df"></a>

#### df

```python
@cached_property
def df() -> pd.DataFrame
```

Return the parsed CFs as a DataFrame, materialising the cache once.

<a id="ef.simapro_cf_table.SimaProEFCfTable.METHOD_TO_OUR_KEY"></a>

#### METHOD\_TO\_OUR\_KEY

<a id="ef.simapro_cf_table.SimaProEFCfTable.for_our_method"></a>

#### for\_our\_method

```python
def for_our_method(our_category: str, our_indicator: str) -> pd.DataFrame
```

Return SimaPro CF rows for a method given our (category, indicator) tuple.

SimaPro splits ``Ecotoxicity, freshwater`` and ``Human toxicity, ...``
into ``- inorganics`` / ``- organics`` sub-methods. We aggregate
all three (main + inorganics + organics) when the user asks for
the parent method, because that's what gets compared against the
single ADEME reference number.
