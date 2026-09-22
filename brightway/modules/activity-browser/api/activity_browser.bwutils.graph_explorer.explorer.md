**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.graph_explorer.explorer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.graph_explorer.explorer cfg.yml > activity_browser.bwutils.graph_explorer.explorer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.graph_explorer.explorer"></a>

# activity\_browser.bwutils.graph\_explorer.explorer

Graph explorer visible graph — technosphere expand/collapse, not LCA graph_traversal.

<a id="activity_browser.bwutils.graph_explorer.explorer.EXPAND_CAP"></a>

#### EXPAND\_CAP

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey"></a>

## FlowKey Objects

```python
@dataclass(frozen=True)
class FlowKey()
```

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey.side"></a>

#### side

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey.product"></a>

#### product

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey.unit"></a>

#### unit

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey.as_dict"></a>

#### as\_dict

```python
def as_dict() -> dict
```

<a id="activity_browser.bwutils.graph_explorer.explorer.FlowKey.from_dict"></a>

#### from\_dict

```python
@classmethod
def from_dict(cls, data: dict) -> FlowKey
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart"></a>

## Counterpart Objects

```python
@dataclass(frozen=True)
class Counterpart()
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.process_id"></a>

#### process\_id

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.amount"></a>

#### amount

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.role"></a>

#### role

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.functional_at"></a>

#### functional\_at

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.from_exchange"></a>

#### from\_exchange

<a id="activity_browser.bwutils.graph_explorer.explorer.Counterpart.abs_amount"></a>

#### abs\_amount

```python
@property
def abs_amount() -> float
```

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow"></a>

## PairFlow Objects

```python
@dataclass(frozen=True)
class PairFlow()
```

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.source_id"></a>

#### source\_id

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.target_id"></a>

#### target\_id

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.product"></a>

#### product

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.amount"></a>

#### amount

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.unit"></a>

#### unit

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.role"></a>

#### role

<a id="activity_browser.bwutils.graph_explorer.explorer.PairFlow.functional_at"></a>

#### functional\_at

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory"></a>

## Inventory Objects

```python
class Inventory(Protocol)
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.label"></a>

#### label

```python
def label(process_id: int) -> tuple[str, str | None]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.flow_heads"></a>

#### flow\_heads

```python
def flow_heads(process_id: int) -> list[tuple[FlowKey, int]]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.counterparts_ranked"></a>

#### counterparts\_ranked

```python
def counterparts_ranked(process_id: int, key: FlowKey) -> list[Counterpart]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.pair_flows"></a>

#### pair\_flows

```python
def pair_flows(process_ids: set[int]) -> list[PairFlow]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.host_flow_amount"></a>

#### host\_flow\_amount

```python
def host_flow_amount(process_id: int, key: FlowKey) -> float | None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.host_flow_style"></a>

#### host\_flow\_style

```python
def host_flow_style(process_id: int, key: FlowKey) -> tuple[str, str | None]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.Inventory.functional_flows"></a>

#### functional\_flows

```python
def functional_flows(process_id: int) -> list[tuple[FlowKey, float, str, str]]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer"></a>

## GraphExplorer Objects

```python
class GraphExplorer()
```

Visible processes and which counterparts have been revealed per flow.

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(center_id: int, inventory: Inventory)
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.refresh_listed_exchanges"></a>

#### refresh\_listed\_exchanges

```python
def refresh_listed_exchanges() -> None
```

Re-read listed inputs/outputs: show new counterparts and drop deleted ones.

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.expand_flow"></a>

#### expand\_flow

```python
def expand_flow(host_id: int,
                key: FlowKey,
                *,
                all_remaining: bool = False) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.expand_listed_side"></a>

#### expand\_listed\_side

```python
def expand_listed_side(host_id: int, side: str) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.expand_side"></a>

#### expand\_side

```python
def expand_side(host_id: int, side: str) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.collapse_side"></a>

#### collapse\_side

```python
def collapse_side(host_id: int, side: str) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.remove_process"></a>

#### remove\_process

```python
def remove_process(process_id: int) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.select"></a>

#### select

```python
def select(process_id: int) -> None
```

<a id="activity_browser.bwutils.graph_explorer.explorer.GraphExplorer.payload"></a>

#### payload

```python
def payload() -> dict
```

<a id="activity_browser.bwutils.graph_explorer.explorer.process_nodes"></a>

#### process\_nodes

```python
def process_nodes(payload: dict) -> list[dict]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.stub_edges"></a>

#### stub\_edges

```python
def stub_edges(payload: dict) -> list[dict]
```

<a id="activity_browser.bwutils.graph_explorer.explorer.remainder_nodes"></a>

#### remainder\_nodes

```python
def remainder_nodes(payload: dict) -> list[dict]
```
