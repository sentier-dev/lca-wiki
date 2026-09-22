**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.cf_flow_join` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.cf_flow_join cfg.yml > ef.cf_flow_join.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.cf_flow_join"></a>

# ef.cf\_flow\_join

Per-flow CF join: SimaPro CFs ↔ the scoring registry's CFs.

The Stage 1 ``dds-compare-cfs --source raw`` comparison computes stats over
two independently-enumerated substance × compartment exports, which means
the SimaPro and JRC sides have different row sets and the resulting deltas
mostly reflect data-shape asymmetry, not real CF disagreement.

This module joins both sides at the **ecoinvent biosphere flow** level so
each `(method, flow)` pair gets ``(sp_cf, ef_cf)`` side-by-side. The
distribution stats the dashboard renders are then computed over the joined
set, where both sides are at the same granularity and the deltas measure
genuine CF disagreement.

Pipeline::

    registry/method_cfs/<slug>/cfs.parquet  ──┐
        (code → ef_cf)                        │
    registry/biosphere_catalog.parquet  ─────┤  FlowLevelCfJoiner
        (code → name, categories, cas, syns)  │     .join_method()
    registry/context_normalisation.parquet  ─┤
        (SP context ↔ eco context)            │
    cache/simapro-EF31-adapted-cfs.parquet ──┘
        (method × name × comp × sub → sp_cf)
                                              ▼
                  pd.DataFrame[code, name, categories,
                              sp_cf, ef_cf, sp_match_provenance]

Spec: ``docs/superpowers/specs/2026-05-22-cf-stats-flow-level-join-design.md``.

<a id="ef.cf_flow_join.BiosphereCatalogLoader"></a>

## BiosphereCatalogLoader Objects

```python
@dataclass(frozen=True)
class BiosphereCatalogLoader()
```

Read ``registry/biosphere_catalog.parquet``.

Each row describes one ecoinvent biosphere flow:
``(database, code, name, categories, unit, cas, synonyms)``.

<a id="ef.cf_flow_join.BiosphereCatalogLoader.path"></a>

#### path

<a id="ef.cf_flow_join.BiosphereCatalogLoader.load"></a>

#### load

```python
def load() -> pd.DataFrame
```

<a id="ef.cf_flow_join.ContextNormaliser"></a>

## ContextNormaliser Objects

```python
@dataclass(frozen=True)
class ContextNormaliser()
```

Map ecoinvent / JRC EF ``categories`` to SimaPro ``(compartment,
sub_compartment)``.

Two input formats are handled:

1. **Ecoinvent** (the common case): 2-element lists like
   ``[air, urban air close to ground]``. The forward rules in
   ``registry/context_normalisation.parquet`` go SimaPro → ecoinvent
   (e.g. ``[Air, high. pop.] → [air, urban air close to ground]``);
   this class inverts them, picking the source whose compartment is
   in the SimaPro adapted-parquet namespace (``Air, Water, Soil,
   Raw``).
2. **JRC EF** (used for flows in the registry that come from JRC's
   raw parquet, not from ecoinvent's biosphere): 3-element lists like
   ``[Emissions, Emissions to air, Emissions to lower stratosphere
   and upper troposphere]``. Mapped via a small built-in dictionary
   since the forward rule table doesn't cover JRC's longer form.

The top-level compartment for ecoinvent inputs is mapped via a small
built-in dictionary (``_SP_COMP_BY_BUCKET``), not via the inverse
rules — the rules carry the long forms ``Raw materials / Resources
/ Substances`` rather than the abbreviated ``Raw`` the adapted
parquet uses.

<a id="ef.cf_flow_join.ContextNormaliser.rules"></a>

#### rules

cols: source_context (list-like), target_context (list-like)

<a id="ef.cf_flow_join.ContextNormaliser.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="ef.cf_flow_join.ContextNormaliser.from_path"></a>

#### from\_path

```python
@classmethod
def from_path(cls, path: Path) -> ContextNormaliser
```

<a id="ef.cf_flow_join.ContextNormaliser.normalise"></a>

#### normalise

```python
def normalise(categories: list[str] | tuple[str, ...]) -> tuple[str, str]
```

<a id="ef.cf_flow_join.SimaProCfUnitHarmoniser"></a>

## SimaProCfUnitHarmoniser Objects

```python
@dataclass(frozen=True)
class SimaProCfUnitHarmoniser()
```

Per-method scale factor that brings an SP CF into the registry's
implicit unit frame.

Some EF v3.1 methods quote CFs in a *substance-natural* unit rather
than the flow-tracked unit. For Water use, JRC quotes CFs as
``m3 deprivation / m3 water``; the registry stores those raw JRC
values. SimaPro, on the other hand, converts each CF to the flow's
``flow_unit`` (so ``"Water, fresh"`` with ``flow_unit=m3`` keeps the
raw ``42.95`` while ``"Water"`` emission with ``flow_unit=kg`` is
divided to ``-0.042955``). Both express the same physics; comparing
them apples-to-apples needs the conversion.

Mapping: ``(registry_method_category, sp_flow_unit) → scale``.
Multiplying SP's CF by ``scale`` brings it into the registry's frame.
Missing entries default to ``1.0`` (no conversion needed — common
case for kg-tracked methods like Climate change).

<a id="ef.cf_flow_join.SimaProCfUnitHarmoniser.scale_for"></a>

#### scale\_for

```python
@classmethod
def scale_for(cls, registry_method_category: str, sp_flow_unit: str) -> float
```

<a id="ef.cf_flow_join.SimaProCfMatch"></a>

## SimaProCfMatch Objects

```python
@dataclass(frozen=True)
class SimaProCfMatch()
```

Result of a :meth:`SimaProCfIndex.lookup`.

Carries the matched SimaPro CF plus the **identity of the SimaPro row the
CF came from** — its name and ``(compartment, sub_compartment)`` — so callers
can show which SimaPro flow a registry flow reconciled against (the
reviewer's "which flow is used" / reconciliation signal). On a miss, ``cf`` is
``None``, ``provenance`` is :data:`SimaProCfIndex.PROV_UNMATCHED`, and the
identity fields are empty strings.

<a id="ef.cf_flow_join.SimaProCfMatch.cf"></a>

#### cf

<a id="ef.cf_flow_join.SimaProCfMatch.provenance"></a>

#### provenance

<a id="ef.cf_flow_join.SimaProCfMatch.name"></a>

#### name

<a id="ef.cf_flow_join.SimaProCfMatch.compartment"></a>

#### compartment

<a id="ef.cf_flow_join.SimaProCfMatch.sub_compartment"></a>

#### sub\_compartment

<a id="ef.cf_flow_join.SimaProCfIndex"></a>

## SimaProCfIndex Objects

```python
@dataclass(frozen=True)
class SimaProCfIndex()
```

O(1) lookup of SimaPro CFs keyed on registry method + flow identity.

The SP adapted parquet uses SimaPro method names (e.g.
``"Ozone depletion"`` / ``"Particulate matter"`` plus
``- inorganics`` / ``- organics`` variants). The index converts each
row's method to the registry ``(category, indicator)`` tuple via
:data:`SimaProEFCfTable.METHOD_TO_OUR_KEY` so callers can query with
the registry-side method key directly. Inorganics/organics sub-methods
fold into their root.

Each indexed CF is harmonised at index-build time via
:class:`SimaProCfUnitHarmoniser` so the stored value is directly
comparable to the registry's CF for the same flow (e.g. Water-use
SP CFs with ``flow_unit=kg`` are multiplied by 1000 to match JRC's
per-m3 frame).

Four lookup tiers, tried in order, each tier falling back from exact
``(compartment, sub_compartment)`` to ``(compartment, "(unspecified)")``
so an ecoinvent flow whose sub-compartment isn't enumerated in SP
still finds its substance-level CF.

1. **Exact** ``(method_key, name, compartment, sub_compartment)`` →
   fall back to ``(name, compartment, "(unspecified)")``.
2. **Synonym**: the biosphere catalog's ``synonyms`` list, same key
   structure as tier 1.
3. **CAS**, same sub fallback. When multiple SP rows share
   ``(method, cas, compartment, sub_compartment)`` (e.g. SP has
   ``Uranium`` and ``Uranium, 2291 GJ per kg`` and
   ``Uranium, 451 GJ per kg`` all with the same CAS), the row with
   the **shortest name** wins — that's typically the canonical
   substance, not a unit-specific variant.
4. **Short-name** (e.g. ``"Halon-2401"`` matches SP's
   ``"Ethane, 1,1,1,2-tetrafluoro-2-bromo-, Halon 2401"``). Built by
   taking the last comma-separated token of each SP name and
   normalising punctuation. Only emitted when the token contains a
   digit — chemical identifiers like ``CFC-115`` / ``Halon 2401`` /
   ``HCFC-141b`` all have digits; generic suffixes like
   ``"unspecified"`` / ``"biotic"`` / ``"brown"`` don't, and matching
   those produced false hits (e.g. ``"Coal, hard, unspecified"``
   would otherwise match SP's ``"Energy, unspecified"``).

<a id="ef.cf_flow_join.SimaProCfIndex.primary"></a>

#### primary

<a id="ef.cf_flow_join.SimaProCfIndex.by_cas_sub"></a>

#### by\_cas\_sub

<a id="ef.cf_flow_join.SimaProCfIndex.by_cas_unspec"></a>

#### by\_cas\_unspec

<a id="ef.cf_flow_join.SimaProCfIndex.by_short_name"></a>

#### by\_short\_name

<a id="ef.cf_flow_join.SimaProCfIndex.PROV_EXACT"></a>

#### PROV\_EXACT

<a id="ef.cf_flow_join.SimaProCfIndex.PROV_SYNONYM"></a>

#### PROV\_SYNONYM

<a id="ef.cf_flow_join.SimaProCfIndex.PROV_CAS"></a>

#### PROV\_CAS

<a id="ef.cf_flow_join.SimaProCfIndex.PROV_SHORT_NAME"></a>

#### PROV\_SHORT\_NAME

<a id="ef.cf_flow_join.SimaProCfIndex.PROV_UNMATCHED"></a>

#### PROV\_UNMATCHED

<a id="ef.cf_flow_join.SimaProCfIndex.from_dataframe"></a>

#### from\_dataframe

```python
@classmethod
def from_dataframe(cls, df: pd.DataFrame) -> SimaProCfIndex
```

<a id="ef.cf_flow_join.SimaProCfIndex.lookup"></a>

#### lookup

```python
def lookup(*, registry_method_key: tuple[str, str, str, str], name: str,
           context: tuple[str,
                          str], synonyms: list[str] | tuple[str, ...] | None,
           cas: str | None) -> SimaProCfMatch
