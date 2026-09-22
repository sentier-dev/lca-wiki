**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.eaternity.cf_identity` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.eaternity.cf_identity cfg.yml > sentier_importers.sources.eaternity.cf_identity.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.eaternity.cf_identity"></a>

# sentier\_importers.sources.eaternity.cf\_identity

biosphere3 code -> EF 3.1 flow, by characterization-factor vector identity.

The EF v3.1 methods were matched onto both flow universes at Brightway import time,
so a biosphere3 code and an EF code carrying the same factor in every method are the
same characterization factor. Comparing CF vectors recovers that pairing without
publishing anything ecoinvent-shaped: the output names only the EF flow. This is the
de-bridging argument of ``docs/specs/2026-08-06-bafu-ef-debridged-mappings.md``,
reused here for the biosphere3 side of the ecoinvent-biosphere3 -> eaternity-bafu-ext
bridge.

Tiers, first hit wins, each gated on compartment:

- **T2 exact**: an EF flow with the identical vector. Several candidates are
  harmless (identical factors); prefer one whose name agrees with the BAFU flow,
  then one in the matching EF sub-compartment, then the smallest code.
- **T3 superset**: an EF flow agreeing on every method the biosphere3 code has and
  characterised in more. Only name-matched candidates count, and they must agree
  on the added methods; otherwise the pick would silently choose factors the flow
  does not receive today.

Compartment gate: identical factors are not identical flows. A metal emitted to air
and the same metal extracted from ground can share a single ADP factor; the gate
keeps an emission from resolving to a resource.

<a id="sentier_importers.sources.eaternity.cf_identity.BAFU_BUCKET"></a>

#### BAFU\_BUCKET

BAFU ecoSpold category -> compartment bucket shared with the EF category path.

<a id="sentier_importers.sources.eaternity.cf_identity.BAFU_SUB_TO_EF_LEAF"></a>

#### BAFU\_SUB\_TO\_EF\_LEAF

BAFU ``subCategory`` -> whole EF leaf tail(s) it accepts, once the connective is
removed (see ``_LEAF_CONNECTIVES``): a plain ``str`` for a single tail, or a ``tuple``
of tails when more than one EF leaf counts as a match (e.g. both land-use leaves).

<a id="sentier_importers.sources.eaternity.cf_identity.Vector"></a>

#### Vector

<a id="sentier_importers.sources.eaternity.cf_identity.Twin"></a>

## Twin Objects

```python
@dataclass(frozen=True)
class Twin()
```

<a id="sentier_importers.sources.eaternity.cf_identity.Twin.code"></a>

#### code

<a id="sentier_importers.sources.eaternity.cf_identity.Twin.tier"></a>

#### tier

<a id="sentier_importers.sources.eaternity.cf_identity.Twin.candidates"></a>

#### candidates

<a id="sentier_importers.sources.eaternity.cf_identity.Twin.name_matched"></a>

#### name\_matched

<a id="sentier_importers.sources.eaternity.cf_identity.Twin.sub_matched"></a>

#### sub\_matched

<a id="sentier_importers.sources.eaternity.cf_identity.Withheld"></a>

## Withheld Objects

```python
@dataclass(frozen=True)
class Withheld()
```

<a id="sentier_importers.sources.eaternity.cf_identity.Withheld.reason"></a>

#### reason

<a id="sentier_importers.sources.eaternity.cf_identity.Withheld.detail"></a>

#### detail

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors"></a>

## CfVectors Objects

```python
class CfVectors()
```

``(database, code) -> {method: amount}`` over the EF v3.1 method tables.

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.__init__"></a>

#### \_\_init\_\_

```python
def __init__(vectors: dict[tuple[str, str], Vector]) -> None
```

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.from_tables"></a>

#### from\_tables

```python
@classmethod
def from_tables(cls, tables: dict[str, Iterable[Record]]) -> CfVectors
```

``{method: [{database, code, amount}, ...]}`` -> index.

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.from_directory"></a>

#### from\_directory

```python
@classmethod
def from_directory(cls, root: Path) -> CfVectors
```

One ``<method-slug>/cfs.parquet`` per method (<private> layout).

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.vector"></a>

#### vector

```python
def vector(database: str, code: str) -> Vector | None
```

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.biosphere3"></a>

#### biosphere3

```python
def biosphere3(code: str) -> Vector | None
```

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.exact"></a>

#### exact

```python
def exact(vector: Vector | None) -> list[str]
```

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.superset"></a>

#### superset

```python
def superset(vector: Vector | None) -> list[str]
```

EF codes agreeing on every method in ``vector`` and characterised in more.

<a id="sentier_importers.sources.eaternity.cf_identity.CfVectors.extra_methods_agree"></a>

#### extra\_methods\_agree

```python
def extra_methods_agree(candidates: list[str], vector: Vector) -> bool
```

True when every candidate adds the same methods with the same amounts.

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels"></a>

## EfLabels Objects

```python
class EfLabels()
```

EF flow code -> name and category path, from the sentier-methods CF table.

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.__init__"></a>

#### \_\_init\_\_

```python
def __init__(labels: dict[str, tuple[str, list[str]]]) -> None
```

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.from_rows"></a>

#### from\_rows

```python
@classmethod
def from_rows(cls, rows: Iterable[Record]) -> EfLabels
```

Rows with ``flow`` (IRI or bare uuid), ``flow_name``, ``flow_context``.

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.name"></a>

#### name

```python
def name(code: str) -> str
```

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.context"></a>

#### context

```python
def context(code: str) -> list[str]
```

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.bucket"></a>

#### bucket

```python
def bucket(code: str) -> str | None
```

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.name_matches"></a>

#### name\_matches

```python
def name_matches(code: str, bafu_name: str) -> bool
```

``barium (ii)`` reads as ``Barium``; ``copper`` as ``Copper``.

<a id="sentier_importers.sources.eaternity.cf_identity.EfLabels.sub_matches"></a>

#### sub\_matches

```python
def sub_matches(code: str, bafu_subcategory: str) -> bool
```

True when the EF leaf's tail equals a mapped token: the token must equal the
leaf tail or be preceded by a space, so a hyphen is not a boundary (this is what
rejects ``non-agricultural``), and the long-term qualifier is part of the tail
so it is self-enforcing.

<a id="sentier_importers.sources.eaternity.cf_identity.find_twin"></a>

#### find\_twin

```python
def find_twin(vectors: CfVectors, labels: EfLabels, b3_code: str,
              bafu: BafuFlow) -> Twin | Withheld
```

The EF flow carrying the factors the biosphere3 code carries, for ``bafu``.
