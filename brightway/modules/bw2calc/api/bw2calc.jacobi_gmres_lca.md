**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.jacobi_gmres_lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.jacobi_gmres_lca cfg.yml > bw2calc.jacobi_gmres_lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.jacobi_gmres_lca"></a>

# bw2calc.jacobi\_gmres\_lca

<a id="bw2calc.jacobi_gmres_lca.JacobiGMRESLCA"></a>

## JacobiGMRESLCA Objects

```python
class JacobiGMRESLCA(LCA)
```

Solve ``Ax=b`` with GMRES using a Jacobi preconditioner.

The preconditioner is the inverse of the technosphere diagonal, i.e. ``D^-1``.
This prior decomposition can significantly improve convergence for certain types of
matrices, especially those with dominant diagonal entries.

**Arguments**:

- `demand` (`dict`): Functional unit mapping passed through to :class:`bw2calc.lca.LCA`.
- `data_objs` (`iterable`): Datapackages passed through to :class:`bw2calc.lca.LCA`.
- `rtol` (`float`): Relative tolerance for GMRES convergence. Convergence is checked against a threshold
comparable to ``max(rtol * ||b||, atol)``.
- `atol` (`float`): Absolute tolerance floor for GMRES convergence.
- `restart` (`int or None`): Number of iterations between GMRES restarts. ``None`` uses SciPy defaults.
- `maxiter` (`int or None`): Maximum number of outer GMRES iterations.
- `use_guess` (`bool`): If ``True``, reuse the previous solution as ``x0`` for subsequent solves in the same
instance.

<a id="bw2calc.jacobi_gmres_lca.JacobiGMRESLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args,
             rtol: float = 1e-8,
             atol: float = 0.0,
             restart: Optional[int] = 50,
             maxiter: Optional[int] = 300,
             use_guess: bool = True,
             **kwargs)
```

<a id="bw2calc.jacobi_gmres_lca.JacobiGMRESLCA.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="bw2calc.jacobi_gmres_lca.JacobiGMRESLCA.load_lci_data"></a>

#### load\_lci\_data

```python
def load_lci_data(nonsquare_ok=False) -> None
```

<a id="bw2calc.jacobi_gmres_lca.JacobiGMRESLCA.solve_linear_system"></a>

#### solve\_linear\_system

```python
def solve_linear_system(demand: Optional[np.ndarray] = None) -> np.ndarray
```
