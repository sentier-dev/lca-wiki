**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.bafu.mappings_biosphere_matched` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.bafu.mappings_biosphere_matched cfg.yml > sentier_importers.sources.bafu.mappings_biosphere_matched.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched"></a>

# sentier\_importers.sources.bafu.mappings\_biosphere\_matched

bafu-2026-v1 -> EF 3.1 CF keys by public matching (the characterised package,
biosphere-3-matched).

For every BAFU-2026 v1 elementary flow that neither the curated (biosphere-1-curated)
nor the inferred (biosphere-2-inferred) package maps, run
``matching.pipeline.default_pipeline`` (name, land-use class, ore composite, synonym,
qualifier, carbon-oxide, ion-strip, alias, the same eight tiers again on the
region-stripped name, CAS last) against the public EF flow index and emit one
``replace`` entry per match. Withheld flows are emitted by the sibling coverage
source. Round 4, decision 2026-09-13: a tier whose candidates exist in EF but not in
the flow's own sub-compartment (``sub_compartment_absent``) no longer stops the
pipeline outright; a later tier -- most often CAS, after every name-keyed tier has
failed to place -- may still resolve it (``pipeline.MatchPipeline.match``).

Inputs: the ecoSpold zip (primary), ``curated`` and ``inferred`` payloads (exclusion)
and ``ef_cfs`` (sentier-methods CF table) all go through the content-addressed fetch
cache like any other input. Only ``ef_vocab`` (a DIRECTORY of sentier-vocab
elementary-flow shards) bypasses it, read from its local path directly in ``parse``:
a directory has no single content digest to cache against.

Unit/dimension conversion (``unit_conversion``, ``conversion_for``, ``ENERGY_CONTENT``,
``STOICHIOMETRIC``, ``nomenclature_target_unit``) lives in the sibling ``ef_units`` module.

Round 5, decision 2026-09-14 (``_name_only_match``, wired into ``_decide``): a flow the
pipeline gives up on entirely (``Unmatched(reason="no_ef_flow")``) over the sibling
nomenclature package's inclusive index gets one more try -- "for the ones with names:
we map, else: nothing". Every EF flow anywhere in the inclusive index whose name
(``EfFlow.name``, the matching key, not ``EfFlow.label``) equals the source name,
case-insensitively, is looked up regardless of bucket
(``ef_index.EfFlowIndex.by_name_any_bucket``); if at least one exists and every one of
them is uncharacterised, the flow is aligned onto one of them by name alone, with no
context and no factor. A single characterised namesake vetoes the alignment entirely
(this source's own characterised-only index can never reach this rule at all --
gated on ``EfFlowIndex.includes_uncharacterised``). See ``_name_only_match`` and
``entry_for`` for the full rule and the comment it produces.

Round 6, decision 2026-09-14: a characterised EF target's matching key
(``EfFlow.name``) and its display name (``EfFlow.label``) are no longer the same
thing -- ``ef_index.EfFlowIndex.from_tables`` names a characterised flow from the CF
table's own JRC spelling for matching, but ``entry_for`` emits ``target["name"]``
from ``ef_flow.label`` (the vocab pref_label, when it was kept), so a BAFU flow that
matches on the JRC name can still emit the nicer, more familiar vocab spelling. See
``ef_index.py``'s own docstring and ``EfFlow.label`` for the full rule (curated
defects and same-bucket collisions suppress the vocab label back to the JRC name).

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs"></a>

## ParsedInputs Objects

```python
@dataclass(frozen=True)
class ParsedInputs()
```

Everything ``BafuEfMatchedSource.parse`` builds once, for ``outcomes``/``transform``
to reuse: the BAFU flow universe, the per-substance CAS table (and its conflicts,
for the sibling coverage source to report), the curated, inferred and matched
source-code sets (kept separate so the coverage sidecar can tell which package
mapped a flow; see ``excluded``), the EF flow index and the matching pipeline built
over it.

``matched_codes`` is empty unless the registry entry declares a ``matched`` input
(only the nomenclature source does): the matched and nomenclature packages both run
over the characterised-only index's leftovers, so the nomenclature package must
also skip whatever the matched package itself mapped, not just curated/inferred.

``inclusive_index``/``inclusive_pipeline`` are the sibling coverage source's own
fields (``None`` here): its ``parse`` override attaches an inclusive
(``include_uncharacterised=True``) index and the pipeline built over it, so its
``transform`` can run the nomenclature package's second pass without touching
``self.inputs`` or ``self.config`` at all.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.bafu"></a>

#### bafu

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.cas"></a>

#### cas

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.cas_conflicts"></a>

#### cas\_conflicts

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.curated_codes"></a>

#### curated\_codes

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.inferred_codes"></a>

#### inferred\_codes

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.index"></a>

#### index

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.pipeline"></a>

#### pipeline

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.matched_codes"></a>

#### matched\_codes

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.inclusive_index"></a>

#### inclusive\_index

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.inclusive_pipeline"></a>

#### inclusive\_pipeline

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.ParsedInputs.excluded"></a>

#### excluded

```python
@property
def excluded() -> frozenset[str]
```

Every source code the curated, inferred or matched package already maps --
this source's exclusion set.

A derived union rather than a stored field: ``curated_codes``/
``inferred_codes``/``matched_codes`` are the single source of truth (the
coverage sidecar needs them apart), and this property keeps ``outcomes``
(which only needs the union) unchanged.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.flow_sort_key"></a>

#### flow\_sort\_key

```python
def flow_sort_key(flow: BafuFlow) -> tuple[str, str, str, str]
```

The stable order every BAFU flow listing (``outcomes``, the coverage sidecar) is
sorted by: name first, then category/subcategory/unit to break ties between flows
sharing a name (e.g. ``Zinc`` to different sub-compartments).

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.source_record"></a>

#### source\_record

```python
def source_record(flow: BafuFlow) -> Record
```

The ``source`` sub-record shape the coverage sidecar carries for every flow:
name, code, unit and context unconditionally (unit may be ``""`` for a unitless
flow; the key is kept regardless). Contrast ``entry_for``, whose own ``source``
omits a falsy unit/context -- the randonneur payload convention.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.substance_cas"></a>

#### substance\_cas

```python
def substance_cas(
        records: Records) -> tuple[dict[str, str], dict[str, tuple[str, ...]]]
