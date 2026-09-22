**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.matching.ef_index` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.matching.ef_index cfg.yml > sentier_importers.matching.ef_index.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.matching.ef_index"></a>

# sentier\_importers.matching.ef\_index

EF 3.1 flow index built from public inputs only.

- ``characterization-factors.parquet`` (sentier-methods): which EF flows carry a
  factor, their context path, and their CF vector by ``method_id``. A flow that is
  not in this table has no factor and is not a mapping target.
- ``elementary-flows/*.parquet`` (sentier-vocab, rows with the ef-3.1 source):
  preferred label, synonyms (``alt_labels``) and CAS number, keyed by the flow IRI.

The CF vector keeps the global (location-less) factor per method; location-specific
rows (land use, water use, some regionalised categories) are not part of flow identity.

An EF vocab row that carries no factor at all (``characterised=False``) can still be
placed and indexed, opt-in via ``include_uncharacterised``: its context comes not from
the CF table (it has none) but from its ``additional_notations`` ``bw-context:<code>``
entry, resolved through the ``matching.bw_context`` crosswalk. A code with no EF leaf
(``envi-biot``) or a row with no ``bw-context`` notation at all is skipped, not indexed.

Round 6, decision 2026-09-14 (first cut): sentier-vocab occasionally ships an EF flow
whose factors are correct but whose ``pref_label`` names the wrong substance (a real
EF flow labelled "sodium" is CAS 1120-01-0, sodium hexadecyl sulphate, a surfactant,
not the inorganic sodium ion). The curated ``label_defects.yaml`` table
(``load_label_defects``) lists every known such defect by CAS.

Round 6, decision 2026-09-14 (second cut, superseded by the third below for how a
characterised flow is actually named, but not for *why*): a sentier-vocab
``pref_label`` is itself a derived label and is not authoritative; the CF table's own
``flow_name`` column is the JRC name and is authoritative for any flow it
characterises.

Round 6, decision 2026-09-14 (third cut): ``EfFlow`` splits the matching key from the
display name so a curated defect entry or a same-bucket collision never has to touch
one to fix the other. ``name`` is always the CF table's own JRC spelling for a
characterised flow -- grouped CASE-INSENSITIVELY across that flow's own CF-table rows
(``_pick_jrc_name`` picks the winning spelling by total row count, ties broken
alphabetically on the lowercased spelling, then picks a literal casing to display:
the vocab pref_label's own casing when it matches case-insensitively, else a
non-all-lowercase variant, else the alphabetically first; ``EfFlowIndex.
multi_name_codes`` counts codes whose rows disagree on more than just case) -- never
the vocab ``pref_label``. ``label`` (what an emitted entry actually shows, e.g.
``mappings_biosphere_matched.entry_for``) is the vocab pref_label when it differs
from ``name`` in more than casing and was kept as a synonym; otherwise (the label is
absent, matches ``name`` already, is listed in ``label_defects.yaml`` for that CAS, or
collides case-insensitively with the name of a DIFFERENT flow -- characterised or
not -- sharing the same bucket, the same grouping ``by_name``/``by_synonym`` use, so
this collision check is not fooled by two colliding flows sitting on different
leaves) ``label`` falls back to ``name`` and the vocab label is dropped instead of
added as a synonym (``EfFlowIndex.suppressed_vocab_synonyms`` counts these drops) --
so the synonym tier can never recreate a collision either construction resolves. An
*uncharacterised* flow (opt-in via ``include_uncharacterised``) carries no CF row at
all, so both ``name`` and ``label`` come from the vocab pref_label, still passed
through ``label_defects.yaml`` exactly as before (see ``load_label_defects``);
``EfFlowIndex.relabelled_count`` counts only these.

<a id="sentier_importers.matching.ef_index.EF_SOURCE"></a>

#### EF\_SOURCE

<a id="sentier_importers.matching.ef_index.UNCERTAIN_RESOURCE_NAME"></a>

#### UNCERTAIN\_RESOURCE\_NAME

An uncharacterised vocab row's context comes only from the ``bw-context`` crosswalk
(``matching.bw_context.BW_CONTEXT_PATH``), and that crosswalk has no code at all for
EF's ``Non-renewable energy resources from ground`` leaf or for any renewable-energy
resource branch (its resource codes only ever reach the element/material leaves --
``reso-grou``'s own leaf is literally "...element resources...", see
``bw_context.py``). So a BAFU/EF resource flow that is actually an ENERGY resource by
name (an ecoinvent-style "Energy, <form>, converted", a "Primary Energy ..." label,
an oil-sand or pit-methane flow) can never land on the right branch through this
crosswalk, no matter which code placed it -- it is always on the wrong (element or
material) leaf. Such a row is marked ``context_uncertain`` unconditionally, not just
when its code happens to be one of ``bw_context.AMBIGUOUS_CODES``; also imported by
``mappings_biosphere_matched.BafuEfMatchedSource.entry_for`` (decision (f)(2),
2026-09-13), which -- rather than withhold a nomenclature-package match onto one of
these -- omits ``target["context"]`` entirely from the emitted entry and discloses
that the EF context is not recoverable from the source context code in the comment
instead.

<a id="sentier_importers.matching.ef_index.normalise_cas"></a>

#### normalise\_cas

```python
def normalise_cas(cas: str | None) -> str | None
```

``007440-50-8`` -> ``7440-50-8``; blank -> None.

<a id="sentier_importers.matching.ef_index.LABEL_DEFECTS_PATH"></a>

#### LABEL\_DEFECTS\_PATH

<a id="sentier_importers.matching.ef_index.LabelDefect"></a>

## LabelDefect Objects

```python
@dataclass(frozen=True)
class LabelDefect()
```

A known sentier-vocab ``pref_label`` defect on one EF flow, keyed by CAS.

``wrong_label`` is the incorrect ``pref_label`` an EF flow with this CAS
currently carries; ``true_name`` is the label it must be corrected to;
``note`` records why (see ``label_defects.yaml``).

<a id="sentier_importers.matching.ef_index.LabelDefect.wrong_label"></a>

#### wrong\_label

<a id="sentier_importers.matching.ef_index.LabelDefect.true_name"></a>

#### true\_name

<a id="sentier_importers.matching.ef_index.LabelDefect.note"></a>

#### note

<a id="sentier_importers.matching.ef_index.load_label_defects"></a>

#### load\_label\_defects

```python
def load_label_defects(
        path: Path = LABEL_DEFECTS_PATH) -> dict[str, LabelDefect]
