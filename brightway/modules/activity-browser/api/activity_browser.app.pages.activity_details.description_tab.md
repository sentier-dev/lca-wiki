**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.activity_details.description_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.activity_details.description_tab cfg.yml > activity_browser.app.pages.activity_details.description_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.activity_details.description_tab"></a>

# activity\_browser.app.pages.activity\_details.description\_tab

<a id="activity_browser.app.pages.activity_details.description_tab.DescriptionTab"></a>

## DescriptionTab Objects

```python
class DescriptionTab(QtWidgets.QTextEdit)
```

A widget that displays and edits the description (comment) of a specific activity.

**Attributes**:

- `activity` _tuple | int | bd.Node_ - The activity to display and edit the description for.

<a id="activity_browser.app.pages.activity_details.description_tab.DescriptionTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(activity: tuple | int | bd.Node, parent=None)
```

Initializes the DescriptionTab widget.

**Arguments**:

- `activity` _tuple | int | bd.Node_ - The activity to display and edit the description for.
- `parent` _QtWidgets.QWidget, optional_ - The parent widget. Defaults to None.

<a id="activity_browser.app.pages.activity_details.description_tab.DescriptionTab.sync"></a>

#### sync

```python
def sync()
```

Synchronizes the widget with the current state of the activity.

<a id="activity_browser.app.pages.activity_details.description_tab.DescriptionTab.focusOutEvent"></a>

#### focusOutEvent

```python
def focusOutEvent(e)
```

Handles the focus out event to save the comment if it has changed.

**Arguments**:

- `e` - The focus out event.
