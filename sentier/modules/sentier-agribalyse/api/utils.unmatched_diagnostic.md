**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `utils.unmatched_diagnostic` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m utils.unmatched_diagnostic cfg.yml > utils.unmatched_diagnostic.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="utils.unmatched_diagnostic"></a>

# utils.unmatched\_diagnostic

Replay ``BiosphereMatcher`` candidate selection on residual unlinked flows.

When ``unlinked/biosphere_unlinked.xlsx`` shows a flow that is "stuck",
this module walks the same registry/tier/catalog logic the matcher uses
and explains, per candidate, why it did or didn't link. Designed as a
permanent OOP utility (not a one-off scratch script) so the same checks
can be rerun whenever the registry or matcher behaviour changes.

Construction is dependency-injected: pass an already-loaded
``MappingRegistry`` and ``BiosphereCatalog``, and the diagnostic walks
each requested ``(name, unit, top_cat, sub_cat)`` tuple. Tests inject
in-memory fakes; the linking pipeline can dispatch a CLI run after
``dds-link-all`` for an audit log.

<a id="utils.unmatched_diagnostic.UnmatchedInputRow"></a>

## UnmatchedInputRow Objects

```python
@dataclass(frozen=True)
class UnmatchedInputRow()
```

One row from the unlinked-biosphere artifact.

<a id="utils.unmatched_diagnostic.UnmatchedInputRow.name"></a>

#### name

<a id="utils.unmatched_diagnostic.UnmatchedInputRow.unit"></a>

#### unit

<a id="utils.unmatched_diagnostic.UnmatchedInputRow.top_cat"></a>

#### top\_cat

<a id="utils.unmatched_diagnostic.UnmatchedInputRow.sub_cat"></a>

#### sub\_cat

<a id="utils.unmatched_diagnostic.UnmatchedInputRow.bucket"></a>

#### bucket

```python
@property
def bucket() -> Bucket
```

<a id="utils.unmatched_diagnostic.CandidateTrace"></a>

## CandidateTrace Objects

```python
@dataclass(frozen=True)
class CandidateTrace()
```

How one registry candidate fared during simulation.

<a id="utils.unmatched_diagnostic.CandidateTrace.tier"></a>

#### tier

<a id="utils.unmatched_diagnostic.CandidateTrace.provenance"></a>

#### provenance

<a id="utils.unmatched_diagnostic.CandidateTrace.target_db"></a>

#### target\_db

<a id="utils.unmatched_diagnostic.CandidateTrace.target_code"></a>

#### target\_code

<a id="utils.unmatched_diagnostic.CandidateTrace.target_name"></a>

#### target\_name

<a id="utils.unmatched_diagnostic.CandidateTrace.target_unit"></a>

#### target\_unit

<a id="utils.unmatched_diagnostic.CandidateTrace.is_unmatchable"></a>

#### is\_unmatchable

<a id="utils.unmatched_diagnostic.CandidateTrace.outcome"></a>

#### outcome

"match" | "target_unresolved" | "unit_mismatch" | "skipped" | "halt_unmatchable"

<a id="utils.unmatched_diagnostic.CandidateTrace.resolved_db"></a>

#### resolved\_db

<a id="utils.unmatched_diagnostic.CandidateTrace.resolved_code"></a>

#### resolved\_code

<a id="utils.unmatched_diagnostic.CandidateTrace.resolved_unit"></a>

#### resolved\_unit

<a id="utils.unmatched_diagnostic.CandidateTrace.multiplier"></a>

#### multiplier

<a id="utils.unmatched_diagnostic.CandidateTrace.detail_lines"></a>

#### detail\_lines

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome"></a>

## UnmatchedFlowOutcome Objects

```python
@dataclass(frozen=True)
class UnmatchedFlowOutcome()
```

End-to-end outcome for one input flow.

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.row"></a>

#### row

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.candidates"></a>

#### candidates

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.matched"></a>

#### matched

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.final_target_db"></a>

#### final\_target\_db

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.final_target_code"></a>

#### final\_target\_code

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.final_multiplier"></a>

#### final\_multiplier

<a id="utils.unmatched_diagnostic.UnmatchedFlowOutcome.status"></a>

#### status

```python
@property
def status() -> str
```

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticReport"></a>

## UnmatchedDiagnosticReport Objects

```python
@dataclass(frozen=True)
class UnmatchedDiagnosticReport()
```

Aggregate report across many ``UnmatchedFlowOutcome`` rows.

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticReport.outcomes"></a>

#### outcomes

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticReport.render_text"></a>

#### render\_text

```python
def render_text() -> str
```

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticReport.status_counts"></a>

#### status\_counts

```python
def status_counts() -> dict[str, int]
```

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic"></a>

## UnmatchedFlowDiagnostic Objects

```python
@dataclass(frozen=True)
class UnmatchedFlowDiagnostic()
```

Replay the matcher's candidate logic on a list of unlinked flows.

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic.settings"></a>

#### settings

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic.registry"></a>

#### registry

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic.catalog"></a>

#### catalog

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic.diagnose_many"></a>

#### diagnose\_many

```python
def diagnose_many(rows: list[UnmatchedInputRow]) -> UnmatchedDiagnosticReport
```

<a id="utils.unmatched_diagnostic.UnmatchedFlowDiagnostic.diagnose"></a>

#### diagnose

```python
def diagnose(row: UnmatchedInputRow) -> UnmatchedFlowOutcome
```

<a id="utils.unmatched_diagnostic.UnlinkedXlsxLoader"></a>

## UnlinkedXlsxLoader Objects

```python
@dataclass(frozen=True)
class UnlinkedXlsxLoader()
```

Read the unlinked-biosphere artifact into ``UnmatchedInputRow``s.

<a id="utils.unmatched_diagnostic.UnlinkedXlsxLoader.path"></a>

#### path

<a id="utils.unmatched_diagnostic.UnlinkedXlsxLoader.read"></a>

#### read

```python
def read() -> list[UnmatchedInputRow]
```

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticRunner"></a>

## UnmatchedDiagnosticRunner Objects

```python
@dataclass(frozen=True)
class UnmatchedDiagnosticRunner()
```

Convenience: discover everything from ``Settings`` and produce a report.

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticRunner.settings"></a>

#### settings

<a id="utils.unmatched_diagnostic.UnmatchedDiagnosticRunner.run"></a>

#### run

```python
def run(unlinked_xlsx: Path | None = None) -> UnmatchedDiagnosticReport
```
