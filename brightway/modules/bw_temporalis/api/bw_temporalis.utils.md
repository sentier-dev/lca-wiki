**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_temporalis.utils cfg.yml > bw_temporalis.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.utils"></a>

# bw\_temporalis.utils

<a id="bw_temporalis.utils.IncongruentDistribution"></a>

## IncongruentDistribution Objects

```python
class IncongruentDistribution(Exception)
```

The sum of `TemporalDistribution` values is different than the exchange

<a id="bw_temporalis.utils.normalized_data_array"></a>

#### normalized\_data\_array

```python
def normalized_data_array(steps: int, kind: str,
                          param: float | None) -> npt.NDArray[int]
```

<a id="bw_temporalis.utils.easy_datetime_distribution"></a>

#### easy\_datetime\_distribution

```python
def easy_datetime_distribution(
        start: str,
        end: str,
        steps: int | None = 50,
        kind: str | None = "uniform",
        param: float | None = None) -> TemporalDistribution
```

Generate a datetime `TemporalDistribution` with a few input parameters.

Can generate distributions whose `amount` values are uniformly,
triangularly, or normally distributed. Please build more complicated
distributions manually.

Only the `amount` values are distributed, the resulting distribution
`date` values are uniformly spaced from `start` to `end`.

For triangular distributions, `param` is the mode (optional), and should
be given in the same reference system as `start` and `stop`. The `param`
value should be in the same format as `start` and `end`, e.g.
"2023-01-01".

For normal distributions, `param` is the standard deviation in relation
to a standardized distribution with mu = 0. `param` is not used for the uniform distribution.

Raises
------
ValueError
    If the input parameters prevent construction of valide `TemporalDistribution`.

Parameters
----------
start : str
    Datetime marking the start (inclusive) of the distribution, e.g. "now", "2023-02-01", "2023-03-02T12:34:56"
end : str
    Datetime marking the end (inclusive) of the distribution, e.g. "now", "2023-02-01", "2023-03-02T12:34:56"
steps : int, optional
    Number of values in discrete distribution. Normally not more than 50 or 100.
kind : str, optional
    Distribution type. Must be one of "uniform", "triangular", or "normal"
param : float, optional
    Input parameter to define triangular or normal distribution

Returns
-------
A `TemporalDistribution` instance.

<a id="bw_temporalis.utils.easy_timedelta_distribution"></a>

#### easy\_timedelta\_distribution

```python
def easy_timedelta_distribution(
        start: int,
        end: int,
        resolution: str,
        steps: int | None = 50,
        kind: str | None = "uniform",
        param: float | None = None) -> TemporalDistribution
```

Generate a timedelta `TemporalDistribution` with a few input parameters.

Can generate distributions whose `amount` values are uniformly, triangularly, or normally distributed. Please build more complicated distributions manually.

Only the `amount` values are distributed, the resulting distribution `date` values are uniformly spaced from `start` to `end`.

For triangular distributions, `param` is the mode (optional). For lognormal distributions, `param` is the standard deviation (required). `param` is not used for the uniform distribution.

Raises
------
ValueError
    If the input parameters prevent construction of valide `TemporalDistribution`.

Parameters
----------
start : int
    Start (inclusive) of the distribution in `resolution` units
end : int
    End (inclusive) of the distribution in `resolution` units
resolution : str
    Resolution of the created `timedelta64` array. One of `Y` (year), `M` (month), `D` (day), `h` (hour), `m` (minute), `s` (second)
steps : int, optional
    Number of values in discrete distribution. Normally not more than 50 or 100.
kind : str, optional
    Distribution type. Must be one of "uniform", "triangular", or "normal"
param : float, optional
    Input parameter to define triangular or normal distribution

Returns
-------
A `TemporalDistribution` instance.

<a id="bw_temporalis.utils.check_database_exchanges"></a>

#### check\_database\_exchanges

```python
def check_database_exchanges(database_label: str) -> None
```

Check the sum of an exchange ``TemporalDistribution.amount`` is close to its ``amount`` value.

Raises
------
IncongruentDistribution
    If the two values are more than 1 percent different

Parameters
----------
database_label : str
    Name of database to check

<a id="bw_temporalis.utils.get_version_tuple"></a>

#### get\_version\_tuple

```python
def get_version_tuple() -> tuple
```
