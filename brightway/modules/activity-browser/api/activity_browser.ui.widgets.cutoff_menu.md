**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.cutoff_menu` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.cutoff_menu cfg.yml > activity_browser.ui.widgets.cutoff_menu.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.cutoff_menu"></a>

# activity\_browser.ui.widgets.cutoff\_menu

Classes related to the cutoff options menu in contributions tabs.

These classes contain all menu items required to modify the cutoffs of the MLCA results. The
CutoffMenu class is responsible for assembling the menu. Each different menu item is contained in
its separate class.

<a id="activity_browser.ui.widgets.cutoff_menu.Types"></a>

#### Types

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu"></a>

## CutoffMenu Objects

```python
class CutoffMenu(QWidget)
```

This class assembles the cutoff menu from the other classes in this module.

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.slider_change"></a>

#### slider\_change

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None, cutoff_value=0.05, limit_type="percent")
```

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.connect_signals"></a>

#### connect\_signals

```python
def connect_signals()
```

Connect the signals of the menu.

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.initiate_slider_change"></a>

#### initiate\_slider\_change

```python
def initiate_slider_change()
```

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.initiate_text_change"></a>

#### initiate\_text\_change

```python
def initiate_text_change()
```

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.cutoff_slider_percent_check"></a>

#### cutoff\_slider\_percent\_check

```python
@Slot(str, name="sliderPercentCheck")
def cutoff_slider_percent_check(editor: str)
```

If 'Percent' selected, change the plots and tables to reflect the slider/line-edit.

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.cutoff_slider_cum_percent_check"></a>

#### cutoff\_slider\_cum\_percent\_check

```python
@Slot(str, name="sliderCumPercentCheck")
def cutoff_slider_cum_percent_check(editor: str)
```

If 'Cumulative %' selected, change the plots and tables to reflect the slider/line-edit.

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.cutoff_slider_number_check"></a>

#### cutoff\_slider\_number\_check

```python
@Slot(str, name="sliderNumberCheck")
def cutoff_slider_number_check(editor: str)
```

If 'Number' selected, change the plots and tables to reflect the slider/line-edit.

<a id="activity_browser.ui.widgets.cutoff_menu.CutoffMenu.make_layout"></a>

#### make\_layout

```python
def make_layout()
```

Assemble the layout of the cutoff menu.

Construct the layout for the cutoff menu widget. The initial layout is set to 'Percent'.

<a id="activity_browser.ui.widgets.cutoff_menu.LogarithmicSlider"></a>

## LogarithmicSlider Objects

```python
class LogarithmicSlider(QSlider)
```

Makes a QSlider object that behaves logarithmically.

Inherits from QSlider. This class uses the property `log_value` getter and setter to modify
the QSlider through the `value` and `setValue` methods.

<a id="activity_browser.ui.widgets.cutoff_menu.LogarithmicSlider.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.cutoff_menu.LogarithmicSlider.log_value"></a>

#### log\_value

```python
@property
def log_value() -> Union[int, float]
```

Read (slider) and modify from 1-100 to 0.001-100 logarithmically with relevant rounding.

This function converts the 1-100 values and modifies these to 0.001-100 on a logarithmic
scale. Rounding is done based on magnitude.

<a id="activity_browser.ui.widgets.cutoff_menu.LogarithmicSlider.log_value"></a>

#### log\_value

```python
@log_value.setter
def log_value(value: float) -> None
```

Modify value from 0.001-100 to 1-100 logarithmically and set slider to value.
