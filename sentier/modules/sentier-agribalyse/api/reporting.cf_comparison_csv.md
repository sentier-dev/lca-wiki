**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.cf_comparison_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.cf_comparison_csv cfg.yml > reporting.cf_comparison_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.cf_comparison_csv"></a>

# reporting.cf\_comparison\_csv

CF-comparison data for the dashboard, built on the deterministic 1:1 join.

The CF-comparison tab compares the SimaPro adapted EF 3.1 CFs against the built
per-method registry CFs the scoring pipeline uses. The match is the
**per-flow 1:1 join** produced by :class:`ef.cf_flow_join.FlowLevelCfJoiner`:
every registry biosphere flow ``code`` is matched to *exactly one* SimaPro CF
(via full ``(method, name, compartment, sub_compartment)`` identity with
synonym / CAS / short-name fallbacks), so there are no "candidates" to choose
between — the multiplicity the old bucketed comparison produced was an artefact
of collapsing flows to a coarse compartment bucket.

Three classes, all OOP per ``CLAUDE.md`` (frozen dataclasses, DI, no
module-level behaviour):

* :class:`CfComparisonJoinBuilder` — turn the per-method ``JoinedFlowFrame``s
  into one flat join DataFrame (one row per ``(method, code)``), computing the
  SimaPro/registry compartment paths, the agree/differ status, and the
  disagreement metrics. This is the complete join (matched + registry-only),
  persisted to ``registry/cf_comparison_join.parquet`` for auditing.
* :class:`CfComparisonCsvEmitter` — project the join onto the dashboard CSV
  schema and write ``dashboard/cf_comparison.csv``. By default only the
  **matched** rows are written (the genuine molecule-to-molecule comparisons);
  registry-only rows live in the parquet.
* :class:`CfComparisonByCodeBuilder` — the per-``code`` SimaPro CF sidecar
  (``registry/cf_comparison_by_code.parquet``) consumed by
  :class:`reporting.SimaProCfLookup` for the flow-decomposition toggle.

How the match was made is surfaced as ``match_provenance`` (``exact_name`` /
``synonym`` / ``cas`` / ``short_name``) — the reconciliation signal showing
*which* SimaPro flow a registry flow resolved against.

<a id="reporting.cf_comparison_csv.AGREE_ABS"></a>

#### AGREE\_ABS

<a id="reporting.cf_comparison_csv.AGREE_REL"></a>

#### AGREE\_REL

<a id="reporting.cf_comparison_csv.STATUS_AGREE"></a>

#### STATUS\_AGREE

<a id="reporting.cf_comparison_csv.STATUS_DIFFER"></a>

#### STATUS\_DIFFER

<a id="reporting.cf_comparison_csv.STATUS_REGISTRY_ONLY"></a>

#### STATUS\_REGISTRY\_ONLY

<a id="reporting.cf_comparison_csv.CfComparisonJoinBuilder"></a>

## CfComparisonJoinBuilder Objects

```python
@dataclass(frozen=True)
class CfComparisonJoinBuilder()
```

Flatten per-method :class:`JoinedFlowFrame`s into the comparison join.

One row per ``(method, code)``. ``normaliser`` derives the coarse
compartment bucket from each registry flow's ``categories`` (reusing the
same context logic the joiner used to match), so the bucket the dashboard
filters on is consistent with how the flow was matched.

<a id="reporting.cf_comparison_csv.CfComparisonJoinBuilder.normaliser"></a>

#### normaliser

<a id="reporting.cf_comparison_csv.CfComparisonJoinBuilder.COLUMNS"></a>

#### COLUMNS

<a id="reporting.cf_comparison_csv.CfComparisonJoinBuilder.build"></a>

#### build

```python
def build(frames: Iterable[JoinedFlowFrame]) -> pd.DataFrame
```

<a id="reporting.cf_comparison_csv.UsedFlowFilter"></a>

## UsedFlowFilter Objects

```python
@dataclass(frozen=True)
class UsedFlowFilter()
```

Restrict a comparison join to flows the scoring pipeline actually uses.

