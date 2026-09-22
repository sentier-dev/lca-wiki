**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.button_collapser` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.button_collapser cfg.yml > activity_browser.ui.widgets.button_collapser.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.button_collapser"></a>

# activity\_browser.ui.widgets.button\_collapser

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser"></a>

## ABRadioButtonCollapser Objects

```python
class ABRadioButtonCollapser(QtWidgets.QWidget)
```

Composite that shows different 'views' depending on what radio button is clicked. After initialization you may
add different options through the add_option method. These are displayed horizontally and only shown when the
corresponding radiobutton is clicked.

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.buttonClicked"></a>

#### buttonClicked

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.buttonPressed"></a>

#### buttonPressed

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.buttonReleased"></a>

#### buttonReleased

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.buttonToggled"></a>

#### buttonToggled

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(item)
```

Give option name, returns tuple of the corresponding button and view_widget

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.addOption"></a>

#### addOption

```python
def addOption(name: str, label: str, w: QtWidgets.QWidget)
```

Add a collapsible option to the layout.

Parameters
----------
    name : `str`
        Simple name that can be used to identify the option.
    label : `str`
        Label to be shown next to the radio button. Append a * to disable the button, a # to hide the button,
        or a ~ to select the button.
    view : `QtWidgets.QWidget`
        A QWidget that will be shown once the radio button is checked by the user

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.hideAll"></a>

#### hideAll

```python
def hideAll(uncheck=True)
```

Hides all the views, unchecking all the radio_buttons by default.

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.updateCollapse"></a>

#### updateCollapse

```python
def updateCollapse()
```

Slot that check what radio button is checked and only unhides the associated view

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.button"></a>

#### button

```python
def button(name: str) -> QtWidgets.QRadioButton
```

Returns the button associated with the given name

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.view"></a>

#### view

```python
def view(name: str) -> QtWidgets.QWidget | QtWidgets.QLayout
```

Returns the view associated with the given name

<a id="activity_browser.ui.widgets.button_collapser.ABRadioButtonCollapser.currentOption"></a>

#### currentOption

```python
def currentOption() -> None | str
```

Returns the name of the currently checked option. Returns None if nothing is selected
