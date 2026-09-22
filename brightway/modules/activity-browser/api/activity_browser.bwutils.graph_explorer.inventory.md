**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_explorer.inventory` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.graph_explorer.inventory cfg.yml > activity_browser.bwutils.graph_explorer.inventory.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_explorer.inventory"></a>

# activity\_browser.bwutils.graph\_explorer.inventory

Brightway inventory adapter for the Graph explorer. No Qt.

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory"></a>

## BrightwayInventory Objects

```python
class BrightwayInventory()
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.__init__"></a>

#### \_\_init\_\_

```python
def __init__(metadata_lookup=None)
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.invalidate"></a>

#### invalidate

```python
def invalidate(process_id: int | None = None) -> None
```

Drop cached inventory for one process, or all processes.

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.label"></a>

#### label

```python
def label(process_id: int) -> tuple[str, str | None]
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.card"></a>

#### card

```python
def card(process_id: int) -> dict
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.flow_heads"></a>

#### flow\_heads

```python
def flow_heads(process_id: int) -> list[tuple[FlowKey, int]]
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.counterparts_ranked"></a>

#### counterparts\_ranked

```python
def counterparts_ranked(process_id: int, key: FlowKey) -> list[Counterpart]
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.host_flow_amount"></a>

#### host\_flow\_amount

```python
def host_flow_amount(process_id: int, key: FlowKey) -> float | None
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.host_flow_style"></a>

#### host\_flow\_style

```python
def host_flow_style(process_id: int, key: FlowKey) -> tuple[str, str | None]
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.functional_flows"></a>

#### functional\_flows

```python
def functional_flows(process_id: int) -> list[tuple[FlowKey, float, str, str]]
```

<a id="activity_browser.bwutils.graph_explorer.inventory.BrightwayInventory.pair_flows"></a>

#### pair\_flows

```python
def pair_flows(process_ids: set[int]) -> list[PairFlow]
```
