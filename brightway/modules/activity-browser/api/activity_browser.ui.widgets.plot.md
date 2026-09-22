**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.plot` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.plot cfg.yml > activity_browser.ui.widgets.plot.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.plot"></a>

# activity\_browser.ui.widgets.plot

Matplotlib plot widget base for Activity Browser LCA results.

Subclasses in ``activity_browser.app.pages.lca_results.plots`` implement
:meth:`ABPlot.plot` and call :meth:`finish_plot` when drawing is done.

Shared concerns handled here:
  - Qt scroll-area sizing (zero width hint, figure sync on resize)
  - Label shortening / wrapping (driven by per-tab ``full_labels``)
  - Series color palette, bar styling, signed-value grids
  - Hover tooltips on truncated tick labels, bars, and legends
  - Multi-panel figures via :meth:`set_axis_contexts`

<a id="activity_browser.ui.widgets.plot.DEFAULT_PLOT_PALETTE"></a>

#### DEFAULT\_PLOT\_PALETTE

<a id="activity_browser.ui.widgets.plot.PLOT_PALETTES"></a>

#### PLOT\_PALETTES

<a id="activity_browser.ui.widgets.plot.lca_results_tab_from_widget"></a>

#### lca\_results\_tab\_from\_widget

```python
def lca_results_tab_from_widget(widget) -> object | None
```

Walk parents to the LCA results sub-tab with display options.

<a id="activity_browser.ui.widgets.plot.ABFigureCanvas"></a>

## ABFigureCanvas Objects

```python
class ABFigureCanvas(FigureCanvasQTAgg)
```

Canvas with zero width hint so scroll areas do not widen the main window.

<a id="activity_browser.ui.widgets.plot.ABFigureCanvas.sizeHint"></a>

#### sizeHint

```python
def sizeHint() -> QtCore.QSize
```

<a id="activity_browser.ui.widgets.plot.ABFigureCanvas.minimumSizeHint"></a>

#### minimumSizeHint

```python
def minimumSizeHint() -> QtCore.QSize
```

<a id="activity_browser.ui.widgets.plot.ABFigureCanvas.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event: QtGui.QResizeEvent) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot"></a>

## ABPlot Objects

```python
class ABPlot(QtWidgets.QWidget)
```

Matplotlib figure embedded in Qt; subclasses implement :meth:`plot`.

<a id="activity_browser.ui.widgets.plot.ABPlot.PNG_FILTER"></a>

#### PNG\_FILTER

<a id="activity_browser.ui.widgets.plot.ABPlot.SVG_FILTER"></a>

#### SVG\_FILTER

<a id="activity_browser.ui.widgets.plot.ABPlot.FONT_SIZE"></a>

#### FONT\_SIZE

<a id="activity_browser.ui.widgets.plot.ABPlot.LABEL_MAX_LENGTH"></a>

#### LABEL\_MAX\_LENGTH

<a id="activity_browser.ui.widgets.plot.ABPlot.AXIS_LABEL_WRAP_LENGTH"></a>

#### AXIS\_LABEL\_WRAP\_LENGTH

<a id="activity_browser.ui.widgets.plot.ABPlot.CATEGORY_ROTATE_LABELS_ABOVE"></a>

#### CATEGORY\_ROTATE\_LABELS\_ABOVE

<a id="activity_browser.ui.widgets.plot.ABPlot.HORIZONTAL_LABEL_WIDTH_FRACTION"></a>

#### HORIZONTAL\_LABEL\_WIDTH\_FRACTION

<a id="activity_browser.ui.widgets.plot.ABPlot.HORIZONTAL_AXIS_LABEL_WRAP_LENGTH"></a>

#### HORIZONTAL\_AXIS\_LABEL\_WRAP\_LENGTH

<a id="activity_browser.ui.widgets.plot.ABPlot.REST_BAR_COLOR"></a>

#### REST\_BAR\_COLOR

<a id="activity_browser.ui.widgets.plot.ABPlot.BAR_EDGE_WIDTH"></a>

#### BAR\_EDGE\_WIDTH

<a id="activity_browser.ui.widgets.plot.ABPlot.series_color"></a>

#### series\_color

```python
@classmethod
def series_color(cls, index: int) -> tuple[float, float, float, float]
```

RGBA for categorical series ``index`` (palette colors, then golden-ratio hues).

<a id="activity_browser.ui.widgets.plot.ABPlot.series_colors"></a>

#### series\_colors

```python
@classmethod
def series_colors(cls, n: int) -> np.ndarray
```

<a id="activity_browser.ui.widgets.plot.ABPlot.gsa_type_color"></a>

#### gsa\_type\_color

```python
@classmethod
def gsa_type_color(cls, gsa_type: str) -> tuple[float, float, float, float]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.stack_contributor_colors"></a>

