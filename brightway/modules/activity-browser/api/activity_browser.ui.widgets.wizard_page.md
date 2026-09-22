**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.wizard_page` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.wizard_page cfg.yml > activity_browser.ui.widgets.wizard_page.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.wizard_page"></a>

# activity\_browser.ui.widgets.wizard\_page

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage"></a>

## ABWizardPage Objects

```python
class ABWizardPage(QtWidgets.QWizardPage)
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.title"></a>

#### title

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.subtitle"></a>

#### subtitle

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.buttonLayout"></a>

#### buttonLayout

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.wizard"></a>

#### wizard

```python
def wizard() -> "ABWizard"
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.nextPage"></a>

#### nextPage

```python
def nextPage() -> type[QtWidgets.QWizardPage] | None
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.nextId"></a>

#### nextId

```python
def nextId()
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.initializePage"></a>

#### initializePage

```python
def initializePage(context: dict)
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.finalize"></a>

#### finalize

```python
def finalize(context: dict)
```

<a id="activity_browser.ui.widgets.wizard_page.ABWizardPage.context"></a>

#### context

```python
def context() -> dict
```

<a id="activity_browser.ui.widgets.wizard_page.ABThreadedWizardPage"></a>

## ABThreadedWizardPage Objects

```python
class ABThreadedWizardPage(ABWizardPage)
```

<a id="activity_browser.ui.widgets.wizard_page.ABThreadedWizardPage.Thread"></a>

#### Thread

<a id="activity_browser.ui.widgets.wizard_page.ABThreadedWizardPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.wizard_page.ABThreadedWizardPage.statusUpdate"></a>

#### statusUpdate

```python
def statusUpdate(progress: int, message: str)
```

<a id="activity_browser.ui.widgets.wizard_page.ABThreadedWizardPage.isComplete"></a>

#### isComplete

```python
def isComplete()
```

Check if the download thread has finished
