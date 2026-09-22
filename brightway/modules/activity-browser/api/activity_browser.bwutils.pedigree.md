**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.pedigree` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.pedigree cfg.yml > activity_browser.bwutils.pedigree.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.pedigree"></a>

# activity\_browser.bwutils.pedigree

Code in `pedigree.py` is taken wholesale from the https://bitbucket.org/cmutel/pedigree-matrix/src repository,
which is published by Chris Mutel under an MIT license (2012).

FUTURE WORK?
'The application of the pedigree approach to the distributions foreseen in ecoinvent v3'
(doi: 10.1007/s11367-014-0759-5) reveals the formulas used to convert the calculated sigma
(+ geometric standard deviation) into the coefficient of variation ('CV').
In turn, this CV can then be used to generate required values for a number of other uncertainty distributions.

Any additions made should improve the transition of the calculated sigma (or Geometric Standard Deviation/GSD)
smoothly into the related uncertainty distributions.

<a id="activity_browser.bwutils.pedigree.VERSION_2"></a>

#### VERSION\_2

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix"></a>

## PedigreeMatrix Objects

```python
class PedigreeMatrix(object)
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.__slots__"></a>

#### \_\_slots\_\_

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.labels"></a>

#### labels

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.from_numbers"></a>

#### from\_numbers

```python
@classmethod
def from_numbers(cls, data: tuple) -> "PedigreeMatrix"
```

Takes a tuple of integers and construct a PedigreeMatrix.

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.from_dict"></a>

#### from\_dict

```python
@classmethod
def from_dict(cls, data: dict) -> "PedigreeMatrix"
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.from_bw_object"></a>

#### from\_bw\_object

```python
@classmethod
def from_bw_object(cls, obj) -> "PedigreeMatrix"
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.calculate"></a>

#### calculate

```python
def calculate(basic_uncertainty: float = 1.0,
              as_geometric_sigma: bool = False) -> float
```

Calculates the sigma or geometric standard deviation from the factors.

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.get_values"></a>

#### get\_values

```python
def get_values() -> list
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.factors_as_tuple"></a>

#### factors\_as\_tuple

```python
def factors_as_tuple()
```

<a id="activity_browser.bwutils.pedigree.PedigreeMatrix.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__() -> str
```

<a id="activity_browser.bwutils.pedigree.SCORE_KEYS"></a>

#### SCORE\_KEYS

<a id="activity_browser.bwutils.pedigree.BASIC_UNCERTAINTY_KEY"></a>

#### BASIC\_UNCERTAINTY\_KEY

<a id="activity_browser.bwutils.pedigree.infer_basic_uncertainty"></a>

#### infer\_basic\_uncertainty

```python
def infer_basic_uncertainty(recipe: dict, scale: float) -> float | None
```

Recover basic uncertainty from a lognormal scale and pedigree scores.

Inverse of ``PedigreeMatrix.calculate``. Returns ``None`` when scores are
unusable or the scale is tighter than the scores alone allow.

<a id="activity_browser.bwutils.pedigree.recipe_is_usable"></a>

#### recipe\_is\_usable

```python
def recipe_is_usable(recipe: dict | None) -> bool
```

<a id="activity_browser.bwutils.pedigree.recipe_for_storage"></a>

#### recipe\_for\_storage

```python
def recipe_for_storage(recipe: dict, stored: dict | None = None) -> dict
```

<a id="activity_browser.bwutils.pedigree.pedigree_scores_suffix"></a>

#### pedigree\_scores\_suffix

```python
def pedigree_scores_suffix(recipe: dict | None) -> str
```

Cell text for stored scores (not basic uncertainty). Empty if unusable.

<a id="activity_browser.bwutils.pedigree.display_basic_uncertainty"></a>

#### display\_basic\_uncertainty

```python
def display_basic_uncertainty(recipe: dict | None, *, scale: float,
                              uncertainty_type: int) -> float
```

Basic uncertainty to show in the dialog: stored, else inferred, else 1.

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession"></a>

## PedigreeEditSession Objects

```python
class PedigreeEditSession()
```

In-dialog pedigree mode: check/uncheck/clear without Qt.

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.__init__"></a>

#### \_\_init\_\_

```python
def __init__(sampled: dict, stored: dict | None)
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.check_use"></a>

#### check\_use

```python
def check_use() -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.uncheck_use"></a>

#### uncheck\_use

```python
def uncheck_use() -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.stop_using_keep_sampled"></a>

#### stop\_using\_keep\_sampled

```python
def stop_using_keep_sampled() -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.clear"></a>

#### clear

```python
def clear() -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.edit_recipe"></a>

#### edit\_recipe

```python
def edit_recipe(recipe: dict) -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.set_sampled"></a>

#### set\_sampled

```python
def set_sampled(sampled: dict) -> None
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditSession.outcome"></a>

#### outcome

```python
def outcome() -> dict
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditResult"></a>

## PedigreeEditResult Objects

```python
class PedigreeEditResult(NamedTuple)
```

<a id="activity_browser.bwutils.pedigree.PedigreeEditResult.write"></a>

#### write

<a id="activity_browser.bwutils.pedigree.PedigreeEditResult.delete"></a>

#### delete

<a id="activity_browser.bwutils.pedigree.resolve_pedigree_edit"></a>

#### resolve\_pedigree\_edit

```python
def resolve_pedigree_edit(stored: dict | None,
                          outcome: dict) -> PedigreeEditResult
```

Decide sampled-uncertainty writes and pedigree deletes from a dialog outcome.
