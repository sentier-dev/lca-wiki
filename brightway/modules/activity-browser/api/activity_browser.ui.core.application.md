**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.core.application` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.core.application cfg.yml > activity_browser.ui.core.application.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.core.application"></a>

# activity\_browser.ui.core.application

<a id="activity_browser.ui.core.application.ABApplication"></a>

## ABApplication Objects

```python
class ABApplication(QtWidgets.QApplication)
```

<a id="activity_browser.ui.core.application.ABApplication.theme_changed"></a>

#### theme\_changed

<a id="activity_browser.ui.core.application.ABApplication.windows"></a>

#### windows

<a id="activity_browser.ui.core.application.ABApplication.__new__"></a>

#### \_\_new\_\_

```python
def __new__(cls)
```

<a id="activity_browser.ui.core.application.ABApplication.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.ui.core.application.ABApplication.add_fonts"></a>

#### add\_fonts

```python
def add_fonts()
```

<a id="activity_browser.ui.core.application.ABApplication.set_icon"></a>

#### set\_icon

```python
def set_icon()
```

<a id="activity_browser.ui.core.application.ABApplication.pyside6_setup"></a>

#### pyside6\_setup

```python
def pyside6_setup()
```

<a id="activity_browser.ui.core.application.ABApplication.check_palette"></a>

#### check\_palette

```python
def check_palette(color_scheme)
```

<a id="activity_browser.ui.core.application.ABApplication.apply_color_scheme"></a>

#### apply\_color\_scheme

```python
def apply_color_scheme(hint) -> None
```

Set Qt color scheme and refresh matplotlib / WebEngine styling.

<a id="activity_browser.ui.core.application.ABApplication.main_window"></a>

#### main\_window

```python
@property
def main_window() -> QtWidgets.QMainWindow
```

Returns the main_window widget of the Activity Browser

<a id="activity_browser.ui.core.application.ABApplication.main_window"></a>

#### main\_window

```python
@main_window.setter
def main_window(widget: QtWidgets.QMainWindow)
```

<a id="activity_browser.ui.core.application.ABApplication.show"></a>

#### show

```python
def show()
```

<a id="activity_browser.ui.core.application.ABApplication.close"></a>

#### close

```python
def close()
```

<a id="activity_browser.ui.core.application.ABApplication.deleteLater"></a>

#### deleteLater

```python
def deleteLater()
```

<a id="activity_browser.ui.core.application.global_shortcut"></a>

#### global\_shortcut

```python
def global_shortcut(key_sequence)
```

Decorator to register a global keyboard shortcut for the main window. Decorate a function with e.g.
@global_shortcut("Ctrl+S") to register it as a shortcut. Also works on the run method of actions as long as the
parameters of said action are taken care of.
