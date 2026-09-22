**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `transforms.parameter_extraction` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m transforms.parameter_extraction cfg.yml > transforms.parameter_extraction.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="transforms.parameter_extraction"></a>

# transforms.parameter\_extraction

``ProcessParameterExtractor`` — lift process-local parameter definitions.

``bw_simapro_csv``'s ``lci_to_brightway`` exports only the database/project
parameter blocks — which are **empty** in the AGB 3.2 export. Every real
parameter is process-local (13 725 processes with input parameters, 1 422
with calculated parameters), living on ``Process.blocks["Input parameters"]``
/ ``["Calculated parameters"]`` and dropped from the brightway dicts.

This extractor walks ``SimaProCSV.blocks`` after resolution and captures the
definitions so they survive into ``ParsedSimaProCsv`` (and its pickle cache).
Names come in two forms:

* ``name`` — the normalized form referenced by exchange formulas
  (``ratio_ingredient1`` → ``SP_RATIO_INGREDIENT1``);
* ``original_name`` — the SimaPro-facing name users know
  (``Packaging_Weight``); matching is case-insensitive on this form.

<a id="transforms.parameter_extraction.ProcessParameterExtractor"></a>

## ProcessParameterExtractor Objects

```python
@dataclass(frozen=True)
class ProcessParameterExtractor()
```

Extract per-process parameter definitions from a parsed ``SimaProCSV``.

<a id="transforms.parameter_extraction.ProcessParameterExtractor.extract"></a>

#### extract

```python
def extract(spcsv: Any, bw_processes: list[dict] | None = None) -> list[dict]
```

Extract parameter rows, keyed by the emitted datasets' codes.

Two joins happen here, both against ``bw_processes`` (the
``lci_to_brightway`` output):

* **Parents.** ~700 AGB 3.2 processes have no ``Process
  identifier``; the export synthesises uuid4 codes that exist only
  on the output dicts. The export emits exactly one PARENT dataset
  per ``Process`` block, in block order (the multifunctional
  allocation step appends extra ``readonly_process`` children but
  never drops or reorders parents), so parent codes are joined by
  position — cross-checked on every identifier-carrying pair, and
  raising on any disagreement rather than mis-keying silently.
* **Children.** Multifunctional parents get per-product
  ``readonly_process`` children (uuid4 codes, ``mf_parent_key``
  linkage) whose exchange formulas embed the allocation factor
  textually — evaluating them with the PARENT's parameter
  environment reproduces their baked amounts. Each parent's rows
  are mirrored onto its children so overrides reach the allocated
  datasets too (without this, a stale child column can survive
  producer dedup and silently drop an override).

Without ``bw_processes`` (legacy callers/tests) it falls back to
the metadata identifier and skips identifier-less blocks.
