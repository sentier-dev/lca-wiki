**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.widgets.database_name_edit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.widgets.database_name_edit cfg.yml > activity_browser.ui.widgets.database_name_edit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.widgets.database_name_edit"></a>

# activity\_browser.ui.widgets.database\_name\_edit

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit"></a>

## DatabaseNameEdit Objects

```python
class DatabaseNameEdit(QtWidgets.QWidget)
```

Extended LineEdit widget that will check whether the database name provided by the user already exist and warn
the user accordingly.

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit.textChanged"></a>

#### textChanged

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit.__init__"></a>

#### \_\_init\_\_

```python
def __init__(label: str | None = "",
             database_placeholder="Database name",
             database_preset="",
             overwrite_warning="Existing database will be overwritten")
```

Parameters
----------
    label : `str`
        Header to show above the text field. If an empty string is provided (default), label will not be added
    database_placeholder : `str`
        Text to show in the background of the database field
    database_preset : `str`
        Text with which to fill in the database field as suggestion
    overwrite_warning : `str`
        Text to show as warning when the database already exists. If the string is empty, no warning will be
        shown

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit.text"></a>

#### text

```python
def text() -> str
```

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit.setText"></a>

#### setText

```python
def setText(text: str)
```

<a id="activity_browser.ui.widgets.database_name_edit.DatabaseNameEdit.willOverwrite"></a>

#### willOverwrite

```python
def willOverwrite() -> bool
```
