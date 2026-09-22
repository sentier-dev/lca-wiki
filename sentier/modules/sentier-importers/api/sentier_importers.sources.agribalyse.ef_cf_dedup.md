**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.agribalyse.ef_cf_dedup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.agribalyse.ef_cf_dedup cfg.yml > sentier_importers.sources.agribalyse.ef_cf_dedup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup"></a>

# sentier\_importers.sources.agribalyse.ef\_cf\_dedup

Deterministic resolution of duplicate global-level CF rows in the EF 3.1 JRC table.

For 182 (flow, method) pairs at the global level (``LCIAMethod_location`` empty), the
JRC ``EF-LCIAMethod_CF(EF-v3.1)`` table lists TWO rows with different ``CF EF3.1``
values instead of one: 171 Land use flows and 11 Water use flows. Naive first-row-wins
dedup (the previous behavior of :mod:`sentier_importers.sources.agribalyse.cfs`) kept
whichever value happened to sort first in the parquet, so mass-balanced pairs such as
land ``from X`` / ``to X`` transformation flows, or water intake / return flows, ended
up asymmetric in ``sentier-methods/data/01-ef-3.1/characterization-factors.parquet``.

Resolution rules (deterministic, applied in this order):

1. Detect every (flow uuid, method) group of *global* rows (``LCIAMethod_location``
   empty or ``None``) with 2+ distinct ``CF EF3.1`` values; only these groups are
   touched. Country-level rows are never inspected or altered.
2. **Water use**: keep the value in the "42.95 family" (``|value|`` closest to 42.95,
   i.e. one of 42.95 / -42.95 / -42.955) -- the AWARE world-average default EF 3.1
   applies to an unknown location. This is also what makes a flow's intake and return
   values cancel (e.g. ``Water to Cooling`` +42.95 against ``Water`` emission -42.95).
3. **Land use**: keep the value that makes the flow's ``from X`` / ``to X``
   transformation partner symmetric (``|from| == |to|``, within :data:`_ARBITER_RTOL`
   -- never exact float equality). A partner is either a single deterministic value
   (a non-ambiguous flow) -- in which case we keep whichever of our two candidates
   matches its absolute value -- or itself an ambiguous duplicate group, in which case
   we compare candidate sets. When both of our candidates could be symmetric (the
   partner is an equally ambiguous duplicate carrying the same two ``|value|``s) or no
   partner exists at all (``Land occupation`` flows have no ``from``/``to``
   counterpart), the SimaPro "EF 3.1 adapted" export
   (``<private>/source/simapro-EF31-adapted-cfs.parquet``, a local reference input
   that is never copied into sentier-methods) arbitrates. It is an *equality* arbiter,
   not a nearest-value guess: its ``Occupation, X`` / ``Transformation, from X`` /
   ``Transformation, to X`` rows are normalized onto our ``X`` / ``from X`` / ``to X``
   flow names (see :func:`_land_index_keys`) and compared case-insensitively; a
   candidate only "hits" when it equals a SimaPro value within :data:`_ARBITER_RTOL`
   (scaled by the candidate's own magnitude). Exactly one hit resolves the group;
   zero hits (no matching name) or two hits (both candidates happen to equal some
   SimaPro value -- normalization matched the wrong class) both fall through:

   - *primary* normalization (rule ``"simapro"`` when it resolves the group) --
     reused wholesale from
     :data:`sentier_importers.matching.matchers.LAND_CLASS_SYNONYMS` (the same
     ecoinvent-style land-class spellings ``LandUseMatcher`` already reconciles for
     BAFU), a SimaPro-only ``pasture, man made`` -> ``pasture/meadow`` rename (its own
     land vocabulary splits "man made" from the JRC/BAFU-shared "meadow" naming),
     dropping a trailing SimaPro ``(non-use)`` qualifier EF's own names never carry,
     and singular/plural spelling (``crop``/``crops``, ``margin``/``margins``,
     ``wetland``/``wetlands``);
   - *fallback* normalization (rule ``"simapro-fallback"``) -- dropping a bare
     ``natural``/``sclerophyllous``/``unspecified`` qualifier segment SimaPro carries
     but EF's coarser class does not (e.g. EF's bare ``forest`` matches SimaPro's
     ``forest, unspecified``), tried only once the primary forms above fail to match
     -- so a class EF *does* qualify with ``natural`` (e.g. ``unspecified, natural``)
     still matches on its own name first -- plus one narrow alias for EF's
     ``grassland, not used`` (no dedicated SimaPro row; shares both candidate values
     with bare ``grassland``). A dropped-segment candidate is discarded outright when
     its *un-dropped* name is itself a distinct global flow in the same method (e.g.
     ``forest`` can never resolve from ``forest, natural``'s SimaPro evidence --
     ``forest, natural`` is EF's own class, not a filler-qualified spelling of
     ``forest`` -- but *can* resolve from ``forest, unspecified``'s, since EF has no
     ``forest, unspecified`` class of its own).

   SimaPro's own land-use nomenclature still does not cover every JRC flow name (it
   groups some ecoinvent land classes differently, e.g. by crop type rather than
   irrigation regime), so a number of groups still fall through. If the arbiter is
   absent (the file could not be fetched, or could not be parsed) or has no
   single-hit entry, the larger ``|value|`` is kept and the flow is recorded in the
   report with rule ``"larger"``; either way a warning is logged.
