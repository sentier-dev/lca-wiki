**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.calculation_setup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.calculation_setup cfg.yml > activity_browser.bwutils.calculation_setup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.calculation_setup"></a>

# activity\_browser.bwutils.calculation\_setup

Calculation setup helpers (Brightway ``inv`` / ``ia`` lists + scenario inclusion).

<a id="activity_browser.bwutils.calculation_setup.INV_ACTIVE"></a>

#### INV\_ACTIVE

<a id="activity_browser.bwutils.calculation_setup.IA_ACTIVE"></a>

#### IA\_ACTIVE

<a id="activity_browser.bwutils.calculation_setup.SCENARIO_PATHS"></a>

#### SCENARIO\_PATHS

<a id="activity_browser.bwutils.calculation_setup.SCENARIO_SHEETS"></a>

#### SCENARIO\_SHEETS

<a id="activity_browser.bwutils.calculation_setup.SCENARIO_COMBINE"></a>

#### SCENARIO\_COMBINE

<a id="activity_browser.bwutils.calculation_setup.SCENARIO_INCLUDED"></a>

#### SCENARIO\_INCLUDED

<a id="activity_browser.bwutils.calculation_setup.SCENARIO_AXES"></a>

#### SCENARIO\_AXES

<a id="activity_browser.bwutils.calculation_setup.active_flags"></a>

#### active\_flags

```python
def active_flags(cs: dict, list_key: str) -> list[bool]
```

<a id="activity_browser.bwutils.calculation_setup.ensure_active_lists"></a>

#### ensure\_active\_lists

```python
def ensure_active_lists(cs: dict) -> None
```

<a id="activity_browser.bwutils.calculation_setup.move_rows"></a>

#### move\_rows

```python
def move_rows(items: list, flags: list[bool], rows: list[int],
              dest: int) -> None
```

<a id="activity_browser.bwutils.calculation_setup.set_active"></a>

#### set\_active

```python
def set_active(cs_name: str, list_key: str, row: int, active: bool) -> None
```

<a id="activity_browser.bwutils.calculation_setup.reorder"></a>

#### reorder

```python
def reorder(cs_name: str, list_key: str, rows: list[int], dest: int) -> None
```

<a id="activity_browser.bwutils.calculation_setup.active_calculation_setup"></a>

#### active\_calculation\_setup

```python
def active_calculation_setup(cs_name: str) -> dict
```

<a id="activity_browser.bwutils.calculation_setup.get_scenario_persistence"></a>

#### get\_scenario\_persistence

```python
def get_scenario_persistence(cs: dict) -> dict | None
```

Return scenario persistence fields, or None if the CS has none.

<a id="activity_browser.bwutils.calculation_setup.set_scenario_persistence"></a>

#### set\_scenario\_persistence

```python
def set_scenario_persistence(
        cs_name: str,
        *,
        paths: Sequence[str],
        combine: str,
        included: Sequence[str],
        axes: Sequence[Sequence[str]],
        sheets: Sequence[int | None] | None = None) -> None
```

Persist absolute scenario paths, combine mode, included set S, and axes.

<a id="activity_browser.bwutils.calculation_setup.clear_scenario_persistence"></a>

#### clear\_scenario\_persistence

```python
def clear_scenario_persistence(cs_name: str) -> None
```

<a id="activity_browser.bwutils.calculation_setup.filter_scenario_dataframe"></a>

#### filter\_scenario\_dataframe

```python
def filter_scenario_dataframe(df: pd.DataFrame,
                              included: Sequence[str]) -> pd.DataFrame
```

Restrict scenario columns to members of S (preserve dataframe column order).

<a id="activity_browser.bwutils.calculation_setup.reconcile_scenario_persistence"></a>

#### reconcile\_scenario\_persistence

```python
def reconcile_scenario_persistence(cs: dict,
                                   current_axes: Sequence[Sequence[str]],
                                   mode: str) -> ReconcileResult
```

Reconcile saved S with current axes; returns ReconcileResult.

<a id="activity_browser.bwutils.calculation_setup.functional_unit_key"></a>

#### functional\_unit\_key

```python
def functional_unit_key(functional_unit: dict) -> tuple | int
```

Reference-flow key from a Brightway calculation-setup ``inv`` entry.

<a id="activity_browser.bwutils.calculation_setup.remove_functional_units_from_calculation_setup"></a>

#### remove\_functional\_units\_from\_calculation\_setup

```python
def remove_functional_units_from_calculation_setup(database_name: str) -> bool
```

Remove ``inv`` entries whose reference flow belongs to *database_name*.

Brightway does not update ``bd.calculation_setups`` when a database is
deleted. Call this before ``del bd.databases[...]`` so reference-flow keys
are still resolvable.

Returns ``True`` if any calculation setup was modified.
