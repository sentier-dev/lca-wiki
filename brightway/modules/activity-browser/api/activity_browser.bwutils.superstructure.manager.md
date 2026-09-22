**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.manager` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.manager cfg.yml > activity_browser.bwutils.superstructure.manager.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.manager"></a>

# activity\_browser.bwutils.superstructure.manager

<a id="activity_browser.bwutils.superstructure.manager.EXCHANGE_KEYS"></a>

#### EXCHANGE\_KEYS

<a id="activity_browser.bwutils.superstructure.manager.INDEX_KEYS"></a>

#### INDEX\_KEYS

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager"></a>

## SuperstructureManager Objects

```python
class SuperstructureManager(object)
```

A combination of methods used to manipulate and transform superstructures.

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__(df: pd.DataFrame, *dfs: pd.DataFrame)
```

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.combined_data"></a>

#### combined\_data

```python
def combined_data(kind: str = "product",
                  skip_checks: bool = False) -> pd.DataFrame
```

Combines multiple superstructures using logic specified by the first argument (kind).

Currently implemented: 'product' creates an outer-product combination
from all of the columns of the dataframes and injects values from all
the frames for their specific indexes, any shared indexes are overridden
where the later dataframes have preference.

Uses parts of https://stackoverflow.com/a/45286061

If only a single dataframe is given to the manager, return this dataframe instead.

Parameters
----------
kind: a string that indicates the type of combination to make for the class self.frames variable
can be of the form 'product', or 'addition'
skip_checks: A boolean trigger that should be set to True if the duplicate checks are not required.
Primarily of use when removing a dataframe, in which case duplicates are removed without warnings
provided to the user.

Returns
-------
A single pandas dataframe built from the separate dataframes held in the objects frame variable

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.product_combine_frames"></a>

#### product\_combine\_frames

```python
@staticmethod
def product_combine_frames(data: List[pd.DataFrame],
                           index: pd.MultiIndex,
                           cols: pd.MultiIndex,
                           skip_checks: bool = False) -> pd.DataFrame
```

Iterate through the dataframes, filling data into the combined
dataframe with duplicate indexes being resolved using a 'last one wins'
logic.

Parameters
----------
data: A List of dataframes, each dataframe corresponding to a dataframe from a single scenario difference file
index: The combined Multi-index for the final merged dataframe
cols: A Multi-index object that contains all of the levels (scenario names) from the different scenario files)
this is used to create a combined set of scenario names
skip_checks: a boolean that triggers the use of duplicate checks (not required when removing scenario files)

Returns
-------
A pandas dataframe constructed from the combined inputs to the class self.frames variable

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.addition_combine_frames"></a>

#### addition\_combine\_frames

```python
@staticmethod
def addition_combine_frames(data: List[pd.DataFrame],
                            index: pd.MultiIndex,
                            cols: pd.Index,
                            skip_checks: bool = False) -> pd.DataFrame
```

Iterates through the combined dataframes to produce a single merged dataframe where duplicates are resolved
with a "last one wins" approach

Parameters
----------
data: list of input dataframes from the scenario difference files
index: pandas Multi-Index used to create the x-index from the merged indexes of the data input
cols: the list of scenario columns from the scenario difference files
skip_checks: a simple boolean used to avoid the duplicate checks (when removing a scenario file)

Returns
-------
A pandas dataframe constructed from the combined inputs to the class self.frames variable

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.format_dataframe"></a>

#### format\_dataframe

```python
@staticmethod
def format_dataframe(df: pd.DataFrame) -> pd.DataFrame
```

Format the input superstructure dataframes.
If in the future more formatting functions are needed, they should be added here.

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.merge_flows_to_self"></a>

#### merge\_flows\_to\_self

```python
@staticmethod
@_time_it_
def merge_flows_to_self(df: pd.DataFrame) -> pd.DataFrame
```

This function checks if any technosphere flows to self exist and merges them with a production flow.
If no production flow exists, it is added using the default value from the respective brightway database