4. No other method is expected to hit this ambiguity (verified empirically against the
   full 319k-row JRC table: every one of the 182 ambiguous groups is Water use or Land
   use), but should one appear in a future refresh of the source file, it falls back to
   rule 3's last resort (larger ``|value|``, logged) rather than silently keeping an
   arbitrary row.

:func:`resolve_global_duplicates` returns both the resolved value per group (for the CF
transform to filter rows on) and a full report of every resolved (flow, method) pair, in
the ``flow_name | method | kept | dropped | rule`` shape this module's own tests and the
import's ad hoc diagnostics use -- the importer framework has no import-report facility
of its own, so nothing else reads ``report``; a summary is also logged at INFO level.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SIMAPRO_INPUT"></a>

#### SIMAPRO\_INPUT

Name of the named ``registry.yaml`` input carrying the SimaPro arbiter file.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.WATER_METHOD"></a>

#### WATER\_METHOD

Methods with global-level duplicate CF rows in the JRC EF 3.1 table.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.LAND_METHOD"></a>

#### LAND\_METHOD

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.DuplicateResolution"></a>

## DuplicateResolution Objects

```python
@dataclass(frozen=True)
class DuplicateResolution()
```

Result of resolving global-level CF duplicates.

``kept`` maps ``(method_name, flow_uuid)`` to the CF value to keep; any row in that
group whose value differs from the kept one must be dropped by the caller.
``report`` lists one entry per resolved group -- ``flow_name``, ``method``,
``kept``, ``dropped``, ``rule`` (one of ``"water"``, ``"symmetric"``,
``"simapro"``, ``"simapro-fallback"``, ``"larger"``) -- for this module's own
tests and ad hoc diagnostics; nothing in the import pipeline reads it back (see
module docstring), so a full breakdown is also logged at INFO level.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.DuplicateResolution.kept"></a>

#### kept

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.DuplicateResolution.report"></a>

#### report

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SimaproLandIndex"></a>

## SimaproLandIndex Objects

```python
@dataclass(frozen=True)
class SimaproLandIndex()
```

The SimaPro land-use arbiter, keyed by normalized, lowercased JRC-style name.

``primary`` holds the high-confidence normalizations (module docstring rule 3);
``fallback`` the lower-confidence ones, each CF paired with the *donor* name the
candidate key was derived from (``None`` for an explicit, reviewed alias that
needs no guard) -- see :meth:`fallback_values`.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SimaproLandIndex.primary"></a>

#### primary

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SimaproLandIndex.fallback"></a>

#### fallback

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SimaproLandIndex.primary_values"></a>

#### primary\_values

```python
def primary_values(name: str) -> list[float] | None
```

SimaPro CF values carried directly (high confidence) for ``name``.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.SimaproLandIndex.fallback_values"></a>

#### fallback\_values

```python
def fallback_values(name: str,
                    known_land_names: frozenset[str]) -> list[float] | None
```

SimaPro CF values inferred (lower confidence) for ``name``, excluding any
entry whose donor is itself a distinct global flow in ``known_land_names``
(e.g. ``forest`` must never borrow ``forest, natural``'s evidence).

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.parse_simapro_index"></a>

#### parse\_simapro\_index

```python
def parse_simapro_index(raw: RawData | None) -> SimaproLandIndex | None
```

Build the SimaPro land-use arbiter index from the adapted-export rows.

Returns ``None`` when ``raw`` is ``None`` (arbiter file unavailable -- the caller
already logged the fallback warning when the fetch failed) or when the content
cannot be parsed as the expected parquet (a malformed arbiter file must not crash
the import; a warning is logged and the caller falls back the same way).

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.harmonise_water_family"></a>

#### harmonise\_water\_family

```python
def harmonise_water_family(value: float) -> float
```

``-42.955`` -> ``-42.95``; values outside the rounding tolerance unchanged.

<a id="sentier_importers.sources.agribalyse.ef_cf_dedup.resolve_global_duplicates"></a>

#### resolve\_global\_duplicates

```python
def resolve_global_duplicates(
        records: Records,
        simapro_index: SimaproLandIndex | None) -> DuplicateResolution
```

Resolve every ambiguous (flow uuid, method) global CF group in ``records``.

``records`` are :func:`~sentier_importers.sources.agribalyse.ef_common.parse_cf_table`
records (one per JRC row: ``flow_uuid``, ``flow_name``, ``method_name``, ``cf``,
``location``). Only rows with an empty/``None`` ``location`` are considered;
country-level rows are left untouched by construction.