```

Normalised CAS number per substance NAME over every biosphere exchange (group 4).

A BAFU flow name is shared across sub-compartments (``Methanol`` to air and to
water, say); its CAS number is a property of the substance, not the placement, so
it is collected per name rather than per (name, category, subcategory, unit).
Every value is compared after ``normalise_cas`` (leading-zero padding, e.g.
``000067-56-1`` vs ``67-56-1``, must not read as two different substances), and a
blank or missing CAS is ignored rather than counted as a value. A name whose
exchanges disagree on (normalised) CAS gets no CAS at all -- returned instead in
the second mapping, keyed by name and sorted for determinism, so a caller can see
what was withheld and why (and so it round-trips through JSON unchanged).

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.outcome_for"></a>

#### outcome\_for

```python
def outcome_for(flow: BafuFlow, cas: str | None, pipeline: MatchPipeline,
                index: EfFlowIndex) -> Match | Unmatched
```

Match ``flow`` against ``pipeline``, then run the result through ``_decide``.

The one place the per-flow "match, then decide" computation lives, shared by
``BafuEfMatchedSource.outcomes`` (this source's own single pass, over its own
characterised-only ``pipeline``/``index``) and the coverage sidecar's second pass
(``BafuEfCoverageSource.transform``, over its own inclusive pair): both passes
differ only in which ``pipeline``/``index`` get passed in here. A module-level
function, not a method: the two call sites live in two different ``Source``
subclasses, and neither needs ``self``.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource"></a>

## BafuEfMatchedSource Objects

```python
class BafuEfMatchedSource(Source)
```

Match every BAFU flow the curated and inferred packages leave uncovered against
the EF index.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.include_uncharacterised"></a>

#### include\_uncharacterised

Whether ``parse`` builds the EF index with uncharacterised flows included (see
``EfFlowIndex.from_bytes``). ``False`` here -- this source's targets always
carry a real factor. The nomenclature source (``mappings_biosphere_
nomenclature.BafuEfNomenclatureSource``) is the one subclass that flips this.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData
```

Fetch every named input except ``ef_vocab`` (a directory, read locally in ``parse``).

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

One record holding a :class:`ParsedInputs`; ``outcomes``/``transform`` reuse it.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.entry_for"></a>

#### entry\_for

```python
def entry_for(flow: BafuFlow, match: Match, index: EfFlowIndex) -> Record
```

One randonneur ``replace`` entry asserting ``flow`` resolves to ``match``.

For a characterised target, the target unit is always the EF flow's own
reference unit (``EfFlowIndex.reference_unit``) -- never a respelling of the
BAFU unit -- and ``conversion_factor`` is set only when that factor is not
1.0. Raises ``ValueError`` when no fixed conversion exists: ``outcomes()``
withholds any such flow as ``unit_mismatch`` before an entry is ever built for
it, so this can only fire on a direct call with a mismatched (flow, match)
pair.

