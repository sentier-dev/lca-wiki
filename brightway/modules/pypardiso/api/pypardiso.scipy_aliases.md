**Generated API reference** · package `pypardiso` 0.4.7 · module `pypardiso.scipy_aliases` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'pypardiso==0.4.7'
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
  -I "$SP" -m pypardiso.scipy_aliases cfg.yml > pypardiso.scipy_aliases.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="pypardiso.scipy_aliases"></a>

# pypardiso.scipy\_aliases

<a id="pypardiso.scipy_aliases.pypardiso_solver"></a>

#### pypardiso\_solver

<a id="pypardiso.scipy_aliases.spsolve"></a>

#### spsolve

```python
def spsolve(A,
            b,
            factorize=True,
            squeeze=True,
            solver=pypardiso_solver,
            *args,
            **kwargs)
```

This function mimics scipy.sparse.linalg.spsolve, but uses the Pardiso solver instead of SuperLU/UMFPACK

    solve Ax=b for x

    --- Parameters ---
    A: sparse square CSR or CSC matrix (scipy.sparse.csr.csr_matrix)
    b: numpy ndarray
       right-hand side(s), b.shape[0] needs to be the same as A.shape[0]
    factorize: boolean, default True
               matrix A is factorized by default, so the factorization can be reused
    squeeze: default True
             strange quirk of scipy spsolve, which always returns x.squeeze(), this
             feature in order to keep it compatible with implementations that rely on
             this behaviour
    solver: instance of PyPardisoSolver, default pypardiso_solver
            you can supply your own instance of PyPardisoSolver, but using several instances
            of PyPardisoSolver in parallel can lead to errors

    --- Returns ---
    x: numpy ndarray
       solution of the system of linear equations, same shape as b (but returnsshape (n,) if b has shape (n,1))

    --- Notes ---
    The computation time increases only minimally if the factorization and the solve phase are carried out
    in two steps, therefore it is factorized by default. Subsequent calls to spsolve with the same matrix A
    will be drastically faster. This makes the "factorized" method obsolete, but it is kept for compatibility.

<a id="pypardiso.scipy_aliases.factorized"></a>

#### factorized

```python
def factorized(A, solver=pypardiso_solver, *args, **kwargs)
```

This function mimics scipy.sparse.linalg.factorized, but uses the Pardiso solver instead of SuperLU/UMFPACK

    --- Parameters ---
    A: sparse square CSR or CSC matrix (scipy.sparse.csr.csr_matrix)

    --- Returns ---
    solve_b: callable
             an array b passed to this callable returns the solution to Ax=b

    --- Notes ---
    The returned callable will store a copy of matrix A. This ensures correct results even when the solver
    was used for other tasks in between calls to the returned callable. The factorization is however not
    stored and the first call will take longer.
    Don't use the factorized method for very large matrices, because it needs to keep an additional copy of
    A in memory.
    !!! Use spsolve directly whenever possible !!! Contrary to the scipy implementation there is no performance
    gain in PyPardiso by using factorized instead of spsolve.
