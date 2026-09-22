**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.uncertainty` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.uncertainty cfg.yml > activity_browser.bwutils.uncertainty.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.uncertainty"></a>

# activity\_browser.bwutils.uncertainty

Uncertainty helpers for Activity Browser.

Two roles:

1. **UI interfaces** — wrap exchanges, parameters, and CFs for the uncertainty
   editor dialog (``ExchangeUncertaintyInterface``, etc.).

2. **GSA / reporting** — format stats_arrays data using the same field names and
   labels as ``ui/dialogs/uncertainty_dialog.py``:

   - ``standard_uncertainty_fields`` — active stats_arrays keys per distribution type
   - ``uncertainty_type_name`` — distribution name (e.g. ``Uniform``)
   - ``uncertainty_parameters_summary`` — parameter summary (e.g.
     ``Mode: 5.0; Minimum: 0.0; Maximum: 10.0``)
   - ``uncertainty_cell_summary`` — combined table cell (``Uniform; Minimum: 0; Maximum: 1``)

<a id="activity_browser.bwutils.uncertainty.EMPTY_UNCERTAINTY"></a>

#### EMPTY\_UNCERTAINTY

<a id="activity_browser.bwutils.uncertainty.UNCERTAINTY_FIELDS"></a>

#### UNCERTAINTY\_FIELDS

<a id="activity_browser.bwutils.uncertainty.OPTIONAL_UNCERTAINTY_FIELDS"></a>

#### OPTIONAL\_UNCERTAINTY\_FIELDS

<a id="activity_browser.bwutils.uncertainty.DISTRIBUTIONS_WITH_CALCULATED_MEAN"></a>

#### DISTRIBUTIONS\_WITH\_CALCULATED\_MEAN

<a id="activity_browser.bwutils.uncertainty.UNCERTAINTY_VALIDATION_N"></a>

#### UNCERTAINTY\_VALIDATION\_N

<a id="activity_browser.bwutils.uncertainty.as_scalar"></a>

#### as\_scalar

```python
def as_scalar(value) -> float
```

One float from a stats_arrays statistic (scalar, 0-d, or 1-element array).

<a id="activity_browser.bwutils.uncertainty.discrete_uniform_expected"></a>

#### discrete\_uniform\_expected

```python
def discrete_uniform_expected(array: np.ndarray) -> float
```

Expected value on integers ``[minimum, maximum)`` (:class:`stats_arrays.DiscreteUniform`).

<a id="activity_browser.bwutils.uncertainty.prepare_uncertainty_dict"></a>

#### prepare\_uncertainty\_dict

```python
def prepare_uncertainty_dict(info: dict, dist=None) -> dict
```

Merge defaults and apply ``stats_arrays``-specific fixes before validate/sample.

<a id="activity_browser.bwutils.uncertainty.validate_uncertainty_dict"></a>

#### validate\_uncertainty\_dict

```python
def validate_uncertainty_dict(info: dict,
                              dist=None,
                              n: int = _UNCERTAINTY_VALIDATION_N
                              ) -> tuple[np.ndarray | None, str | None]
```

Build via ``UncertaintyBase.from_dicts``, then ``validate`` and sample.

<a id="activity_browser.bwutils.uncertainty.uncertainty_dict_is_sampleable"></a>

#### uncertainty\_dict\_is\_sampleable

```python
def uncertainty_dict_is_sampleable(data: dict) -> bool
```

True when ``stats_arrays`` accepts *data* (undefined / no-uncertainty always pass).

<a id="activity_browser.bwutils.uncertainty.uncertainty_statistics_scalar"></a>

#### uncertainty\_statistics\_scalar

```python
def uncertainty_statistics_scalar(dist,
                                  array: np.ndarray,
                                  key: str = "mean") -> float
