**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.matching.compartments` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.matching.compartments cfg.yml > sentier_importers.matching.compartments.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.matching.compartments"></a>

# sentier\_importers.matching.compartments

BAFU ecoSpold compartments against EF 3.1 context paths.

BAFU keys a flow by ``(category, subCategory)`` (``emissions to air`` / ``high. pop.``);
EF keys it by a context path whose last segment (the *leaf*) carries the
sub-compartment (``Emissions to urban air close to ground``). Matching happens on
whole leafs and within one compartment bucket: ``agricultural soil`` must never
match ``non-agricultural soil``, and a resource token never matches an emission leaf.
Placement is category-aware: a BAFU ``(category, subCategory)`` only ever matches a
context whose bucket agrees with ``category`` (via ``bucket_of_bafu_category``), so a
``resources`` category never places on an ``Emissions to air`` context regardless of
what the subCategory token happens to be, and an unrecognised category (e.g. an
ecoSpold ``economic issues`` compartment) never places anywhere.

Emission matching is on the whole leaf tail (after stripping the ``emissions to ``
connective); resource matching is on the whole leaf by suffix (e.g. ``in ground``
matches any leaf ending in ``resources from ground``), except the land family, which
matches the full ``Land use / ...`` leaf directly.

EF 3.1's *characterised* index (``EfFlowIndex`` built without
``include_uncharacterised``, i.e. every index before phase 2 task 3, and still the
default today) has neither a "ground water" leaf nor a "resources from biosphere"
leaf, so the BAFU ``groundwater``/``fossilwater`` tokens (kept below to document BAFU
vocabulary) never match a leaf exactly there; they only ever place through the
bucket-level ``water, unspecified`` fallback (see ``place``), and ``biotic`` never
places at all.

That "resources from biosphere" / ``biotic`` statement stops being quite true once an
index is built with ``include_uncharacterised=True`` (``matching.bw_context``): the
``reso-biot`` crosswalk code introduces exactly one such leaf, "Renewable material
resources from biosphere" (uncharacterised rows like Wood, Biomass, forest gross
calorific value), and ``biotic`` matches it EXACT by suffix like any other resource
leaf (``_RESOURCE_SUFFIX["biotic"]``). There is still no "ground water" leaf in either
index -- ``groundwater``/``fossilwater`` remain fallback-only regardless.

<a id="sentier_importers.matching.compartments.BAFU_BUCKET"></a>

#### BAFU\_BUCKET

<a id="sentier_importers.matching.compartments._LeafFamily"></a>

## \_LeafFamily Objects

```python
class _LeafFamily(NamedTuple)
```

The bucket(s) a BAFU subCategory is valid in, and the EF leaf tail(s) it matches.

Leaf tails are lowercased, with the ``emissions to `` connective already stripped.

<a id="sentier_importers.matching.compartments._LeafFamily.buckets"></a>

#### buckets

<a id="sentier_importers.matching.compartments._LeafFamily.leafs"></a>

#### leafs

<a id="sentier_importers.matching.compartments.KNOWN_SUBCATEGORIES"></a>

#### KNOWN\_SUBCATEGORIES

Every BAFU subCategory this module recognises, across both the emission and
resource families.

<a id="sentier_importers.matching.compartments.Placement"></a>

## Placement Objects

```python
class Placement(Enum)
```

<a id="sentier_importers.matching.compartments.Placement.EXACT"></a>

#### EXACT

<a id="sentier_importers.matching.compartments.Placement.UNSPECIFIED"></a>

#### UNSPECIFIED

<a id="sentier_importers.matching.compartments.Placement.RESOURCE_BRANCH"></a>

#### RESOURCE\_BRANCH

<a id="sentier_importers.matching.compartments.Placement.NOMENCLATURE"></a>

#### NOMENCLATURE

Nomenclature package only (decision (f)(1), 2026-09-13): every remaining candidate is
uncharacterised and the flow is placed on the EF leaf they exist in anyway --
a nomenclature alignment only, never a factor claim. See
``pipeline.MatchPipeline._resolve``.

<a id="sentier_importers.matching.compartments.Placement.DEFAULT_LEAF"></a>

#### DEFAULT\_LEAF

Round 4, decision 2026-09-13: a ``water`` / ``unspecified`` BAFU source whose
candidates exist on neither the unspecified nor the unspecified (long-term)
leaf, but do exist on fresh water, is placed there instead (``DEFAULT_LEAF`` in
``pipeline.py``). No such fallback is defined for air/soil/resource.

<a id="sentier_importers.matching.compartments.Placement.NAME_ONLY"></a>

#### NAME\_ONLY

Round 5, decision 2026-09-14: a BAFU flow the matching pipeline itself never
places at all (``Unmatched(reason="no_ef_flow")``) but that names, exactly and
case-insensitively, one or more EF flows elsewhere in the inclusive index, all
of them uncharacterised -- "for the ones with names: we map, else: nothing". Not
produced by ``pipeline.MatchPipeline`` itself: assembled directly by
``mappings_biosphere_matched._name_only_match``, which runs after the pipeline
gives up, over ``EfFlowIndex.by_name_any_bucket`` rather than any bucket-scoped
matcher. See that function's docstring for the full rule.

<a id="sentier_importers.matching.compartments.Placement.NONE"></a>

#### NONE

<a id="sentier_importers.matching.compartments.is_uninformative_resource_sub"></a>

#### is\_uninformative\_resource\_sub

```python
def is_uninformative_resource_sub(category: str, subcategory: str,
                                  name: str) -> bool
