**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.impact_background` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.impact_background cfg.yml > activity_browser.ui.delegates.impact_background.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.impact_background"></a>

# activity\_browser.ui.delegates.impact\_background

Delegate that tints table cells by signed impact magnitude.

Used by the Contribution Tree tab for percentage columns. Intensity uses a
log scale focused on the 1%–100% range so 1 / 10 / 50 / 100 read clearly
apart, still as a plain translucent color fill (no custom bar widgets).

<a id="activity_browser.ui.delegates.impact_background.impact_intensity_fraction"></a>

#### impact\_intensity\_fraction

```python
def impact_intensity_fraction(value: float,
                              column_max: float,
                              *,
                              floor_ratio: float = 0.01) -> float
```

Map ``|value|`` to ``[0, 1]`` on a log10 axis from ``floor`` to ``column_max``.

Default ``floor_ratio=0.01`` puts the floor at 1% when ``column_max`` is 100,
so 1 → 0, 10 → ~0.5, 50 → ~0.85, 100 → 1. Values below the floor share the
minimum intensity.

<a id="activity_browser.ui.delegates.impact_background.ImpactBackgroundDelegate"></a>

## ImpactBackgroundDelegate Objects

```python
class ImpactBackgroundDelegate(QtWidgets.QStyledItemDelegate)
```

Paint a translucent full-cell background from a signed numeric value.

Tint intensity uses :func:`impact_intensity_fraction` (log-scaled).
Positive and negative hues are configurable (e.g. red for cumulative %,
blue for direct %).

Parameters
----------
column_max:
    Maximum absolute value in the column — used to scale tint intensity.
positive_rgb:
    RGB triple for positive (burden) values.
negative_rgb:
    RGB triple for negative (credit) values.
parent:
    Optional Qt parent.

<a id="activity_browser.ui.delegates.impact_background.ImpactBackgroundDelegate.VALUE_ROLE"></a>

#### VALUE\_ROLE

<a id="activity_browser.ui.delegates.impact_background.ImpactBackgroundDelegate.__init__"></a>

#### \_\_init\_\_

```python
def __init__(column_max: float = 100.0,
             positive_rgb: tuple[int, int, int] = (210, 85, 85),
             negative_rgb: tuple[int, int, int] = (85, 170, 95),
             parent=None)
```

<a id="activity_browser.ui.delegates.impact_background.ImpactBackgroundDelegate.paint"></a>

#### paint

```python
def paint(painter: QtGui.QPainter, option: QtWidgets.QStyleOptionViewItem,
          index: QtCore.QModelIndex) -> None
```
