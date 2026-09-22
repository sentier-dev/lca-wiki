**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.matching.matchers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.matching.matchers cfg.yml > sentier_importers.matching.matchers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.matching.matchers"></a>

# sentier\_importers.matching.matchers

Matchers: one lookup strategy each, from a BAFU flow to EF candidate flows.

A matcher never places (sub-compartment) or disambiguates (several substances); it
returns every EF flow in the BAFU flow's compartment bucket that its key finds, sorted
by code. Placement and the choice among candidates are the pipeline's job.

<a id="sentier_importers.matching.matchers.ALIASES_PATH"></a>

#### ALIASES\_PATH

<a id="sentier_importers.matching.matchers.LAND_CLASS_SYNONYMS"></a>

#### LAND\_CLASS\_SYNONYMS

BAFU land-class spellings that differ from EF's, applied to each comma segment of
the class independently (e.g. ``annual crop, irrigated`` -> ``arable, irrigated``).
Public: also imported by ``sources.agribalyse.ef_cf_dedup`` to normalize the
SimaPro "EF 3.1 adapted" export onto the same EF class names, since ecoinvent's
land-class vocabulary is the same wherever it is sourced from.

<a id="sentier_importers.matching.matchers.Candidate"></a>

## Candidate Objects

```python
@dataclass(frozen=True)
class Candidate()
```

One EF flow a matcher proposes, tagged with provenance and any carried caveat.

``subcategory_override``, when set, overrides ``flow.subcategory`` for placement
(``MatchPipeline.match``) instead of the source's own sub-compartment -- for a
matcher that knows a flow's true compartment from its NAME rather than from the
source's sub-compartment column (currently: land use, whose BAFU name encodes
``Occupation``/``Transformation`` even when the flow is filed under an unrelated
resource sub-compartment). Such a matcher must always explain the override with a
caveat, except when the source's own sub-compartment already agrees with the
override -- there is nothing to explain in that case.

<a id="sentier_importers.matching.matchers.Candidate.flow"></a>

#### flow

<a id="sentier_importers.matching.matchers.Candidate.location"></a>

#### location

ISO-2 code carried from the source name

<a id="sentier_importers.matching.matchers.Candidate.region"></a>

#### region

non-ISO region token carried from the source name

<a id="sentier_importers.matching.matchers.Candidate.tier"></a>

#### tier

the matcher (tier) that produced this candidate

<a id="sentier_importers.matching.matchers.Candidate.caveat"></a>

#### caveat

a known caveat about this match, if any

<a id="sentier_importers.matching.matchers.Candidate.subcategory_override"></a>

#### subcategory\_override

placement override; see class docstring

<a id="sentier_importers.matching.matchers.Alias"></a>

## Alias Objects

```python
@dataclass(frozen=True)
class Alias()
```

One curated alias table entry: the EF preferred label to match, plus an optional caveat.

<a id="sentier_importers.matching.matchers.Alias.target"></a>

#### target

<a id="sentier_importers.matching.matchers.Alias.caveat"></a>

#### caveat

<a id="sentier_importers.matching.matchers.Matcher"></a>

## Matcher Objects

```python
class Matcher(Protocol)
```

A single matching strategy over one BAFU flow.

<a id="sentier_importers.matching.matchers.Matcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.Matcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return every EF flow this strategy finds for ``flow``, sorted by code.

<a id="sentier_importers.matching.matchers.ExactNameMatcher"></a>

## ExactNameMatcher Objects

```python
class ExactNameMatcher()
```

Matches on the BAFU flow name against the EF preferred label, bucket-scoped.

<a id="sentier_importers.matching.matchers.ExactNameMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.ExactNameMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return EF flows whose preferred label equals ``flow.name`` in ``flow``'s bucket.

<a id="sentier_importers.matching.matchers.SynonymMatcher"></a>

## SynonymMatcher Objects

```python
class SynonymMatcher()
```

Matches on the BAFU flow name against EF synonyms (``alt_labels``), bucket-scoped.

