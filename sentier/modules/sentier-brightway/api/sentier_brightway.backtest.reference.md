**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.reference` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.backtest.reference cfg.yml > sentier_brightway.backtest.reference.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.reference"></a>

# sentier\_brightway.backtest.reference

Read BAFU's published 'LCIA Results' workbook into a frame keyed by (name, location).

<a id="sentier_brightway.backtest.reference.SHEET"></a>

#### SHEET

<a id="sentier_brightway.backtest.reference.SECTOR_PLACEHOLDERS"></a>

#### SECTOR\_PLACEHOLDERS

compared lower-cased, stripped

<a id="sentier_brightway.backtest.reference.EF_FAMILY"></a>

#### EF\_FAMILY

<a id="sentier_brightway.backtest.reference.demojibake"></a>

#### demojibake

```python
def demojibake(text: str) -> str
```

The table double-encodes non-ASCII names ('ä' arrives as 'ÃƒÂ¤'); undo that.

Most bytes round-trip through cp1252, but some (e.g. the second byte of 'ÖBB' or 'ß')
only exist in latin-1, so fall back to it when cp1252 can't encode a character.

<a id="sentier_brightway.backtest.reference.split_product"></a>

#### split\_product

```python
def split_product(product: str) -> tuple[str, str]
```

``"<name> - <location>"`` split on the LAST separator (names may contain ' - ').

<a id="sentier_brightway.backtest.reference.BafuReference"></a>

## BafuReference Objects

```python
@dataclass(frozen=True)
class BafuReference()
```

<a id="sentier_brightway.backtest.reference.BafuReference.frame"></a>

#### frame

columns: name, location, sector, unit, <25 shorts> (NaN when blank)

<a id="sentier_brightway.backtest.reference.BafuReference.blank_cells"></a>

#### blank\_cells

<a id="sentier_brightway.backtest.reference.BafuReference.source"></a>

#### source

<a id="sentier_brightway.backtest.reference.BafuReference.from_path"></a>

#### from\_path

```python
@classmethod
def from_path(cls, path: Path | str) -> "BafuReference"
```
