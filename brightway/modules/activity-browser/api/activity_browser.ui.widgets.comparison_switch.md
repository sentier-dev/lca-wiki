**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.comparison_switch` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.comparison_switch cfg.yml > activity_browser.ui.widgets.comparison_switch.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.comparison_switch"></a>

# activity\_browser.ui.widgets.comparison\_switch

<a id="activity_browser.ui.widgets.comparison_switch.Switches"></a>

#### Switches

<a id="activity_browser.ui.widgets.comparison_switch.LCIASwitches"></a>

#### LCIASwitches

<a id="activity_browser.ui.widgets.comparison_switch.LCAscoresSwitchComboBox"></a>

## LCAscoresSwitchComboBox Objects

```python
class LCAscoresSwitchComboBox(QtWidgets.QComboBox)
```

Compare modes for the LCIA results landing tab.

<a id="activity_browser.ui.widgets.comparison_switch.LCAscoresSwitchComboBox.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget = None)
```

<a id="activity_browser.ui.widgets.comparison_switch.LCAscoresSwitchComboBox.configure"></a>

#### configure

```python
def configure(modes: list[str]) -> None
```

<a id="activity_browser.ui.widgets.comparison_switch.ContributionsSwitchComboBox"></a>

## ContributionsSwitchComboBox Objects

```python
class ContributionsSwitchComboBox(QtWidgets.QComboBox)
```

For keeping track of contribution tab comparisons.

<a id="activity_browser.ui.widgets.comparison_switch.ContributionsSwitchComboBox.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget = None)
```

<a id="activity_browser.ui.widgets.comparison_switch.ContributionsSwitchComboBox.configure"></a>

#### configure

```python
def configure(has_func: bool = True, has_method: bool = True)
```
