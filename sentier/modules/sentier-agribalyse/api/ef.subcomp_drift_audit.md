**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.subcomp_drift_audit` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.subcomp_drift_audit cfg.yml > ef.subcomp_drift_audit.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.subcomp_drift_audit"></a>

# ef.subcomp\_drift\_audit

``MethodCfSubcompDriftAudit`` — surface JRC method+flow groups whose
CF varies materially across sub-compartments.

This is the §C.3 PM / climate diagnostic. Bw2io's snapshot inherits
CFs onto bio3 codes by name; when JRC's CF on a flow varies between
sub-compartments (e.g. PM2.5 ranges from 0 long-term to 2.4e-4 urban-
close-to-ground — factor ~∞ across sub-comps), any inheritance that
collapses to the unspecified-fallback CF will skew scoring relative to
JRC's intended sub-comp-specific characterisation.

The audit lists every (method, FLOW_name) group whose ``max_cf / min_cf``
exceeds a configurable threshold (default 2.0×). Reviewers cross-check
the matrix's actual bio3 sub-comp targets to find rows the snapshot
mis-CFed.

<a id="ef.subcomp_drift_audit.MethodCfSubcompDriftAudit"></a>

## MethodCfSubcompDriftAudit Objects

```python
@dataclass(frozen=True)
class MethodCfSubcompDriftAudit()
```

Per-method (FLOW_name) audit of CF spread across sub-compartments.

<a id="ef.subcomp_drift_audit.MethodCfSubcompDriftAudit.ef_cf_table"></a>

#### ef\_cf\_table

<a id="ef.subcomp_drift_audit.MethodCfSubcompDriftAudit.candidates"></a>

#### candidates

```python
def candidates(*, method_name: str, min_ratio: float = 2.0) -> pd.DataFrame
```

Return one row per FLOW_name with sub-comp CF spread ≥ ``min_ratio``.

Columns:
* ``FLOW_name`` — the JRC flow name.
* ``min_cf`` / ``max_cf`` — CF range across sub-compartments
  for this method.
* ``n_subcomps`` — count of distinct sub-comps with rows.
* ``ratio`` — ``max_cf / min_cf`` if ``min_cf > 0`` else ``inf``.

Sorted by ratio descending so the most-variant flows surface
first.
