**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.mlca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.mlca cfg.yml > activity_browser.bwutils.superstructure.mlca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.mlca"></a>

# activity\_browser.bwutils.superstructure.mlca

<a id="activity_browser.bwutils.superstructure.mlca.metadata"></a>

#### metadata

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA"></a>

## SuperstructureMLCA Objects

```python
class SuperstructureMLCA(MLCA)
```

Subclass of the `MLCA` class which adds another dimension in the form
of scenarios.

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.matrices"></a>

#### matrices

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name: str, df: pd.DataFrame, cs: dict | None = None)
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.scenario_overlay"></a>

#### scenario\_overlay

```python
def scenario_overlay(scenario: str | int) -> ScenarioOverlay
```

Precomputed matrix overlay for one scenario (reused by Monte Carlo).

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.current"></a>

#### current

```python
@property
def current() -> int
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.current"></a>

#### current

```python
@current.setter
def current(current: int) -> None
```

Ensure current index is looped to 0 if end of array is reached.

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.next_scenario"></a>

#### next\_scenario

```python
def next_scenario()
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.set_scenario"></a>

#### set\_scenario

```python
def set_scenario(index: int) -> None
```

Set the current scenario index given a new index to go to

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.indices_to_matrix"></a>

#### indices\_to\_matrix

```python
def indices_to_matrix() -> None
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.update_matrices"></a>

#### update\_matrices

```python
def update_matrices() -> None
```

A Simplified version of the `PackagesDataLoader.update_matrices` method.
In this case, we expect to only replace technosphere and biosphere
values, leaving out characterization factor values.

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.update_lca_calculation_for_sankey"></a>

#### update\_lca\_calculation\_for\_sankey

```python
def update_lca_calculation_for_sankey(scenario_index: int, func_unit: str,
                                      method_index: int)
```

Reuses the LCA object to prepare the LCA object for necessary calculations to be made before performing the
Graph Traversal calculations

@param scenario_index: Index of the Scenario for which the calculation must be performed
@param func_unit: The functional unit for which the calculation must be performed
@param method_index: Index of the method for which the calculation must be performed

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.get_results_for_method"></a>

#### get\_results\_for\_method

```python
def get_results_for_method(index: int = 0) -> pd.DataFrame
```

Overrides the parent and returns a dataframe with the scenarios
as columns

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureMLCA.lca_scores_to_dataframe"></a>

#### lca\_scores\_to\_dataframe

```python
def lca_scores_to_dataframe() -> pd.DataFrame
```

Returns a dataframe of LCA scores using FU labels as index and
the product of methods and scenarios as columns.

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureContributions"></a>

## SuperstructureContributions Objects

```python
class SuperstructureContributions(Contributions)
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureContributions.mlca"></a>

#### mlca

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureContributions.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mlca)
```

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureContributions.lca_scores_df"></a>

#### lca\_scores\_df

```python
def lca_scores_df(normalized: bool = False) -> pd.DataFrame
```

Returns a metadata-annotated DataFrame of the LCA scores.

<a id="activity_browser.bwutils.superstructure.mlca.SuperstructureContributions.get_contributions"></a>

#### get\_contributions

```python
def get_contributions(contribution,
                      functional_unit=None,
                      method=None,
                      scenario=0,
                      **kwargs) -> np.ndarray
```

Return a contribution matrix given the type and fu / method

Allow for both fu and method to exist.
