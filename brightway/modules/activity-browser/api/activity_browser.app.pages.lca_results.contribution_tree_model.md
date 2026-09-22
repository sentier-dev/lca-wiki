**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.contribution_tree_model` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.contribution_tree_model cfg.yml > activity_browser.app.pages.lca_results.contribution_tree_model.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.contribution_tree_model"></a>

# activity\_browser.app.pages.lca\_results.contribution\_tree\_model

Qt item model for the Contribution Tree tab.

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_CUMULATIVE_PCT"></a>

#### COL\_CUMULATIVE\_PCT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_DIRECT_PCT"></a>

#### COL\_DIRECT\_PCT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_PRODUCT"></a>

#### COL\_PRODUCT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_PROCESS"></a>

#### COL\_PROCESS

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_LOCATION"></a>

#### COL\_LOCATION

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_DATABASE"></a>

#### COL\_DATABASE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_FLOW_AMOUNT"></a>

#### COL\_FLOW\_AMOUNT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_UNIT"></a>

#### COL\_UNIT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_CUMULATIVE"></a>

#### COL\_CUMULATIVE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_DIRECT"></a>

#### COL\_DIRECT

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COL_TIER"></a>

#### COL\_TIER

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.COLUMNS"></a>

#### COLUMNS

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.BAR_COLUMNS"></a>

#### BAR\_COLUMNS

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.EXPAND_MODE_TIER"></a>

#### EXPAND\_MODE\_TIER

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.EXPAND_MODE_PATH"></a>

#### EXPAND\_MODE\_PATH

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.EXPAND_MODE_CUMULATIVE"></a>

#### EXPAND\_MODE\_CUMULATIVE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.UID_ROLE"></a>

#### UID\_ROLE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.PLACEHOLDER_ROLE"></a>

#### PLACEHOLDER\_ROLE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.TIER_ROLE"></a>

#### TIER\_ROLE

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel"></a>

## ContributionTreeModel Objects

```python
class ContributionTreeModel(QtGui.QStandardItemModel)
```

QStandardItemModel backed by a SameNodeEachVisitGraphTraversal state.

Populated lazily: call ``load_state`` after initial traversal, then
``expand_node`` from a queued ``expanded`` handler. Empty placeholder
children provide expand chevrons without visible ellipsis text.

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.column_max_changed"></a>

#### column\_max\_changed

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.has_real_children"></a>

#### has\_real\_children

```python
@staticmethod
def has_real_children(item: QtGui.QStandardItem) -> bool
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.root_uid"></a>

#### root\_uid

```python
@property
def root_uid() -> int | None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.item_for_uid"></a>

#### item\_for\_uid

```python
def item_for_uid(unique_id: int) -> QtGui.QStandardItem | None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.iter_uid_items"></a>

#### iter\_uid\_items

```python
def iter_uid_items()
```

Yield ``(unique_id, first_column_item)`` for rows currently in the model.

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.model_uids"></a>

#### model\_uids

```python
def model_uids() -> set[int]
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.load_state"></a>

#### load\_state

```python
def load_state(state: SameNodeEachVisitGraphTraversal,
               total_score: float,
               included_uids: set[int] | None = None) -> None
```

Rebuild the model from a (possibly cached) traversal state.

When ``included_uids`` is set, only those nodes are materialized
(avoids building the full tree then pruning).

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.expand_node"></a>

#### expand\_node

```python
def expand_node(unique_id: int) -> bool
```

Traverse from the given node and add its direct children to the model.

All children discovered by graph traversal are listed (the engine cutoff
already limits which edges exist).

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.to_dataframe"></a>

#### to\_dataframe

```python
def to_dataframe(metadata_lookup=None)
```

Return a flat DataFrame of all traversed nodes.

<a id="activity_browser.app.pages.lca_results.contribution_tree_model.ContributionTreeModel.lookup_activity_meta"></a>

#### lookup\_activity\_meta

```python
def lookup_activity_meta(activity_datapackage_id) -> dict
```

Public metadata lookup for plot tooltips (by activity id).
