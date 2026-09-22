**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.ef_units` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.ef_units cfg.yml > sentier_importers.sources.bafu.ef_units.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.ef_units"></a>

# sentier\_importers.sources.bafu.ef\_units

Unit/dimension conversion helpers for the bafu-2026-v1 -> EF 3.1 bridges.

Split out of ``mappings_biosphere_matched`` so the unit-conversion domain (physical
dimensions, the energy-content table, the stoichiometric factor table, the
water-density special case, and the nomenclature-package target-unit convention for an
uncharacterised target) has its own home apart from the matching/decision pipeline
itself. Everything here is a pure function or lookup table; nothing touches
``BafuFlow``/EF index construction.

Round 5, decision 2026-09-14: ``nomenclature_target_unit`` replaces the earlier
same-scale-only ``nomenclature_unit`` respelling (kept the SOURCE unit's own spelling,
applied no factor at all). That respelling let one EF flow fed by both a ``Bq`` source
and a ``kBq`` source (BAFU carries both twins for many radionuclides) end up with two
different ``target["unit"]`` values and no ``conversion_factor`` on either -- silently
off by 1000x whenever a downstream consumer merged the two amounts onto one EF node
(91 affected codes; also 2 water-substance codes fed by ``kg`` and ``m3``, and one
fed by ``kWh`` and ``MJ``). ``nomenclature_target_unit`` instead canonicalises: one
EF-convention unit per physical dimension, exactly what the nomenclature package's own
sentier-mappings metadata already promises ("kilogram, kBq with a Bq -> kBq factor,
cubic meter, megajoule, m2, m2*a"), with the source-to-target factor made explicit via
its returned ``conversion_factor`` instead of silently assumed 1.

That canonicalisation is only safe when a fixed factor bridges every source unit onto
one target dimension (water's density does); when it does not (EF's "Wood" is counted
by mass, but BAFU also reports standing wood by volume, with no density convention
anywhere in this codebase), decision 2026-09-14 withholds the wrong-dimension source
instead of inventing one -- ``NOMENCLATURE_TARGET_DIMENSION``/
``nomenclature_unit_mismatch``, consulted by ``mappings_biosphere_matched._decide``.

<a id="sentier_importers.sources.bafu.ef_units.WATER_USE_METHOD"></a>

#### WATER\_USE\_METHOD

EF 3.1's water-use method id, used by ``conversion_for``'s water-density special
case below; also imported by ``mappings_biosphere_matched._decide`` for the
ocean-discharge guard, so the two modules never risk stating the id differently.

<a id="sentier_importers.sources.bafu.ef_units.NOMENCLATURE_TARGET_DIMENSION"></a>

#### NOMENCLATURE\_TARGET\_DIMENSION

EF target-name -> the one physical dimension EF's own convention counts it in,
consulted only for an uncharacterised nomenclature-package match (round 5, decision
2026-09-14): unlike water (a genuine, fixed mass -> volume density factor,
``_WATER_DENSITY_FACTOR``), a name here has NO valid cross-dimension conversion at
all -- ``nomenclature_target_unit`` would otherwise happily canonicalise a
cubic-meter source onto ``"cubic meter"`` right next to a kilogram source of the
SAME EF flow canonicalised onto ``"kilogram"``, two different target units for one
EF node with no way to reconcile them. "Wood" is the one such name today: EF counts
it by mass, but BAFU also reports standing wood by volume (``m3``, a wood-density
assumption this codebase does not carry anywhere else) -- decision 2026-09-14:
withhold the wrong-dimension source (``unit_mismatch``) rather than invent one.

<a id="sentier_importers.sources.bafu.ef_units.nomenclature_unit_mismatch"></a>

#### nomenclature\_unit\_mismatch

```python
def nomenclature_unit_mismatch(flow: BafuFlow, ef_flow: EfFlow) -> str | None
```

The withholding detail when ``flow.unit``'s physical dimension disagrees with
``NOMENCLATURE_TARGET_DIMENSION``'s entry for ``ef_flow.name``, or ``None`` when
``ef_flow.name`` has no entry there at all, or the dimension agrees.

Consulted by ``mappings_biosphere_matched._decide`` for every match onto an
uncharacterised target, ahead of ``nomenclature_target_unit``: a name in this table
fixes the substance to one physical dimension, and a source outside it must be
withheld rather than silently canonicalised onto a target unit that does not
correspond to the same physical measurement at all (unlike the water density
special case, there is no fixed factor to bridge the two here).

<a id="sentier_importers.sources.bafu.ef_units.ENERGY_CONTENT"></a>

#### ENERGY\_CONTENT

Net calorific values, MJ per BAFU unit, keyed by (BAFU name, BAFU unit) so a
conversion is never applied by accident. These are the resource-flow definitions the
BAFU-2026 inventory is built from. `Gas, natural/m3` exists in both m3 and Nm3 in
BAFU; both are treated as normal cubic metres. Decision (g), 2026-09-13: coal-mine
off-gas (which the pipeline itself matches onto EF's "Natural Gas" resource flow, by
CAS -- both share CAS 8006-14-2) is approximated at the same natural-gas value, in
both its m3 and Nm3 variants; see ``ENERGY_CONTENT_NOTES`` for the extra caveat text
these two keys carry.

Round 7, decision 2026-09-14: Coal (hard and brown), Oil (crude) and both natural-gas
keys (including the coal-mine off-gas approximation, which shares the natural-gas
value) were replaced with values implied by a parity check against BAFU's own
published EF 3.1 results -- a regression of BAFU's published resource-use score
against the source amount, R2 1.0 -- rather than the earlier generic net calorific
value convention; see ``_REGRESSION_INFERRED_ENERGY_CONTENT`` for the caveat wording
this earns. Peat and Uranium are unchanged and keep the original wording.

<a id="sentier_importers.sources.bafu.ef_units.ENERGY_CONTENT_NOTES"></a>

#### ENERGY\_CONTENT\_NOTES

Extra caveat text appended (after "; ") to the energy-content caveat for specific
``ENERGY_CONTENT`` keys, when the NCV factor alone would not disclose an assumption
baked into the key itself. Decision (g), 2026-09-13: the two coal-mine off-gas keys
are not natural-gas extraction at all -- the factor is a deliberate approximation,
and every entry using it must say so. A key absent here carries no extra text.

<a id="sentier_importers.sources.bafu.ef_units.STOICHIOMETRIC"></a>

#### STOICHIOMETRIC

Round 4, decision 2026-09-13: the two BAFU ``TiO2, ...`` ore-composite-shaped names
that ``matching.matchers.OreCompositeMatcher`` does NOT decompose (its ``_ORE_RE``
requires a bare element as the leading segment; ``TiO2`` names a compound, not an
element) but that the curated alias table still maps onto plain ``Titanium`` --
BAFU's amount is kg of TiO2, not kg of titanium metal, so it needs its own factor
(the titanium mass fraction of TiO2, 47.9/79.9 rounded) applied the same way
``ENERGY_CONTENT`` is: keyed on the exact BAFU (name, unit) pair, consulted by
``conversion_for`` whenever the target's reference unit is kilogram.

<a id="sentier_importers.sources.bafu.ef_units.STOICHIOMETRIC_NOTES"></a>

#### STOICHIOMETRIC\_NOTES

The caveat text for each ``STOICHIOMETRIC`` key, same shape as
``ENERGY_CONTENT_NOTES``: unlike the energy-content caveat (one generic template,
the factor and unit filled in), there is no substance-neutral wording for "this
amount is really kg of a different compound" -- the compound name is part of the
sentence itself, so each key's full caveat is stored here rather than assembled.

<a id="sentier_importers.sources.bafu.ef_units.nomenclature_target_unit"></a>

#### nomenclature\_target\_unit

```python
def nomenclature_target_unit(flow: BafuFlow,
                             ef_flow: EfFlow) -> tuple[str, float | None]