```

Load the curated label-defect table, keyed by normalised CAS.

Each entry is a ``{cas, wrong_label, true_name, note}`` mapping. Raises
``ParseError``, naming ``path``, when the top-level ``label_defects`` key is
missing, ``None``, or not a list, or when an entry is not a mapping with exactly
those four keys, all non-empty strings.

<a id="sentier_importers.matching.ef_index.EfFlow"></a>

## EfFlow Objects

```python
@dataclass(frozen=True)
class EfFlow()
```

<a id="sentier_importers.matching.ef_index.EfFlow.code"></a>

#### code

<a id="sentier_importers.matching.ef_index.EfFlow.name"></a>

#### name

The matching key: matchers, ``by_name``/``by_synonym``/``by_cas`` and every
identity/collision check key off this. For a characterised flow this is the
CF table's own (JRC) name, never the vocab pref_label (round 6, decision
2026-09-14, third cut); for an uncharacterised flow (no CF row) it is the
vocab pref_label, same as ``label`` below.

<a id="sentier_importers.matching.ef_index.EfFlow.context"></a>

#### context

<a id="sentier_importers.matching.ef_index.EfFlow.synonyms"></a>

#### synonyms

<a id="sentier_importers.matching.ef_index.EfFlow.cas"></a>

#### cas

<a id="sentier_importers.matching.ef_index.EfFlow.characterised"></a>

#### characterised

``False`` for a flow indexed only via ``include_uncharacterised`` (no CF
vector at all -- ``vector``/``identity`` are ``{}``/``()`` and
``reference_unit`` is ``None`` for it).

<a id="sentier_importers.matching.ef_index.EfFlow.context_uncertain"></a>

#### context\_uncertain

``True`` when this flow's context was resolved through one of
``bw_context.AMBIGUOUS_CODES`` -- the majority leaf was used, but a real
minority of flows under that code sit elsewhere. Always ``False`` for a
characterised flow.

<a id="sentier_importers.matching.ef_index.EfFlow.label"></a>

#### label

The DISPLAY name: what an emitted entry actually shows a human (``entry_for``
reads this, never ``name``, for its ``target["name"]``). For a characterised
flow this is the vocab pref_label when it was kept as a synonym (round 6,
decision 2026-09-14, third cut: ``EfFlowIndex.from_tables`` decouples the
matching key from the display name so a curated defect or a same-bucket
collision never has to touch matching at all to fix display, or vice versa);
when the vocab label was instead suppressed (defect-listed or colliding), or
for an uncharacterised flow (no vocab/JRC split to make), this defaults to
``name`` -- an empty/omitted ``label`` at construction always falls back to
``name`` (``__post_init__``), so every existing caller that builds an
``EfFlow`` without naming ``label`` explicitly keeps displaying ``name``,
exactly as before this field existed.

<a id="sentier_importers.matching.ef_index.EfFlow.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="sentier_importers.matching.ef_index.EfFlow.context_path"></a>

#### context\_path

```python
@property
def context_path() -> str
```

<a id="sentier_importers.matching.ef_index.EfFlow.leaf"></a>

#### leaf

```python
@property
def leaf() -> str
```

<a id="sentier_importers.matching.ef_index.EfFlow.bucket"></a>

#### bucket

```python
@property
def bucket() -> str | None
```

<a id="sentier_importers.matching.ef_index.EfFlowIndex"></a>

## EfFlowIndex Objects

```python
class EfFlowIndex()
```

Lookup index over EF 3.1 flows: by default only those that carry at least one
characterization factor, plus uncharacterised ones too when built with
``include_uncharacterised=True`` (see ``from_tables``).

Every lookup's ``bucket`` argument must be a value produced by
``compartments.bucket_of_bafu_category`` or ``compartments.bucket_of_ef_context``
(``"resource"``, not ``"resources"``); a bucket these functions would not produce
simply matches nothing (``[]``), it is never an error. ``by_name``, ``by_synonym``
and ``by_cas`` each return a fresh, code-sorted list; ``vector`` returns a fresh
dict; ``identity`` returns a tuple sorted by ``method_id``. Callers may hold onto
or mutate any of these results without affecting the index.

``by_name_any_bucket`` is the one un-bucketed lookup: every flow whose label
matches, across every bucket at once, code-sorted like the rest. Round 5, decision
2026-09-14: it exists only for the nomenclature package's name-only alignment
(``mappings_biosphere_matched._name_only_match``), which deliberately looks past
the bucket a source flow's own category would restrict it to.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.__init__"></a>

#### \_\_init\_\_

```python
def __init__(flows: Iterable[EfFlow],
             vectors: dict[str, dict[str, float]],
             *,
             includes_uncharacterised: bool = False,
             relabelled_count: int = 0,
             multi_name_codes: int = 0,
             suppressed_vocab_synonyms: int = 0) -> None