```

One distribution statistic; works around NumPy 2.x bugs in some ``statistics()`` methods.

<a id="activity_browser.bwutils.uncertainty.uncertainty_reference_value"></a>

#### uncertainty\_reference\_value

```python
def uncertainty_reference_value(dist, array: np.ndarray) -> float
```

Preview plot reference line (median for lognormal, mean otherwise).

<a id="activity_browser.bwutils.uncertainty.uncertainty_type_id"></a>

#### uncertainty\_type\_id

```python
def uncertainty_type_id(source) -> int
```

Return stats_arrays uncertainty type id from a dict, exchange proxy, or int.

<a id="activity_browser.bwutils.uncertainty.uncertainty_type_name"></a>

#### uncertainty\_type\_name

```python
def uncertainty_type_name(source) -> str
```

Distribution label for GSA (``Uniform``, ``Triangular``, …).

<a id="activity_browser.bwutils.uncertainty.standard_uncertainty_fields"></a>

#### standard\_uncertainty\_fields

```python
def standard_uncertainty_fields(ut_id: int) -> list[str]
```

Active stats_arrays keys per type (shared with ``UncertaintyDialog``).

<a id="activity_browser.bwutils.uncertainty.uncertainty_field_name"></a>

#### uncertainty\_field\_name

```python
def uncertainty_field_name(ut_id: int, field_key: str) -> str
```

Dialog caption for a stats_arrays field (public for tests).

<a id="activity_browser.bwutils.uncertainty.uncertainty_parameters_summary"></a>

#### uncertainty\_parameters\_summary

```python
def uncertainty_parameters_summary(source) -> str
```

Semicolon-separated uncertainty parameters, using UncertaintyDialog labels.

<a id="activity_browser.bwutils.uncertainty.uncertainty_cell_summary"></a>

#### uncertainty\_cell\_summary

```python
def uncertainty_cell_summary(source, pedigree=None) -> str
```

Single-table-cell text: distribution type and parameters (``Type; param: val; …``).

<a id="activity_browser.bwutils.uncertainty.uncertainty_initial_from_flow"></a>

#### uncertainty\_initial\_from\_flow

```python
def uncertainty_initial_from_flow(exchange) -> dict
```

Sampled uncertainty plus stored pedigree recipe for the flow editor.

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface"></a>

## BaseUncertaintyInterface Objects

```python
class BaseUncertaintyInterface(abc.ABC)
```

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.__slots__"></a>

#### \_\_slots\_\_

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.KEYS"></a>

#### KEYS

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.data_type"></a>

#### data\_type

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.__init__"></a>

#### \_\_init\_\_

```python
def __init__(unc_obj)
```

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.data"></a>

#### data

```python
@property
def data()
```

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.amount"></a>

#### amount

```python
@property
@abc.abstractmethod
def amount() -> float
```

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.uncertainty_type"></a>

#### uncertainty\_type

```python
@property
@abc.abstractmethod
def uncertainty_type() -> UncertaintyBase
```

<a id="activity_browser.bwutils.uncertainty.BaseUncertaintyInterface.uncertainty"></a>

#### uncertainty

```python
@property
@abc.abstractmethod
def uncertainty() -> dict
```

<a id="activity_browser.bwutils.uncertainty.ExchangeUncertaintyInterface"></a>

## ExchangeUncertaintyInterface Objects

```python
class ExchangeUncertaintyInterface(BaseUncertaintyInterface)
```

Many kinds of exchanges use uncertainty to describe how 'correct' the
data is which makes up the amount of the exchange.

<a id="activity_browser.bwutils.uncertainty.ExchangeUncertaintyInterface.data_type"></a>

#### data\_type

<a id="activity_browser.bwutils.uncertainty.ExchangeUncertaintyInterface.amount"></a>

#### amount

```python
@property
def amount() -> float
```

<a id="activity_browser.bwutils.uncertainty.ExchangeUncertaintyInterface.uncertainty_type"></a>

#### uncertainty\_type

```python
@property
def uncertainty_type() -> UncertaintyBase
```

<a id="activity_browser.bwutils.uncertainty.ExchangeUncertaintyInterface.uncertainty"></a>

#### uncertainty

```python
@property
def uncertainty() -> dict
```

<a id="activity_browser.bwutils.uncertainty.ParameterUncertaintyInterface"></a>

## ParameterUncertaintyInterface Objects

```python
class ParameterUncertaintyInterface(BaseUncertaintyInterface)
```

All levels of parameters can describe their amounts with uncertainty.

<a id="activity_browser.bwutils.uncertainty.ParameterUncertaintyInterface.data_type"></a>

#### data\_type

<a id="activity_browser.bwutils.uncertainty.ParameterUncertaintyInterface.amount"></a>

#### amount

```python
@property
def amount() -> float
```

<a id="activity_browser.bwutils.uncertainty.ParameterUncertaintyInterface.uncertainty_type"></a>

#### uncertainty\_type

```python
@property
def uncertainty_type() -> UncertaintyBase
```

<a id="activity_browser.bwutils.uncertainty.ParameterUncertaintyInterface.uncertainty"></a>

#### uncertainty

```python
@property
def uncertainty() -> dict
```

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface"></a>

## CFUncertaintyInterface Objects

```python
class CFUncertaintyInterface(BaseUncertaintyInterface)
```

The characterization factors (CFs) of an impact assessment method can also
contain uncertainty.

This is however not certain (ha), as the CF is made up out of a flow key
and either an amount (float) or the uncertainty values + an amount (dict).

See the ``Method`` and ``ProcessedDataStore`` classes in the bw2data library.

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface.data_type"></a>

#### data\_type

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface.is_uncertain"></a>

#### is\_uncertain

```python
@property
def is_uncertain() -> bool
```

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface.amount"></a>

#### amount

```python
@property
def amount() -> float
```

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface.uncertainty_type"></a>

#### uncertainty\_type

```python
@property
def uncertainty_type() -> UncertaintyBase
```

<a id="activity_browser.bwutils.uncertainty.CFUncertaintyInterface.uncertainty"></a>

#### uncertainty

```python
@property
def uncertainty() -> dict
```

<a id="activity_browser.bwutils.uncertainty.get_uncertainty_interface"></a>

#### get\_uncertainty\_interface

```python
def get_uncertainty_interface(data: object) -> BaseUncertaintyInterface
```
