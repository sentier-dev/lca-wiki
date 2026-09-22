**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.combobox_utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.combobox_utils cfg.yml > activity_browser.app.pages.lca_results.combobox_utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.combobox_utils"></a>

# activity\_browser.app.pages.lca\_results.combobox\_utils

Shared QComboBox helpers for LCA Results tabs and graph navigators.

<a id="activity_browser.app.pages.lca_results.combobox_utils.SmallComboBox"></a>

## SmallComboBox Objects

```python
class SmallComboBox(QtWidgets.QComboBox)
```

Compact combo box for LCA Results control rows.

<a id="activity_browser.app.pages.lca_results.combobox_utils.SmallComboBox.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.combobox_utils.set_combobox_index"></a>

#### set\_combobox\_index

```python
def set_combobox_index(box: QtWidgets.QComboBox, index: int) -> None
```

Set the current index without emitting signals.

<a id="activity_browser.app.pages.lca_results.combobox_utils.update_combobox"></a>

#### update\_combobox

```python
def update_combobox(box: QtWidgets.QComboBox,
                    labels: Sequence[str],
                    *,
                    preserve_selection: bool = True) -> None
```

Replace combo items, optionally keeping the current label when still valid.

<a id="activity_browser.app.pages.lca_results.combobox_utils.scenario_labels"></a>

#### scenario\_labels

```python
def scenario_labels(parent) -> list[str]
```

Scenario names from the parent LCA results page, if any.

<a id="activity_browser.app.pages.lca_results.combobox_utils.configure_selection_comboboxes"></a>

#### configure\_selection\_comboboxes

```python
def configure_selection_comboboxes(*, parent, fu_box: QtWidgets.QComboBox,
                                   method_box: QtWidgets.QComboBox,
                                   scenario_box: QtWidgets.QComboBox,
                                   scenario_label: QtWidgets.QLabel,
                                   has_scenarios: bool) -> None
```

Populate RF / IC / scenario combos from the calculated MLCA (active CS rows).
