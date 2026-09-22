**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.calculation_setup.calculation_setup` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.calculation_setup.calculation_setup cfg.yml > activity_browser.app.pages.calculation_setup.calculation_setup.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.calculation_setup.calculation_setup"></a>

# activity\_browser.app.pages.calculation\_setup.calculation\_setup

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage"></a>

## CalculationSetupPage Objects

```python
class CalculationSetupPage(widgets.ABAbstractPage)
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(cs_name: str, parent=None)
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.syncLater"></a>

#### syncLater

```python
def syncLater()
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.sync"></a>

#### sync

```python
def sync() -> None
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.type_switch"></a>

#### type\_switch

```python
def type_switch(calculation_type: str)
```

<a id="activity_browser.app.pages.calculation_setup.calculation_setup.CalculationSetupPage.run_calculation"></a>

#### run\_calculation

```python
def run_calculation()
```
