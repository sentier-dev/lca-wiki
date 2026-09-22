**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.wizard` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.wizard cfg.yml > activity_browser.ui.widgets.wizard.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.wizard"></a>

# activity\_browser.ui.widgets.wizard

<a id="activity_browser.ui.widgets.wizard.ABWizardButtons"></a>

#### ABWizardButtons

<a id="activity_browser.ui.widgets.wizard.ABWizardButtonLayout"></a>

#### ABWizardButtonLayout

<a id="activity_browser.ui.widgets.wizard.ABWizard"></a>

## ABWizard Objects

```python
class ABWizard(QtWidgets.QWizard)
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.pages"></a>

#### pages

<a id="activity_browser.ui.widgets.wizard.ABWizard.context"></a>

#### context

<a id="activity_browser.ui.widgets.wizard.ABWizard.defaultButtonLayout"></a>

#### defaultButtonLayout

<a id="activity_browser.ui.widgets.wizard.ABWizard.finalButtonLayout"></a>

#### finalButtonLayout

<a id="activity_browser.ui.widgets.wizard.ABWizard.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, title: str = None, context: dict = None, **kwargs)
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.page"></a>

#### page

```python
def page(page_id: int) -> "ABWizardPage"
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.initializePage"></a>

#### initializePage

```python
def initializePage(page_id)
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.setButtonLayout"></a>

#### setButtonLayout

```python
def setButtonLayout(layout: ABWizardButtonLayout)
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.customButtonOne"></a>

#### customButtonOne

```python
def customButtonOne()
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.customButtonTwo"></a>

#### customButtonTwo

```python
def customButtonTwo()
```

<a id="activity_browser.ui.widgets.wizard.ABWizard.customButtonThree"></a>

#### customButtonThree

```python
def customButtonThree()
```