```

<a id="sentier_importers.matching.ef_index.EfFlowIndex.from_tables"></a>

#### from\_tables

```python
@classmethod
def from_tables(
        cls,
        cf_rows: Iterable[dict],
        vocab_rows: Iterable[dict],
        *,
        include_uncharacterised: bool = False,
        label_defects: Mapping[str, LabelDefect] | None = None
) -> "EfFlowIndex"
```

Build an index from CF table rows and vocab shard rows already loaded in memory.

When ``include_uncharacterised`` is ``True``, every EF vocab row whose code
carries no CF-table context is also indexed (``EfFlow.characterised=False``),
placed via ``bw_context.context_for`` on its ``additional_notations``. A row
whose ``bw-context`` code has no EF leaf, or that carries no ``bw-context``
notation at all, is skipped. Default ``False`` reproduces the exact previous
behaviour (characterised flows only).

A characterised flow's ``name`` (the matching key) is always the CF table's
own JRC spelling (round 6, decision 2026-09-14, third cut -- see the module
docstring), grouped case-insensitively across that flow's own CF-table rows
(``EfFlowIndex.multi_name_codes`` counts codes whose rows disagree on more
than just case; ``_pick_jrc_name`` picks both the winning spelling and its
displayed casing). The vocab ``pref_label``, when its CONTENT differs from
the JRC name (not just its casing), becomes ``EfFlow.label`` (what an emitted
entry actually shows, see ``EfFlow.label``) and an extra synonym, UNLESS
``label_defects`` (the curated CAS -> wrong pref_label -> true name table,
``load_label_defects``) lists it for that CAS, or it collides
(case-insensitively) with the name of a different flow -- characterised or
not -- sharing the same bucket (the same grouping ``by_name``/``by_synonym``
themselves use, so "the synonym tier can never recreate the collision" holds
by construction, not just for same-leaf collisions). Either way it is
dropped, not added, ``label`` falls back to the JRC name too, and
``EfFlowIndex.suppressed_vocab_synonyms`` counts how many times this fires.

An *uncharacterised* flow carries no CF row, so both its matching key
(``name``) and its display (``label``, defaulting to ``name``) come from the
vocab pref_label, passed through ``label_defects`` exactly as before --
``EfFlowIndex.relabelled_count`` counts only these.

``label_defects`` defaults to ``None``, which loads the shipped
``label_defects.yaml`` (pass ``{}`` to disable it entirely, e.g. in a test
that wants the raw vocab label to survive as a synonym unconditionally).

<a id="sentier_importers.matching.ef_index.EfFlowIndex.from_files"></a>

#### from\_files

```python
@classmethod
def from_files(
        cls,
        cf_parquet: Path,
        vocab_dir: Path,
        *,
        include_uncharacterised: bool = False,
        label_defects: Mapping[str, LabelDefect] | None = None
) -> "EfFlowIndex"
```

Build an index by reading the CF parquet file and every vocab shard parquet file.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.from_bytes"></a>

#### from\_bytes

```python
@classmethod
def from_bytes(
        cls,
        cf_parquet_bytes: bytes,
        vocab_dir: Path,
        *,
        include_uncharacterised: bool = False,
        label_defects: Mapping[str, LabelDefect] | None = None
) -> "EfFlowIndex"
```

Build an index from the CF parquet file's raw bytes (e.g. already fetched
through the content-addressed cache, so the cache/offline contract holds) and
every vocab shard parquet file read from ``vocab_dir`` on disk.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.get"></a>

#### get

```python
def get(code: str) -> EfFlow | None
```

Return the flow for ``code``, or ``None`` if it is not indexed.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.vector"></a>

#### vector

```python
def vector(code: str) -> dict[str, float]
```

Return a copy of the CF vector (``method_id`` -> factor) for ``code``, or ``{}``.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.identity"></a>

#### identity

```python
def identity(code: str) -> tuple[tuple[str, float], ...]
```

Hashable CF-identity key: the vector's ``(method_id, factor)`` pairs, sorted.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.reference_unit"></a>

#### reference\_unit

```python
def reference_unit(code: str) -> str | None
```

The EF 3.1 reference unit for ``code``, inferred from method membership.

Returns ``None`` when ``code`` is an uncharacterised flow
(``EfFlow.characterised=False``): it carries no CF vector at all, so there is
no method membership to infer a unit from. An unknown ``code`` (not indexed
at all) is unaffected by this and still defaults to ``"kilogram"`` below, same
as before.

The CF table (``characterization-factors.parquet``) carries no flow-unit
column at all -- only a ``factor_value`` per ``(flow, method)`` -- so a
flow's physical unit is not data to look up but a convention to apply: EF
3.1 / ILCD fixes one reference unit per impact-category family, and every
flow that family characterises is reported in it. A resource-use-fossils
flow is in megajoule, an ionising-radiation-human-health flow in kBq, a
water-use flow in cubic meter, a land-use flow in m2 (or m2*a when its EF
context leaf is ``land occupation``, not ``land transformation``); everything
else -- the overwhelming majority, all substance emissions and non-energy/
water/land resources -- is in kilogram.

The land-use unit is keyed on the EF context *leaf*, not the flow name: EF
occupation flows are named ``Arable``, ``Pasture/meadow`` and so on, never
anything starting with "occupation" -- biosphere-1-curated's published payload uses
``m2*a`` for exactly the flows whose leaf is ``land occupation``.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.by_name"></a>

#### by\_name

```python
def by_name(name: str, bucket: str | None) -> list[EfFlow]
```

Flows in ``bucket`` whose label matches ``name`` (case- and whitespace-insensitive).

<a id="sentier_importers.matching.ef_index.EfFlowIndex.by_name_any_bucket"></a>

#### by\_name\_any\_bucket

```python
def by_name_any_bucket(name: str) -> list[EfFlow]
```

Every indexed flow whose label matches ``name`` (case/whitespace-insensitive),
in ANY bucket, code-sorted.

Unlike ``by_name``, not scoped to one bucket: used only by the nomenclature
package's round-5 name-only alignment (``mappings_biosphere_matched.
_name_only_match``), which recovers an EF namesake living in a different
bucket than the source flow's own category would place it in (e.g. a resource
extraction whose only EF namesake sits among soil-emission leaves).

<a id="sentier_importers.matching.ef_index.EfFlowIndex.by_synonym"></a>

#### by\_synonym

```python
def by_synonym(name: str, bucket: str | None) -> list[EfFlow]
```

Flows in ``bucket`` whose synonym matches ``name`` (case/whitespace-insensitive).

<a id="sentier_importers.matching.ef_index.EfFlowIndex.by_cas"></a>

#### by\_cas

```python
def by_cas(cas: str | None, bucket: str | None) -> list[EfFlow]
```

Flows in ``bucket`` whose CAS matches ``cas``, normalised; ``[]`` for ``None``.

<a id="sentier_importers.matching.ef_index.EfFlowIndex.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="sentier_importers.matching.ef_index.EfFlowIndex.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__() -> Iterator[EfFlow]
```

Iterate all indexed flows, sorted by code.
