**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `exports.lca_flow_coverage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m exports.lca_flow_coverage cfg.yml > exports.lca_flow_coverage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="exports.lca_flow_coverage"></a>

# exports.lca\_flow\_coverage

``LcaFlowCoverageExporter`` — write ``to_review/lca_flow_coverage.xlsx``.

One row per unique AGB biosphere LCA flow keyed by ``name`` (case-folded).
This matches the "2,318 unique flows" universe counted on the freshly
imported AGB CSV — collapsing compartment and unit variants of the same
substance. For every flow we record:

* whether any AGB exchange of this flow is linked (``yes`` / ``partial`` /
  ``no``) and the dominant target DB it lands on,
* the target flow it is mapped to (name, categories, CAS),
* its presence in each sheet of ``placeholder_flow_classification.xlsx``
  (``ei`` / ``ef`` / ``neither``) — so reviewers can see novel AGB flows
  the placeholder workbook does not yet cover.

A second sheet lists placeholder rows whose flow ``name`` does not appear
in the AGB universe at all (stale / removed flows).

Columns mirror the EI-sheet layout of ``MappingsComparisonExporter``
(name / categories / unit / code / cas / matched_* / match_type /
category_proxy_match) with ``linked`` and ``target_database`` added so
the unlinked dimension has somewhere to live.

<a id="exports.lca_flow_coverage._FlowRecord"></a>

## \_FlowRecord Objects

```python
@dataclass(frozen=True)
class _FlowRecord()
```

Aggregated view of every AGB biosphere exchange sharing one flow name.

<a id="exports.lca_flow_coverage._FlowRecord.name"></a>

#### name

<a id="exports.lca_flow_coverage._FlowRecord.units"></a>

#### units

<a id="exports.lca_flow_coverage._FlowRecord.categories"></a>

#### categories

<a id="exports.lca_flow_coverage._FlowRecord.cas"></a>

#### cas

<a id="exports.lca_flow_coverage._FlowRecord.n_exchanges"></a>

#### n\_exchanges

<a id="exports.lca_flow_coverage._FlowRecord.n_linked"></a>

#### n\_linked

<a id="exports.lca_flow_coverage._FlowRecord.target_counts"></a>

#### target\_counts

<a id="exports.lca_flow_coverage._FlowRecord.linked_label"></a>

#### linked\_label

```python
@property
def linked_label() -> str
```

<a id="exports.lca_flow_coverage._FlowRecord.dominant_target"></a>

#### dominant\_target

```python
@property
def dominant_target() -> tuple[str, str] | None
```

<a id="exports.lca_flow_coverage._FlowRecord.category_proxy_match"></a>

#### category\_proxy\_match

```python
@property
def category_proxy_match() -> bool
```

True when the source flow is observed in more than one compartment.

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter"></a>

## LcaFlowCoverageExporter Objects

```python
@dataclass(frozen=True)
class LcaFlowCoverageExporter()
```

Generate ``to_review/lca_flow_coverage.xlsx`` from ``sp.data``.

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.settings"></a>

#### settings

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.sp_data"></a>

#### sp\_data

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.COLUMNS"></a>

#### COLUMNS

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.WIDTHS"></a>

#### WIDTHS

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.PLACEHOLDER_ONLY_COLUMNS"></a>

#### PLACEHOLDER\_ONLY\_COLUMNS

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.PLACEHOLDER_ONLY_WIDTHS"></a>

#### PLACEHOLDER\_ONLY\_WIDTHS

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.BANNER_FILL"></a>

#### BANNER\_FILL

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.LINKED_FILL"></a>

#### LINKED\_FILL

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.PARTIAL_FILL"></a>

#### PARTIAL\_FILL

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.UNLINKED_FILL"></a>

#### UNLINKED\_FILL

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.PLACEHOLDER_ONLY_FILL"></a>

#### PLACEHOLDER\_ONLY\_FILL

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.PLACEHOLDER_SHEETS"></a>

#### PLACEHOLDER\_SHEETS

<a id="exports.lca_flow_coverage.LcaFlowCoverageExporter.export"></a>

#### export

```python
def export() -> Path
```
