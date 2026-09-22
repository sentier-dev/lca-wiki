**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios cfg.yml > activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios"></a>

# activity\_browser.bwutils.superstructure.convert\_parameter\_to\_flow\_scenarios

Convert parameter scenario files into flow scenario files.

Purpose
-------
This module contains the complete, standalone conversion pipeline used by the
Activity Browser to transform a parameter scenario table (Name/Group/default +
scenario columns) into a flow scenario table (SUPERSTRUCTURE columns + scenario
columns).

What it does
------------
- Reads scenario columns from the uploaded parameter scenario data.
- Rebuilds parameter values per scenario (project, database, and activity scopes).
- Evaluates formula-bearing exchanges for the selected output database groups.
- Builds and returns a flow scenario DataFrame with preserved scenario order.

Main entry points
-----------------
- ``convert_parameter_to_flow_scenarios(parameter_scenarios)``
  Convert an in-memory parameter scenario DataFrame.
- ``if __name__ == "__main__":``
  Run a local file-to-file conversion script for manual testing/debugging.

Legacy remark
-------------
The conversion logic is intentionally separated from ``ParameterManager`` so
that:
- conversion behavior is easy to run and test independently;
- MonteCarlo-related logic can remain in ``ParameterManager`` without being
  coupled to file conversion workflows.
- However, ParameterManager and MonteCarloParameterManager should be reworked in the future

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.activity_group_by_output_key"></a>

#### activity\_group\_by\_output\_key

```python
def activity_group_by_output_key() -> dict[tuple[str, str], str]
```

Map ``(database, activity code)`` to parameter group for exchange output activities.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.scenario_columns"></a>

#### scenario\_columns

```python
def scenario_columns(parameter_scenarios: pd.DataFrame) -> list[str]
```

Return scenario columns in file order, excluding Name/Group/default.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.prepare_parameter_matrix"></a>

#### prepare\_parameter\_matrix

```python
def prepare_parameter_matrix(
    parameter_scenarios: pd.DataFrame
) -> tuple[pd.DataFrame, pd.DataFrame, list[str], set[str]]
```

Build scenario matrix by overlaying uploaded values on BW parameter defaults.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.recalculate_project_parameters"></a>

#### recalculate\_project\_parameters

```python
def recalculate_project_parameters(
        initial: StaticParameters, parameters: Parameters,
        active_override_keys: set[tuple[str, str]]) -> dict
```

Recalculate project parameters, keeping explicit scenario overrides fixed.

Why ``active_override_keys``:
    When a parameter is explicitly provided in the scenario file, we want that
    numeric override to win. We therefore blank out its formula for this
    recalculation pass so ``ParameterSet`` doesn't recompute and overwrite it.
    E.g.: if an exchange has a parameter CO2; if that parameter CO2 is calculated
    from other parameters, CO2 = A*B; then the user can specify either A and or B or directly CO2

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.recalculate_database_parameters"></a>

#### recalculate\_database\_parameters

```python
def recalculate_database_parameters(
        initial: StaticParameters, parameters: Parameters, database: str,
        global_params: dict, active_override_keys: set[tuple[str,
                                                             str]]) -> dict
```

Recalculate database parameters for one database with override protection.

``active_override_keys`` has the same role as in project recalculation: enforce
scenario-specified values over stored formulas for explicitly overridden params.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.recalculate_activity_parameters"></a>

#### recalculate\_activity\_parameters

```python
def recalculate_activity_parameters(
        initial: StaticParameters, parameters: Parameters, group: str,
        global_params: dict, active_override_keys: set[tuple[str,
                                                             str]]) -> dict
```

Recalculate one activity-parameter group against provided scope.

``active_override_keys`` ensures activity-level values supplied by the scenario
file are not re-derived from formulas in this pass.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.exchange_formula_rows_for_selected_groups"></a>

#### exchange\_formula\_rows\_for\_selected\_groups

```python
def exchange_formula_rows_for_selected_groups(
        selected_groups: set[str]) -> list[tuple[str, int, str, str | None]]
```

Collect formula-bearing exchanges for selected parameter groups.

``selected_groups`` comes from the parameter-scenario ``Group`` column and may
contain activity-parameter group ids, database names, and/or ``project``.

Activity groups are resolved via ``ParameterizedExchange`` (same source as
``ParameterManager``). Database-named groups still scan formula exchanges
whose ``output_database`` matches.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.process_selected_exchange_formulas"></a>

#### process\_selected\_exchange\_formulas

```python
def process_selected_exchange_formulas(
        initial: StaticParameters, parameters: Parameters,
        project_params: dict, database_params: dict, selected_groups: set[str],
        active_override_keys: set[tuple[str, str]]) -> dict[int, float]
```

Evaluate selected exchange formulas for one scenario scope.

<a id="activity_browser.bwutils.superstructure.convert_parameter_to_flow_scenarios.convert_parameter_to_flow_scenarios"></a>

#### convert\_parameter\_to\_flow\_scenarios

```python
def convert_parameter_to_flow_scenarios(
        parameter_scenarios: pd.DataFrame) -> pd.DataFrame
```

Convert parameter scenarios DataFrame into flow scenarios DataFrame.
