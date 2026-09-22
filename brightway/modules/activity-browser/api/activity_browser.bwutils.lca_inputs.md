**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.lca_inputs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.lca_inputs cfg.yml > activity_browser.bwutils.lca_inputs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.lca_inputs"></a>

# activity\_browser.bwutils.lca\_inputs

Product-keyed LCA demand for Brightway 2.5 / ``functional_sqlite``.

Stopgap used by Tree and Sankey: remap process datapackage ids to product ids
so demand keys match the product dictionary. MultiLCA, Monte Carlo, and GSA
still prepare demand independently.

Future: this mapping belongs in a shared place, preferably **bw_functional**,
not a new Activity Browser layering ADR. See
``docs/adr/0001-ui-app-bwutils-layering.md``.

<a id="activity_browser.bwutils.lca_inputs.demand_as_product_ids"></a>

#### demand\_as\_product\_ids

```python
def demand_as_product_ids(demand: dict) -> dict
```

Rewrite a functional-unit dict so keys are product datapackage ids.

<a id="activity_browser.bwutils.lca_inputs.demand_database_names"></a>

#### demand\_database\_names

```python
def demand_database_names(demand: dict) -> frozenset[str]
```

Database labels present in a functional-unit dict.

<a id="activity_browser.bwutils.lca_inputs.prepared_lca_inputs"></a>

#### prepared\_lca\_inputs

```python
def prepared_lca_inputs(demand: dict,
                        method: tuple | None = None,
                        **kwargs: Any)
```

Map a functional-unit demand to product keys and datapackage objects.

``functional_sqlite`` process datapackage ids are not in the product
dictionary. Always use the returned demand for ``LCA(...)`` and
``LCA.redo_lci`` — never pass process ids to ``redo_lci``.

<a id="activity_browser.bwutils.lca_inputs.lca_for_tree_selection"></a>

#### lca\_for\_tree\_selection

```python
def lca_for_tree_selection(
    *,
    has_scenarios: bool,
    mlca: Any,
    demand: dict,
    method,
    scenario_idx: int | None,
    method_idx: int,
    cached_lca: Any = None,
    cached_scope: frozenset[str] | None = None
) -> tuple[Any, frozenset[str] | None]
```

LCA object for the Tree tab's current reference flow / method / scenario.

With scenarios, reuse ``mlca.lca`` after ``update_lca_calculation_for_sankey``
(same as Sankey). Without scenarios, solve a private ``bc.LCA`` via
``prepared_lca_inputs`` (rebuild when demand databases change).

<a id="activity_browser.bwutils.lca_inputs.activity_direct_impacts"></a>

#### activity\_direct\_impacts

```python
def activity_direct_impacts(lca) -> dict[int, float]
```

Solved-inventory direct LCIA per activity datapackage id.
