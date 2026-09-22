---
title: pypardiso gotchas
type: module-page
summary: "What surprises people about pypardiso: platforms, MKL, and a shared solver."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-pypardiso, pypardiso-repo, bw-timex-docs, pypi-bw-timex]
---

# pypardiso gotchas

- **Linux and Windows only.** MKL is not available on Apple silicon, so pypardiso is
  not an option on modern Macs. The maintainers recommend `scikit-umfpack` there
  (source: pypardiso-repo). bw_timex encodes the same rule in its dependencies, marking
  pypardiso for x86-64 Linux and Windows only, and documents a separate macOS
  installation path (source: pypi-bw-timex, bw-timex-docs).
- **MKL 2024.0 is excluded on purpose.** The dependency is written to skip that
  release. A pinned environment that forces it back in is asking for trouble
  (source: pypi-pypardiso).
- **The install is large.** MKL dominates the download. Budget for it in a container
  image.
- **The two module functions share one solver.** `spsolve` and `factorized` both
  default to the module-level `ps` instance, so a factorisation cached by one call is
  reused by another, and solver options set anywhere in the process apply everywhere.
  Pass your own `solver=` when that matters (source: pypi-pypardiso).
- **Cached factorisations hold memory.** `size_limit_storage` bounds what is kept, but
  a long-running process solving many different matrices should call
  `remove_stored_factorization` or `free_memory` rather than trusting the bound.
- **No complex numbers.** The package does not support them, and it is not a binding to
  the separate PARDISO 7 project (source: pypardiso-repo).
- **The matrix must be square, sparse and in CSR or CSC.** A dense array or a COO
  matrix is not accepted as is (source: pypardiso-repo).
- **The `bw2calc` warning is the usual first encounter.** On x64 hardware without
  pypardiso, importing `bw2calc` prints a warning recommending it. The warning is
  advice, not an error: calculations still run, on the slower SciPy solver.
- **The conda package for a dependant may not pull it in.** `bw_timex`'s conda build is
  noarch and therefore cannot pin a platform-specific run dependency, so pypardiso has
  to be named on the install command (source: bw-timex-docs).
- **The repository name has two spellings.** The historical repository was
  `PyPardisoProject`; that address now redirects to `haasad/PyPardiso`, which is what
  the distribution metadata points at (source: pypardiso-repo).
- **It is maintained, not developed.** The gap between 0.4.6 in March 2024 and 0.4.7 in
  November 2025 is normal for this package; a quiet year does not mean it is abandoned
  (source: pypi-pypardiso).
