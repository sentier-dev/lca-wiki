**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.near_zero_floor` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.near_zero_floor cfg.yml > reporting.near_zero_floor.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.near_zero_floor"></a>

# reporting.near\_zero\_floor

``NearZeroFloor`` — collapse near-zero computed/reference pairs to 0.

When both the computed score and the ADEME reference for a method are
well below the method's natural scale (default: 1 % of the median
``|reference|`` across all mapped products), the percentage delta blows
up to four-digit values that reflect numerical noise rather than
calibration error — e.g. ``Tap water cc_luc = +5631 %`` after the
multi-output waste-treatment fix. This class detects those cells and
zeros all four entries (``computed_*``, ``reference_*``, ``diff_abs``,
``diff_pct``) so the backtest dashboard surfaces only meaningful
discrepancies.

<a id="reporting.near_zero_floor.NearZeroFloor"></a>

## NearZeroFloor Objects

```python
@dataclass(frozen=True)
class NearZeroFloor()
```

Per-method ``|x| < factor * median(|reference|)`` zero-threshold floor.

<a id="reporting.near_zero_floor.NearZeroFloor.thresholds"></a>

#### thresholds

<a id="reporting.near_zero_floor.NearZeroFloor.factor"></a>

#### factor

<a id="reporting.near_zero_floor.NearZeroFloor.compute"></a>

#### compute

```python
@classmethod
def compute(cls,
            scores_df: pd.DataFrame,
            method_shortnames: Sequence[str],
            factor: float = 0.01) -> NearZeroFloor
```

Derive per-method thresholds from the absolute median reference.

<a id="reporting.near_zero_floor.NearZeroFloor.apply"></a>

#### apply

```python
def apply(scores_df: pd.DataFrame, diff_abs: MutableMapping[str, pd.Series],
          diff_pct: MutableMapping[str, pd.Series]) -> dict[str, int]
```

Mutate ``scores_df`` and the diff maps in place; return zeroed counts.
