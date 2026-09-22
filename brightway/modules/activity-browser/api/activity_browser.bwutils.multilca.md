**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.multilca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.multilca cfg.yml > activity_browser.bwutils.multilca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.multilca"></a>

# activity\_browser.bwutils.multilca

<a id="activity_browser.bwutils.multilca.metadata"></a>

#### metadata

<a id="activity_browser.bwutils.multilca.ca"></a>

#### ca

<a id="activity_browser.bwutils.multilca.databases_for_fu_keys"></a>

#### databases\_for\_fu\_keys

```python
def databases_for_fu_keys(fu_activity_keys: Iterable) -> set[str]
```

Dependent databases reachable from reference-flow ``(database, code)`` keys.

<a id="activity_browser.bwutils.multilca.setup_index"></a>

#### setup\_index

```python
def setup_index(key) -> int | None
```

Parse a contribution setup key (reference flow / method / scenario) to an int index.

<a id="activity_browser.bwutils.multilca.MLCA"></a>

## MLCA Objects

```python
class MLCA(object)
```

Wrapper class for performing LCA calculations with many reference flows and impact categories.

Needs to be passed a brightway ``calculation_setup`` name.

This class does not subclass the `LCA` class, and performs all
calculations upon instantiation.

Initialization creates `self.lca_scores`, which is a NumPy array
of LCA scores, with rows of reference flows and columns of impact categories.
Ordering is the same as in the `calculation_setup`.

This class is adapted from `bw2calc.multi_lca.MultiLCA` and includes a
number of additional attributes required to perform process- and
elementary flow contribution analysis (see class `Contributions` below).

Parameters
----------
cs_name : str
    Name of the calculation setup

Attributes
----------
func_units_dict
all_databases
lca_scores_normalized
func_units: list
    List of dictionaries, each containing the reference flow key and
    its required output
fu_labels: dict[int, str]
    Full display label per ``inv`` row index
method_labels: dict[int, str]
    Full display label per impact category index
scenario_labels: dict[int, str]
    Full display label per scenario index (superstructure only)
fu_keys: tuple[str, ...]
    Brightway ``inv`` position keys (``"0"``, ``"1"``, …)
fu_demands: dict[str, dict]
    ``inv`` demands keyed by position
fu_activity_keys: list
    Brightway activity keys per ``inv`` row (duplicates allowed)
methods: list
    The impact categories of the calculation setup
method_index: dict
    Links the impact categories to a specific index
rev_method_index: dict
    Same as `method_index` but using the indexes as keys
lca: `bw2calc.lca.LCA`
    Brightway LCA instance used to perform LCA, LCI and LCIA
    calculations
method_matrices: list
    Contains the characterization matrix for each impact category.
lca_scores: `numpy.ndarray`
    2-dimensional array of shape (`func_units`, `methods`) holding the
    calculated LCA scores of each combination of reference flow and
    impact assessment method
rev_activity_dict: dict
    See `bw2calc.lca.LCA.reverse_dict`
rev_product_dict: dict
    See `bw2calc.lca.LCA.reverse_dict`
rev_biosphere_dict: dict
    See `bw2calc.lca.LCA.reverse_dict`
scaling_factors: dict
    Contains the life-cycle inventory scaling factors per reference flow
technosphere_flows: dict
    Contains the calculated technosphere flows per reference flow
inventory: dict
    Life cycle inventory (biosphere flows) per reference flow
inventories: dict
    Biosphere flows per reference flow and impact category combination
characterized_inventories: dict
    Inventory multiplied by scaling (relative impact on environment) per
    reference flow and impact category combination
elementary_flow_contributions: `numpy.ndarray`
    3-dimensional array of shape (`func_units`, `methods`, `biosphere`)
    which holds the characterized inventory results summed along the
    technosphere axis
process_contributions: `numpy.ndarray`
    3-dimensional array of shape (`func_units`, `methods`, `technosphere`)
    which holds the characterized inventory results summed along the
    biosphere axis
Raises
------
ValueError
    If the given `cs_name` cannot be found in brightway calculation_setups

