**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.cf_simapro_filter` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.cf_simapro_filter cfg.yml > ef.cf_simapro_filter.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.cf_simapro_filter"></a>

# ef.cf\_simapro\_filter

``SimaProCfFilter`` — drop bw2io-inherited CFs not in JRC EF v3.1.

The project's CF values are pinned to the JRC EF v3.1 reference dataset
(``source/EF-LCIAMethod_CF(EF-v3.1)__lciamethods_CF.parquet``). The
bw2io snapshot (``source/ef-v31-methods.json``) re-attaches those JRC
CF *values* onto biosphere3 codes via ecoinvent's ``LCIA
Implementation 3.9.1.xlsx`` mapping table — and that mapping table
is over-zealous: it routes the JRC value 134 083 CTUe/kg onto the
biosphere3 ``Kaolin`` code even though Kaolin has no entry in the JRC
source, and routes the JRC water-resource CF 42.95 onto biosphere3
``Water [air]`` rows where it's a category mismatch. The CF value is
EF v3.1; the bio3 *code* it lands on is wrong.

Both kinds bias our backtest:

* Ecotoxicity freshwater: 581 stray pesticide / dioxin CF placements
  push the median ratio from 0.90 (10 % under) to 1.82 (82 % over) —
  a single Pear orchard activity emitting 1.5 g Kaolin/kg pear
  contributes ~95 % of the score against ADEME's reference of 6 CTUe.
* Water use: 5 ``Water [air]`` placements at 42.95 m³ depriv./kg
  over-count every cooling-tower evaporation in the supply chain.
* Human toxicity carcinogenic: 122 stray dioxin placements.

This class is a **flow-set filter** — it does NOT touch CF values
(the project ships only EF v3.1 CFs, by design). It uses the
SimaPro EF 3.1 (adapted) export
(``source/EF3.1 (adapted) (1).XLSX``) as a curated reflection of
which (flow_name, top_compartment) pairs JRC actually characterises
in each method, then drops bw2io-inherited rows whose flow isn't in
that set. Synonym resolution via the biosphere flowmap
(``source/agribalyse-3.2-ecoinvent-3.10-biosphere.json``) catches
naming-convention drift (e.g. bio3 ``Methane, non-fossil`` ↔ SimaPro
``Methane, biogenic``); CAS fallback catches halocarbon families
where bio3 keeps the IUPAC + Halon code form and SimaPro the common
name. Both are *flow identity* matches; the CF value is always
whatever bw2io's LCIA xlsx wrote (= JRC EF v3.1).

Drop-only filter: the ``EF v3.1 (adapted)`` flow set is a *subset* of
the bw2io-inherited bio3 set, never a superset (SimaPro's flow list
was hand-pruned by JRC to drop substances they don't characterise).
Adding bio3 rows would require importing CF values from somewhere —
either SimaPro (mixes methodologies, forbidden) or hand-mapping JRC
EF UUIDs onto bio3 codes (a deliberate methodology extension that
belongs in a separate PR).

<a id="ef.cf_simapro_filter.SimaProCfFilter"></a>

## SimaProCfFilter Objects

```python
@dataclass(frozen=True)
class SimaProCfFilter()
```

Decide whether a (method, db, code) CF survives the SimaPro intersection.

<a id="ef.cf_simapro_filter.SimaProCfFilter.simapro_table"></a>

#### simapro\_table

<a id="ef.cf_simapro_filter.SimaProCfFilter.biosphere_catalog_path"></a>

#### biosphere\_catalog\_path

<a id="ef.cf_simapro_filter.SimaProCfFilter.flowmap_path"></a>

#### flowmap\_path

<a id="ef.cf_simapro_filter.SimaProCfFilter.COMPARTMENT_ALIASES"></a>

#### COMPARTMENT\_ALIASES

<a id="ef.cf_simapro_filter.SimaProCfFilter.SKIP_FILTER_METHODS"></a>

#### SKIP\_FILTER\_METHODS

<a id="ef.cf_simapro_filter.SimaProCfFilter.EXCLUDED_FLOW_NAMES_BY_SP_METHOD"></a>

#### EXCLUDED\_FLOW\_NAMES\_BY\_SP\_METHOD

<a id="ef.cf_simapro_filter.SimaProCfFilter.keep"></a>

#### keep

```python
def keep(*, our_category: str, our_indicator: str, db: str, code: str) -> bool
```

Return ``True`` if (db, code) is characterised by SimaPro for this method.

The signature / synonym / CAS gauntlet only runs for
biosphere3 / ecoinvent-3.9.1-biosphere rows; EF-coded rows
otherwise pass through (we have no JRC signature table keyed
by EF UUID). The
:attr:`EXCLUDED_FLOW_NAMES_BY_SP_METHOD` per-flow-name
override runs *first* and applies uniformly across all three
databases — EF UUIDs were historically assumed to be dead
weight in the matrix, but 2026-05-17 decomposition of the
carrot ``ht_nc`` cluster found AGB recipes emit to EF-coded
flows that get characterised at JRC's CF, so the exclusion
must reach them too.

<a id="ef.cf_simapro_filter.SimaProCfFilter.filter_rows"></a>

#### filter\_rows

```python
def filter_rows(*, our_key: tuple[str, str, str, str],
                rows: Iterable[dict]) -> tuple[list[dict], int]
```

Return ``(kept_rows, n_dropped)`` for one method's CF rows.

``rows`` are the dicts ``MethodCfRegistryBuilder._cfs_for_method``
already builds (``{"database", "code", "amount"}``). Caller can
substitute the filtered list back in place.

<a id="ef.cf_simapro_filter.SimaProCfFilter.augment_rows"></a>

#### augment\_rows

```python
def augment_rows(*, our_key: tuple[str, str, str, str],
                 rows: list[dict]) -> tuple[list[dict], int]
```

Append SimaPro CFs missing from ``rows`` and return ``(merged, n_added)``.

.. warning::
   **Not used by the production registry build.** This method
   was prototyped to widen CF coverage where the bw2io snapshot
   is incomplete (e.g. natural-resource water flows in water
   use), but using it would import *SimaPro's CF values* into
   our scoring path. The project is intentionally pinned to JRC
   EF v3.1 CFs only; mixing in SimaPro CFs would conflate two
   CF datasets and defeat the whole point of the JRC-source
   pipeline. Kept on the class for ad-hoc analysis (e.g.
   comparing what *would* score if we ported SimaPro's
   additions across).
