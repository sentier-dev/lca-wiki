**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.selection_history` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.selection_history cfg.yml > activity_browser.ui.selection_history.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.selection_history"></a>

# activity\_browser.ui.selection\_history

Session history of (reference flow, impact category, scenario) combo indices.

<a id="activity_browser.ui.selection_history.IndexSelectionHistory"></a>

## IndexSelectionHistory Objects

```python
class IndexSelectionHistory()
```

Back/Forward stack for LCA result-tab combo selections.

Records ``(fu_index, method_index, scenario_index)`` only. Applying Back
or Forward must call :meth:`suppress_push` so setting combos does not
push a duplicate.

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.__init__"></a>

#### \_\_init\_\_

```python
def __init__() -> None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.push"></a>

#### push

```python
def push(key: tuple) -> None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.can_back"></a>

#### can\_back

```python
def can_back() -> bool
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.can_forward"></a>

#### can\_forward

```python
def can_forward() -> bool
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.back"></a>

#### back

```python
def back() -> tuple | None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.forward"></a>

#### forward

```python
def forward() -> tuple | None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.suppress_push"></a>

#### suppress\_push

```python
def suppress_push() -> None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.resume_push"></a>

#### resume\_push

```python
def resume_push() -> None
```

<a id="activity_browser.ui.selection_history.IndexSelectionHistory.seed"></a>

#### seed

```python
def seed(key: tuple) -> None
```

Start history at ``key`` (call after combos are populated).