```

The EF-convention unit for ``flow.unit``'s physical dimension, paired with the
factor that rescales the source amount onto it (``None`` when the source is
already at that scale) -- used only when the match target is uncharacterised (the
nomenclature package): such a target has no EF reference unit of its own to defer
to (``EfFlowIndex.reference_unit`` returns ``None`` for it), so ``entry_for`` uses
this instead.

Round 5, decision 2026-09-14: replaces the earlier same-scale-only
``nomenclature_unit`` respelling (kept the SOURCE unit's own spelling, never a
factor) -- see the module docstring for why that was wrong: it let one EF flow fed
by two differently-scaled BAFU sources (``Bq``/``kBq``, ``kg``/``m3`` for water,
``kWh``/``MJ``) end up with two different ``target["unit"]`` values and no
``conversion_factor`` to reconcile them.

Per physical dimension (``_DIMENSION``, canonicalised via
``_NOMENCLATURE_TARGET_UNIT``): mass -> kilogram (``kg`` needs no factor), EXCEPT
a water flow (``_is_water_flow`` on ``ef_flow``, never on ``flow`` -- the source
name is not what is being checked) -> cubic meter, reusing the exact water-density
factor ``conversion_for`` applies to a characterised water-use match
(``_WATER_DENSITY_FACTOR``); activity -> kBq (``Bq`` rescales by
``_SCALED[("Bq", "kBq")]``, ``kBq`` needs no factor); energy -> megajoule (``kWh``
rescales by ``_SCALED[("kWh", "megajoule")]``, ``MJ`` needs no factor); volume ->
cubic meter (``m3``/``Nm3`` need no factor, same physical scale); area -> ``m2``;
area-time -> ``m2*a`` (``m2a`` needs no factor, same physical scale); volume-time
has no EF convention at all -- BAFU's own ``m3y`` spelling is kept as-is (the one
real BAFU flow in this dimension, "Volume occupied, reservoir").

A source unit outside every dimension table entirely is returned unchanged, with
no factor -- a spelling courtesy, not a claim of physical accuracy, same as the
``nomenclature_unit`` respelling this replaces.

Never called for a (``flow``, ``ef_flow``) pair ``nomenclature_unit_mismatch``
would refuse (round 5, decision 2026-09-14, e.g. a cubic-meter "Wood" source):
``_decide`` withholds any such pair as ``unit_mismatch`` before an entry -- and
this function -- is ever reached for it, the same contract ``entry_for``'s own
``ValueError`` documents for a characterised mismatch.

<a id="sentier_importers.sources.bafu.ef_units.unit_conversion"></a>

#### unit\_conversion

```python
def unit_conversion(bafu_unit: str, ef_unit: str | None) -> float | None
```

Fixed multiplier from ``bafu_unit`` onto EF's ``ef_unit``, or ``None`` when unsafe.

The same unit spelling is trivially 1.0. Otherwise a conversion is only ever safe
within one physical dimension (see ``_DIMENSION``): most BAFU/EF spelling pairs
within a dimension are the same physical scale and need no factor at all (1.0,
e.g. ``kg``/``kilogram``, ``m3``/``cubic meter``, ``m2*a``/``m2a``); the handful
that are not (an SI activity prefix, the historical kWh/MJ energy pair) have one
fixed factor in ``_SCALED``. A cross-dimension pair (e.g. a volume-denominated
BAFU flow onto an EF flow whose reference unit is energy or mass), or either unit
outside ``_DIMENSION`` entirely, returns ``None`` -- there is no general fixed
conversion between different physical quantities, so the caller must withhold the
flow rather than assert a fabricated factor.

The one true mass -> volume conversion this system asserts (a BAFU kilogram water
flow onto an EF water-use cubic-meter flow, using water's density) is deliberately
NOT handled here: it depends on the EF flow's characterisation method, which this
function -- unit strings only -- cannot see. It is applied as a special case at
the call site instead (see ``conversion_for``).

<a id="sentier_importers.sources.bafu.ef_units.conversion_for"></a>

#### conversion\_for

```python
def conversion_for(flow: BafuFlow, match: Match,
                   index: EfFlowIndex) -> tuple[float, str | None] | None
