**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.parameters.manager` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.parameters.manager cfg.yml > activity_browser.bwutils.parameters.manager.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.parameters.manager"></a>

# activity\_browser.bwutils.parameters.manager

In-memory parameter recalculation (project → database → activity → exchanges).

<a id="activity_browser.bwutils.parameters.manager.ParameterManager"></a>

## ParameterManager Objects

```python
class ParameterManager()
```

Evaluate Brightway parameter formulas without writing to the database.

Recalculation order: project → database → activity parameters, then
parameterized exchange formulas (per activity group).

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.construct_indices"></a>

#### construct\_indices

```python
def construct_indices() -> Indices
```

Build stable exchange indices for all parameterized exchanges in the project.

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.recalculate_project_parameters"></a>

#### recalculate\_project\_parameters

```python
def recalculate_project_parameters() -> dict
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.recalculate_database_parameters"></a>

#### recalculate\_database\_parameters

```python
def recalculate_database_parameters(database: str,
                                    global_params: dict = None) -> dict
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.process_database_parameters"></a>

#### process\_database\_parameters

```python
def process_database_parameters(global_params: dict = None) -> dict
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.recalculate_activity_parameters"></a>

#### recalculate\_activity\_parameters

```python
def recalculate_activity_parameters(group: str,
                                    global_params: dict = None) -> dict
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.recalculate_exchanges"></a>

#### recalculate\_exchanges

```python
def recalculate_exchanges(group: str,
                          global_params: dict = None
                          ) -> Iterable[Tuple[int, float]]
```

Return ``(exchange_id, amount)`` for parameterized exchanges in a group.

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.process_exchanges"></a>

#### process\_exchanges

```python
def process_exchanges(global_params: dict = None,
                      db_params: dict = None) -> np.ndarray
```

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.calculate"></a>

#### calculate

```python
def calculate() -> np.ndarray
```

Recalculate all parameters and return exchange amounts (index order).

<a id="activity_browser.bwutils.parameters.manager.ParameterManager.recalculate"></a>

#### recalculate

```python
@abstractmethod
def recalculate(values: dict[str, float]) -> np.ndarray
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager"></a>

## MonteCarloParameterManager Objects

```python
class MonteCarloParameterManager(ParameterManager, Iterator)
```

Sample uncertain parameters and recalculate exchange amounts each draw.

Output rows match ``Indices.mock_params`` for
:func:`~activity_browser.bwutils.parameters.parameter_montecarlo.apply_parameter_exchanges`.

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__(seed: Optional[int] = None)
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.__next__"></a>

#### \_\_next\_\_

```python
def __next__()
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.recalculate"></a>

#### recalculate

```python
def recalculate(iterations: int = 10) -> np.ndarray
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.next"></a>

#### next

```python
def next() -> np.ndarray
```

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.init_gsa_parameter_data"></a>

#### init\_gsa\_parameter\_data

```python
def init_gsa_parameter_data() -> dict
```

Build GSA metadata for uncertain parameters (``uncertainty type`` > 1).

<a id="activity_browser.bwutils.parameters.manager.MonteCarloParameterManager.populate_gsa_parameter_data"></a>

#### populate\_gsa\_parameter\_data

```python
def populate_gsa_parameter_data(parameter_data: dict) -> None
```

Append current parameter amounts to the GSA ``parameter_data`` schema.
