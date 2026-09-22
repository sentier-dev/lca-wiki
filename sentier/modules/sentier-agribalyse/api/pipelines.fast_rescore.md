**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `pipelines.fast_rescore` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m pipelines.fast_rescore cfg.yml > pipelines.fast_rescore.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pipelines.fast_rescore"></a>

# pipelines.fast\_rescore

``FastRescorePipeline`` — rebuild the scoring package without relinking.

The full ``dds-link-all`` run has two cost centres: (a) parse + transforms
+ matching/linking, and (b) the scoring-package emit (frame → allocator →
matrices → store). Parameter overrides change exchange *amounts* only, so
(a) is identity-invariant under any override — its output is the pristine
linked-graph snapshot ``LinkedSpCache`` writes (always BEFORE overrides
apply, so the cache is never override-tainted). This pipeline loads that
snapshot, applies the overrides store with the SAME
``ParameterOverridesApplier`` (ratio mode) the full path uses, and replays
the SAME emit stage (``LinkAllPipeline.emit_scoring_package``).

Both paths therefore share every override-relevant code path; a
zero-override fast run reproduces the baseline content hash (verified
live 2026-08-17: hash ``b54a0b1f…`` reproduced in 81s vs ~17min full),
and ratio-mode semantics are unit-pinned in
``tests/unit/test_transforms_parameter_reevaluator.py``.

<a id="pipelines.fast_rescore.FastRescorePipeline"></a>

## FastRescorePipeline Objects

```python
@dataclass
class FastRescorePipeline()
```

<a id="pipelines.fast_rescore.FastRescorePipeline.settings"></a>

#### settings

<a id="pipelines.fast_rescore.FastRescorePipeline.run"></a>

#### run

```python
def run() -> RunReport
```