```

Whether this BAFU resource sub-compartment carries no extraction-medium information.

Such a flow may be placed on the one EF resource branch that holds the substance
instead of being reported ``sub_compartment_absent`` (decision (b), 2026-09-13).

``True`` when ``category`` is ``resources`` and ``subcategory`` is one of
``unspecified``, ``land`` or ``biotic`` (none of these name a medium at all), or
when ``subcategory`` is ``in ground`` and ``name`` starts with ``Water`` (BAFU
files well and cooling water under ``in ground``, while EF keeps all water under
resources-from-water).

Deliberately NOT uninformative, so this stays ``False`` for them: ``in water``
(EF may hold the substance only from ground -- Bromine, Iodine, Magnesium: a
sea-water extraction is not a ground extraction, so the distinction is real
information, not noise), ``in air``, and ``in ground`` for a non-water name (a
real, informative medium already).

<a id="sentier_importers.matching.compartments.bucket_of_bafu_category"></a>

#### bucket\_of\_bafu\_category

```python
def bucket_of_bafu_category(category: str) -> str | None
```

Map a BAFU ecoSpold ``category`` (e.g. ``emissions to air``) to its bucket.

Returns ``None`` for a category this module does not recognise (e.g. ecoSpold's
``economic issues``), which is how such a category is excluded from matching.

<a id="sentier_importers.matching.compartments.bucket_of_ef_context"></a>

#### bucket\_of\_ef\_context

```python
def bucket_of_ef_context(context: str) -> str | None
```

Map an EF 3.1 context path to its bucket (``air``, ``water``, ``soil``, ``resource``).

``context`` must be a full path containing at least one of an ``Emissions to
<bucket>`` segment, a ``Land use`` segment, or a ``Resources`` segment; a bare leaf
(e.g. ``"high. pop."``) or an unrecognised path yields ``None``.

<a id="sentier_importers.matching.compartments.leaf_of"></a>

#### leaf\_of

```python
def leaf_of(context: str) -> str
```

Return the lowercased last segment of a ``/``-separated EF context path.

Tolerant of both ``" / "`` and bare ``"/"`` as the segment separator.

<a id="sentier_importers.matching.compartments.leaf_matches"></a>

#### leaf\_matches

```python
@lru_cache(maxsize=None)
def leaf_matches(bafu_category: str, bafu_subcategory: str,
                 context: str) -> bool
```

Whether ``(bafu_category, bafu_subcategory)`` matches the whole leaf of ``context``.

``context`` must be a full EF context path (see ``bucket_of_ef_context``). Always
``False`` when ``bucket_of_bafu_category(bafu_category)`` disagrees with
``bucket_of_ef_context(context)`` -- a resource category never matches an emission
leaf, an emission category never matches a resource leaf, and an unrecognised
category never matches anything.

<a id="sentier_importers.matching.compartments.unspecified_leaf"></a>

#### unspecified\_leaf

```python
def unspecified_leaf(bucket: str, *, long_term: bool) -> str | None
```

The bucket-level "unspecified" EF leaf a BAFU subCategory can fall back to.

Returns ``None`` when ``bucket`` is not an emission bucket, or when the long-term
variant does not exist for that bucket (EF 3.1 has no long-term soil leaf).

<a id="sentier_importers.matching.compartments.place"></a>

#### place

```python
@lru_cache(maxsize=None)
def place(bafu_category: str, bafu_subcategory: str,
          context: str) -> Placement
```

Resolve where ``(bafu_category, bafu_subcategory)`` places on ``context``.

``context`` must be a full EF context path (see ``bucket_of_ef_context``).
``Placement.EXACT`` for a whole-leaf match, ``Placement.UNSPECIFIED`` when it falls
back to the bucket-level "unspecified" leaf, ``Placement.NONE`` otherwise --
including whenever ``bafu_category`` disagrees with ``context``'s bucket, since the
allowed bucket is derived from the BAFU side, not just from the leaf being matched.
