**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.solvers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.solvers cfg.yml > bw_timex.solvers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.solvers"></a>

# bw\_timex.solvers

Sparse solvers for per-block background solving.

`bw_timex` solves one diagonal block of the technosphere at a time, many
times over. Blocks are solved iteratively (`_IterativeBlockSolver`, a
Jacobi-preconditioned Neumann series, no factorization); the LU backends
below are the fallback for blocks that series cannot handle, and what a
caller gets when it does not pass `allow_iterative`.

Three LU backends, in preference order:

- `pardiso` (Intel MKL, via `pypardiso`): the only one that takes a 2-D
  right-hand side into a single native call with `nrhs > 1`.
- `umfpack` (`scikits.umfpack`, through SciPy's `factorized`): a persistent
  LU per block, but its closure rejects a 2-D RHS, so columns are looped.
- `superlu` (SciPy's built-in): `splu` gives a persistent LU and takes a 2-D
  RHS, and is always available.

Pardiso's advantage is confined to the batched path. Its factorization lives
in MKL's single global slot, so a caller that alternates between blocks with
separate right-hand sides re-factorizes on every hop; such callers ask for
`make_persistent_block_solver` instead, which guarantees a per-object LU.

<a id="bw_timex.solvers.BACKENDS"></a>

#### BACKENDS

<a id="bw_timex.solvers.ITERATIVE_RTOL"></a>

#### ITERATIVE\_RTOL

<a id="bw_timex.solvers.ITERATIVE_RESIDUAL_TOL"></a>

#### ITERATIVE\_RESIDUAL\_TOL

<a id="bw_timex.solvers.ITERATIVE_MAX_ITERATIONS"></a>

#### ITERATIVE\_MAX\_ITERATIONS

<a id="bw_timex.solvers.ITERATIVE_DIVERGENCE_PATIENCE"></a>

#### ITERATIVE\_DIVERGENCE\_PATIENCE

<a id="bw_timex.solvers.SolverPerformanceWarning"></a>

## SolverPerformanceWarning Objects

```python
class SolverPerformanceWarning(UserWarning)
```

A faster sparse solver could be installed on this machine.

<a id="bw_timex.solvers.reset_warning_state"></a>

#### reset\_warning\_state

```python
def reset_warning_state() -> None
```

Forget that the warning was already emitted. For tests.

<a id="bw_timex.solvers.pardiso_available"></a>

#### pardiso\_available

```python
def pardiso_available() -> bool
```

True when MKL Pardiso is importable *and* `mkl_rt` actually loaded.

Probed through `bw2calc`, which performs the same import and catches the
`ImportError` that `PyPardisoSolver.__init__` raises when it cannot find
`mkl_rt`. Sharing the probe keeps `bw_timex` and `bw2calc` from
disagreeing about what is installed.

<a id="bw_timex.solvers.umfpack_available"></a>

#### umfpack\_available

```python
def umfpack_available() -> bool
```

True when `scikits.umfpack` imports.

Probed by import, not by reading `scipy.sparse.linalg._dsolve.linsolve`'s
`noScikit` / `useUmfpack`: both are private, and `useUmfpack` is a
thread-local object in current SciPy.

<a id="bw_timex.solvers.backend_available"></a>

#### backend\_available

```python
def backend_available(name: str) -> bool
```

Whether `name`'s underlying library is actually usable on this machine.

<a id="bw_timex.solvers.require_backend"></a>

#### require\_backend

```python
def require_backend(name: str) -> str
```

Return `name`, or raise if the machine cannot actually provide it.

An unavailable backend must never be returned. SciPy's `factorized`
silently hands back a SuperLU closure when `scikits.umfpack` is missing,
so an unverified `umfpack` request produces an object that *reports*
umfpack while solving with SuperLU - a silent, platform-dependent
degradation indistinguishable from the bug this module exists to remove.

<a id="bw_timex.solvers.select_backend"></a>

#### select\_backend

```python
def select_backend(override: Optional[str] = None) -> str
```

Name of the block-solver backend to use.

`override`, else `BW_TIMEX_BLOCK_SOLVER`, else the best available. A
requested backend is verified, not taken on trust: an unknown name raises
`ValueError`, a known but unavailable one `RuntimeError`.

<a id="bw_timex.solvers.suitesparse_present"></a>

#### suitesparse\_present

```python
def suitesparse_present() -> bool
```

Whether the SuiteSparse C library looks installed on this system.

Only used to sharpen the advice below. `scikit-umfpack` is a *binding*
to this library and a separate install, and conflating the two is the
likeliest way for someone who has done half the job to be told to do the
half they already did.

<a id="bw_timex.solvers.warn_if_suboptimal"></a>

#### warn\_if\_suboptimal

```python
def warn_if_suboptimal(backend: str,
                       sys_platform: Optional[str] = None,
                       machine: Optional[str] = None) -> None
```

Warn once per process when `backend` is not the best one available.

Called from `BackgroundSolver.__init__` rather than at import, so
`import bw_timex` stays quiet and runs that never solve a background
system never warn.

<a id="bw_timex.solvers._SuperLUBlockSolver"></a>

## \_SuperLUBlockSolver Objects

```python
class _SuperLUBlockSolver()
```

SciPy's built-in SuperLU. Always available; takes a 2-D RHS natively.

<a id="bw_timex.solvers._SuperLUBlockSolver.name"></a>

#### name

<a id="bw_timex.solvers._SuperLUBlockSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(submatrix)
```

<a id="bw_timex.solvers._SuperLUBlockSolver.solve"></a>

#### solve

```python
def solve(rhs)
```

<a id="bw_timex.solvers._UmfpackBlockSolver"></a>

## \_UmfpackBlockSolver Objects

```python
class _UmfpackBlockSolver()
```

UMFPACK through SciPy's `factorized`.

The closure holds a persistent LU, but rejects a 2-D right-hand side
(`ValueError: object too deep for desired array`), so a batch is looped
column by column. Each column is still only a triangular solve against
the one factorization.

<a id="bw_timex.solvers._UmfpackBlockSolver.name"></a>

#### name

<a id="bw_timex.solvers._UmfpackBlockSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(submatrix)
```

<a id="bw_timex.solvers._UmfpackBlockSolver.solve"></a>

#### solve

```python
def solve(rhs)
```

<a id="bw_timex.solvers._PardisoBlockSolver"></a>

## \_PardisoBlockSolver Objects

```python
class _PardisoBlockSolver()
```

MKL Pardiso through `pypardiso`'s module-global solver.

A 2-D right-hand side goes into one native call with `nrhs = k`, which is
the whole reason this backend is preferred: one analysis, one numeric
factorization, k triangular solves, all inside MKL.

The CSR submatrix is held here because `pypardiso.spsolve` runs
`A.tocsr()` on every call, which would otherwise be an O(nnz) copy per
chunk.

<a id="bw_timex.solvers._PardisoBlockSolver.name"></a>

#### name

<a id="bw_timex.solvers._PardisoBlockSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(csr_submatrix)
```

<a id="bw_timex.solvers._PardisoBlockSolver.solve"></a>

#### solve

```python
def solve(rhs)
```

<a id="bw_timex.solvers._IterativeBlockSolver"></a>

## \_IterativeBlockSolver Objects

```python
class _IterativeBlockSolver()
```

A block solved by summing the Jacobi-preconditioned Neumann series
`A^-1 b = sum_k (I - D^-1 A)^k D^-1 b`, with no factorization.

On a premise-sized vintage block (43.6k rows, 525k nonzeros) that is
~110 sparse matrix products, 20-25 ms per right-hand side, against ~4 s
for the UMFPACK factorization the block would otherwise need.

A block with a zero on its diagonal is rejected in `__init__`; one whose
series diverges or misses `residual_tol` falls back from `solve`. Either
way `fallback` - a zero-argument callable, so no LU is built unless it is
needed - provides the solver used from then on.

<a id="bw_timex.solvers._IterativeBlockSolver.name"></a>

#### name

<a id="bw_timex.solvers._IterativeBlockSolver.__init__"></a>

#### \_\_init\_\_

```python
def __init__(submatrix,
             fallback,
             rtol: float = ITERATIVE_RTOL,
             residual_tol: float = ITERATIVE_RESIDUAL_TOL,
             max_iterations: int = ITERATIVE_MAX_ITERATIONS)
```

<a id="bw_timex.solvers._IterativeBlockSolver.solve"></a>

#### solve

```python
def solve(rhs)
```

<a id="bw_timex.solvers.iterative_solver_enabled"></a>

#### iterative\_solver\_enabled

```python
def iterative_solver_enabled() -> bool
```

Whether the series path may be used. `BW_TIMEX_NO_ITERATIVE_SOLVER`
turns it off process-wide, leaving every block on the LU backend.

<a id="bw_timex.solvers.make_block_solver"></a>

#### make\_block\_solver

```python
def make_block_solver(backend: str, submatrix, allow_iterative: bool = False)
```

Build the block solver named by `backend` over `submatrix`.

With `allow_iterative`, returns an `_IterativeBlockSolver` that builds
`backend`'s LU only if the series cannot solve the block. Off by default,
so naming a backend returns that backend's object.

`backend` is verified first (`require_backend`), so asking for a backend
this machine cannot provide raises instead of quietly handing back an
object that reports the requested name while solving with something else.

A block with an empty row is rejected here, for every backend. Such a
block is square with a zero row, i.e. singular, and no backend can solve
it: pardiso's `_check_A` raises
`ValueError('Matrix A is singular, because it contains empty row(s)')`,
and SuperLU's `splu` raises `RuntimeError: Factor is exactly singular`.
Routing one to the other only exchanges a precise diagnosis for a vague
one, so the condition is named once, here, where the offending rows can
still be pointed at.

<a id="bw_timex.solvers.make_persistent_block_solver"></a>

#### make\_persistent\_block\_solver

```python
def make_persistent_block_solver(submatrix,
                                 backend: Optional[str] = None,
                                 allow_iterative: bool = False)
```

Build a block solver that *owns* its factorization for its lifetime.

Use this - not `make_block_solver` - when one block will be solved many
times with separate right-hand sides, interleaved with solves of other
blocks. That access pattern is exactly what MKL Pardiso is worst at:
`pypardiso` keeps a single global factorization slot and re-runs the
analysis and the numeric factorization whenever the matrix handed to
`spsolve` differs from the previous call, so alternating between B blocks
over T rounds costs T*B full factorizations instead of B.

SuperLU's `splu` and UMFPACK's `factorized` both hold their own LU inside
the returned object, so either is safe here; pardiso is substituted with
SuperLU. The pardiso multi-RHS win is unaffected - it lives on the batched
path (`BackgroundSolver.prepare`), where one call carries every column and
the global slot is used once per block.

An empty-row block is rejected exactly as in `make_block_solver`, so both
entry points report the same diagnosis for the same degeneracy.
