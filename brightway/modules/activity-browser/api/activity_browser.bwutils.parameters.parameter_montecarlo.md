**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.parameters.parameter_montecarlo` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.parameters.parameter_montecarlo cfg.yml > activity_browser.bwutils.parameters.parameter_montecarlo.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.parameters.parameter_montecarlo"></a>

# activity\_browser.bwutils.parameters.parameter\_montecarlo

Parameter Monte Carlo overlay for ``bw2calc.MultiLCA``.

Each iteration, after technosphere / biosphere / CF resampling, ``bind_parameter_hook``
samples uncertain Brightway parameters, recalculates formula exchanges, and writes amounts
into the LCA matrices.

For ``functional_sqlite``, exchange keys often use **process** codes while matrix columns
use **reference product** activity ids — resolved via ``bw_functional`` (AB loads it at
startup in ``__main__.py``).

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.BIOSPHERE_EXCHANGE_TYPE"></a>

#### BIOSPHERE\_EXCHANGE\_TYPE

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.activity_key_parts"></a>

#### activity\_key\_parts

```python
def activity_key_parts(key: Any) -> Tuple[str, str]
```

Return ``(database, code)`` from a Brightway activity key or datapackage key.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.activity_id_from_database_code"></a>

#### activity\_id\_from\_database\_code

```python
def activity_id_from_database_code(database: str, code: str) -> int
```

``ActivityDataset.id`` for a technosphere or biosphere activity.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.activity_id_from_key"></a>

#### activity\_id\_from\_key

```python
def activity_id_from_key(key: Any) -> int
```

``ActivityDataset.id`` for a functional-unit or exchange activity key.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.activity_col_in_lca"></a>

#### activity\_col\_in\_lca

```python
def activity_col_in_lca(lca: bc.MultiLCA,
                        database: str,
                        code: str,
                        activity_id: Optional[int] = None) -> Optional[int]
```

Technosphere / biosphere column index in ``lca.dicts.activity``.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.product_row_in_lca"></a>

#### product\_row\_in\_lca

```python
def product_row_in_lca(lca: bc.MultiLCA,
                       database: str,
                       code: str,
                       activity_id: Optional[int] = None) -> Optional[int]
```

Product row index in ``lca.dicts.product``.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.matrix_coords_for_exchange"></a>

#### matrix\_coords\_for\_exchange

```python
def matrix_coords_for_exchange(
        lca: bc.MultiLCA,
        *,
        flow_type: str,
        input_database: str,
        input_code: str,
        output_database: str,
        output_code: str,
        input_id: Optional[int] = None,
        output_id: Optional[int] = None) -> Optional[Tuple[str, int, int]]
```

Return ``(matrix_name, row, col)`` for a technosphere or biosphere exchange.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.write_matrix_amount"></a>

#### write\_matrix\_amount

```python
def write_matrix_amount(lca: bc.MultiLCA, matrix_name: str, row: int, col: int,
                        amount: float) -> None
```

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.exchange_from_param_row"></a>

#### exchange\_from\_param\_row

```python
def exchange_from_param_row(row: np.void) -> ExchangeDataset
```

Load the ``ExchangeDataset`` row described by a parameter MC numpy row.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.matrix_coords_for_param_row"></a>

#### matrix\_coords\_for\_param\_row

```python
def matrix_coords_for_param_row(
        lca: bc.MultiLCA, row: np.void) -> Optional[Tuple[str, int, int]]
```

Return ``(matrix_name, row_index, col_index)`` or ``None`` if not in this LCA.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.signed_exchange_amount"></a>

#### signed\_exchange\_amount

```python
def signed_exchange_amount(row: np.void) -> float
```

Amount with technosphere sign convention (negative edge types).

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.apply_parameter_exchanges"></a>

#### apply\_parameter\_exchanges

```python
def apply_parameter_exchanges(lca: bc.MultiLCA, param_rows: np.ndarray) -> int
```

Write recalculated parameter amounts into ``MultiLCA`` matrices. Returns cells updated.

<a id="activity_browser.bwutils.parameters.parameter_montecarlo.bind_parameter_hook"></a>

#### bind\_parameter\_hook

```python
def bind_parameter_hook(
        lca: bc.MultiLCA,
        monte_carlo_lca: Any,
        *,
        before_parameters: Optional[Callable[[bc.MultiLCA],
                                             None]] = None) -> None
```

Attach ``after_matrix_iteration`` for optional pre-step and parameter draws.
