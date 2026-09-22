**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.ui.delegates.card` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.ui.delegates.card cfg.yml > activity_browser.ui.delegates.card.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.ui.delegates.card"></a>

# activity\_browser.ui.delegates.card

<a id="activity_browser.ui.delegates.card.CardData"></a>

## CardData Objects

```python
class CardData(TypedDict)
```

<a id="activity_browser.ui.delegates.card.CardData.title"></a>

#### title

<a id="activity_browser.ui.delegates.card.CardData.subtitle"></a>

#### subtitle

<a id="activity_browser.ui.delegates.card.CardData.detail"></a>

#### detail

<a id="activity_browser.ui.delegates.card.CardData.categories"></a>

#### categories

<a id="activity_browser.ui.delegates.card.CardDelegate"></a>

## CardDelegate Objects

```python
class CardDelegate(QtWidgets.QStyledItemDelegate)
```

Delegate for rendering card-like items with title, subtitle, categories and background icon.

<a id="activity_browser.ui.delegates.card.CardDelegate.PADDING"></a>

#### PADDING

<a id="activity_browser.ui.delegates.card.CardDelegate.MARGIN"></a>

#### MARGIN

<a id="activity_browser.ui.delegates.card.CardDelegate.TITLE_LINES"></a>

#### TITLE\_LINES

<a id="activity_browser.ui.delegates.card.CardDelegate.ICON_OPACITY"></a>

#### ICON\_OPACITY

<a id="activity_browser.ui.delegates.card.CardDelegate.sizeHint"></a>

#### sizeHint

```python
def sizeHint(option, index)
```

<a id="activity_browser.ui.delegates.card.CardDelegate.paint"></a>

#### paint

```python
def paint(painter, option: QtWidgets.QStyleOptionViewItem, index)
```
