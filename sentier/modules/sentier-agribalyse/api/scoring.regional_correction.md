**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `scoring.regional_correction` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m scoring.regional_correction cfg.yml > scoring.regional_correction.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="scoring.regional_correction"></a>

# scoring.regional\_correction

``RegionalCorrectionBuilder`` — per-activity correction row for one method.

The matrix scorer is built around a flat 1×N characterisation vector per
method (one CF per biosphere flow), multiplied as
``Q @ B @ supply``. Regional CFs (AWARE water consumption per ISO country)
break that assumption: the CF for an activity emitting flow F depends on
*which activity* (its location) emits it, not just on F.

To preserve the fast 1×N path for the 18 non-regional methods, we compute
a *per-activity correction vector* at build time::

    delta_vec[j] = Σ_i (regional_cf[i, location(j)] - global_cf[i]) × B[i, j]

so the score becomes ``(Q @ inventory) + (delta_vec @ supply)``. The
correction is contracted across biosphere rows at build time — at score
time it's an extra sparse dot product per method, indistinguishable in
shape from the regular characterisation step.

Methods without regional CFs simply don't get a correction row;
``ScoringPackage.corrections`` is keyed by method tuple and absent keys
mean "no correction needed".

<a id="scoring.regional_correction.RegionalCorrectionBuilder"></a>

## RegionalCorrectionBuilder Objects

```python
@dataclass(frozen=True)
class RegionalCorrectionBuilder()
```

Compose one method's per-activity correction row from regional CFs.

<a id="scoring.regional_correction.RegionalCorrectionBuilder.build"></a>

#### build

```python
def build(*, global_cf_df: pd.DataFrame, regional_cf_df: pd.DataFrame,
          biosphere: BuiltMatrix, technosphere: BuiltMatrix,
          col_id_to_location: dict[int, str]) -> sp.csr_matrix
```

Return a ``(1, n_activities)`` sparse correction row.

``global_cf_df`` columns: ``(flow_id int, cf float)``.
``regional_cf_df`` columns: ``(flow_id int, location str, cf float)``.
``col_id_to_location`` maps technosphere column ids (the
``output_id`` hash) to the activity's location string.
