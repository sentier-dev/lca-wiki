**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.lca cfg.yml > bw2calc.lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.lca"></a>

# bw2calc.lca

<a id="bw2calc.lca.logger"></a>

#### logger

<a id="bw2calc.lca.LCA"></a>

## LCA Objects

```python
class LCA(LCABase)
```

<a id="bw2calc.lca.LCA.matrix_labels"></a>

#### matrix\_labels

<a id="bw2calc.lca.LCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(demand: dict,
             method: Optional[tuple] = None,
             weighting: Optional[str] = None,
             normalization: Optional[str] = None,
             data_objs: Optional[Iterable[Union[Path, AbstractFileSystem,
                                                bwp.DatapackageBase]]] = None,
             remapping_dicts: Optional[Iterable[dict]] = None,
             log_config: Optional[dict] = None,
             seed_override: Optional[int] = None,
             use_arrays: Optional[bool] = False,
             use_distributions: Optional[bool] = False,
             selective_use: Optional[dict] = False)
```

Create a new LCA calculation object.

Compatible with Brightway2 and 2.5 semantics. Can be static, stochastic, or iterative
(scenario-based), depending on the ``data_objs`` input data..

This class supports both stochastic and static LCA, and can use a variety of ways to
describe uncertainty. The input flags `use_arrays` and `use_distributions` control some of
this stochastic behaviour. See the
[documentation for `matrix_utils`](https://github.com/brightway-lca/matrix_utils) for more
information on the technical implementation.

Parameters
----------
demand : dict[object: float]
    The demand for which the LCA will be calculated. The keys can be Brightway `Node`
    instances, `(database, code)` tuples, or integer ids.
method : tuple
    Tuple defining the LCIA method, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
weighting : tuple
    Tuple defining the LCIA weighting, such as `('foo', 'bar')`. Only needed if not passing
    `data_objs`.
weighting : string
    String defining the LCIA normalization, such as `'foo'`. Only needed if not passing
    `data_objs`.
data_objs : list[bw_processing.Datapackage]
    List of `bw_processing.Datapackage` objects. Can be loaded via
    `bw2data.prepare_lca_inputs` or constructed manually. Should include data for all needed
    matrices.
remapping_dicts : dict[str, dict]
    Dict of remapping dictionaries that link Brightway `Node` ids to `(database, code)`
    tuples. `remapping_dicts` can provide such remapping for any of `activity`, `product`,
    `biosphere`.
log_config : dict
    Optional arguments to pass to logging. Not yet implemented.
seed_override : int
    RNG seed to use in place of `Datapackage` seed, if any.
use_arrays : bool
    Use arrays instead of vectors from the given `data_objs`
use_distributions : bool
    Use probability distributions from the given `data_objs`
selective_use : dict[str, dict]
    Dictionary that gives more control on whether `use_arrays` or `use_distributions` should
    be used. Has the form `{matrix_label: {"use_arrays"|"use_distributions": bool}`.
    Standard matrix labels are `technosphere_matrix`, `biosphere_matrix`, and
    `characterization_matrix`.

<a id="bw2calc.lca.LCA.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="bw2calc.lca.LCA.build_demand_array"></a>

#### build\_demand\_array

```python
def build_demand_array(demand: Optional[dict] = None) -> None
```

Turn the demand dictionary into a *NumPy* array of correct size.

**Arguments**:

  * *demand* (dict, optional): Demand dictionary. Optional, defaults to ``self.demand``.
  

**Returns**:

  A 1-dimensional NumPy array

<a id="bw2calc.lca.LCA.load_lcia_data"></a>

#### load\_lcia\_data

```python
def load_lcia_data(
    data_objs: Optional[Iterable[Union[AbstractFileSystem,
                                       bwp.DatapackageBase]]] = None
) -> None
```

Load data and create characterization matrix.

This method will filter out regionalized characterization factors.

<a id="bw2calc.lca.LCA.load_normalization_data"></a>

#### load\_normalization\_data

```python
def load_normalization_data(
    data_objs: Optional[Iterable[Union[AbstractFileSystem,
                                       bwp.DatapackageBase]]] = None
) -> None
```

Load normalization data.

<a id="bw2calc.lca.LCA.load_weighting_data"></a>

#### load\_weighting\_data

```python
def load_weighting_data(
    data_objs: Optional[Iterable[Union[AbstractFileSystem,
                                       bwp.DatapackageBase]]] = None
) -> None
```

Load normalization data.

<a id="bw2calc.lca.LCA.lci_calculation"></a>

#### lci\_calculation

```python
def lci_calculation() -> None
```

The actual LCI calculation.

Separated from ``lci`` to be reusable in cases where the matrices are already built, e.g.
``redo_lci`` and Monte Carlo classes.

<a id="bw2calc.lca.LCA.lcia_calculation"></a>

#### lcia\_calculation

```python
def lcia_calculation() -> None
```

The actual LCIA calculation.

Separated from ``lcia`` to be reusable in cases where the matrices are already built, e.g.
``redo_lcia`` and Monte Carlo classes.

<a id="bw2calc.lca.LCA.normalization_calculation"></a>

#### normalization\_calculation

```python
def normalization_calculation() -> None
```

The actual normalization calculation.

Creates ``self.normalized_inventory``.

<a id="bw2calc.lca.LCA.weighting_calculation"></a>

#### weighting\_calculation

```python
def weighting_calculation() -> None
```

The actual weighting calculation.

Multiples weighting value by normalized inventory, if available, otherwise by characterized
inventory.

Creates ``self.weighted_inventory``.

<a id="bw2calc.lca.LCA.score"></a>

#### score

```python
@property
def score() -> float
```

The LCIA score as a ``float``.

Note that this is a `property <http://docs.python.org/2/library/functions.html#property>`_,
so it is ``foo.lca``, not ``foo.score()``

<a id="bw2calc.lca.LCA.switch_method"></a>

#### switch\_method

```python
def switch_method(
    method=Union[tuple, Iterable[Union[AbstractFileSystem,
                                       bwp.DatapackageBase]]]
) -> None
```

Load a new method and replace ``.characterization_mm`` and ``.characterization_matrix``.

Does not do any new calculations or change ``.characterized_inventory``.

<a id="bw2calc.lca.LCA.switch_normalization"></a>

#### switch\_normalization

```python
def switch_normalization(
    normalization=Union[tuple, Iterable[Union[AbstractFileSystem,
                                              bwp.DatapackageBase]]]
) -> None
```

Load a new normalization and replace ``.normalization_mm`` and ``.normalization_matrix``.

Does not do any new calculations or change ``.normalized_inventory``.

<a id="bw2calc.lca.LCA.switch_weighting"></a>

#### switch\_weighting

```python
def switch_weighting(
    weighting=Union[tuple, Iterable[Union[AbstractFileSystem,
                                          bwp.DatapackageBase]]]
) -> None
```

Load a new weighting and replace ``.weighting_mm`` and ``.weighting_matrix``.

Does not do any new calculations or change ``.weighted_inventory``.

<a id="bw2calc.lca.LCA.check_demand"></a>

#### check\_demand

```python
def check_demand(demand: Optional[dict] = None)
```

<a id="bw2calc.lca.LCA.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(matrix_label: str = "characterized_inventory",
                 row_dict: Optional[dict] = None,
                 col_dict: Optional[dict] = None,
                 annotate: bool = True,
                 cutoff: Number = 200,
                 cutoff_mode: str = "number") -> pd.DataFrame