```

The multiplier from ``flow.unit`` onto ``match``'s EF reference unit, paired with
any caveat that factor itself carries, or ``None`` when no fixed conversion exists
and the flow must be withheld.

Checked in this order: an energy-content factor (``ENERGY_CONTENT``) whenever the
target's reference unit is megajoule and ``(flow.name, flow.unit)`` is a key BAFU
actually reports -- checked first, and keyed on the exact BAFU (name, unit) pair,
so it is never applied by accident to an unrelated flow that merely happens to
share the same EF target; then a stoichiometric factor (``STOICHIOMETRIC``,
decision 2026-09-13) whenever the target's reference unit is kilogram, the same
way and for the same reason; then the water density special case (depends on the
target's characterisation method, so it cannot live in the generic, method-blind
``unit_conversion`` table); then the generic, unit-string-only fallback.

The energy-content caveat's own wording depends on the key (round 7, decision
2026-09-14): a key in ``_REGRESSION_INFERRED_ENERGY_CONTENT`` names the parity-check
regression that produced its factor; every other key keeps the original net
calorific value wording. A key also present in ``ENERGY_CONTENT_NOTES`` (decision
(g), 2026-09-13: the two coal-mine off-gas keys) has that extra text appended to
the caveat on top of either wording, disclosing an assumption the factor alone
would not.
