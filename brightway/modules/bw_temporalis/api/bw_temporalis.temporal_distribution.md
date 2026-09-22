**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.temporal_distribution` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_temporalis==1.2.0'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m bw_temporalis.temporal_distribution cfg.yml > bw_temporalis.temporal_distribution.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.temporal_distribution"></a>

# bw\_temporalis.temporal\_distribution

<a id="bw_temporalis.temporal_distribution.RESOLUTION_LABELS"></a>

#### RESOLUTION\_LABELS

<a id="bw_temporalis.temporal_distribution.TDAware"></a>

## TDAware Objects

```python
class TDAware()
```

Base class for functions which can be multiplied by temporal distributions

<a id="bw_temporalis.temporal_distribution.TDAware.__mul__"></a>

#### \_\_mul\_\_

```python
def __mul__(other)
```

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase"></a>

## TemporalDistributionBase Objects

```python
class TemporalDistributionBase()
```

Base class for temporal distributions

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase.__len__"></a>

#### \_\_len\_\_

```python
def __len__() -> int
```

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other: Any) -> bool
```

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase.graph"></a>

#### graph

```python
def graph(style: str | None = "fivethirtyeight",
          resolution: str | None = None)
```

Graph the temporal distribution.

`resolution` is one of `YMWDhms`.

This isn't too difficult, if you need more customization write your own :)

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase.__str__"></a>

#### \_\_str\_\_

```python
def __str__() -> str
```

<a id="bw_temporalis.temporal_distribution.TemporalDistributionBase.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution"></a>

## TemporalDistribution Objects

```python
class TemporalDistribution(TemporalDistributionBase)
```

A container for a series of amount spread over time.

**Arguments**:

  * *date* (ndarray): 1D array containg temporal info of `amount` with type `timedelta64` or `datetime64` .
  * *amount* (ndarray): 1D array containg amount with type `float`
  
  Times and amount must have same length and element of `amount` must correspond to the element of `date`
  with the same index.

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.__init__"></a>

#### \_\_init\_\_

```python
def __init__(date: npt.NDArray[np.datetime64 | np.timedelta64],
             amount: npt.NDArray)
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.total"></a>

#### total

```python
@property
def total() -> float
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.__mul__"></a>

#### \_\_mul\_\_

```python
def __mul__(
    other: Union["TemporalDistribution", SupportsFloat, TDAware]
) -> "TemporalDistribution"
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.__truediv__"></a>

#### \_\_truediv\_\_

```python
def __truediv__(other: SupportsFloat) -> "TemporalDistribution"
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.__add__"></a>

#### \_\_add\_\_

```python
def __add__(
    other: Union["TemporalDistribution",
                 SupportsFloat]) -> "TemporalDistribution"
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.to_json"></a>

#### to\_json

```python
def to_json()
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.from_json"></a>

#### from\_json

```python
@classmethod
def from_json(cls, json_obj: str | Mapping) -> "TemporalDistributionBase"
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.nonzero"></a>

#### nonzero

```python
def nonzero()
```

<a id="bw_temporalis.temporal_distribution.TemporalDistribution.simplify"></a>

#### simplify

```python
def simplify(threshhold: int | None = 1000,
             num_clusters: int | None = None,
             iterations: int | None = 30) -> "TemporalDistribution"
```

Use clustering to simplify a `TemporalDistribution` with more than
`threshhold` number of points.

Uses the `kmeans2` implementation of KNN from
[scipy.cluster.vq](https://docs.scipy.org/doc/scipy/reference/generated/scipy.cluster.vq.kmeans2.html).
Subclass and override this method to get a custom clustering algorithm.

This isn't perfect, `kmeans2` produces "lumpy" distributions - to see
this graph the simplification of a uniform distribution with many
points.

Parameters
----------

threshhold : int, optional
    The number of `date` points above which simplification is triggered
iterations : int, optional
    `iter` parameters to feed to `kmeans2`

Returns
-------

Either `self` (if no simplification) or a new instance of `TemporalDistribution`.

<a id="bw_temporalis.temporal_distribution.FixedTimeOfYearTD"></a>

## FixedTimeOfYearTD Objects

```python
class FixedTimeOfYearTD(TemporalDistribution)
```

Instead of creating a relative shift in time, regardless of the starting datetime or the properties of the system being modeled, create an absolute period in the first available year.

The fixed time of year is a *relative temporal distribution*, and must already be constructed as such.

When multiplied by another temporal distribution, the entire period of the `FixedTimeOfYear` must lie before the other distribution, or else the `FixedTimeOfYear` is shifted back a year. In other words, a `FixedTimeOfYear` of March to May could be multiplied by August 2020 and result in March to May 2020, but if multiplied by April 2020 it would result in March to May 2019. To allow partial overlaps and stay in the same year, set `allow_overlap` to `True`. In any case, the start of the `FixedTimeOfYear` must be before the start of the temporal distribution being multiplied or it is shifted back a year.

<a id="bw_temporalis.temporal_distribution.FixedTimeOfYearTD.__init__"></a>

#### \_\_init\_\_

```python
def __init__(date: npt.NDArray[np.timedelta64],
             amount: npt.NDArray,
             allow_overlap: Optional[bool] = False)
```

<a id="bw_temporalis.temporal_distribution.FixedTimeOfYearTD.__mul__"></a>

#### \_\_mul\_\_

```python
def __mul__(
        other: TemporalDistribution | Number
) -> TemporalDistribution | TDAware
```

<a id="bw_temporalis.temporal_distribution.FixedTimeOfYearTD.to_json"></a>

#### to\_json

```python
def to_json() -> str
```

<a id="bw_temporalis.temporal_distribution.FixedTimeOfYearTD.from_json"></a>

#### from\_json

```python
@classmethod
def from_json(cls, json_obj)
```

<a id="bw_temporalis.temporal_distribution.FixedTD"></a>

## FixedTD Objects

```python
class FixedTD(TemporalDistribution)
```

An absolute `TemporalDistribution` that ignores other temporal information.

<a id="bw_temporalis.temporal_distribution.FixedTD.__add__"></a>

#### \_\_add\_\_

```python
def __add__(other: Any) -> None
```

<a id="bw_temporalis.temporal_distribution.FixedTD.__mul__"></a>

#### \_\_mul\_\_

```python
def __mul__(
        other: TemporalDistribution | Number
) -> TemporalDistribution | TDAware
```

<a id="bw_temporalis.temporal_distribution.FixedTD.to_json"></a>

#### to\_json

```python
def to_json() -> str
```
