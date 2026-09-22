**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.least_squares` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.least_squares cfg.yml > bw2calc.least_squares.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.least_squares"></a>

# bw2calc.least\_squares

<a id="bw2calc.least_squares.LeastSquaresLCA"></a>

## LeastSquaresLCA Objects

```python
class LeastSquaresLCA(LCA)
```

Solve overdetermined technosphere matrix with more products than activities using
least-squares approximation.

See also:

* `Multioutput processes in LCA <http://chris.mutel.org/multioutput.html>`_
* `LSMR in SciPy <http://docs.scipy.org/doc/scipy/reference/generated/scipy.sparse.linalg.lsmr.html#scipy.sparse.linalg.lsmr>`_  # noqa: E501
* `Another least-squares algorithm in SciPy <http://docs.scipy.org/doc/scipy/reference/generated/scipy.sparse.linalg.lsqr.html#scipy.sparse.linalg.lsqr>`_  # noqa: E501

<a id="bw2calc.least_squares.LeastSquaresLCA.load_lci_data"></a>

#### load\_lci\_data

```python
def load_lci_data() -> None
```

<a id="bw2calc.least_squares.LeastSquaresLCA.solve_linear_system"></a>

#### solve\_linear\_system

```python
def solve_linear_system(solver=lsmr) -> np.ndarray
```

<a id="bw2calc.least_squares.LeastSquaresLCA.decompose_technosphere"></a>

#### decompose\_technosphere

```python
def decompose_technosphere() -> None
```