Parameters
----------
df: a pandas dataframe for the scenario files with the exchanges to be checked

Returns
-------
A pandas dataframe with the changes made to the scenario dataframe for these self referential flows

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.remove_duplicates"></a>

#### remove\_duplicates

```python
@staticmethod
def remove_duplicates(df: pd.DataFrame) -> pd.DataFrame
```

Using the input/output index for a superstructure, drop duplicates
where the last instance survives.

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.build_index"></a>

#### build\_index

```python
@staticmethod
def build_index(df: pd.DataFrame) -> pd.MultiIndex
```

Construct MultiIndex from exchange keys and flows, allowing for
data merging.

- If any of the exchange key columns are missing keys, attempt to fill
them. If filling them does not succeed, raise an assertion.

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.exchangesPopup"></a>

#### exchangesPopup

```python
@staticmethod
def exchangesPopup() -> ABPopup
```

Provides a popup message if there is an issue to find some of the scenario exchanges in the uploaded files

Returns
-------
A QDialog with a critical Error

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.fill_empty_process_keys_in_exchanges"></a>

#### fill\_empty\_process\_keys\_in\_exchanges

```python
@staticmethod
@_time_it_
def fill_empty_process_keys_in_exchanges(df: pd.DataFrame) -> pd.DataFrame
```

identifies those exchanges in the input dataframe that are missing keys.
If the keys cannot be found in the available databases then an Exception is
raised

Raises
------
ScenarioExchangeNotFoundError if a scenario exchange is not present in the local database

Parameters
----------
df: the input dataframe containing scenario data with exchanges that need to be
checked for the presence of a key

Returns
-------
A pandas dataframe with complete entries for the dataframes 'to key' and 'from key' fields

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.verify_scenario_process_keys"></a>

#### verify\_scenario\_process\_keys

```python
@staticmethod
@_time_it_
def verify_scenario_process_keys(df: pd.DataFrame) -> pd.DataFrame
```

Checks all process keys in the scenario file and does not provide alternative keys based on exchange
metadata.

Raises
------
ScenarioExchangeNotFoundError if a scenario exchange is not present in the local database

Parameters
-------
df: the dataframe with process keys that need to be verified

Returns
-------
A scenario dataframe with all scenario exchange keys verified with the local brightway databases

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.check_scenario_exchange_values"></a>

#### check\_scenario\_exchange\_values

```python
@staticmethod
@_time_it_
def check_scenario_exchange_values(df: pd.DataFrame, cols: pd.Index)
```

"
Checks the scenario exchange amounts from the dataframes for valid values, if none are found an error
is raised, if some exchange amounts are absent a warning is raised and default values are used.

Raises
------
A ScenarioExchangeDataNotFoundError if no valid values are found in the scenario 'amounts'
A ScenarioExchangeDataNonNumericError if non-numeric values are found for the scenario 'amounts'
A logged warning before replacement of invalid scenario values

Parameters
----------
df: a pandas dataframe holding the current file scenario data, should be in the full scenario file format, with
all fields defined in the utils.SUPERSTRUCTURE global
cols: a pandas index that indicates the scenario columns holding the 'amounts' to be used in the scenario
calculations

<a id="activity_browser.bwutils.superstructure.manager.SuperstructureManager.check_duplicates"></a>

#### check\_duplicates

```python
@staticmethod
@_time_it_
def check_duplicates(data: Optional[Union[pd.DataFrame, list]],
                     index: list = ["to key", "from key", "flow type"])
```

Checks three fields to identify whether a scenario difference file contains duplicate exchanges:
'from key', 'to key' and 'flow type'
Produces a warning

Raises
------
ImportCanceledError if the user cancels the import due to duplicate exchanges

Parameters
----------
data: a pandas dataframe or list of pandas dataframes that will be checked for containing duplicates
index: nominally required, but probably best to avoid overwriting the default values. Used to indicate the
    columns to check for duplication of an exchange

Returns
-------
A dataframe that contains only unique flow exchanges
