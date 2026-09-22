**Generated API reference** · package `bw_temporalis` 1.2.0 · module `bw_temporalis.lcia.climate` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_temporalis.lcia.climate cfg.yml > bw_temporalis.lcia.climate.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_temporalis.lcia.climate"></a>

# bw\_temporalis.lcia.climate

<a id="bw_temporalis.lcia.climate.characterize_co2"></a>

#### characterize\_co2

```python
def characterize_co2(series,
                     period: int | None = 100,
                     cumulative: bool | None = False) -> pd.DataFrame
```

Calculate the cumulative or marginal radiative forcing (CRF) from CO2 for each year in a given period.

If `cumulative` is True, the cumulative CRF is calculated. If `cumulative` is False, the marginal CRF is calculated.
Takes a single row of the TimeSeries Pandas DataFrame (corresponding to a set of (`date`/`amount`/`flow`/`activity`).
For each year in the given period, the CRF is calculated.
Units are watts/square meter/kilogram of CO2.

Returns
-------
A TimeSeries dataframe with the following columns:
- date: datetime64[s]
- amount: float
- flow: str
- activity: str

Notes
-----
See also the relevant scientific publication on CRF: https://doi.org/10.5194/acp-13-2793-2013
See also the relevant scientific publication on the numerical calculation of CRF: http://pubs.acs.org/doi/abs/10.1021/acs.est.5b01118

See Also
--------
characterize_methane: The same function for CH4

<a id="bw_temporalis.lcia.climate.characterize_methane"></a>

#### characterize\_methane

```python
def characterize_methane(series,
                         period: int = 100,
                         cumulative=False) -> pd.DataFrame
```

Calculate the cumulative or marginal radiative forcing (CRF) from CH4 for each year in a given period.

If `cumulative` is True, the cumulative CRF is calculated. If `cumulative` is False, the marginal CRF is calculated.
Takes a single row of the TimeSeries Pandas DataFrame (corresponding to a set of (`date`/`amount`/`flow`/`activity`).
For earch year in the given period, the CRF is calculated.
Units are watts/square meter/kilogram of CH4.

Parameters
----------
series : array-like
    A single row of the TimeSeries dataframe.
period : int, optional
    Time period for calculation (number of years), by default 100
cumulative : bool, optional
    Should the RF amounts be summed over time?

Returns
-------
A TimeSeries dataframe with the following columns:
- date: datetime64[s]
- amount: float
- flow: str
- activity: str

Notes
-----
See also the relevant scientific publication on CRF: https://doi.org/10.5194/acp-13-2793-2013
See also the relevant scientific publication on the numerical calculation of CRF: http://pubs.acs.org/doi/abs/10.1021/acs.est.5b01118

See Also
--------
characterize_co2: The same function for CO2
