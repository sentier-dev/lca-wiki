**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.sources.eaternity.bridge` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.sources.eaternity.bridge cfg.yml > sentier_importers.sources.eaternity.bridge.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.sources.eaternity.bridge"></a>

# sentier\_importers.sources.eaternity.bridge

Eaternity flat flow -> BAFU-2026 v1 flow: the bridge between the two instances.

Eaternity's BAFU-2026-based instance (datasource ``eaternity-bafu-ext``) collapses
sub-compartments to the root compartment and spells units the Brightway way, so an
Eaternity flow is ``(name, root, unit)``. Our ``bafu-2026-v1`` keys every flow by
``(name, category, subcategory, unit)`` over the v1 ecoSpold exchange universe.

The ecoinvent-biosphere3 -> eaternity-bafu-ext bridge retains the biosphere3 source
sub-compartment on every entry; that sub-compartment is what
places an Eaternity flow at BAFU sub-compartment level. Placement is **strict**:
a biosphere3 ``ocean`` flow resolves only to the BAFU ``ocean`` flow of that
name, never to ``river`` or ``unspecified`` as a fallback. EF factors for sea
water and fresh water differ by orders of magnitude, so a fallback would assert
the wrong factor with a straight face.

Unit twins: BAFU carries radionuclides in both Bq and kBq while Eaternity keeps
only kBq, so one Eaternity kBq flow stands for both BAFU twins, the Bq one with a
``conversion_factor`` of 0.001 (BAFU amount x factor = amount in the target unit).

<a id="sentier_importers.sources.eaternity.bridge.ROOT_TO_CATEGORY"></a>

#### ROOT\_TO\_CATEGORY

Eaternity / biosphere3 root compartment -> BAFU ecoSpold category.

<a id="sentier_importers.sources.eaternity.bridge.B3_SUB_TO_BAFU"></a>

#### B3\_SUB\_TO\_BAFU

biosphere3 ``(root, sub-compartment)`` -> BAFU ecoSpold ``subCategory``. A root-only
biosphere3 context (``["air"]``) is the ``unspecified`` sub-compartment. Anything
not listed resolves to nothing rather than to a guess.

<a id="sentier_importers.sources.eaternity.bridge.UNIT_TWINS"></a>

#### UNIT\_TWINS

Eaternity unit -> the BAFU units it stands for, with the BAFU -> Eaternity factor.

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow"></a>

## BafuFlow Objects

```python
@dataclass(frozen=True)
class BafuFlow()
```

One bafu-2026-v1 elementary flow at unit level.

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.name"></a>

#### name

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.category"></a>

#### category

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.subcategory"></a>

#### subcategory

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.unit"></a>

#### unit

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.code"></a>

#### code

```python
@property
def code() -> str
```

The id sentier-vocab mints for this flow (joins to the published IRI).

<a id="sentier_importers.sources.eaternity.bridge.BafuFlow.context"></a>

#### context

```python
@property
def context() -> list[str]
```

<a id="sentier_importers.sources.eaternity.bridge.Resolution"></a>

## Resolution Objects

```python
@dataclass(frozen=True)
class Resolution()
```

A BAFU flow an Eaternity flow stands for, with the unit factor to reach it.

<a id="sentier_importers.sources.eaternity.bridge.Resolution.flow"></a>

#### flow

<a id="sentier_importers.sources.eaternity.bridge.Resolution.conversion_factor"></a>

#### conversion\_factor

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex"></a>

## BafuFlowIndex Objects

```python
class BafuFlowIndex()
```

Lookup of the bafu-2026-v1 flow universe by ``(name, category, subcategory, unit)``.

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.__init__"></a>

#### \_\_init\_\_

```python
def __init__(flows: Iterable[BafuFlow]) -> None
```

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.from_flows"></a>

#### from\_flows

```python
@classmethod
def from_flows(cls, flows: Iterable[BafuFlow]) -> BafuFlowIndex
```

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.from_ecospold"></a>

#### from\_ecospold

```python
@classmethod
def from_ecospold(cls, records: Iterable[Record]) -> BafuFlowIndex
```

Build from parsed ecoSpold datasets (``ecospold.parse_ecospold_zip`` output).

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.lookup"></a>

#### lookup

```python
def lookup(name: str, category: str, subcategory: str,
           unit: str) -> BafuFlow | None
```

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__() -> Iterator[BafuFlow]
```

<a id="sentier_importers.sources.eaternity.bridge.BafuFlowIndex.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="sentier_importers.sources.eaternity.bridge.bafu_subcategory"></a>

#### bafu\_subcategory

```python
def bafu_subcategory(b3_context: list[str]) -> str | None
```

BAFU ``subCategory`` a biosphere3 context places a flow in, or ``None`` if unknown.

<a id="sentier_importers.sources.eaternity.bridge.resolve"></a>

#### resolve

```python
def resolve(index: BafuFlowIndex, name: str, root: str, unit: str,
            b3_context: list[str]) -> list[Resolution]
```

BAFU flows the Eaternity flow ``(name, root, unit)`` stands for, placed by the
biosphere3 sub-compartment. Empty when any part does not resolve exactly.
