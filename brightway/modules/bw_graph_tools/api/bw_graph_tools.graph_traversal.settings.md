**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.settings` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_graph_tools==0.10'
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
  -I "$SP" -m bw_graph_tools.graph_traversal.settings cfg.yml > bw_graph_tools.graph_traversal.settings.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.settings"></a>

# bw\_graph\_tools.graph\_traversal.settings

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings"></a>

## GraphTraversalSettings Objects

```python
class GraphTraversalSettings(BaseModel)
```

Graph traversal settings object with reasonable defaults.

Parameters
----------
cutoff : float
    Cutoff value used to stop graph traversal. Fraction of total score,
    should be in `(0, 1)`
biosphere_cutoff : float
    Cutoff value used to determine if a separate biosphere node is
    added. Fraction of total score.
max_calc : int | None
    Maximum number of inventory calculations to perform
max_depth : int
    Maximum depth in the supply chain traversal. Default is no maximum.
skip_coproducts : bool
    Don't traverse co-production edges, i.e. production edges other
    than the reference product
separate_biosphere_flows : bool
    Add separate `Flow` nodes for important individual biosphere
    emissions
min_coverage_fraction : float
    Minimum fraction of the total LCA score that must be covered by the
    traversed nodes. A warning is raised if coverage falls below this
    value. Should be in `(0, 1]`. Default is 0.9.

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.cutoff"></a>

#### cutoff

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.biosphere_cutoff"></a>

#### biosphere\_cutoff

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.max_calc"></a>

#### max\_calc

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.max_depth"></a>

#### max\_depth

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.skip_coproducts"></a>

#### skip\_coproducts

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.separate_biosphere_flows"></a>

#### separate\_biosphere\_flows

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.caching_solver"></a>

#### caching\_solver

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.min_coverage_fraction"></a>

#### min\_coverage\_fraction

<a id="bw_graph_tools.graph_traversal.settings.GraphTraversalSettings.max_depth_positive"></a>

#### max\_depth\_positive

```python
@model_validator(mode="after")
def max_depth_positive()
```

<a id="bw_graph_tools.graph_traversal.settings.TaggedGraphTraversalSettings"></a>

## TaggedGraphTraversalSettings Objects

```python
class TaggedGraphTraversalSettings(GraphTraversalSettings)
```

Supply Chain Traversal Settings with a functional unit tag

Parameters
----------
tags : List[str]
    A list of tags to group nodes by

<a id="bw_graph_tools.graph_traversal.settings.TaggedGraphTraversalSettings.tags"></a>

#### tags
