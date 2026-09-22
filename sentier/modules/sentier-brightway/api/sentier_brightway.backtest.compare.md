**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.compare` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.backtest.compare cfg.yml > sentier_brightway.backtest.compare.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.compare"></a>

# sentier\_brightway.backtest.compare

Join our scores with BAFU's, reconcile units, compute pct differences with the 4.0
dashboard's guards (zero reference blank, near-zero floor, fold cap), and summarise.

``Box``/``box_stats`` (the box-plot statistics the summary and ``boxes.py`` share) live
here so that ``boxes.py`` can import ``compare`` without a cycle.

<a id="sentier_brightway.backtest.compare.NEAR_ZERO_FACTOR"></a>

#### NEAR\_ZERO\_FACTOR

of the median |reference| per category

<a id="sentier_brightway.backtest.compare.FOLD_CAP_PCT"></a>

#### FOLD\_CAP\_PCT

<a id="sentier_brightway.backtest.compare.PCT_DECIMALS"></a>

#### PCT\_DECIMALS

<a id="sentier_brightway.backtest.compare.SIGNIFICANT"></a>

#### SIGNIFICANT

significant digits kept for absolute scores (CSV and worst lists)

<a id="sentier_brightway.backtest.compare.KEY"></a>

#### KEY

<a id="sentier_brightway.backtest.compare.SECTOR_COLUMN"></a>

#### SECTOR\_COLUMN

BAFU's top-level "Category"; carried onto the aligned frame

<a id="sentier_brightway.backtest.compare.OUTLIER_CAP"></a>

#### OUTLIER\_CAP

``Box.outliers`` entries kept per box (``n_outliers`` is the full count)

<a id="sentier_brightway.backtest.compare.SECTOR_OUTLIER_CAP"></a>

#### SECTOR\_OUTLIER\_CAP

the same for a single sector's box (keeps boxes.json small)

<a id="sentier_brightway.backtest.compare.WHISKER_K"></a>

#### WHISKER\_K

whiskers end at the last value within q1/q3 -/+ WHISKER_K * IQR

<a id="sentier_brightway.backtest.compare.BOX_DECIMALS"></a>

#### BOX\_DECIMALS

<a id="sentier_brightway.backtest.compare.TABLE_UNITS"></a>

#### TABLE\_UNITS

<a id="sentier_brightway.backtest.compare.UNIT_FACTORS"></a>

#### UNIT\_FACTORS

<a id="sentier_brightway.backtest.compare.LOCATION_ALIASES"></a>

#### LOCATION\_ALIASES

<a id="sentier_brightway.backtest.compare.unit_factor"></a>

#### unit\_factor

```python
def unit_factor(ours: str, table: str) -> float | None
```

Factor turning our per-``ours`` score into per-``table`` unit; None when unknown.

<a id="sentier_brightway.backtest.compare.Aligned"></a>

## Aligned Objects

```python
@dataclass(frozen=True)
class Aligned()
```

<a id="sentier_brightway.backtest.compare.Aligned.frame"></a>

#### frame

<a id="sentier_brightway.backtest.compare.Aligned.unmatched_ref"></a>

#### unmatched\_ref

(name, location) of reference rows unused

<a id="sentier_brightway.backtest.compare.Aligned.unit_skipped"></a>

#### unit\_skipped

(our unit, table unit) -> count

<a id="sentier_brightway.backtest.compare.Aligned.aliased_ref"></a>

#### aliased\_ref

reference rows whose location went through LOCATION_ALIASES

<a id="sentier_brightway.backtest.compare.Compared"></a>

## Compared Objects

```python
@dataclass(frozen=True)
class Compared()
```

<a id="sentier_brightway.backtest.compare.Compared.frame"></a>

#### frame

code + one pct column per short (NaN = blank), mapped rows only

<a id="sentier_brightway.backtest.compare.Compared.aligned"></a>

#### aligned

<a id="sentier_brightway.backtest.compare.Compared.thresholds"></a>

#### thresholds

short -> near-zero threshold

<a id="sentier_brightway.backtest.compare.Compared.suppressed"></a>

#### suppressed

short -> {near_zero, fold_capped}

<a id="sentier_brightway.backtest.compare.Box"></a>

## Box Objects

```python
@dataclass(frozen=True)
class Box()
```

Box-plot statistics of one category's finite pct values; every quantile is None
when ``n == 0``. ``outliers`` are ``(code, pct)`` pairs sorted by |pct| descending
(ties by code), capped at ``OUTLIER_CAP``.

<a id="sentier_brightway.backtest.compare.Box.n"></a>

#### n

<a id="sentier_brightway.backtest.compare.Box.n_blank"></a>

#### n\_blank

<a id="sentier_brightway.backtest.compare.Box.min"></a>

#### min

<a id="sentier_brightway.backtest.compare.Box.q1"></a>

#### q1

<a id="sentier_brightway.backtest.compare.Box.median"></a>

#### median

<a id="sentier_brightway.backtest.compare.Box.q3"></a>

#### q3

<a id="sentier_brightway.backtest.compare.Box.max"></a>

#### max

<a id="sentier_brightway.backtest.compare.Box.lo"></a>

#### lo

<a id="sentier_brightway.backtest.compare.Box.hi"></a>

#### hi

<a id="sentier_brightway.backtest.compare.Box.n_outliers"></a>

#### n\_outliers

<a id="sentier_brightway.backtest.compare.Box.outliers"></a>

#### outliers

<a id="sentier_brightway.backtest.compare.box_stats"></a>

#### box\_stats

```python
def box_stats(pct: pd.Series,
              codes: pd.Series,
              cap: int = OUTLIER_CAP,
              n_blank: int = 0) -> Box
```

Quartiles (linear interpolation), whisker ends and outliers of the finite values of
``pct``; ``codes`` labels the outliers and ``n_blank`` is passed through. The result
satisfies ``min <= lo <= q1 <= median <= q3 <= hi <= max`` whenever ``n > 0``.

<a id="sentier_brightway.backtest.compare.align"></a>

#### align

```python
def align(scores: pd.DataFrame, reference: pd.DataFrame,
          categories: tuple[Category, ...]) -> Aligned
```

Left-join ``reference`` onto ``scores`` by (name, location) and convert our scores to
the table's unit. Names are stripped on both sides and the reference's locations go
through ``LOCATION_ALIASES`` before the join (ours stay as in the registry). Codes must
be unique (downstream writers look rows up by code). Rows
resolve to ``mapped``, ``unmatched`` (no reference row) or ``unit_skipped`` (reference
found but no conversion known); ``<short>_ours`` is NaN unless mapped. The reference's
``sector`` column rides along (``UNSPECIFIED_SECTOR`` when the reference has none, NaN
for unmatched rows). Neither input is modified.

<a id="sentier_brightway.backtest.compare.compare"></a>

#### compare

```python
def compare(aligned: Aligned, categories: tuple[Category, ...]) -> Compared
```

Percent differences (ours vs reference, in the table's unit) for mapped rows.

<a id="sentier_brightway.backtest.compare.summarise"></a>

#### summarise

```python
def summarise(compared: Compared, categories: tuple[Category,
                                                    ...]) -> pd.DataFrame
```

One row per category over the finite pct values (quartiles, whisker ends and the
outlier count as in ``box_stats``); ``n_unit_skipped`` is the number of unit-skipped
processes and is repeated on every row.
