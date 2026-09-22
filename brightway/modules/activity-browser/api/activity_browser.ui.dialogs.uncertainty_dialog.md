**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.dialogs.uncertainty_dialog` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.dialogs.uncertainty_dialog cfg.yml > activity_browser.ui.dialogs.uncertainty_dialog.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.dialogs.uncertainty_dialog"></a>

# activity\_browser.ui.dialogs.uncertainty\_dialog

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog"></a>

## UncertaintyDialog Objects

```python
class UncertaintyDialog(QtWidgets.QDialog)
```

Single-step dialog for defining a stats_arrays uncertainty.

Mirrors the behavior of the UncertaintyWizard type page but returns a
stats_arrays structured array on accept.

Usage:
	ok, array = UncertaintyDialog.get_uncertainty(parent, initial=dict(...))
	if ok:
		# array is a numpy structured array compatible with stats_arrays

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None,
             initial: Optional[dict] = None,
             *,
             read_only: bool = False,
             enable_pedigree: bool = False)
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog.get_uncertainty_array"></a>

#### get\_uncertainty\_array

```python
@staticmethod
def get_uncertainty_array(
        parent=None,
        initial: Optional[dict] = None,
        *,
        read_only: bool = False,
        enable_pedigree: bool = False) -> Tuple[bool, Optional[np.ndarray]]
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog.get_uncertainty_dict"></a>

#### get\_uncertainty\_dict

```python
@staticmethod
def get_uncertainty_dict(
        parent=None,
        initial: Optional[dict] = None,
        *,
        read_only: bool = False,
        enable_pedigree: bool = False) -> Tuple[bool, Optional[dict]]
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog.sizeHint"></a>

#### sizeHint

```python
def sizeHint() -> QtCore.QSize
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.UncertaintyDialog.showEvent"></a>

#### showEvent

```python
def showEvent(event: QtGui.QShowEvent) -> None
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.SimpleDistributionPlot"></a>

## SimpleDistributionPlot Objects

```python
class SimpleDistributionPlot(ABPlot)
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.SimpleDistributionPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.dialogs.uncertainty_dialog.SimpleDistributionPlot.plot_analytical"></a>

#### plot\_analytical

```python
def plot_analytical(curve: PreviewDensity,
                    vline_x: float,
                    *,
                    title: str = "") -> None
```

Plot ``stats_arrays`` / SciPy PDF or PMF (no random sampling).
