**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.app.pages.lca_results.contribution_tree_plot` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.app.pages.lca_results.contribution_tree_plot cfg.yml > activity_browser.app.pages.lca_results.contribution_tree_plot.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot"></a>

# activity\_browser.app.pages.lca\_results.contribution\_tree\_plot

Plot-type ids for the Contribution Tree.

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_SUNBURST"></a>

#### PLOT\_SUNBURST

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_TIER_BARS"></a>

#### PLOT\_TIER\_BARS

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_ICICLE"></a>

#### PLOT\_ICICLE

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_TREEMAP"></a>

#### PLOT\_TREEMAP

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_GRAPH"></a>

#### PLOT\_GRAPH

<a id="activity_browser.app.pages.lca_results.contribution_tree_plot.PLOT_MODES"></a>

#### PLOT\_MODES