```

Return all nonzero elements of the given matrix as a Pandas dataframe.

The LCA class instance must have the matrix ``matrix_label`` already; common labels are:

* characterized_inventory
* inventory
* technosphere_matrix
* biosphere_matrix
* characterization_matrix

For these common matrices, we already have ``row_dict`` and ``col_dict`` which link row and
column indices to database ids. For other matrices, or if you have a custom mapping
dictionary, override ``row_dict`` and/or ``col_dict``. They have the form
``{matrix index: identifier}``.

If ``bw2data`` is installed, this function will try to look up metadata on the row and
column objects. To turn this off, set ``annotate`` to ``False``.

Instead of returning all possible values, you can apply a cutoff. This cutoff can be
specified in two ways, controlled by ``cutoff_mode``, which should be either ``fraction`` or
``number``.

If ``cutoff_mode`` is ``number`` (the default), then ``cutoff`` is the number of rows in the
DataFrame. Data values are first sorted by their absolute value, and then the largest
``cutoff`` are taken.

If ``cutoff_mode`` is ``fraction``, then only values whose absolute value is greater than
``cutoff * total_score`` are taken. ``cutoff`` must be between 0 and 1.

The returned DataFrame will have the following columns:

* amount
* col_index
* row_index

If row or columns dictionaries are available, the following columns are added:

* col_id
* row_id

If ``bw2data`` is available, then the following columns are added:

* col_code
* col_database
* col_location
* col_name
* col_reference_product
* col_type
* col_unit
* row_categories
* row_code
* row_database
* row_location
* row_name
* row_type
* row_unit
* source_product

Returns a pandas ``DataFrame``.
