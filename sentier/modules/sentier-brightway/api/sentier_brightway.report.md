**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.report` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.report cfg.yml > sentier_brightway.report.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.report"></a>

# sentier\_brightway.report

What got linked, what did not, and the citation the user must carry.

<a id="sentier_brightway.report.Coverage"></a>

## Coverage Objects

```python
@dataclass(frozen=True)
class Coverage()
```

<a id="sentier_brightway.report.Coverage.flows_used"></a>

#### flows\_used

distinct BAFU flow codes appearing in biosphere exchanges

<a id="sentier_brightway.report.Coverage.flows_mapped"></a>

#### flows\_mapped

of those, relinked to an EF flow

<a id="sentier_brightway.report.Coverage.exchange_rows"></a>

#### exchange\_rows

biosphere exchange rows

<a id="sentier_brightway.report.Coverage.exchange_rows_mapped"></a>

#### exchange\_rows\_mapped

<a id="sentier_brightway.report.Coverage.residual_by_compartment"></a>

#### residual\_by\_compartment

(compartment, unmapped flow count)

<a id="sentier_brightway.report.Coverage.processes"></a>

#### processes

<a id="sentier_brightway.report.Coverage.methods"></a>

#### methods

<a id="sentier_brightway.report.Coverage.flows_nomenclature"></a>

#### flows\_nomenclature

<a id="sentier_brightway.report.Coverage.unit_conflicts"></a>

#### unit\_conflicts

<a id="sentier_brightway.report.Coverage.flow_share"></a>

#### flow\_share

```python
@property
def flow_share() -> float
```

<a id="sentier_brightway.report.Coverage.exchange_share"></a>

#### exchange\_share

```python
@property
def exchange_share() -> float
```

<a id="sentier_brightway.report.render"></a>

#### render

```python
def render(cov: Coverage) -> str
```
