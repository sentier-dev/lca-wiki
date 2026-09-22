**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `matching.technosphere` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m matching.technosphere cfg.yml > matching.technosphere.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="matching.technosphere"></a>

# matching.technosphere

``TechnosphereMatcher`` — registry-driven, parquet-backed, no SQLite.

Replaces the legacy bw2io ``match_database(ei_db, ...)`` call chain with
direct lookups into ``EcoinventCatalog``. The match passes are:

1. Apply ``ChangeElectricityUnitMjToKwh`` to harmonise electricity units.
2. Strict 4-field match (name, unit, location, reference product).
3. Registry-driven unit conversions for unlinked technosphere edges.
4. Strict 4-field match again (now that units have been harmonised).
5. Custom-fixes JSON migration via ``randonneur``, then strict match.
6. Relaxed 3-field match (drop ``reference product``) — catches stale or
   capitalised refprod fields that the strict pass missed.

Each strict / relaxed match resolves to ``(database, code)`` only when
the catalog returns exactly one activity for the key — same conservative
behaviour as ``bw2io.match_database``, which leaves ambiguous keys
unlinked.

<a id="matching.technosphere.TechnosphereMatchStats"></a>

## TechnosphereMatchStats Objects

```python
@dataclass(frozen=True)
class TechnosphereMatchStats()
```

<a id="matching.technosphere.TechnosphereMatchStats.n_total"></a>

#### n\_total

<a id="matching.technosphere.TechnosphereMatchStats.n_linked"></a>

#### n\_linked

<a id="matching.technosphere.TechnosphereMatchStats.n_unit_conversions_applied"></a>

#### n\_unit\_conversions\_applied

<a id="matching.technosphere.TechnosphereMatchStats.custom_fixes_applied"></a>

#### custom\_fixes\_applied

<a id="matching.technosphere.TechnosphereMatcher"></a>

## TechnosphereMatcher Objects

```python
@dataclass
class TechnosphereMatcher()
```

<a id="matching.technosphere.TechnosphereMatcher.settings"></a>

#### settings

<a id="matching.technosphere.TechnosphereMatcher.registry"></a>

#### registry

<a id="matching.technosphere.TechnosphereMatcher.catalog"></a>

#### catalog

<a id="matching.technosphere.TechnosphereMatcher.drops"></a>

#### drops

<a id="matching.technosphere.TechnosphereMatcher.json"></a>

#### json

type: ignore[assignment]

<a id="matching.technosphere.TechnosphereMatcher.__post_init__"></a>

#### \_\_post\_init\_\_

```python
def __post_init__() -> None
```

<a id="matching.technosphere.TechnosphereMatcher.match"></a>

#### match

```python
def match(sp) -> TechnosphereMatchStats
```

Apply the four-stage technosphere link chain via ``EcoinventCatalog``.
