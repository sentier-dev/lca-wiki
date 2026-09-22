**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.convolution` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_temporalis.convolution cfg.yml > bw_temporalis.convolution.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.convolution"></a>

# bw\_temporalis.convolution

<a id="bw_temporalis.convolution.OFFSET"></a>

#### OFFSET

<a id="bw_temporalis.convolution.datetime_type"></a>

#### datetime\_type

<a id="bw_temporalis.convolution.timedelta_type"></a>

#### timedelta\_type

<a id="bw_temporalis.convolution.time_types"></a>

#### time\_types

<a id="bw_temporalis.convolution.consolidate"></a>

#### consolidate

```python
def consolidate(
    *, indices: npt.NDArray[np.int64], amounts: npt.NDArray[np.float64]
) -> tuple[npt.NDArray[np.int64], npt.NDArray[np.float64]]
```

Sum all values in ``amount`` which have the same index in ``indices``

<a id="bw_temporalis.convolution.convolve"></a>

#### convolve

```python
def convolve(
    *, first_date: npt.NDArray, first_amount: npt.NDArray[np.float64],
    second_date: npt.NDArray, second_amount: npt.NDArray[np.float64],
    return_dtype: npt.DTypeLike | str
) -> tuple[npt.NDArray, npt.NDArray[np.float64]]
```

<a id="bw_temporalis.convolution.temporal_convolution_datetime_timedelta"></a>

#### temporal\_convolution\_datetime\_timedelta

```python
def temporal_convolution_datetime_timedelta(
    *, first_date: npt.NDArray[datetime_type],
    first_amount: npt.NDArray[np.float64],
    second_date: npt.NDArray[timedelta_type],
    second_amount: npt.NDArray[np.float64]
) -> tuple[npt.NDArray[datetime_type], npt.NDArray[np.float64]]
```

<a id="bw_temporalis.convolution.temporal_convolution_timedelta_timedelta"></a>

#### temporal\_convolution\_timedelta\_timedelta

```python
def temporal_convolution_timedelta_timedelta(
    *, first_date: npt.NDArray[timedelta_type],
    first_amount: npt.NDArray[np.float64],
    second_date: npt.NDArray[timedelta_type],
    second_amount: npt.NDArray[np.float64]
) -> tuple[npt.NDArray[timedelta_type], npt.NDArray[np.float64]]
```
