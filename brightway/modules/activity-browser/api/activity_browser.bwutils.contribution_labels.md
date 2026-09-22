**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.contribution_labels` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.contribution_labels cfg.yml > activity_browser.bwutils.contribution_labels.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.contribution_labels"></a>

# activity\_browser.bwutils.contribution\_labels

Axis, legend, and table labels for LCA contributions.

<a id="activity_browser.bwutils.contribution_labels.REST_ROWS"></a>

#### REST\_ROWS

<a id="activity_browser.bwutils.contribution_labels.SPECIAL_ROWS"></a>

#### SPECIAL\_ROWS

<a id="activity_browser.bwutils.contribution_labels.contribution_axis_unit"></a>

#### contribution\_axis\_unit

```python
def contribution_axis_unit(method: tuple | None,
                           *,
                           relative: bool = False,
                           total_range: bool = True) -> str
```

<a id="activity_browser.bwutils.contribution_labels.is_rest_row"></a>

#### is\_rest\_row

```python
def is_rest_row(label: str) -> bool
```

<a id="activity_browser.bwutils.contribution_labels.contribution_row_labels"></a>

#### contribution\_row\_labels

```python
def contribution_row_labels(df: pd.DataFrame) -> list[str]
```

Contributor labels for process or elementary-flow rows.

<a id="activity_browser.bwutils.contribution_labels.contribution_column_labels"></a>

#### contribution\_column\_labels

```python
def contribution_column_labels(tab, column_keys: list) -> list[str]
```

Map setup indices (0, 1, …) to MLCA display labels.

<a id="activity_browser.bwutils.contribution_labels.apply_contribution_column_labels"></a>

#### apply\_contribution\_column\_labels

```python
def apply_contribution_column_labels(df: pd.DataFrame, tab) -> pd.DataFrame
```

Replace setup-index comparison columns (0, 1, …) with MLCA display labels.
