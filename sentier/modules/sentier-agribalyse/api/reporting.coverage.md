**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.coverage` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.coverage cfg.yml > reporting.coverage.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.coverage"></a>

# reporting.coverage

``CoverageReporter`` — pre-purge and post-purge biosphere/technosphere link rates.

Closes fix 1.h: report both states so the user sees what survived the
matrix-squareness purge. After REFACTOR_FINAL F5 there's no on-disk DB
walk left — coverage is computed from the in-memory ``sp.data`` only.

<a id="reporting.coverage.CoverageSnapshot"></a>

## CoverageSnapshot Objects

```python
@dataclass(frozen=True)
class CoverageSnapshot()
```

<a id="reporting.coverage.CoverageSnapshot.label"></a>

#### label

<a id="reporting.coverage.CoverageSnapshot.bio_total"></a>

#### bio\_total

<a id="reporting.coverage.CoverageSnapshot.bio_linked"></a>

#### bio\_linked

<a id="reporting.coverage.CoverageSnapshot.tech_total"></a>

#### tech\_total

<a id="reporting.coverage.CoverageSnapshot.tech_linked"></a>

#### tech\_linked

<a id="reporting.coverage.CoverageSnapshot.bio_rate"></a>

#### bio\_rate

```python
@property
def bio_rate() -> float
```

<a id="reporting.coverage.CoverageSnapshot.tech_rate"></a>

#### tech\_rate

```python
@property
def tech_rate() -> float
```

<a id="reporting.coverage.CoverageSnapshot.as_dict"></a>

#### as\_dict

```python
def as_dict() -> dict
```

<a id="reporting.coverage.CoverageReporter"></a>

## CoverageReporter Objects

```python
@dataclass(frozen=True)
class CoverageReporter()
```

Compute coverage from an in-memory ``sp.data`` snapshot.

<a id="reporting.coverage.CoverageReporter.from_sp_data"></a>

#### from\_sp\_data

```python
@staticmethod
def from_sp_data(label: str, sp_data: list[dict]) -> CoverageSnapshot
```
