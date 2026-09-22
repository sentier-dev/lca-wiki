**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.montecarlo.engine` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.montecarlo.engine cfg.yml > activity_browser.bwutils.montecarlo.engine.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.montecarlo.engine"></a>

# activity\_browser.bwutils.montecarlo.engine

Monte Carlo LCA via Brightway ``MultiLCA``.

When uncertainty layers are enabled, each iteration stores matrix snapshots for
global sensitivity analysis (GSA):

- ``A_matrices`` / ``B_matrices`` — technosphere and biosphere draws
- ``CF_dict[method]`` — characterization factor vectors per iteration
- ``parameter_data`` — sampled parameter amounts (when Parameters is checked)

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA"></a>

## MonteCarloLCA Objects

```python
class MonteCarloLCA(object)
```

Monte Carlo LCA for multiple reference flows and methods from a calculation setup.

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name, cs: dict | None = None)
```

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.construct_lca"></a>

#### construct\_lca

```python
def construct_lca(demands: dict,
                  method_config: dict,
                  technosphere: bool = True,
                  biosphere: bool = True,
                  characterization: bool = True,
                  seed_override: Optional[int] = None) -> bc.MultiLCA
```

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.calculate"></a>

#### calculate

```python
def calculate(iterations: int = 10,
              seed: Optional[int] = None,
              scenario_overlay: Optional[ScenarioOverlay] = None,
              scenario_df: Optional[pd.DataFrame] = None,
              scenario: Optional[str | int] = None,
              **kwargs)
```

Run Monte Carlo LCA with optional technosphere, biosphere, CF, parameter, and scenario amounts.

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.last_run_summary"></a>

#### last\_run\_summary

```python
@property
def last_run_summary() -> Optional[dict]
```

Metadata from the last successful ``calculate`` call, or ``None``.

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.func_units_dict"></a>

#### func\_units\_dict

```python
@property
def func_units_dict() -> dict
```

Return a dictionary of reference flows (key, demand).

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.get_results_by"></a>

#### get\_results\_by

```python
def get_results_by(fu_row=None, method=None)
```

Slice Monte Carlo results by ``inv`` row index and/or impact method.

<a id="activity_browser.bwutils.montecarlo.engine.MonteCarloLCA.get_results_dataframe"></a>

#### get\_results\_dataframe

```python
def get_results_dataframe(fu_row=None, method=None, labelled=True)
```

DataFrame of MC runs for all reference flows (one method) or all methods (one row).

<a id="activity_browser.bwutils.montecarlo.engine.perform_MonteCarlo_LCA"></a>

#### perform\_MonteCarlo\_LCA

```python
def perform_MonteCarlo_LCA(project="default",
                           cs_name=None,
                           iterations=10,
                           **calculate_kwargs)
```

Perform Monte Carlo LCA for a calculation setup and return the ``MonteCarloLCA`` instance.
