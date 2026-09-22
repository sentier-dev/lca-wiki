**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.sensitivity_analysis` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.sensitivity_analysis cfg.yml > activity_browser.bwutils.sensitivity_analysis.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.sensitivity_analysis"></a>

# activity\_browser.bwutils.sensitivity\_analysis

Global sensitivity analysis (GSA) for Monte Carlo LCA results.

Uses SALib's delta moment-independent measure on inputs sampled during
:class:`~activity_browser.bwutils.montecarlo.MonteCarloLCA`. Enable the
uncertainty layers you want analysed (technosphere, biosphere, CFs, parameters)
before running MC.

Results
-------

``GlobalSensitivityAnalysis.df_final`` is sorted by ``delta`` (descending) and
shown in the LCA results GSA tab. Column names are defined in ``GSA_COLUMNS``:

| Column | Role |
|--------|------|
| ``index`` | Unique SALib variable id (full exchange path, including ``(database)``) |
| ``Type`` | ``technosphere``, ``biosphere``, ``characterization factor``, ``parameter`` |
| ``Shortname (without databases)`` | Same path without database suffixes (compact display) |
| ``delta``, ``delta_conf`` | SALib sensitivity indices |
| ``uncertainty`` | Distribution type and parameters (``Uniform; Minimum: 0; Maximum: 1``) |

For technosphere exchanges, ``index`` and the shortname differ; for parameters and
most CFs they are usually identical.

Standalone script
-----------------

Edit the constants under ``if __name__ == "__main__"`` and run this file
(``functional_sqlite`` projects need ``bw_functional`` imported, which the block does).

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_INDEX_COLUMN"></a>

#### GSA\_INDEX\_COLUMN

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_TYPE_COLUMN"></a>

#### GSA\_TYPE\_COLUMN

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_NAME_COLUMN"></a>

#### GSA\_NAME\_COLUMN

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_RESULT_COLUMNS"></a>

#### GSA\_RESULT\_COLUMNS

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_COLUMNS"></a>

#### GSA\_COLUMNS

<a id="activity_browser.bwutils.sensitivity_analysis.GSA_METADATA_COLUMNS"></a>

#### GSA\_METADATA\_COLUMNS

<a id="activity_browser.bwutils.sensitivity_analysis.get_lca"></a>

#### get\_lca

```python
def get_lca(fu, method)
```

Run deterministic LCA and attach reverse dicts for exchange resolution.

<a id="activity_browser.bwutils.sensitivity_analysis.filter_technosphere_exchanges"></a>

#### filter\_technosphere\_exchanges

```python
def filter_technosphere_exchanges(lca, cutoff=0.05, max_calc=1000)
```

Return ``(producer, consumer)`` matrix index pairs above the traversal cutoff.

<a id="activity_browser.bwutils.sensitivity_analysis.filter_biosphere_exchanges"></a>

#### filter\_biosphere\_exchanges

```python
def filter_biosphere_exchanges(lca, cutoff=0.005)
```

Return biosphere matrix indices contributing above ``cutoff`` × |LCA score|.

<a id="activity_browser.bwutils.sensitivity_analysis.get_exchanges"></a>

#### get\_exchanges

```python
def get_exchanges(lca, indices, biosphere=False, only_uncertain=True)
```

Map matrix indices to uncertain exchange objects.

<a id="activity_browser.bwutils.sensitivity_analysis.get_exchanges_dataframe"></a>

#### get\_exchanges\_dataframe

```python
def get_exchanges_dataframe(exchanges, indices, biosphere=False)
```

<a id="activity_browser.bwutils.sensitivity_analysis.get_CF_dataframe"></a>

#### get\_CF\_dataframe

```python
def get_CF_dataframe(lca, method, only_uncertain_CFs=True)
```

Uncertain CF metadata. Returns ``(dataframe, mm_param_indices)``.

<a id="activity_browser.bwutils.sensitivity_analysis.get_parameters_dataframe"></a>

#### get\_parameters\_dataframe

```python
def get_parameters_dataframe(mc)
```

Parameter metadata for GSA (requires ``mc.parameter_data`` from MC).

<a id="activity_browser.bwutils.sensitivity_analysis.get_X"></a>

#### get\_X

```python
def get_X(matrix_list, indices)
```

<a id="activity_browser.bwutils.sensitivity_analysis.get_X_CF"></a>

#### get\_X\_CF

```python
def get_X_CF(mc, cf_param_indices, method)
```

<a id="activity_browser.bwutils.sensitivity_analysis.get_X_P"></a>

#### get\_X\_P

```python
def get_X_P(parameter_data: dict, keys: list) -> np.ndarray
```

<a id="activity_browser.bwutils.sensitivity_analysis.get_problem"></a>

#### get\_problem

```python
def get_problem(X, names)
```

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis"></a>

## GlobalSensitivityAnalysis Objects

```python
class GlobalSensitivityAnalysis()
```

SALib delta GSA on a completed :class:`MonteCarloLCA` run.

Call :meth:`perform_GSA` for one reference flow and impact method. Results
are in :attr:`df_final`; :attr:`metadata` holds pre-SALib rows indexed by
``GSA_INDEX_COLUMN``.

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.__init__"></a>

#### \_\_init\_\_

```python
def __init__(mc)
```

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.update_mc"></a>

#### update\_mc

```python
def update_mc(mc)
```

Attach a completed Monte Carlo run (e.g. after a new MC calculation).

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.perform_GSA"></a>

#### perform\_GSA

```python
def perform_GSA(act_number=0,
                method_number=0,
                cutoff_technosphere=0.01,
                cutoff_biosphere=0.01)
```

Run delta GSA; sets :attr:`df_final` or returns ``None`` on failure.

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.get_save_name"></a>

#### get\_save\_name

```python
def get_save_name() -> str
```

Default export basename: ``{cs}_GSA_{product}_{process}_{location}_{db}_{method}``.

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.export_GSA_all"></a>

#### export\_GSA\_all

```python
def export_GSA_all(filepath: str | Path) -> Path
```

Write GSA results and MC input matrix to one Excel workbook (two sheets).

<a id="activity_browser.bwutils.sensitivity_analysis.GlobalSensitivityAnalysis.export_GSA_all_csv"></a>

#### export\_GSA\_all\_csv

```python
def export_GSA_all_csv(filepath: str | Path) -> tuple[Path, Path]
```

Write GSA results and MC input matrix to two CSV files (*_output.csv, *_input.csv).
