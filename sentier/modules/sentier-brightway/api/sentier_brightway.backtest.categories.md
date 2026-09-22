**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.categories` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.backtest.categories cfg.yml > sentier_brightway.backtest.categories.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.categories"></a>

# sentier\_brightway.backtest.categories

The 25 EF 3.1 categories: our method ids, dashboard short ids and labels, BAFU headers.

This is the single source of truth. The dashboard's ``CATS`` array is generated from it
(``as_js_cats``) and a test asserts the HTML carries exactly that text.

<a id="sentier_brightway.backtest.categories.Category"></a>

## Category Objects

```python
@dataclass(frozen=True)
class Category()
```

<a id="sentier_brightway.backtest.categories.Category.short"></a>

#### short

CSV column / dashboard id

<a id="sentier_brightway.backtest.categories.Category.method_id"></a>

#### method\_id

sentier-methods id, also the datapackage slug source

<a id="sentier_brightway.backtest.categories.Category.label"></a>

#### label

dashboard column header

<a id="sentier_brightway.backtest.categories.Category.xlsx_header"></a>

#### xlsx\_header

BAFU LCIA table header (whitespace-normalised)

<a id="sentier_brightway.backtest.categories.META_COLUMNS"></a>

#### META\_COLUMNS

<a id="sentier_brightway.backtest.categories.UNSPECIFIED_SECTOR"></a>

#### UNSPECIFIED\_SECTOR

<a id="sentier_brightway.backtest.categories.CATEGORIES"></a>

#### CATEGORIES

<a id="sentier_brightway.backtest.categories.by_short"></a>

#### by\_short

```python
def by_short(short: str) -> Category
```

<a id="sentier_brightway.backtest.categories.by_header"></a>

#### by\_header

```python
def by_header(header: str) -> Category | None
```

Match a BAFU column header after whitespace normalisation; None if not an EF column.

<a id="sentier_brightway.backtest.categories.shorts"></a>

#### shorts

```python
def shorts() -> tuple[str, ...]
```

<a id="sentier_brightway.backtest.categories.method_ids"></a>

#### method\_ids

```python
def method_ids() -> tuple[str, ...]
```

<a id="sentier_brightway.backtest.categories.as_js_cats"></a>

#### as\_js\_cats

```python
def as_js_cats() -> str
```

The dashboard's ``const CATS = [...]`` block, one ``[short, label]`` pair per line.
