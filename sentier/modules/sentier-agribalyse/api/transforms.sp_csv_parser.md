**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.sp_csv_parser` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.sp_csv_parser cfg.yml > transforms.sp_csv_parser.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.sp_csv_parser"></a>

# transforms.sp\_csv\_parser

``SimaProCsvParser`` + ``ParsedSimaProCsv`` — bw2-free SimaPro wrapper.

bw2io's ``SimaProBlockCSVImporter`` did two things bundled together:
parsed the SimaPro CSV (via ``bw_simapro_csv``) and exposed a
``LCIImporter``-shaped surface (``apply_strategy``, ``match_database``,
etc.). REFACTOR_FINAL strips it down: ``bw_simapro_csv`` does the parse
directly and the wrapper exposes only the methods the linker actually
uses, all of them dispatching to in-house ``transforms.strategies``
classes — no bw2io, no bw2data.

<a id="transforms.sp_csv_parser.SimaProCsvParser"></a>

## SimaProCsvParser Objects

```python
@dataclass(frozen=True)
class SimaProCsvParser()
```

Parse AGB SimaPro CSV directly via ``bw_simapro_csv``.

<a id="transforms.sp_csv_parser.SimaProCsvParser.csv_path"></a>

#### csv\_path

<a id="transforms.sp_csv_parser.SimaProCsvParser.database_name"></a>

#### database\_name

<a id="transforms.sp_csv_parser.SimaProCsvParser.separate_products"></a>

#### separate\_products

<a id="transforms.sp_csv_parser.SimaProCsvParser.shorten_names"></a>

#### shorten\_names

<a id="transforms.sp_csv_parser.SimaProCsvParser.parse"></a>

#### parse

```python
def parse() -> ParsedSimaProCsv
```

<a id="transforms.sp_csv_parser.ParsedSimaProCsv"></a>

## ParsedSimaProCsv Objects

```python
class ParsedSimaProCsv()
```

In-house replacement for ``bw2io.SimaProBlockCSVImporter``'s surface.

Holds ``.data`` (list[dict]) and exposes the strategy-application,
internal-link, randonneur, and drop-unlinked methods the linker calls.
Every method dispatches to a pure-Python class under
``transforms.strategies``; no bw2io / bw2data imports remain.

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.__init__"></a>

#### \_\_init\_\_

```python
def __init__(db_name: str,
             data: list[dict],
             metadata: dict | None = None,
             parameters: list[dict] | None = None)
```

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.apply_strategy"></a>

#### apply\_strategy

```python
def apply_strategy(fn: Callable, *args: Any, **kwargs: Any) -> None
```

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies() -> None
```

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.match_database"></a>

#### match\_database

```python
def match_database(db_name: str | None = None,
                   fields: list[str] | tuple[str, ...] | None = None,
                   kind: str | list[str] | None = None,
                   processes_to_products: bool = False,
                   relink: bool = False) -> None
```

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.randonneur"></a>

#### randonneur

```python
def randonneur(label: str | None = None,
               datapackage: object | None = None,
               fields: list[str] | None = None,
               node_filter: Callable | None = None,
               edge_filter: Callable | None = None,
               case_sensitive: bool = False,
               verbs: list[str] | None = None,
               migrate_edges: bool = True,
               migrate_nodes: bool = False) -> None
```

Apply a randonneur transformation to ``self.data``.

Two mutually-exclusive sources are supported (matching the
``bw2io.SimaProBlockCSVImporter.randonneur`` surface so callers
like ``BiosphereFlowmapApplier`` work against either parser):

* ``label="<datapackage-name>"`` — pull a stored datapackage by
  name from the registered randonneur registry.
* ``datapackage=<rn.Datapackage>`` — apply an in-memory
  ``Datapackage`` instance (typically loaded from a custom
  JSON via ``rn.Datapackage.from_json``).

Pass exactly one. ``datapackage`` takes precedence when both
are supplied.

<a id="transforms.sp_csv_parser.ParsedSimaProCsv.drop_unlinked"></a>

#### drop\_unlinked

```python
def drop_unlinked(*, i_am_reckless: bool = False) -> None
```
