**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.actions.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.actions.base cfg.yml > activity_browser.app.actions.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.actions.base"></a>

# activity\_browser.app.actions.base

<a id="activity_browser.app.actions.base.ABAction"></a>

## ABAction Objects

```python
class ABAction()
```

<a id="activity_browser.app.actions.base.ABAction.icon"></a>

#### icon

<a id="activity_browser.app.actions.base.ABAction.text"></a>

#### text

<a id="activity_browser.app.actions.base.ABAction.tooltip"></a>

#### tooltip

<a id="activity_browser.app.actions.base.ABAction.run"></a>

#### run

```python
@staticmethod
def run(*args, **kwargs)
```

<a id="activity_browser.app.actions.base.ABAction.triggered"></a>

#### triggered

```python
@classmethod
def triggered(cls, *args, **kwargs)
```

<a id="activity_browser.app.actions.base.ABAction.get_QAction"></a>

#### get\_QAction

```python
@classmethod
def get_QAction(cls,
                *args,
                parent=None,
                text=None,
                enabled=True,
                **kwargs) -> QtWidgets.QAction
```

<a id="activity_browser.app.actions.base.ABAction.get_QButton"></a>

#### get\_QButton

```python
@classmethod
def get_QButton(cls, *args, **kwargs)
```

Convenience function to return a button that has this ABAction as default action.

<a id="activity_browser.app.actions.base.exception_dialogs"></a>

#### exception\_dialogs

```python
def exception_dialogs(func)
```
