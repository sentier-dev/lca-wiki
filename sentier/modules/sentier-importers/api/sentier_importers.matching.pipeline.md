**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.matching.pipeline` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.matching.pipeline cfg.yml > sentier_importers.matching.pipeline.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.matching.pipeline"></a>

# sentier\_importers.matching.pipeline

Match a BAFU flow to one EF flow: matchers in tier order, then placement, then
disambiguation. Anything that cannot be asserted comes back as ``Unmatched`` with a
reason a reviewer can act on.

Tier order: exact name, land-use class, ore composite, synonym, qualifier spelling,
carbon-oxide rewrite, ion-strip, curated alias, the same eight tiers again applied to
the region-stripped name (``RegionStripMatcher`` applies that same first-hit rule
among its own inner matchers), then CAS last. The first matcher whose candidates
resolve to a ``Match``, or to an ``Unmatched`` other than ``sub_compartment_absent``,
decides the outcome. ``sub_compartment_absent`` alone is not final (round 4, decision
2026-09-13): it means this matcher's candidates exist in EF but not in the flow's own
sub-compartment, which a later tier's candidates may still place correctly (e.g. a
name-tier hit that only exists on an unplaceable leaf, followed by a CAS-tier hit on
the very same substance in the right leaf) -- so the pipeline keeps trying later tiers
instead of stopping there. The first ``Match`` any tier produces wins; if none ever
does, the FIRST ``sub_compartment_absent`` seen is returned (it names the substance,
so it is the most informative of however many dead tiers followed). Every other
``Unmatched`` reason (``ambiguous_substances`` included) still stops the pipeline
outright, exactly as before. When a ``Match`` is only reached this way and its own
tier is ``cas``, an extra caveat names the CAS used, since the EF target's own name
found by CAS may not resemble the source name at all (BAFU
``2-Methyl-4-chlorophenoxyacetic acid`` onto EF's
``(4-Chloro-2-methylphenoxy)acetic acid``, CAS 94-74-6, MCPA, is exactly such a case).

After a matcher's candidates fail both EXACT and UNSPECIFIED placement, one more
placement is tried before giving up: the resource-branch fallback (decision (b),
2026-09-13). A BAFU resource sub-compartment that carries no information about the
extraction medium (``compartments.is_uninformative_resource_sub``) may still be placed
on the one EF resource branch that holds the substance, provided every candidate the
matcher found lands on the very same EF leaf -- if the candidates spread over more
than one leaf, there is nothing to choose between and the flow stays
``sub_compartment_absent``.

Nomenclature package only (decision (f)(1), 2026-09-13): when every remaining candidate is
uncharacterised (``not Candidate.flow.characterised``) and the index was built with
``include_uncharacterised=True``, one more placement -- ``Placement.NOMENCLATURE`` --
is tried before ``sub_compartment_absent``: the candidates carry no factor in any
case, so relaxing which sub-compartment they are asserted on is a nomenclature
statement only, never a factor claim. When the candidates share one EF leaf that
leaf is used outright; when they spread over several, each source gets exactly one
preferred leaf for its own long-term-ness: a long-term source (round 7, decision
2026-09-14, and see below) is restricted to the candidate leafs that are themselves
long-term, among which the bucket-level unspecified (long-term) leaf
(``unspecified_leaf`` with ``long_term=True``) is preferred, else the alphabetically
first eligible one; a non-long-term source is unrestricted, preferring the plain
bucket-level unspecified leaf (``long_term=False``), else the alphabetically first
candidate leaf. The caveat names every leaf the name was found in when there is more
than one, and which one was picked, so it never overstates "only" when several exist.
This never fires for the matched package's (biosphere-3-matched) characterised-only
index: that index carries no uncharacterised flow at all, so the ``not characterised``
condition can never hold for it.

Round 4, decision 2026-09-13, one more placement, tried after NOMENCLATURE and before
giving up as ``sub_compartment_absent``: ``Placement.DEFAULT_LEAF`` -- a ``water`` /
``unspecified`` BAFU source whose candidates exist on neither the unspecified nor the
unspecified (long-term) leaf, but do exist on fresh water, is placed there instead
(``DEFAULT_LEAF`` table below); air, soil and resource get no such fallback -- there is
no single obvious "default" leaf for them the way fresh water is the default body of
water. Ordered after NOMENCLATURE so it never pre-empts that placement's own leaf
preference (module docstring above; see also the ordering comment in ``_resolve``).

Round 7, decision 2026-09-14: ``Placement.LONG_TERM_COLLAPSED`` is retired. EF 3.1's
``(long-term)``/``, long-term`` contexts carry factor 0 in every toxicity and
eutrophication method; collapsing a long-term BAFU source onto the matching
immediate-emission leaf (as ``LONG_TERM_COLLAPSED`` used to do) silently attached that
leaf's real, nonzero factor to a flow EF itself treats as factorless -- BAFU
``Chromium VI`` to groundwater, long-term this way alone made 45 percent of the
curated package's human-toxicity-cancer score. A long-term BAFU source (its
sub-compartment carries ``, long-term``) now places only onto an EF leaf that is
itself a long-term leaf: EXACT via ``place`` (the ``, long-term`` sub-compartment's own
family, e.g. ``river, long-term`` -> ``water, unspecified (long-term)``), or the
UNSPECIFIED fallback onto the bucket-level unspecified (long-term) leaf where the
bucket has one (``compartments.unspecified_leaf`` with ``long_term=True``). The same
rule reaches the relaxed NOMENCLATURE placement above too (nomenclature package only):
when the BAFU source is long-term, only a candidate leaf that is itself a long-term
leaf is eligible there either -- crossing to a non-long-term leaf, even a nameless,
factorless nomenclature-only one, would misrepresent a long-term source as an
immediate-emission one. If none of a long-term source's candidates ever land on a
long-term leaf, by any of the above, the flow is ``Unmatched("sub_compartment_absent")``
in both packages -- the substance simply has no long-term flow in EF, and the
ordinary (non-long-term) EF leaves it does have must never be substituted for it.

Round 4, decision 2026-09-13, one more tiebreak inside ``_pick``, tried only after the
source CAS itself fails to single out exactly one candidate (no source CAS, or the CAS
matches none or several of them -- a CAS that DOES single one out is positive evidence
and always wins, never overridden by the refrigerant code): when several same-leaf
candidates carry different CF identities (normally ``ambiguous_substances``) and the
source name ends in a refrigerant code (``, CFC-10``, ``, HCFC-140``, ...) that names
exactly one of the candidates, that candidate is used -- but only when its own CF
identity characterises every impact-category method id at least one other candidate
does (coordinator decision, round 4 review): BAFU sometimes bakes several synonyms for
one substance into its own name, and the refrigerant code is the most specific of them,
but two EF flows for the same substance can be genuinely complementary (one carries
climate/POF/ecotoxicity factors, the other ozone-depletion/human-toxicity ones) rather
than duplicates, and picking the code-named one must never silently drop an impact
category the other one alone would have supplied -- when it would, this tiebreak
declines and the ambiguity is reported as usual.

Round 6, decision 2026-09-14: a label-collision guard inside ``_pick``
(``_label_collision``) catches the sentier-vocab pref_label-defect shape that
``ef_index.load_label_defects`` fixes for known cases -- two or more same-leaf
candidates sharing the exact same lowercase name but carrying different, present CAS
numbers (two distinct real substances filed under one EF preferred label). When the
source CAS matches NONE of them (no source CAS at all, or one naming a substance
outside this candidate set), this is reported as
``Unmatched("ambiguous_substances", ...)`` instead of silently resolved by name
similarity or code order, the way an ordinary "several synonymous EF flows, identical
factors" tie is. A source CAS that DOES match at least one candidate is treated as
real evidence and never triggers the guard, even when more than one candidate shares
that CAS (a genuine duplicate entry rather than a different substance) -- the ordinary
free-choice narrowing (with its own caveat) still applies among those.

<a id="sentier_importers.matching.pipeline.DEFAULT_LEAF"></a>

#### DEFAULT\_LEAF

Round 4, decision 2026-09-13: the one EF leaf a bucket's ``unspecified`` BAFU source
falls back onto (``Placement.DEFAULT_LEAF``) when EF has neither the unspecified nor
the unspecified (long-term) leaf for the substance. Only ``water`` gets one -- fresh
water is the obvious default body of water; air, soil and resource have no equally
obvious single default leaf, so they get none.

<a id="sentier_importers.matching.pipeline.Match"></a>

## Match Objects

```python
@dataclass(frozen=True)
class Match()
```

One BAFU flow resolved to one EF flow.

<a id="sentier_importers.matching.pipeline.Match.code"></a>

#### code

<a id="sentier_importers.matching.pipeline.Match.tier"></a>

#### tier

<a id="sentier_importers.matching.pipeline.Match.placement"></a>

#### placement

<a id="sentier_importers.matching.pipeline.Match.location"></a>

#### location

<a id="sentier_importers.matching.pipeline.Match.candidates"></a>

#### candidates

size of the winning placement group, before disambiguation

<a id="sentier_importers.matching.pipeline.Match.caveats"></a>

#### caveats

<a id="sentier_importers.matching.pipeline.Unmatched"></a>

## Unmatched Objects

```python
@dataclass(frozen=True)
class Unmatched()
```

A BAFU flow that could not be resolved, with a reason a reviewer can act on.

<a id="sentier_importers.matching.pipeline.Unmatched.reason"></a>

#### reason

<a id="sentier_importers.matching.pipeline.Unmatched.detail"></a>

#### detail

<a id="sentier_importers.matching.pipeline.MatchPipeline"></a>

## MatchPipeline Objects

```python
class MatchPipeline()
```

Runs matchers in tier order, then places and disambiguates the result.

<a id="sentier_importers.matching.pipeline.MatchPipeline.__init__"></a>

#### \_\_init\_\_

```python
def __init__(matchers: Sequence[Matcher],
             index: EfFlowIndex,
             *,
             unspecified_fallback: bool = True,
             resource_fallback: bool = True) -> None