For an uncharacterised target (the nomenclature package only -- ``_decide``
never lets one reach here for the default, characterised-only source), there is
no EF reference unit at all: the target unit is ``nomenclature_target_unit``'s
EF-convention spelling for the source unit's physical dimension (round 5,
decision 2026-09-14), and ``conversion_factor`` is set whenever that function
returns a factor (a source unit already at the EF-convention scale gets
``None`` back and no key at all -- same as the characterised branch below,
never a fabricated 1.0). ``target["context"]`` is omitted entirely in two
distinct cases, never both disclosed at once:

- the target is a resource-bucket flow whose name is energy-carrier-shaped
  (``ef_flow.bucket == "resource"`` and ``ef_index.UNCERTAIN_RESOURCE_NAME``
  matches, decision (f)(2), 2026-09-13) -- the bw-context crosswalk cannot
  reach an EF energy-resource branch at all (see
  ``ef_index.UNCERTAIN_RESOURCE_NAME``'s own docstring, which is specifically
  about the *resource* branch the crosswalk cannot reach; an emission-bucket
  flow that happens to share an energy-shaped name is unaffected and keeps its
  context), so asserting one, even as "uncertain", would overstate what is
  known -- and the comment says so ("EF context not recoverable ...") instead
  of the usual branch/sub-compartment-uncertain wording;
- the match is a name-only alignment (round 5, decision 2026-09-14,
  ``match.placement == compartments.Placement.NAME_ONLY.value``, built by
  ``mappings_biosphere_matched._name_only_match``): the chosen EF namesake
  lives in a different bucket than the source flow's own category, so its
  context is never the source's context to assert -- the match's own one
  caveat already discloses this ("... so the EF context is omitted ..."), so
  neither the energy-carrier wording nor the branch/sub-compartment-uncertain
  wording is added for it (both would either be false or duplicate what the
  caveat already says).

Any of the three placements whose own first caveat names a specific EF
leaf/branch (``resource_branch_fallback``, ``unspecified_fallback``,
``nomenclature_placement``) drops that caveat for an energy carrier, since
naming a specific leaf would contradict the "not recoverable" disclosure just
given -- only trailing (non-placement) caveats, if any, are kept;
``resource_branch_fallback`` also drops its own "placed on the inferred EF
resource branch ..." wording (below) for the same reason. A name-only match's
own placement is never one of these three, so this dropping never applies to
it -- its one caveat is always kept whole. Otherwise the comment always starts
with a fixed disclosure that the target carries no factor in any EF 3.1 method
and that the target unit is the EF convention for the source unit's dimension,
followed by a branch/sub-compartment caveat when the target's context itself
was uncertain (``EfFlow.context_uncertain``, skipped for a name-only match same
as for an energy carrier), then the match's own caveats -- except a
``resource_branch_fallback`` caveat, which is never honest to repeat verbatim
for an uncharacterised target: the pipeline's own wording ("EF has ... only as
...") asserts a fact about EF's *characterised* branches that has no bearing
here, so it is replaced with a caveat that instead says plainly that this is an
inferred placement on an uncharacterised flow.

A BAFU ``..., resource correction`` flow (a correction entry against a
substance's own extraction, not a distinct resource) gets one more caveat,
appended after those. Last of all (round 5, decision 2026-09-14): when
``nomenclature_target_unit`` returns a real factor, ``"amount rescaled by
{factor:g}"`` is appended too, so the comment always names the very factor
``conversion_factor`` carries.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.outcomes"></a>

#### outcomes

```python
def outcomes(records: Records) -> list[tuple[BafuFlow, Match | Unmatched]]
```

Every non-excluded BAFU flow with its final outcome, sorted for determinism.

A flow the curated, inferred or matched package already maps is skipped
entirely -- not just its entry withheld -- since those packages keep
precedence and this source's job is only to fill the gap they leave.

<a id="sentier_importers.sources.bafu.mappings_biosphere_matched.BafuEfMatchedSource.transform"></a>

#### transform

```python
def transform(records: Records) -> Rows
```

Emit one entry per BAFU flow ``outcomes`` resolves to a characterised ``Match``.

A ``Match`` onto an uncharacterised target is never emitted here -- with
``include_uncharacterised`` at its default (``False``) this cannot happen at
all (the index built in ``parse`` carries no uncharacterised flow to match
onto), but the guard makes that contract explicit rather than relying on the
flag never being flipped by accident. The nomenclature source
(``mappings_biosphere_nomenclature.BafuEfNomenclatureSource``) is the one
place such a match is actually emitted.
