**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.multi_lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.multi_lca cfg.yml > bw2calc.multi_lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.multi_lca"></a>

# bw2calc.multi\_lca

<a id="bw2calc.multi_lca.logger"></a>

#### logger

<a id="bw2calc.multi_lca.DemandsValidator"></a>

## DemandsValidator Objects

```python
class DemandsValidator(BaseModel)
```

<a id="bw2calc.multi_lca.DemandsValidator.demands"></a>

#### demands

<a id="bw2calc.multi_lca.MultiLCA"></a>

## MultiLCA Objects

```python
class MultiLCA(LCABase)
```

Perform LCA on multiple demands, impact categories, and normalization and weighting sets.

Builds only *one* technosphere and biosphere matrix which can cover all demands.

Main differences from the base `LCA` class:

* Many attributes are plural, such as `supply_arrays`, `inventories`, characterization_matrices`
* `demands` must be a dictionary with `str` keys, e.g. `{'my truck': {12345: 1}}`
* `demands` must have integer IDs; you can't pass `('database', 'code')` or `Activity` objects.
* Calculation results are a dictionary with keys of functional units and impact categories

The calculation procedure is the same as for singular LCA: `lci()`, `lcia()`, and `next()`. See
the LCA documentation for these methods and their input arguments.

Parameters
----------
demands : dict[str, dict[int, float]]
    The demands for which the LCA will be calculated. The keys identify functional unit sets.
method_config : dict | MethodConfig
    Dictionary satisfying the `MethodConfig` specification or `MethodConfig` instance.
data_objs : list[bw_processing.Datapackage]
    List of `bw_processing.Datapackage` objects. Should include data for all needed matrices.
remapping_dicts : dict[str, dict]
    Dict of remapping dictionaries that link Brightway `Node` ids to `(database, code)` tuples.
    `remapping_dicts` can provide such remapping for any of `activity`, `product`, `biosphere`.
log_config : dict
    Optional arguments to pass to logging. Not yet implemented.
seed_override : int
    RNG seed to use in place of `Datapackage` seed, if any.
use_arrays : bool
    Use arrays instead of vectors from the given `data_objs`
use_distributions : bool
    Use probability distributions from the given `data_objs`
selective_use : dict[str, dict]
    Dictionary that gives more control on whether `use_arrays` or `use_distributions` should be
    used. Has the form `{matrix_label: {"use_arrays"|"use_distributions": bool}`. Standard
    matrix labels are `technosphere_matrix`, `biosphere_matrix`, and `characterization_matrix`.

<a id="bw2calc.multi_lca.MultiLCA.matrix_labels"></a>

#### matrix\_labels

<a id="bw2calc.multi_lca.MultiLCA.matrix_list_labels"></a>

#### matrix\_list\_labels

<a id="bw2calc.multi_lca.MultiLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(demands: dict[str, dict[int, float]],
             method_config: Union[dict, MethodConfig],
             data_objs: Iterable[Union[Path, AbstractFileSystem,
                                       bwp.DatapackageBase]],
             remapping_dicts: Optional[Iterable[dict]] = None,
             log_config: Optional[dict] = None,
             seed_override: Optional[int] = None,
             use_arrays: Optional[bool] = False,
             use_distributions: Optional[bool] = False,
             selective_use: Optional[dict] = None)
```

<a id="bw2calc.multi_lca.MultiLCA.redo_lci"></a>

#### redo\_lci

```python
def redo_lci() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.lci"></a>

#### lci

```python
def lci() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.redo_lcia"></a>

#### redo\_lcia

```python
def redo_lcia() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.lcia"></a>

#### lcia

```python
def lcia() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.build_demand_array"></a>

#### build\_demand\_array

```python
def build_demand_array(demands: Optional[dict] = None) -> None
```

Turn the demand dictionary into a *NumPy* array of correct size.

**Arguments**:

  * *demand* (dict, optional): Demand dictionary. Optional, defaults to ``self.demand``.
  

**Returns**:

  A 1-dimensional NumPy array

<a id="bw2calc.multi_lca.MultiLCA.filter_package_by_identifier"></a>

#### filter\_package\_by\_identifier

```python
def filter_package_by_identifier(
    data_objs: Iterable[bwp.DatapackageBase],
    identifier: Union[list[str], tuple[str, ...], str]
) -> list[bwp.DatapackageBase]
```

Filter the datapackage resources in `data_objs` whose "identifier" attribute equals
input argument `identifier`.

Used in splitting up impact categories, normalization, and weighting matrices.

<a id="bw2calc.multi_lca.MultiLCA.load_lcia_data"></a>

#### load\_lcia\_data

```python
def load_lcia_data(
        data_objs: Optional[Iterable[bwp.DatapackageBase]] = None) -> None
```

Load data and create characterization matrices.

This method will filter out regionalized characterization factors.

<a id="bw2calc.multi_lca.MultiLCA.load_normalization_data"></a>

#### load\_normalization\_data

```python
def load_normalization_data(
        data_objs: Optional[Iterable[bwp.DatapackageBase]] = None) -> None
```

Load normalization data.

<a id="bw2calc.multi_lca.MultiLCA.load_weighting_data"></a>

#### load\_weighting\_data

```python
def load_weighting_data(
        data_objs: Optional[Iterable[bwp.DatapackageBase]] = None) -> None
```

Load weighting data.

<a id="bw2calc.multi_lca.MultiLCA.decompose_technosphere"></a>

#### decompose\_technosphere

```python
def decompose_technosphere() -> None
```

<a id="bw2calc.multi_lca.MultiLCA.lci_calculation"></a>

#### lci\_calculation

```python
def lci_calculation() -> None
```

The actual LCI calculation.

Separated from ``lci`` to be reusable in cases where the matrices are already built, e.g.
``redo_lci`` and Monte Carlo classes.

<a id="bw2calc.multi_lca.MultiLCA.lcia_calculation"></a>

#### lcia\_calculation

```python
def lcia_calculation() -> None
```

The actual LCIA calculation.

Separated from ``lcia`` to be reusable in cases where the matrices are already built, e.g.
``redo_lcia`` and Monte Carlo classes.

<a id="bw2calc.multi_lca.MultiLCA.normalization_calculation"></a>

#### normalization\_calculation

```python
def normalization_calculation() -> None
```

The actual normalization calculation.

Creates ``self.normalized_inventories``.

<a id="bw2calc.multi_lca.MultiLCA.weighting_calculation"></a>

#### weighting\_calculation

```python
def weighting_calculation() -> None
```

The actual weighting calculation.

  Multiplies weighting value by normalized inventories, if available, otherwise by
characterized inventories.

  Creates ``self.weighted_inventories``.

<a id="bw2calc.multi_lca.MultiLCA.scores"></a>

#### scores

```python
@property
def scores() -> dict
```

The LCIA score as a ``float``.

Note that this is a `property <http://docs.python.org/2/library/functions.html#property>`_,
so it is ``foo.lca``, not ``foo.score()``
