**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `reporting.flow_decomposition` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m reporting.flow_decomposition cfg.yml > reporting.flow_decomposition.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="reporting.flow_decomposition"></a>

# reporting.flow\_decomposition

``FlowDecompositionEmitter`` — per-product, per-method flow JSONs.

For every mapped product in the backtest scores frame, decomposes the
score under each registered method into per-biosphere-flow contributions
(pre-CF ``inventory`` × ``cf`` = post-CF ``contribution``), truncates to
``top_n`` rows by ``|contribution|``, joins the biosphere catalog for
per-flow units, and writes one JSON per product to ``out_dir``. The
dashboard fetches these lazily when a user clicks a (product, method)
cell.

By design the emitter is a thin orchestrator on top of
:class:`scoring.decomposer.ScoreDecomposer`: the decomposer carries the
LU factorisation cache so iterating products × 19 methods costs roughly
one solve per product. The biosphere catalog is consumed only for the
``unit`` column.

OOP-only per ``CLAUDE.md``: frozen dataclass, dependencies injected,
no module-level helpers.

<a id="reporting.flow_decomposition.FlowDecompositionEmitter"></a>

## FlowDecompositionEmitter Objects

```python
@dataclass(frozen=True)
class FlowDecompositionEmitter()
```

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.decomposer"></a>

#### decomposer

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.biosphere_catalog"></a>

#### biosphere\_catalog

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.method_short_to_full"></a>

#### method\_short\_to\_full

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.out_dir"></a>

#### out\_dir

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.top_n"></a>

#### top\_n

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.simapro_cf"></a>

#### simapro\_cf

<a id="reporting.flow_decomposition.FlowDecompositionEmitter.write"></a>

#### write

```python
def write(scores_df: pd.DataFrame) -> Path
```

Emit one JSON per mapped product in ``scores_df``.

Expected columns: ``Code AGB`` (product code, str/int),
``Nom du Produit`` (display name), ``mapped`` (bool filter).
Rows with ``mapped=False`` are skipped silently.
