**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.dataframe` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.dataframe cfg.yml > activity_browser.bwutils.superstructure.dataframe.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.dataframe"></a>

# activity\_browser.bwutils.superstructure.dataframe

<a id="activity_browser.bwutils.superstructure.dataframe.metadata"></a>

#### metadata

<a id="activity_browser.bwutils.superstructure.dataframe.superstructure_from_arrays"></a>

#### superstructure\_from\_arrays

```python
def superstructure_from_arrays(samples: np.ndarray,
                               indices: np.ndarray,
                               names: List[str] = None) -> pd.DataFrame
```

Process indices into the superstructure itself, the samples represent
the scenarios.

<a id="activity_browser.bwutils.superstructure.dataframe.superstructure_from_scenario_exchanges"></a>

#### superstructure\_from\_scenario\_exchanges

```python
def superstructure_from_scenario_exchanges(scenarios: dict[str, dict[int,
                                                                     float]])
```

<a id="activity_browser.bwutils.superstructure.dataframe.regular_exchange_to_sdf"></a>

#### regular\_exchange\_to\_sdf

```python
def regular_exchange_to_sdf(exchange_id: int, scenarios: dict[str, float])
```

<a id="activity_browser.bwutils.superstructure.dataframe.mf_exchange_to_sdf"></a>

#### mf\_exchange\_to\_sdf

```python
def mf_exchange_to_sdf(exchange_id: int, scenarios: dict[str, float])
```

<a id="activity_browser.bwutils.superstructure.dataframe.exchange_is_from_functional_backend"></a>

#### exchange\_is\_from\_functional\_backend

```python
def exchange_is_from_functional_backend(exchange_id: int)
```

<a id="activity_browser.bwutils.superstructure.dataframe.transpose_scenarios_to_exchange_ids"></a>

#### transpose\_scenarios\_to\_exchange\_ids

```python
def transpose_scenarios_to_exchange_ids(
        scenarios: dict[str, dict[int, float]]) -> dict[int, dict[str, float]]
```

Transpose a dictionary of scenarios to organize data by exchange IDs.

Parameters
----------
scenarios : dict[str, dict[int, float]]
    A dictionary where keys are scenario names (str) and values are dictionaries
    mapping exchange IDs (int) to amounts (float).

Returns
-------
dict[int, dict[str, float]]
    A dictionary where keys are exchange IDs (int) and values are dictionaries
    mapping scenario names (str) to amounts (float).

<a id="activity_browser.bwutils.superstructure.dataframe.arrays_from_indexed_superstructure"></a>

#### arrays\_from\_indexed\_superstructure

```python
def arrays_from_indexed_superstructure(
        df: pd.DataFrame) -> Tuple[np.ndarray, np.ndarray]
```

<a id="activity_browser.bwutils.superstructure.dataframe.filter_databases_indexed_superstructure"></a>

#### filter\_databases\_indexed\_superstructure

```python
def filter_databases_indexed_superstructure(df: pd.DataFrame,
                                            include: set) -> pd.DataFrame
```

Filters the given superstructure so that only indexes where the output
database is in the `include` set are valid.

<a id="activity_browser.bwutils.superstructure.dataframe.scenario_columns"></a>

#### scenario\_columns

```python
def scenario_columns(df: pd.DataFrame) -> pd.Index
```

<a id="activity_browser.bwutils.superstructure.dataframe.ensure_string_scenario_names"></a>

#### ensure\_string\_scenario\_names

```python
def ensure_string_scenario_names(df: pd.DataFrame) -> pd.DataFrame
```

Coerce scenario column names to strings (Excel/CSV may yield ints).

<a id="activity_browser.bwutils.superstructure.dataframe.scenario_names_from_df"></a>

#### scenario\_names\_from\_df

```python
def scenario_names_from_df(df: pd.DataFrame) -> List[str]
```

Returns the list of scenario names from a given superstructure.

Strip out any possible carriage returns (excel junk)

<a id="activity_browser.bwutils.superstructure.dataframe.scenario_replace_databases"></a>

#### scenario\_replace\_databases

```python
def scenario_replace_databases(df_: pd.DataFrame,
                               replacements: dict) -> pd.DataFrame
```

For a provided dataframe the function will check for the presence of a unidentified database for all rows.
If an unidentified database is found as a key in the replacements argument the corresponding value provided is used
to provide an alternative database. The corresponding key for the activity from the unidentified database is
collected from the provided alternative.

If an activity cannot be identified within the provided database a warning message is provided. The process can
either be terminated, or can proceed without replacement of those activities not identified (the unidentified
database names in these instances will be retained)

Raises
------
ScenarioDatabaseNotFoundError

Parameters
----------

df_ : the dataframe that is produced from the supplied scenario files provided to the AB

replacements : a dictionary of key-value pairs where the key corresponds to the database in the supplied dataframe
        and the value corresponds to the respective database in the local brightway environment

bw_dbs : a list of Brightway databases held locally

Returns
-------