<a id="activity_browser.bwutils.multilca.MLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name: str, lca_class: bc.LCA = bc.LCA, cs: dict | None = None)
```

<a id="activity_browser.bwutils.multilca.MLCA.calculate"></a>

#### calculate

```python
def calculate()
```

<a id="activity_browser.bwutils.multilca.MLCA.func_units_dict"></a>

#### func\_units\_dict

```python
@property
def func_units_dict() -> dict
```

Return a dictionary of reference flow (key, demand).

<a id="activity_browser.bwutils.multilca.MLCA.all_databases"></a>

#### all\_databases

```python
@property
def all_databases() -> set
```

Get all databases linked to the reference flows.

<a id="activity_browser.bwutils.multilca.MLCA.get_results_for_method"></a>

#### get\_results\_for\_method

```python
def get_results_for_method(index: int = 0) -> pd.DataFrame
```

<a id="activity_browser.bwutils.multilca.MLCA.lca_scores_normalized"></a>

#### lca\_scores\_normalized

```python
@property
def lca_scores_normalized() -> np.ndarray
```

Normalize LCA scores per impact category (0–1 scale; safe for zero columns).

<a id="activity_browser.bwutils.multilca.MLCA.lca_scores_to_dataframe"></a>

#### lca\_scores\_to\_dataframe

```python
def lca_scores_to_dataframe() -> pd.DataFrame
```

Returns a dataframe of LCA scores using FU labels as index and
methods as columns.

<a id="activity_browser.bwutils.multilca.Contributions"></a>

## Contributions Objects

```python
class Contributions(object)
```

Contribution Analysis built on top of the Multi-LCA class.

This class requires instantiated MLCA and MetaDataStore objects.

Parameters
----------
mlca : `MLCA`
    An instantiated MLCA object

Attributes
----------
DEFAULT_ACT_FIELDS : list
    Default activity/reference flow column names
DEFAULT_EF_FIELDS : list
    Default environmental flow column names
mlca: `MLCA`
    Linked `MLCA` instance used for contribution calculations
act_fields: list
    technosphere-specific metadata column names
ef_fields: list
    biosphere-specific metadata column names

Raises
------
ValueError
    If the given `mlca` object is not an instance of `MLCA`

<a id="activity_browser.bwutils.multilca.Contributions.ACT"></a>

#### ACT

<a id="activity_browser.bwutils.multilca.Contributions.EF"></a>

#### EF

<a id="activity_browser.bwutils.multilca.Contributions.TECH"></a>

#### TECH

<a id="activity_browser.bwutils.multilca.Contributions.BIOS"></a>

#### BIOS

<a id="activity_browser.bwutils.multilca.Contributions.DEFAULT_ACT_FIELDS"></a>

#### DEFAULT\_ACT\_FIELDS

<a id="activity_browser.bwutils.multilca.Contributions.DEFAULT_EF_FIELDS"></a>

#### DEFAULT\_EF\_FIELDS

<a id="activity_browser.bwutils.multilca.Contributions.DEFAULT_ACT_AGGREGATES"></a>

#### DEFAULT\_ACT\_AGGREGATES

<a id="activity_browser.bwutils.multilca.Contributions.DEFAULT_EF_AGGREGATES"></a>

#### DEFAULT\_EF\_AGGREGATES

<a id="activity_browser.bwutils.multilca.Contributions.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mlca)
```

<a id="activity_browser.bwutils.multilca.Contributions.normalize"></a>

#### normalize

```python
def normalize(contribution_array: np.ndarray,
              total_range: bool = True) -> np.ndarray
```

Normalize the contribution array based on range or score.

Percent scale (0–100), consistent with LCIA overview / LCA scores plots.
Score mode uses ``|net total|``; when the net is zero but contributions
have mixed signs, falls back to the range (sum of absolute values).

<a id="activity_browser.bwutils.multilca.Contributions.join_df_with_metadata"></a>

#### join\_df\_with\_metadata

```python
@classmethod
def join_df_with_metadata(cls,
                          df: pd.DataFrame,
                          x_fields: Optional[list] = None,
                          special_keys: Optional[list] = None,
                          mlca: MLCA | None = None) -> pd.DataFrame
```

Join a dataframe that has keys on the index with metadata.

Metadata fields are defined in x_fields.

Parameters
----------
df : Simple DataFrame containing processed data
x_fields : List of additional columns to add from the MetaDataStore
special_keys : List of specific items to place at the top of the dataframe

Returns
-------
Expanded and metadata-annotated dataframe

<a id="activity_browser.bwutils.multilca.Contributions.get_labelled_contribution_dict"></a>

#### get\_labelled\_contribution\_dict

```python
def get_labelled_contribution_dict(cont_dict: dict,
                                   x_fields: list = None,
                                   mask: list = None) -> pd.DataFrame
```

Annotate the contribution dict with metadata.

