**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `ef.simapro_jrc_delta` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m ef.simapro_jrc_delta cfg.yml > ef.simapro_jrc_delta.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="ef.simapro_jrc_delta"></a>

# ef.simapro\_jrc\_delta

``SimaProJrcDeltaAudit`` — surface (sp_method_root, flow_name) pairs
that SimaPro EF 3.1 (adapted) characterises but JRC EF v3.1 does not.

This is the §A.5 sweep tool. The Barite case (§A.1) is the exemplar:
SimaPro carries Barite ecotox at CF=322.16 across 8 rows; JRC has zero
matching rows. Without dropping it, the CF leaks through aluminium-can
and duck-farming chains and inflates ecotox scores.

The output is a *candidate list*. Whether to add a given pair to
``SimaProCfFilter.EXCLUDED_FLOW_NAMES_BY_SP_METHOD`` requires backtest
evidence that the flow appears in the matrix with non-zero mass on at
least one AGB-side product and that dropping the SimaPro CF improves
a dominated outlier without regressing any clean product.

<a id="ef.simapro_jrc_delta.SimaProJrcDeltaAudit"></a>

## SimaProJrcDeltaAudit Objects

```python
@dataclass(frozen=True)
class SimaProJrcDeltaAudit()
```

Compute (sp_method_root, flow_name) pairs in SimaPro but not JRC.

<a id="ef.simapro_jrc_delta.SimaProJrcDeltaAudit.simapro_table"></a>

#### simapro\_table

<a id="ef.simapro_jrc_delta.SimaProJrcDeltaAudit.ef_cf_table"></a>

#### ef\_cf\_table

<a id="ef.simapro_jrc_delta.SimaProJrcDeltaAudit.SUBMETHOD_SUFFIXES"></a>

#### SUBMETHOD\_SUFFIXES

<a id="ef.simapro_jrc_delta.SimaProJrcDeltaAudit.candidates"></a>

#### candidates

```python
def candidates() -> pd.DataFrame
```

Return the audit DataFrame.

Columns:
* ``sp_method_root`` — SimaPro method root (post sub-method fold).
* ``flow_name_lower`` — flow name, lowercased + stripped.
* ``max_abs_cf`` — max |CF| across SimaPro rows for that pair.
* ``our_category`` / ``our_indicator`` — our (category, indicator)
  tuple if the SimaPro method is known, else None.
* ``jrc_method`` — the JRC ``LCIAMethod_name`` we intersected
  against (resolved from ``METHOD_TO_OUR_KEY`` reversed).
* ``in_jrc`` — always False here (rows present in JRC are filtered out).