```

Build the pipeline from an ordered ``matchers`` sequence and its ``index``.

``unspecified_fallback`` controls whether a candidate that only exists on the
bucket-level "unspecified" EF context is accepted (with a caveat) when the
BAFU sub-compartment names something more specific; disabling it turns that
case into a ``sub_compartment_absent`` ``Unmatched`` instead.

``resource_fallback`` controls the resource-branch fallback (decision (b),
2026-09-13): whether an uninformative BAFU resource sub-compartment
(``compartments.is_uninformative_resource_sub``) may be placed on the one EF
resource branch its candidates agree on; disabling it turns that case into a
``sub_compartment_absent`` ``Unmatched`` too.

<a id="sentier_importers.matching.pipeline.MatchPipeline.match"></a>

#### match

```python
def match(flow: BafuFlow, cas: str | None) -> Match | Unmatched
```

Resolve ``flow`` (with an optional ``cas`` number) to one EF flow, or report why not.

Guards the flow's compartment and sub-compartment, then tries each matcher in
tier order, handing its candidates to ``_resolve``. The first ``Match`` any
tier produces wins outright. An ``Unmatched`` other than
``sub_compartment_absent`` stops the pipeline immediately too -- a later tier
never rescues, say, a genuine ``ambiguous_substances`` call. Round 4, decision
2026-09-13: ``sub_compartment_absent`` alone does not stop the pipeline; the
first one seen is remembered and later tiers still get a chance, since "the
exact-name EF flow exists but only in another sub-compartment" does not mean a
later tier's candidates (a synonym, an alias, the bare CAS number) cannot still
place correctly. If no tier ever produces a ``Match``, the first
``sub_compartment_absent`` recorded is returned (the most informative of
however many dead tiers followed, since it names the substance); if none of the
tiers even produced that much, the generic ``no_ef_flow`` is returned instead.

When a ``Match`` is only reached after skipping at least one
``sub_compartment_absent`` and its own tier is ``cas``, an extra caveat names
the CAS: CAS is name-blind, so the EF flow it lands on may carry a name that
does not resemble the source at all (module docstring).

<a id="sentier_importers.matching.pipeline.default_pipeline"></a>

#### default\_pipeline

```python
def default_pipeline(index: EfFlowIndex,
                     aliases: Mapping[str, str | Alias],
                     *,
                     unspecified_fallback: bool = True,
                     resource_fallback: bool = True) -> MatchPipeline
