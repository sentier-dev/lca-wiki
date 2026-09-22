**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.backtest.scorer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.backtest.scorer cfg.yml > sentier_brightway.backtest.scorer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.backtest.scorer"></a>

# sentier\_brightway.backtest.scorer

Score every process for every category with one adjoint solve per category.

score(j, m) = c_mᵀ B A⁻¹ e_j = (A⁻ᵀ Bᵀ c_m)_j, so solving Aᵀ X = Bᵀ C once (C = per-flow
factors, one column per category) gives all scores. Matrices and index dictionaries come
from a stock ``bw2calc.LCA`` built on the file-mode datapackages; the solve uses pypardiso
when importable and scipy's SuperLU otherwise, and is verified by its residual.

<a id="sentier_brightway.backtest.scorer.CHARACTERIZATION"></a>

#### CHARACTERIZATION

<a id="sentier_brightway.backtest.scorer.RESIDUAL_TOL"></a>

#### RESIDUAL\_TOL

relative residual ||Aᵀx - w|| / ||w|| accepted per category

<a id="sentier_brightway.backtest.scorer.LOOP_REL_TOL"></a>

#### LOOP\_REL\_TOL

adjoint vs plain-loop relative tolerance

<a id="sentier_brightway.backtest.scorer.LOOP_ABS_FRACTION"></a>

#### LOOP\_ABS\_FRACTION

absolute floor as a fraction of the column's largest magnitude

<a id="sentier_brightway.backtest.scorer.Scores"></a>

## Scores Objects

```python
@dataclass(frozen=True)
class Scores()
```

<a id="sentier_brightway.backtest.scorer.Scores.frame"></a>

#### frame

META_COLUMNS + one float column per category short

<a id="sentier_brightway.backtest.scorer.Scores.values"></a>

#### values

(n_processes, n_categories), NaN where the method is missing

<a id="sentier_brightway.backtest.scorer.Scores.solver"></a>

#### solver

<a id="sentier_brightway.backtest.scorer.Scores.elapsed_s"></a>

#### elapsed\_s

<a id="sentier_brightway.backtest.scorer.Scores.missing_methods"></a>

#### missing\_methods

<a id="sentier_brightway.backtest.scorer.score_all"></a>

#### score\_all

```python
def score_all(files_dir: Path | str, categories: tuple[Category,
                                                       ...]) -> Scores
```

Scores of 1 unit of every registry process for every category, via one adjoint
solve. Categories whose method datapackage is absent get a NaN column and are listed
in ``missing_methods``; ``ValueError`` if none is present or no category is given.

<a id="sentier_brightway.backtest.scorer.check_against_loop"></a>

#### check\_against\_loop

```python
def check_against_loop(files_dir: Path | str,
                       scores: Scores,
                       categories: tuple[Category, ...],
                       n: int = 3,
                       seed: int = 0,
                       rel: float = LOOP_REL_TOL) -> None
```

Recompute ``n`` random processes with the plain bw2calc demand loop; raise on mismatch.

Tolerances: the plain loop solves ``A x = e_j`` with scipy's forward solver, which is the
less accurate side (scipy and pardiso have been seen to disagree by up to 1.5e-7 relative
on small scores), hence ``rel = 1e-6`` by default. Each category also gets an absolute
floor of ``LOOP_ABS_FRACTION`` times the largest magnitude in its column, so scores near
zero are judged against the category's scale rather than their own tiny value.
Categories listed in ``scores.missing_methods`` (NaN columns) are skipped; a category
without a column in ``scores.frame`` is a ``ValueError``.