<a id="sentier_importers.matching.matchers.SynonymMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.SynonymMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return EF flows whose synonym equals ``flow.name`` in ``flow``'s bucket.

<a id="sentier_importers.matching.matchers.CasMatcher"></a>

## CasMatcher Objects

```python
class CasMatcher()
```

Matches on a CAS number against the EF flow's CAS, bucket-scoped.

Needs a CAS number to do anything; returns every flow sharing it (several EF flows,
e.g. distinct biogenic/fossil/land-use-change carbon dioxide entries, share a CAS
number -- disambiguating between them is not this matcher's job).

<a id="sentier_importers.matching.matchers.CasMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.CasMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return every EF flow in ``flow``'s bucket whose CAS number matches ``cas``.

<a id="sentier_importers.matching.matchers.QualifierMatcher"></a>

## QualifierMatcher Objects

```python
class QualifierMatcher()
```

Rewrites a BAFU comma-qualifier (``, biogenic`` / ``, fossil`` / ...) to EF spelling.

EF spells qualifiers in parentheses (``Carbon dioxide (biogenic)``), calls the
biogenic class ``biogenic`` (never BAFU's ``non-fossil``), and land transformation
``land use change`` (never BAFU's ``land transformation``).

<a id="sentier_importers.matching.matchers.QualifierMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.QualifierMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return EF flows whose label is ``flow.name`` rewritten to EF qualifier spelling.

<a id="sentier_importers.matching.matchers.CarbonOxideMatcher"></a>

## CarbonOxideMatcher Objects

```python
class CarbonOxideMatcher()
```

Rewrites a bare, unqualified BAFU carbon oxide onto an EF qualified spelling.

EF characterises ``Carbon dioxide``/``Carbon monoxide`` only with a qualifier
(fossil/biogenic/land use change); a bare name never matches on its own. Decision
(e), 2026-09-13: a bare emission (``Carbon dioxide``/``Carbon monoxide`` in the
air bucket) is taken as fossil; BAFU's own ``Carbon dioxide, in air`` (a resource
bucket flow, atmospheric CO2 uptake, not an emission) is taken as biogenic. Both
rewrites carry a caveat naming the decision, so the assumption is never silent.

<a id="sentier_importers.matching.matchers.CarbonOxideMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.CarbonOxideMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return the EF qualified-spelling flows a bare carbon-oxide name rewrites to.

<a id="sentier_importers.matching.matchers.IonStripMatcher"></a>

## IonStripMatcher Objects

```python
class IonStripMatcher()
```

Strips an ion/oxidation-state marker from a BAFU name and matches the bare stem.

Decision (d), 2026-09-13: an ion-shaped BAFU name (``_ION_STRIP_RE``) whose EF
counterpart is the plain element/anion flow is emitted, not withheld -- a human
reviewing the result can see the caveat this matcher attaches to every candidate
it returns. A name with no ion/oxidation-state marker never matches (``[]``); a
marker whose stem EF does not carry at all is left to a later tier (this matcher
only ever collapses onto a same-bucket, same-name EF flow, never invents one).

One escape, checked before collapsing: when the source carries a CAS number that
itself names a species-shaped EF flow in this bucket (``_EF_SPECIES_RE``, e.g.
``Chromium(6+)``) -- this matcher defers (``[]``) rather than steal that better,
species-correct match away from ``CasMatcher``, which runs later. Without this
escape, ``Chromium VI`` (CAS 18540-29-9, no exact/synonym route of its own) would
collapse onto plain ``Chromium`` here instead of resolving onto EF's own
``Chromium(6+)`` flow via CAS -- a real species, silently swapped for a wrong one.

<a id="sentier_importers.matching.matchers.IonStripMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.IonStripMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return the bare-stem EF flow(s) an ion/oxidation-state-shaped name strips to.

<a id="sentier_importers.matching.matchers.LandUseMatcher"></a>

## LandUseMatcher Objects

```python
class LandUseMatcher()
```

Matches a BAFU land-occupation/transformation name onto its EF 3.1 land class.

Applies only to resource-bucket flows named ``Occupation, <class>``,
``Transformation, from <class>`` or ``Transformation, to <class>``. BAFU spells
some classes differently from EF (``annual crop`` for EF's ``arable``, ``unknown``
for EF's ``unspecified``, ...; see ``LAND_CLASS_SYNONYMS``) and files 30 of its
43 land flows under a resource sub-compartment other than ``land`` (most often
``unspecified`` or ``in ground``). Every candidate this matcher returns carries
``subcategory_override="land"`` so the pipeline places it on the EF land-use
context regardless of the BAFU sub-compartment, plus a caveat whenever that
filing disagrees with ``land`` (see ``Candidate.subcategory_override``).

When EF has no flow for the exact class, one parent level is dropped (the last
comma segment) and the lookup retried, with a caveat naming the collapse -- e.g.
``Occupation, dump site, benthos`` collapses onto EF's ``Dump Site``. Candidates
are filtered to the matching EF leaf family too: an ``Occupation`` name is only
ever satisfied from the ``land occupation`` leaf, a ``from``/``to`` name only
from ``land transformation`` -- a same-named flow in the other leaf is never
returned.

A name that still carries an unstripped trailing region token (``, CH``,
``, RER``, ...) is refused outright (``[]``): the one-level-collapse fallback
above would otherwise mistake the region token for a droppable sub-class segment
(``Occupation, traffic area, rail network, CH`` would wrongly "collapse" onto
``Traffic Area, Rail Network`` before ``RegionStripMatcher`` ever gets a chance to
strip ``CH`` properly and record it as a location instead). Region-stripping is
``RegionStripMatcher``'s job; this matcher only ever sees a clean stem when it
runs as one of its ``inner`` matchers.

<a id="sentier_importers.matching.matchers.LandUseMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.LandUseMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return EF land-use flows matching ``flow``'s occupation/transformation class.

<a id="sentier_importers.matching.matchers.OreCompositeMatcher"></a>

## OreCompositeMatcher Objects

```python
class OreCompositeMatcher()
```

Matches an ecoinvent v2 ore-composite name onto its bare element resource.

Resource bucket only. BAFU carries several minerals as an ore composite: a
leading element word, an ore-grade segment (``Zn 0.63%, ..., in ore`` or
``0.99% in sulfide, ..., in crude ore``), and sometimes a trailing ``, in
ground`` (``_ORE_RE``) -- the amount is always kg of the *plain element*, never
of the ore rock. A name whose leading segment is not a bare capitalised element
word (e.g. ``TiO2, 54% in ilmenite, ...``) does not match: it names a compound,
and collapsing it onto the element would silently assert the wrong substance.

Candidates are restricted to the ``non-renewable element resources from ground``
EF leaf (``_ORE_LEAF``) -- an ore composite is never anything else -- and every
candidate carries a caveat naming the composite decomposition, since the BAFU
amount is not what the ore name on its own would suggest.

<a id="sentier_importers.matching.matchers.OreCompositeMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.OreCompositeMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return the bare-element EF resource flow(s) an ore-composite name decomposes to.

<a id="sentier_importers.matching.matchers.AliasMatcher"></a>

## AliasMatcher Objects

```python
class AliasMatcher()
```

Matches on a curated BAFU-name -> EF-preferred-label table, bucket-scoped.

Accepts either plain ``str`` targets or ``Alias`` values; a plain string is wrapped
into a target-only ``Alias``. When the matched alias carries a caveat, every
candidate it produces carries that caveat too.

Round 6, decision 2026-09-14 (``ef_index`` naming, third cut): a characterised EF
flow's matching key (``EfFlow.name``) is now the CF table's own JRC spelling, not
the vocab pref_label these aliases were curated against -- the vocab label
survives, when kept, as ``EfFlow.label`` and a synonym (``EfFlowIndex.
from_tables``). So a target string that still names a flow's pref_label exactly
(not its JRC name) is looked up by synonym too, but only accepted when that
tells us something a plain synonym hit alone would not: every matching flow's
OWN displayed label (``EfFlow.label``, never just any alt_label it happens to
share the target string with) equals the target, and every one of them is the
same identity (``(name, cas)`` -- distinct EF rows for one physical substance are
fine, e.g. genuine duplicates, but two DIFFERENT substances that both merely
list the target as one alt_label among many are not this alias's business at
all, e.g. "Water" must never fall through onto "Water Vapour" just because
"water" appears somewhere in its long synonym list). Falls back to synonym only
when the name lookup itself finds nothing -- a target that resolves by name is
never second-guessed by also checking synonyms.

<a id="sentier_importers.matching.matchers.AliasMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.AliasMatcher.__init__"></a>

#### \_\_init\_\_

```python
def __init__(aliases: Mapping[str, str | Alias]) -> None
```

Build the matcher from ``aliases`` (arbitrary case/whitespace keys).

<a id="sentier_importers.matching.matchers.AliasMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return EF flows whose label -- or, failing that, whose OWN displayed
label via a synonym hit, unambiguously -- equals the alias table's target
for ``flow.name``.

<a id="sentier_importers.matching.matchers.RegionStripMatcher"></a>

## RegionStripMatcher Objects

```python
class RegionStripMatcher()
```

Strips a trailing region token from the flow name and retries with inner matchers.

BAFU sometimes bakes a region into the flow name (``Water, KR``, ``Water, Europe``,
``Water, river, CH``). This matcher recognises a trailing comma-separated region
token (an ISO-3166-1 alpha-2 code, or a small set of named non-ISO regions such as
``Europe``/``RER``/``GLO``), strips it, runs ``inner`` matchers in turn against the
stem name, and re-wraps the first non-empty result with the stripped token recorded
as ``location`` (ISO-2) or ``region`` (anything else) and a ``tier`` of
``"region/<inner tier>"``. No token, no match: ``[]``.

``inner`` must be name-keyed matchers only (``ExactNameMatcher``, ``LandUseMatcher``,
``SynonymMatcher``, ``QualifierMatcher``, ``CarbonOxideMatcher``, ``IonStripMatcher``,
``AliasMatcher``): a ``CasMatcher`` inside would ignore the stripped stem and match
on ``cas`` again, defeating the point of stripping. The actual rule is narrower than
"never reads ``cas``": ``IonStripMatcher`` DOES read ``cas``, but only as a defer
guard (to check whether a same-CAS EF flow already carries its own species marker,
see its docstring) -- it never KEYS its lookup on ``cas`` the way ``CasMatcher``
does, so stripping the region token first still matters for it. ``LandUseMatcher``
remains name-keyed in the strict sense despite its own internal class lookup -- it
only ever reads ``flow.name``.

<a id="sentier_importers.matching.matchers.RegionStripMatcher.tier"></a>

#### tier

<a id="sentier_importers.matching.matchers.RegionStripMatcher.__init__"></a>

#### \_\_init\_\_

```python
def __init__(inner: Sequence[Matcher]) -> None
```

Build the matcher from an ordered sequence of name-keyed inner matchers.

<a id="sentier_importers.matching.matchers.RegionStripMatcher.candidates"></a>

#### candidates

```python
def candidates(flow: BafuFlow, cas: str | None,
               index: EfFlowIndex) -> list[Candidate]
```

Return candidates found for ``flow``'s name stem, tagged with the stripped region.

<a id="sentier_importers.matching.matchers.load_aliases"></a>

#### load\_aliases

```python
def load_aliases(path: Path = ALIASES_PATH) -> dict[str, Alias]
```

Load the curated alias table, keyed by lowercase, stripped BAFU flow name.

A YAML value is either a bare string (becomes a target-only ``Alias``) or a
``{target, caveat}`` mapping. Raises ``ParseError``, naming ``path``, when the
top-level ``aliases`` key is missing, ``None``, or not a mapping, or when an
entry's value is neither a non-empty string nor a well-formed ``{target, caveat}``
mapping (a key with no value at all -- YAML ``null`` -- is exactly such a case).