#### stack\_contributor\_colors

```python
@classmethod
def stack_contributor_colors(cls, full_rows: list[str],
                             display_rows: list[str]) -> list
```

One palette color per contributor; grey for Rest (+)/(−) rows.

<a id="activity_browser.ui.widgets.plot.ABPlot.near_square_subplot_grid"></a>

#### near\_square\_subplot\_grid

```python
@staticmethod
def near_square_subplot_grid(n: int) -> tuple[int, int]
```

``(nrows, ncols)`` for *n* panels, as square as practical.

<a id="activity_browser.ui.widgets.plot.ABPlot.legend_column_width_ratio"></a>

#### legend\_column\_width\_ratio

```python
def legend_column_width_ratio() -> float
```

GridSpec width fraction for a shared legend column.

<a id="activity_browser.ui.widgets.plot.ABPlot.set_signed_value_grid"></a>

#### set\_signed\_value\_grid

```python
@staticmethod
def set_signed_value_grid(ax, *, horizontal: bool) -> None
```

Zero reference line and dashed grid on the value axis.

<a id="activity_browser.ui.widgets.plot.ABPlot.plot_bar_strip"></a>

#### plot\_bar\_strip

```python
def plot_bar_strip(ax, positions, heights, thickness: float, color, label: str,
                   *, horizontal: bool) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.set_category_positions"></a>

#### set\_category\_positions

```python
def set_category_positions(ax, n_categories: int, *,
                           horizontal: bool) -> np.ndarray
```

Place category tick positions; invert y for horizontal bars.

<a id="activity_browser.ui.widgets.plot.ABPlot.category_axis_tooltips"></a>

#### category\_axis\_tooltips

```python
@staticmethod
def category_axis_tooltips(
        labels: list[str], *,
        horizontal: bool) -> tuple[list[str] | None, list[str] | None]
```

``(tooltip_x, tooltip_y)`` for :meth:`finish_plot` from category labels.

<a id="activity_browser.ui.widgets.plot.ABPlot.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.ui.widgets.plot.ABPlot.sizeHint"></a>

#### sizeHint

```python
def sizeHint() -> QtCore.QSize
```

<a id="activity_browser.ui.widgets.plot.ABPlot.minimumSizeHint"></a>

#### minimumSizeHint

```python
def minimumSizeHint() -> QtCore.QSize
```

<a id="activity_browser.ui.widgets.plot.ABPlot.showEvent"></a>

#### showEvent

```python
def showEvent(event: QtGui.QShowEvent) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.resizeEvent"></a>

#### resizeEvent

```python
def resizeEvent(event: QtGui.QResizeEvent) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.get_canvas_size_in_inches"></a>

#### get\_canvas\_size\_in\_inches

```python
def get_canvas_size_in_inches() -> tuple[float, float]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.sync_figure_to_widget"></a>

#### sync\_figure\_to\_widget

```python
def sync_figure_to_widget() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.set_minimum_height_for_figure_inches"></a>

#### set\_minimum\_height\_for\_figure\_inches

```python
def set_minimum_height_for_figure_inches(height_inches: float) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.reset_minimum_figure_height"></a>

#### reset\_minimum\_figure\_height

```python
def reset_minimum_figure_height() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.use_full_labels"></a>

#### use\_full\_labels

```python
def use_full_labels() -> bool
```

<a id="activity_browser.ui.widgets.plot.ABPlot.use_horizontal_bars"></a>

#### use\_horizontal\_bars

```python
def use_horizontal_bars() -> bool
```

<a id="activity_browser.ui.widgets.plot.ABPlot.shorten_labels"></a>

#### shorten\_labels

```python
def shorten_labels(labels: list[str],
                   max_length: int | None = None) -> list[str]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.format_title"></a>

#### format\_title

```python
def format_title(title: str, max_length: int | None = None) -> str
```

<a id="activity_browser.ui.widgets.plot.ABPlot.legend_labels"></a>

#### legend\_labels

```python
def legend_labels(labels: list[str],
                  max_length: int | None = None) -> list[str]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.label_needs_tooltip"></a>

#### label\_needs\_tooltip

```python
@staticmethod
def label_needs_tooltip(display: str, full: str) -> bool
```

<a id="activity_browser.ui.widgets.plot.ABPlot.wrap_labels_to_lines"></a>

#### wrap\_labels\_to\_lines

```python
def wrap_labels_to_lines(labels: list[str],
                         *,
                         chars_per_line: int,
                         max_lines: int = 3) -> list[str]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.apply_axis_fonts"></a>

