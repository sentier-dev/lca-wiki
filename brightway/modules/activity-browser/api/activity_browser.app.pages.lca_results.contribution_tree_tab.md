**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.contribution_tree_tab` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.contribution_tree_tab cfg.yml > activity_browser.app.pages.lca_results.contribution_tree_tab.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab"></a>

# activity\_browser.app.pages.lca\_results.contribution\_tree\_tab

Contribution Tree tab for the LCA Results page.

Shows the contribution tree as a hierarchical table with an optional contribution-tree plot.

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.HELP_TEXT"></a>

#### HELP\_TEXT

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeCacheEntry"></a>

## ContributionTreeCacheEntry Objects

```python
@dataclass
class ContributionTreeCacheEntry()
```

Cached graph plus the Qt tree view snapshot for one selection.

``model_uids`` is the set of rows that were in the tree (e.g. after path
prune). ``None`` means unrestricted — use whatever ``load_state`` builds.

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeCacheEntry.state"></a>

#### state

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeCacheEntry.expanded_uids"></a>

#### expanded\_uids

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeCacheEntry.model_uids"></a>

#### model\_uids

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeTab"></a>

## ContributionTreeTab Objects

```python
class ContributionTreeTab(QtWidgets.QWidget)
```

Contribution Tree tab for the LCA Results page.

Shows a QTreeView (lazy, expandable by tier) with an optional contribution-tree plot.
Cache key: (fu_index, method_index, scenario_index, cutoff_percent).
Each entry stores the Brightway traversal and the set of expanded row uids
so switching RF / IC / scenario restores both calculation and open branches.

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeTab.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent=None)
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeTab.showEvent"></a>

#### showEvent

```python
def showEvent(event: QtGui.QShowEvent) -> None
```

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeTab.update_tab"></a>

#### update\_tab

```python
def update_tab() -> None
```

Called when the tab is shown or the theme changes.

Guarded by ``has_been_opened`` so the generic ``_update_tabs`` loop
in ``LCAResultsPage`` does not trigger a traversal at construction
time (same pattern as Sankey / Tree Navigator).
``has_been_opened`` is set to True by ``LCAResultsPage.generate_content_on_click``
before this method is called on first open.

<a id="activity_browser.app.pages.lca_results.contribution_tree_tab.ContributionTreeTab.configure_scenario"></a>

#### configure\_scenario

```python
def configure_scenario() -> None
```