```

<a id="ef.cf_flow_join.JoinedFlowFrame"></a>

## JoinedFlowFrame Objects

```python
@dataclass(frozen=True)
class JoinedFlowFrame()
```

Result of joining one method's registry CFs against SimaPro.

Mirrors the columns of the per-(method, flow) parquet:
``code, name, categories, sp_cf, ef_cf, sp_match_provenance``.

<a id="ef.cf_flow_join.JoinedFlowFrame.method_key"></a>

#### method\_key

<a id="ef.cf_flow_join.JoinedFlowFrame.df"></a>

#### df

<a id="ef.cf_flow_join.JoinedFlowFrame.COLUMNS"></a>

#### COLUMNS

<a id="ef.cf_flow_join.FlowLevelCfJoiner"></a>

## FlowLevelCfJoiner Objects

```python
@dataclass(frozen=True)
class FlowLevelCfJoiner()
```

Join one method's registry CFs against SimaPro at the flow level.

Stateless once constructed: the catalog, normaliser, SP index, and
short-name → CAS cross-reference are built once per
``dds-compare-cfs`` run and reused across the 19 methods.

<a id="ef.cf_flow_join.FlowLevelCfJoiner.catalog"></a>

#### catalog

<a id="ef.cf_flow_join.FlowLevelCfJoiner.normaliser"></a>

#### normaliser

<a id="ef.cf_flow_join.FlowLevelCfJoiner.sp_index"></a>

#### sp\_index

<a id="ef.cf_flow_join.FlowLevelCfJoiner.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="ef.cf_flow_join.FlowLevelCfJoiner.join_method"></a>

#### join\_method

```python
def join_method(method_key: tuple[str, str, str, str],
                ef_cfs: pd.DataFrame) -> JoinedFlowFrame
```

``ef_cfs`` has cols ``(database, code, amount)``.

Returns a JoinedFlowFrame whose DataFrame has one row per
``(method_key, code)`` pair, with ``sp_cf`` populated when the SP
index has a hit (and ``sp_match_provenance`` recording how it was
matched) or ``NaN`` otherwise.