#### apply\_axis\_fonts

```python
def apply_axis_fonts(ax) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.apply_standard_fonts"></a>

#### apply\_standard\_fonts

```python
def apply_standard_fonts() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.set_axis_contexts"></a>

#### set\_axis\_contexts

```python
def set_axis_contexts(contexts: list[dict]) -> None
```

Register per-axes tooltip data for multi-panel figures.

Each dict: ``ax``, ``bar_values``, optional ``tooltip_x`` / ``tooltip_y``,
``full_title``, and subclass-specific keys (e.g. ``panel``).

<a id="activity_browser.ui.widgets.plot.ABPlot.set_plot_context"></a>

#### set\_plot\_context

```python
def set_plot_context(*,
                     unit: str | None = None,
                     relative: bool = False,
                     row_labels: list[str] | None = None,
                     col_labels: list[str] | None = None,
                     bar_values: np.ndarray | None = None,
                     bar_errors: np.ndarray | None = None,
                     col_scores: dict[str, float] | None = None,
                     col_units: dict[str, str] | None = None,
                     hist_series: list[np.ndarray] | None = None) -> None
```

Store labels and values used by default bar/histogram tooltips.

<a id="activity_browser.ui.widgets.plot.ABPlot.compose_bar_tooltip"></a>

#### compose\_bar\_tooltip

```python
@staticmethod
def compose_bar_tooltip(header_lines: list[str],
                        value_lines: list[str]) -> str
```

<a id="activity_browser.ui.widgets.plot.ABPlot.tooltip_value_lines"></a>

#### tooltip\_value\_lines

```python
@staticmethod
def tooltip_value_lines(value: float,
                        *,
                        relative: bool,
                        unit: str | None = None,
                        absolute_value: float | None = None,
                        relative_share_percent: float | None = None,
                        relative_already_percent: bool = False) -> list[str]
```

<a id="activity_browser.ui.widgets.plot.ABPlot.format_bar_tooltip"></a>

#### format\_bar\_tooltip

```python
def format_bar_tooltip(series_idx: int, bar_idx: int, value: float) -> str
```

Default grouped/stacked bar tooltip; override in subclasses.

<a id="activity_browser.ui.widgets.plot.ABPlot.bar_patch_tooltip"></a>

#### bar\_patch\_tooltip

```python
def bar_patch_tooltip(event) -> str | None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.histogram_x_tooltip"></a>

#### histogram\_x\_tooltip

```python
def histogram_x_tooltip(event) -> str | None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.clear_click_handler"></a>

#### clear\_click\_handler

```python
def clear_click_handler() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.set_click_handler"></a>

#### set\_click\_handler

```python
def set_click_handler(on_click) -> None
```

Wire left-click on the canvas (``on_click(event)``).

<a id="activity_browser.ui.widgets.plot.ABPlot.set_motion_tooltip"></a>

#### set\_motion\_tooltip

```python
def set_motion_tooltip(
    on_hover=None,
    *,
    y: list[str] | None = None,
    x: list[str] | None = None,
    legend: list[str] | None = None,
    offset: tuple[int, int] = (12, 12)) -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.clear_hover_tooltip"></a>

#### clear\_hover\_tooltip

```python
def clear_hover_tooltip() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.plot"></a>

#### plot

```python
def plot(*args, **kwargs)
```

<a id="activity_browser.ui.widgets.plot.ABPlot.reset_plot"></a>

#### reset\_plot

```python
def reset_plot() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.add_legend"></a>

#### add\_legend

```python
def add_legend(*args, ax=None, **kwargs)
```

<a id="activity_browser.ui.widgets.plot.ABPlot.finish_plot"></a>

#### finish\_plot

```python
def finish_plot(*,
                on_hover=None,
                on_click=None,
                tooltip_y: list[str] | None = None,
                tooltip_x: list[str] | None = None,
                tooltip_legend: list[str] | None = None) -> None
```

Apply fonts, draw, and wire hover tooltips. Call once per :meth:`plot`.

<a id="activity_browser.ui.widgets.plot.ABPlot.to_clipboard_png"></a>

#### to\_clipboard\_png

```python
def to_clipboard_png() -> None
```

Copy the current figure to the system clipboard as a PNG image.

<a id="activity_browser.ui.widgets.plot.ABPlot.to_png"></a>

#### to\_png

```python
def to_png() -> None
```

<a id="activity_browser.ui.widgets.plot.ABPlot.to_svg"></a>

#### to\_svg

```python
def to_svg() -> None
```