Parameters
----------
cont_dict : Holds the contribution data connected to the functions of methods
x_fields : X-axis fieldnames, these are usually the indexes/keys of specific processes
mask : Used in case of aggregation or special cases where the usual way of using the metadata cannot be used

Returns
-------
Annotated contribution dict inside a pandas dataframe

<a id="activity_browser.bwutils.multilca.Contributions.adjust_table_unit"></a>

#### adjust\_table\_unit

```python
@staticmethod
def adjust_table_unit(df: pd.DataFrame,
                      method: Optional[tuple]) -> pd.DataFrame
```

Given a dataframe, adjust the unit of the table to either match the given method, or not exist.

<a id="activity_browser.bwutils.multilca.Contributions.inventory_df"></a>

#### inventory\_df

```python
def inventory_df(
        inventory_type: str,
        columns: set = {"name", "database", "code", "id"}) -> pd.DataFrame
```

Return an inventory dataframe with metadata of the given type.

<a id="activity_browser.bwutils.multilca.Contributions.lca_scores_df"></a>

#### lca\_scores\_df

```python
def lca_scores_df(normalized: bool = False) -> pd.DataFrame
```

Return a metadata-annotated DataFrame of the LCA scores.

<a id="activity_browser.bwutils.multilca.Contributions.get_contributions"></a>

#### get\_contributions

```python
def get_contributions(contribution,
                      functional_unit=None,
                      method=None,
                      **kwargs) -> np.ndarray
```

Return a contribution matrix given the type and fu / method.

<a id="activity_browser.bwutils.multilca.Contributions.aggregate_by_parameters"></a>

#### aggregate\_by\_parameters

```python
def aggregate_by_parameters(contributions: np.ndarray,
                            inventory: str,
                            parameters: Union[str, list] = None)
```

Perform aggregation of the contribution data given parameters.

Parameters
----------
contributions : 2-dimensional contribution array
inventory : Either 'biosphere' or 'technosphere', used to determine which inventory to use
parameters : One or more parameters by which to aggregate the given contribution array.

Returns
-------
aggregated : pd.DataFrame
    The aggregated 2-dimensional contribution array
mask_index : dict
    Contains all of the values of the aggregation mask, linked to their indexes
mask : list or dictview or None
    An optional list or dictview of the mask_index values

<a id="activity_browser.bwutils.multilca.Contributions.top_elementary_flow_contributions"></a>

#### top\_elementary\_flow\_contributions

```python
def top_elementary_flow_contributions(functional_unit: Optional[tuple] = None,
                                      method: Optional[tuple] = None,
                                      aggregator: Union[str, list,
                                                        None] = None,
                                      limit: int = 5,
                                      normalize: bool = False,
                                      limit_type: str = "number",
                                      total_range: bool = True,
                                      **kwargs) -> pd.DataFrame
```

Return top EF contributions for either functional_unit or method.

* If functional_unit: Compare the unit against all considered impact
assessment methods.
* If method: Compare the method against all involved processes.

Parameters
----------
functional_unit : The reference flow to compare all considered impact categories against
method : The method to compare all considered reference flows against
aggregator : Used to aggregate EF contributions over certain columns
limit : The number of top contributions to consider
normalize : Determines whether or not to normalize the contribution values
limit_type : The type of limit, either 'number' or 'percent'
total_range : Whether to consider the total for contributions the range (True) or the score (False)

Returns
-------
Annotated top-contribution dataframe

<a id="activity_browser.bwutils.multilca.Contributions.top_process_contributions"></a>

#### top\_process\_contributions

```python
def top_process_contributions(functional_unit: Optional[tuple] = None,
                              method: Optional[tuple] = None,
                              aggregator: Union[str, list, None] = None,
                              limit: int = 5,
                              normalize: bool = False,
                              limit_type: str = "number",
                              total_range: bool = True,
                              **kwargs) -> pd.DataFrame
```

Return top process contributions for functional_unit or method.

* If functional_unit: Compare the process against all considered impact
assessment methods.
* If method: Compare the method against all involved processes.

Parameters
----------
functional_unit : The reference flow to compare all considered impact categories against
method : The method to compare all considered reference flows against
aggregator : Used to aggregate EF contributions over certain columns
limit : The number of top contributions to consider
normalize : Determines whether or not to normalize the contribution values
limit_type : The type of limit, either 'number' or 'percent'

Returns
-------
Annotated top-contribution dataframe

<a id="activity_browser.bwutils.multilca.ids_to_keys"></a>

#### ids\_to\_keys

```python
def ids_to_keys(index_list)
```
