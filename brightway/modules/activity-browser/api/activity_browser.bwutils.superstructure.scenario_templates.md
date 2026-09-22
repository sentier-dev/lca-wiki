**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.scenario_templates` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.scenario_templates cfg.yml > activity_browser.bwutils.superstructure.scenario_templates.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.scenario_templates"></a>

# activity\_browser.bwutils.superstructure.scenario\_templates

Resolve and write calculation-setup scenario starter templates.

<a id="activity_browser.bwutils.superstructure.scenario_templates.TEMPLATES_DIR"></a>

#### TEMPLATES\_DIR

<a id="activity_browser.bwutils.superstructure.scenario_templates.EXAMPLE_SCENARIO_COLS"></a>

#### EXAMPLE\_SCENARIO\_COLS

<a id="activity_browser.bwutils.superstructure.scenario_templates.scenario_template_path"></a>

#### scenario\_template\_path

```python
def scenario_template_path(kind: str, fmt: str) -> Path
```

Return packaged starter path for ``kind`` in ``{'parameter','flow'}`` and ``fmt`` in ``{'xlsx','csv'}``.

<a id="activity_browser.bwutils.superstructure.scenario_templates.project_has_parameters"></a>

#### project\_has\_parameters

```python
def project_has_parameters() -> bool
```

<a id="activity_browser.bwutils.superstructure.scenario_templates.parameter_template_dataframe"></a>

#### parameter\_template\_dataframe

```python
def parameter_template_dataframe() -> pd.DataFrame
```

Project parameters as a parameter-scenario table with empty example scenario columns.

<a id="activity_browser.bwutils.superstructure.scenario_templates.write_parameter_template"></a>

#### write\_parameter\_template

```python
def write_parameter_template(path: Path,
                             df: pd.DataFrame | None = None) -> None
```

Write a parameter-scenario template to ``path`` (.xlsx or .csv).

<a id="activity_browser.bwutils.superstructure.scenario_templates.copy_scenario_template"></a>

#### copy\_scenario\_template

```python
def copy_scenario_template(kind: str, fmt: str, destination: Path) -> Path
```

Copy a packaged empty starter to ``destination`` (suffix forced to match ``fmt``).
