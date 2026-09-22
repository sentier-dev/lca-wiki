**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.style` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.style cfg.yml > activity_browser.app.pages.lca_results.style.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.style"></a>

# activity\_browser.app.pages.lca\_results.style

Shared Qt layout and chrome for LCA Results sub-tabs.

Provides consistent margins, control rows, headers, run buttons, and compact
combo boxes used across matplotlib tabs and web navigators (Sankey/Tree).

<a id="activity_browser.app.pages.lca_results.style.LCA_TAB_LAYOUT_SPACING"></a>

#### LCA\_TAB\_LAYOUT\_SPACING

<a id="activity_browser.app.pages.lca_results.style.LCA_TAB_CONTENT_MARGINS"></a>

#### LCA\_TAB\_CONTENT\_MARGINS

<a id="activity_browser.app.pages.lca_results.style.LCA_HEADER_ROW_MIN_HEIGHT"></a>

#### LCA\_HEADER\_ROW\_MIN\_HEIGHT

<a id="activity_browser.app.pages.lca_results.style.LCA_RUN_BUTTON_STYLE"></a>

#### LCA\_RUN\_BUTTON\_STYLE

<a id="activity_browser.app.pages.lca_results.style.configure_lca_tab_layout"></a>

#### configure\_lca\_tab\_layout

```python
def configure_lca_tab_layout(layout: QtWidgets.QVBoxLayout) -> None
```

Shared vertical spacing and edge padding for LCA Results sub-tabs.

<a id="activity_browser.app.pages.lca_results.style.lca_tab_control_row"></a>

#### lca\_tab\_control\_row

```python
def lca_tab_control_row() -> QtWidgets.QHBoxLayout
```

Single control row with standard horizontal spacing.

<a id="activity_browser.app.pages.lca_results.style.lca_tab_controls_section"></a>

#### lca\_tab\_controls\_section

```python
def lca_tab_controls_section(
        *rows: QtWidgets.QHBoxLayout) -> QtWidgets.QVBoxLayout
```

Stack control rows with the same spacing as the main tab layout.

<a id="activity_browser.app.pages.lca_results.style.lca_run_button"></a>

#### lca\_run\_button

```python
def lca_run_button(parent: QtWidgets.QWidget | None = None,
                   *,
                   text: str = "Run") -> QtWidgets.QPushButton
```

Action button styled like the calculation setup Run button.

<a id="activity_browser.app.pages.lca_results.style.vertical_line"></a>

#### vertical\_line

```python
def vertical_line()
```

<a id="activity_browser.app.pages.lca_results.style.header"></a>

#### header

```python
def header(text)
```

<a id="activity_browser.app.pages.lca_results.style.lca_help_tool_button"></a>

#### lca\_help\_tool\_button

```python
def lca_help_tool_button(parent: QtWidgets.QWidget, tooltip: str,
                         on_click) -> QtWidgets.QToolButton
```

Compact help control for tab headers (matches plain header height).

<a id="activity_browser.app.pages.lca_results.style.lca_header_layout"></a>

#### lca\_header\_layout

```python
def lca_header_layout(
        header_text: str,
        help_widget: QtWidgets.QWidget | None = None) -> QtWidgets.QVBoxLayout
```

Title row with consistent height across tabs (with or without help).

<a id="activity_browser.app.pages.lca_results.style.qt_ui_font_css"></a>

#### qt\_ui\_font\_css

```python
def qt_ui_font_css() -> str
```

Match WebEngine chrome (Layout row) to the Qt application font.

<a id="activity_browser.app.pages.lca_results.style.app_is_dark"></a>

#### app\_is\_dark

```python
def app_is_dark() -> bool
```

Whether the Qt application color scheme is dark.

<a id="activity_browser.app.pages.lca_results.style.inject_qt_ui_font"></a>

#### inject\_qt\_ui\_font

```python
def inject_qt_ui_font(page) -> None
```

Apply :func:`qt_ui_font_css` to a WebEngine page.

<a id="activity_browser.app.pages.lca_results.style.show_open_process_menu"></a>

#### show\_open\_process\_menu

```python
def show_open_process_menu(parent, activities, global_pos=None) -> None
```

One-item Open process menu. Greyed out when there is no single process.