```

Build the standard pipeline: name, land-use class, ore composite, synonym,
qualifier, carbon-oxide rewrite, ion-strip, alias, region-stripped, CAS.

``aliases`` is the curated BAFU-name -> EF-preferred-label table (see
``matchers.load_aliases``). ``unspecified_fallback`` and ``resource_fallback`` are
both forwarded to ``MatchPipeline`` unchanged.

``LandUseMatcher`` runs second, right after ``ExactNameMatcher`` and before
``SynonymMatcher``: an EF flow's ``alt_labels`` are free-form BAFU-side data, and a
synonym that happens to collide with a land-use name (``Occupation, dump site``,
say) must not be allowed to steal the match away from the land-use rules -- once a
matcher yields any candidate, ``MatchPipeline.match`` commits to it and never tries
a later tier (see the module docstring). ``ExactNameMatcher`` is left ahead of it
because an EF preferred label never looks like a BAFU ``Occupation``/
``Transformation`` name in practice, so there is nothing for it to steal.

``OreCompositeMatcher`` runs third, right after ``LandUseMatcher``: an ore
composite's own name (``Zinc, Zn 0.63%, ..., in ore``) never looks like an EF
preferred label or a BAFU land-use name, so ordering it there costs nothing, and
it must still run ahead of ``SynonymMatcher``/``QualifierMatcher`` for the same
reason ``LandUseMatcher`` does: an accidental synonym collision must not steal an
ore composite's match away from the element-decomposition rule.

CAS runs last, after every name-keyed tier including the region-stripped ones, not
third: a shared CAS number (the biogenic/fossil/land-use-change carbon dioxide
family, the EF water-use flows, ...) is ambiguous by construction, and an
ambiguity stops the pipeline outright (see ``MatchPipeline.match``). The
qualifier, alias and region-strip tiers exist precisely to resolve those same
names before CAS gets a chance to declare them ambiguous -- a region-stripped name
(``"Water, KR"`` -> ``"Water"``) is still name evidence, not weaker than CAS, so it
must run before CAS too. With CAS first, "Carbon dioxide, fossil" was reported
unmatched in every air sub-compartment instead of resolving through the qualifier
spelling, and "Water, KR" resolved to (or, for the real EF water families,
remained ambiguous by) a bare CAS lookup instead of the more specific
region-stripped name match.

``CarbonOxideMatcher`` and ``IonStripMatcher`` both run right after
``QualifierMatcher``, ahead of ``AliasMatcher``: both rewrite a BAFU name to an EF
spelling the same way ``QualifierMatcher`` does (decisions (d) and (e),
2026-09-13). Since the pipeline commits to the first tier that yields any
candidate, this ordering means a name either of them claims (a bare carbon oxide,
an ion/oxidation-state-shaped name) is decided by them, carrying their own
decision-specific caveat, and never reaches ``AliasMatcher`` at all -- a curated
alias line for such a name would simply never fire (dead weight, not a second
opinion). ``AliasMatcher`` only ever resolves the names neither of these two
claims. Both must still run after ``LandUseMatcher``/``OreCompositeMatcher``/
``SynonymMatcher``, for the same reason those are ordered ahead of
``QualifierMatcher`` above: a more specific earlier tier's match is never stolen.
