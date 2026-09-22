**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.run_report` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.run_report cfg.yml > reporting.run_report.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.run_report"></a>

# reporting.run\_report

``RunReport`` — collects every stage's stats, writes ``dashboard/run_report.json``.

<a id="reporting.run_report.RunReport"></a>

## RunReport Objects

```python
@dataclass
class RunReport()
```

Mutable accumulator. Serialise via ``write(path)``.

<a id="reporting.run_report.RunReport.settings_summary"></a>

#### settings\_summary

<a id="reporting.run_report.RunReport.stages"></a>

#### stages

<a id="reporting.run_report.RunReport.coverage"></a>

#### coverage

<a id="reporting.run_report.RunReport.drops_by_strategy"></a>

#### drops\_by\_strategy

<a id="reporting.run_report.RunReport.suppressed_strategies"></a>

#### suppressed\_strategies

<a id="reporting.run_report.RunReport.matrix_shape"></a>

#### matrix\_shape

<a id="reporting.run_report.RunReport.timestamp"></a>

#### timestamp

<a id="reporting.run_report.RunReport.add_stage"></a>

#### add\_stage

```python
def add_stage(name: str, payload: Any) -> None
```

<a id="reporting.run_report.RunReport.add_coverage"></a>

#### add\_coverage

```python
def add_coverage(snapshot) -> None
```

<a id="reporting.run_report.RunReport.set_drops"></a>

#### set\_drops

```python
def set_drops(totals: dict[str, int]) -> None
```

<a id="reporting.run_report.RunReport.set_suppressed"></a>

#### set\_suppressed

```python
def set_suppressed(totals: dict[str, int]) -> None
```

<a id="reporting.run_report.RunReport.set_matrix_shape"></a>

#### set\_matrix\_shape

```python
def set_matrix_shape(rows: int, cols: int) -> None
```

<a id="reporting.run_report.RunReport.write"></a>

#### write

```python
def write(path: Path) -> Path
```

<a id="reporting.run_report.RunReport.load"></a>

#### load

```python
@classmethod
def load(cls, path: Path) -> RunReport
```

Rehydrate from a previously written ``run_report.json``.

Used when a downstream stage (``--skip-linking`` end-to-end,
backtest re-runs) needs to *augment* the existing report rather
than start from scratch and clobber the scoring_package
metadata that ``dds-backtest`` and friends read back.

<a id="reporting.run_report.RunReport.as_dict"></a>

#### as\_dict

```python
def as_dict() -> dict[str, Any]
```
