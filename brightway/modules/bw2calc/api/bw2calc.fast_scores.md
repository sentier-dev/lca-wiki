**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.fast_scores` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
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
  -I "$SP" -m bw2calc.fast_scores cfg.yml > bw2calc.fast_scores.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.fast_scores"></a>

# bw2calc.fast\_scores

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA"></a>

## FastScoresOnlyMultiLCA Objects

```python
class FastScoresOnlyMultiLCA(MultiLCA, FastSupplyArraysMixin)
```

Use chunking and pre-calculate as much as possible to optimize speed for multiple LCA
calculations.

If using pardiso via pypardiso:

- Feed multiple demands at once as a tensor into the solver function
- Skip some identity checks on the technosphere matrix

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, chunk_size: int = 50, **kwargs)
```

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.lci"></a>

#### lci

```python
def lci() -> None
```

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.lci_calculation"></a>

#### lci\_calculation

```python
def lci_calculation() -> None
```

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.lcia"></a>

#### lcia

```python
def lcia() -> None
```

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.lcia_calculation"></a>

#### lcia\_calculation

```python
def lcia_calculation() -> None
```

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.build_precalculated"></a>

#### build\_precalculated

```python
def build_precalculated() -> None
```

Multiply the characterization, and normalization and weighting matrices if present, by
the biosphere matrix. When done outside the calculation loop, this only needs to be done
once.

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.calculate"></a>

#### calculate

```python
def calculate() -> xarray.DataArray
```

The actual LCI calculation.

Separated from ``lci`` to be reusable in cases where the matrices are already built, e.g.
``redo_lci`` and Monte Carlo classes.

<a id="bw2calc.fast_scores.FastScoresOnlyMultiLCA.scores"></a>

#### scores
