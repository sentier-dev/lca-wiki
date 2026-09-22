**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `exports.cf_comparison` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m exports.cf_comparison cfg.yml > exports.cf_comparison.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="exports.cf_comparison"></a>

# exports.cf\_comparison

``CfComparisonExporter`` — diff our EF v3.1 CFs against the SimaPro export.

For each EF method we ship (one of the 19 keys in
``MethodCfRegistryBuilder.EF_METHOD_MAP``), this exporter:

1. Loads the built per-method CF parquet from ``registry/method_cfs/<slug>/``.
2. Loads the corresponding SimaPro CFs (parsed from the XLSX export) for
   the same method, including the ``- inorganics``/``- organics``
   sub-methods that SimaPro keeps separate.
3. Joins the two by ``(name, top-level compartment)`` and computes the
   per-flow CF ratio.

Output (one parquet per method under
``to_review/cf_comparison/<slug>.parquet``) carries:

    name           : flow name (canonical, lowercased)
    top            : top-level compartment (air, water, soil, raw, …)
    ours_count     : number of CF rows in our parquet for this (name, top)
    ours_mean      : mean CF amount in our parquet
    sp_count       : same for SimaPro
    sp_mean        : same for SimaPro
    ratio          : ours_mean / sp_mean (NaN if either side missing)
    status         : 'match' (ratio ∈ [0.99, 1.01]),
                     'differ' (both sides have a CF but values diverge),
                     'only_ours', 'only_sp'

A single ``_summary.parquet`` carries one row per method with counts of
each status — useful as a top-level FIX_DATA dashboard.

This is a build-time tool. It is not part of ``dds-link-all``; invoke it
explicitly via the ``dds-mappings-comparison`` family of CLIs (a future
``dds-cf-comparison`` should drive this class).

<a id="exports.cf_comparison.CfComparisonExporter"></a>

## CfComparisonExporter Objects

```python
@dataclass(frozen=True)
class CfComparisonExporter()
```

Per-method CF diff: our EF v3.1 CF parquet vs SimaPro EF 3.1 (adapted).

<a id="exports.cf_comparison.CfComparisonExporter.settings"></a>

#### settings

<a id="exports.cf_comparison.CfComparisonExporter.OUT_SUBDIR"></a>

#### OUT\_SUBDIR

<a id="exports.cf_comparison.CfComparisonExporter.MATCH_TOL"></a>

#### MATCH\_TOL

±1% counts as 'match'

<a id="exports.cf_comparison.CfComparisonExporter.export"></a>

#### export

```python
def export() -> Path
```

Materialise per-method comparison parquets + summary.
