**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.welcome` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.welcome cfg.yml > activity_browser.app.pages.welcome.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.welcome"></a>

# activity\_browser.app.pages.welcome

<a id="activity_browser.app.pages.welcome.WelcomePage"></a>

## WelcomePage Objects

```python
class WelcomePage(widgets.ABAbstractPage)
```

<a id="activity_browser.app.pages.welcome.WelcomePage.basePage"></a>

#### basePage

<a id="activity_browser.app.pages.welcome.WelcomePage.title"></a>

#### title

<a id="activity_browser.app.pages.welcome.WelcomePage.html_file"></a>

#### html\_file

<a id="activity_browser.app.pages.welcome.WelcomePage.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.welcome.WelcomePage.update_welcome"></a>

#### update\_welcome

```python
def update_welcome()
```

<a id="activity_browser.app.pages.welcome.Bridge"></a>

## Bridge Objects

```python
class Bridge(QtCore.QObject)
```

A bridge for communication between Python and JavaScript.

**Attributes**:

- `update_graph` _SignalInstance_ - A signal to update the graph.
- `ready` _SignalInstance_ - A signal indicating that the bridge is ready.

<a id="activity_browser.app.pages.welcome.Bridge.update"></a>

#### update

<a id="activity_browser.app.pages.welcome.Bridge.ready"></a>

#### ready

<a id="activity_browser.app.pages.welcome.Bridge.is_ready"></a>

#### is\_ready

```python
@QtCore.Slot()
def is_ready()
```

Emits the ready signal.

<a id="activity_browser.app.pages.welcome.Bridge.open_project"></a>

#### open\_project

```python
@QtCore.Slot(str)
def open_project(project_name)
```

Emits the ready signal.

<a id="activity_browser.app.pages.welcome.WelcomeWebPage"></a>

## WelcomeWebPage Objects

```python
class WelcomeWebPage(QtWebEngineWidgets.QWebEnginePage)
```

<a id="activity_browser.app.pages.welcome.WelcomeWebPage.acceptNavigationRequest"></a>

#### acceptNavigationRequest

```python
def acceptNavigationRequest(qurl, navtype, mainframe)
```
