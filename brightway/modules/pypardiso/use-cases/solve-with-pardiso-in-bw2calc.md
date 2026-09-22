---
title: Solve with PARDISO in bw2calc
type: use-case
summary: Install pypardiso so bw2calc picks the MKL PARDISO solver, and verify it did, on a calculation whose score you already know.
audience: [P1]
updated: 2026-09-22
sources: [pypardiso-repo, pypi-pypardiso, brightway-installation, pypi-bw2calc]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11 virtual environment with bw2data 4.7, bw2calc 2.5.0, bw2io 0.9.17 and pypardiso 0.4.7 (mkl 2026.1.0 pulled in as a dependency), BRIGHTWAY2_DIR set to a temporary directory, Linux x86-64
related: [../commands.md, ../gotchas.md, ../../bw2calc/use-cases/run-an-lca-and-read-the-score.md]
---

# Solve with PARDISO in bw2calc

**Persona:** P1 practitioner whose calculations have got slow, or who wants the warning
on import to go away · **GICS sector:** any

## Goal

`bw2calc` solving through MKL PARDISO instead of SciPy's sparse solver, and proof that
it is, rather than a hope based on having run `pip install`.

## Prerequisites

- x86-64 Linux or Windows. MKL is not available on Apple silicon, so `pypardiso` is not
  an option there; the documented substitute is `scikit-umfpack`
  (source: pypardiso-repo, brightway-installation).
- `pypardiso` 0.4.7, which declares `mkl != 2024.0`, `numpy` and `scipy`. MKL dominates
  the download; budget for it in a container image.
- A calculation you know the answer to. The toy bakery from
  [../../bw2calc/use-cases/run-an-lca-and-read-the-score.md](../../bw2calc/use-cases/run-an-lca-and-read-the-score.md)
  scores 0.4146, which is the check used below.

## Steps

1. Install into a real virtual environment, not an ephemeral one. See the first pitfall.

   ```bash
   uv venv --python 3.11 .venv
   VIRTUAL_ENV=.venv uv pip install bw2data==4.7 bw2calc==2.5.0 bw2io==0.9.17 pypardiso==0.4.7
   ```

2. Ask `bw2calc` which solver it found. The flags are module-level and set at import.

   ```python
   import bw2calc as bc

   bc.PYPARDISO, bc.UMFPACK
   ```

3. Ask where the two solver functions actually came from. This is the check that cannot
   be fooled by a successful install that failed to load.

   ```python
   import bw2calc.lca_base as lb

   lb.factorized.__module__
   lb.spsolve.__module__
   ```

4. Run the calculation and compare the score with the SciPy one.

   ```python
   import bw2data as bd
   import toy_bakery  # noqa

   bread = bd.get_node(database="toy-bakery-db", name="bread production")
   fu, objs, _ = bd.prepare_lca_inputs(
       {bread: 1}, method=("toy method", "climate change", "GWP100")
   )
   lca = bc.LCA(demand=fu, data_objs=objs)
   lca.lci()
   lca.lcia()
   lca.score
   ```

5. Record which MKL you got, because the solver's behaviour is MKL's.

   ```python
   import importlib.metadata as im

   im.version("pypardiso"), im.version("mkl")
   ```

## Expected output

- Without `pypardiso`, importing `bw2calc` 2.5.0 on x64 prints a `UserWarning`
  recommending it, `bc.PYPARDISO` is `False`, and both solver functions come from
  `scipy.sparse.linalg._dsolve.linsolve`.
- With it installed and loadable, no warning, `bc.PYPARDISO` is `True`, `bc.UMFPACK` is
  `False`, and both `factorized` and `spsolve` come from `pypardiso.scipy_aliases`.
- The score is identical to the SciPy one, `0.4146`, bit for bit in the run below. A
  different solver is not a different answer.
- `mkl` arrives as a dependency: 2026.1.0 in the verification run.
- On a three by three matrix there is no speed to measure. The gain shows on a
  background database, where the technosphere matrix has tens of thousands of rows.

## Pitfalls

- **`uv run --with pypardiso` is not enough on Linux.** In an ephemeral `uv` environment
  the MKL shared library is not where `pypardiso` looks, and importing it raises
  `ImportError: Shared library mkl_rt not found. Use environment variable
  PYPARDISO_MKL_RT to provide a custom path.` `bw2calc` catches that `ImportError`,
  falls back to SciPy and prints the "you haven't installed pypardiso" warning even
  though you have. A `uv venv` plus `uv pip install` works. Verified on 2026-09-22.
- **The warning is advice, not an error.** Calculations still run on SciPy, just slower.
- **MKL 2024.0 is excluded on purpose** by the dependency specification. An environment
  that forces it back in is asking for trouble (source: pypi-pypardiso).
- **The two module functions share one solver instance.** A factorisation cached by one
  call is reused by another, and solver options set anywhere in the process apply
  everywhere. Pass your own `solver=` when that matters.
- **Cached factorisations hold memory.** A long-running process solving many different
  matrices should call `remove_stored_factorization` or `free_memory` rather than
  trusting `size_limit_storage`.
- **The matrix must be square, sparse and CSR or CSC.** A dense array or a COO matrix is
  not accepted as is (source: pypardiso-repo).
- **No complex numbers,** and this is not a binding to the separate PARDISO 7 project.
- **A conda install of a dependant may not pull it in.** `bw_timex`'s conda build is
  noarch and cannot pin a platform-specific run dependency, so `pypardiso` has to be
  named on the install command.

## Related vocabulary

- [LCA software](../../../../vocabulary.md#lca-software)
- [Software](../../../../vocabulary.md#software)
- [Inventory](../../../../vocabulary.md#inventory)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Datapackage](../../../../vocabulary.md#datapackage)
- [Module](../../../../vocabulary.md#module)

## Verification

Run on 2026-09-22, Linux x86-64, `uv 0.11.14`, Python 3.11.

Two environments were compared, both with `BRIGHTWAY2_DIR` pointed at a fresh temporary
directory. In an ephemeral `uv run --with` environment, with `pypardiso` 0.4.7 and even
with `mkl` named explicitly, `bc.PYPARDISO` was `False`, both solver functions came from
SciPy, and importing `pypardiso` directly raised the `mkl_rt` `ImportError` quoted above.
In a `uv venv` with the same packages installed by `uv pip install`, `bc.PYPARDISO` was
`True`, `bc.UMFPACK` was `False`, `lb.factorized.__module__` and `lb.spsolve.__module__`
were both `pypardiso.scipy_aliases`, `mkl` resolved to 2026.1.0, and the toy bakery score
was `0.41460000140517933`, identical to the SciPy run. Duration: about 5 seconds for the
successful run, plus the MKL download on first install.
