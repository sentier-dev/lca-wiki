**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.parameters.parameters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.parameters.parameters cfg.yml > activity_browser.app.pages.parameters.parameters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.parameters.parameters"></a>

# activity\_browser.app.pages.parameters.parameters

<a id="activity_browser.app.pages.parameters.parameters.ParametersPage"></a>

## ParametersPage Objects

```python
class ParametersPage(widgets.ABAbstractPage)
```

A widget that displays all parameters and parameterized flows in the current project.

This page shows:
- Parameters section: A tree view of parameters organized by scope
- Parameterized Flows section: A table of flows with formulas in the Brightway index

<a id="activity_browser.app.pages.parameters.parameters.ParametersPage.basePage"></a>

#### basePage

<a id="activity_browser.app.pages.parameters.parameters.ParametersPage.title"></a>

#### title

<a id="activity_browser.app.pages.parameters.parameters.ParametersPage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

Initializes the ParametersPage widget.

**Arguments**:

- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.parameters.parameters.ParametersPage.build_layout"></a>

#### build\_layout

```python
def build_layout()
```

Builds the layout of the widget.