The CF comparison enumerates the full CF *reference* table (every flow with a
CF, across the ``ecoinvent-3.9.1-biosphere`` and ``ef`` namespaces). Scoring
only ever touches the biosphere flows the linked Agribalyse inventory emits —
the rows of the scoring package's biosphere matrix. Those rows are keyed by
the deterministic ``(database, code)`` hash
(:meth:`scoring.exchange_frame_builder.ExchangeFrameBuilder.flow_id_for`), so
a join row is "used" iff ``flow_id_for((database, code))`` is one of the
package's biosphere row ids.

Build with :meth:`from_biosphere_row_ids` from a loaded
``ScoringPackage.biosphere.row_id_to_idx``; then :meth:`filter` a join frame.

<a id="reporting.cf_comparison_csv.UsedFlowFilter.used_flow_ids"></a>

#### used\_flow\_ids

<a id="reporting.cf_comparison_csv.UsedFlowFilter.from_biosphere_row_ids"></a>

#### from\_biosphere\_row\_ids

```python
@classmethod
def from_biosphere_row_ids(cls, row_id_to_idx: dict) -> UsedFlowFilter
```

<a id="reporting.cf_comparison_csv.UsedFlowFilter.mask"></a>

#### mask

```python
def mask(df: pd.DataFrame) -> pd.Series
```

<a id="reporting.cf_comparison_csv.UsedFlowFilter.filter"></a>

#### filter

```python
def filter(df: pd.DataFrame) -> pd.DataFrame
```

<a id="reporting.cf_comparison_csv.CfComparisonJoinLoader"></a>

## CfComparisonJoinLoader Objects

```python
@dataclass(frozen=True)
class CfComparisonJoinLoader()
```

Read ``registry/cf_comparison_join.parquet`` into a DataFrame.

<a id="reporting.cf_comparison_csv.CfComparisonJoinLoader.path"></a>

#### path

<a id="reporting.cf_comparison_csv.CfComparisonJoinLoader.load"></a>

#### load

```python
def load() -> pd.DataFrame
```

<a id="reporting.cf_comparison_csv.CfComparisonCsvEmitter"></a>

## CfComparisonCsvEmitter Objects

```python
@dataclass(frozen=True)
class CfComparisonCsvEmitter()
```

Project the CF comparison join onto the dashboard CSV schema.

By default only matched rows (``both_agree`` / ``both_differ``) are written —
the genuine molecule-to-molecule comparisons the tab is about. The complete
join (including ``registry_only`` flows) is kept in the parquet.

<a id="reporting.cf_comparison_csv.CfComparisonCsvEmitter.out_path"></a>

#### out\_path

<a id="reporting.cf_comparison_csv.CfComparisonCsvEmitter.matched_only"></a>

#### matched\_only

<a id="reporting.cf_comparison_csv.CfComparisonCsvEmitter.COLUMNS"></a>

#### COLUMNS

<a id="reporting.cf_comparison_csv.CfComparisonCsvEmitter.write"></a>

#### write

```python
def write(df: pd.DataFrame) -> Path
```

<a id="reporting.cf_comparison_csv.CfComparisonByCodeBuilder"></a>

## CfComparisonByCodeBuilder Objects

```python
@dataclass(frozen=True)
class CfComparisonByCodeBuilder()
```

Per-``code`` SimaPro CF sidecar for the flow-decomposition toggle.

One row per matched ``(method category, registry code)`` carrying the
SimaPro CF and how it was matched, in the schema
:class:`reporting.SimaProCfLookup` expects (``code, method, cf_simapro,
match_basis, name_simapro, name_registry``). Spans every method present in
``frames`` regardless of any display filter, so the toggle has full coverage.
Deduped on ``(method, code)`` keeping the first occurrence.

<a id="reporting.cf_comparison_csv.CfComparisonByCodeBuilder.COLUMNS"></a>

#### COLUMNS

<a id="reporting.cf_comparison_csv.CfComparisonByCodeBuilder.build"></a>

#### build

```python
def build(frames: Iterable[JoinedFlowFrame]) -> pd.DataFrame
```
