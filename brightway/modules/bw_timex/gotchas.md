---
title: bw_timex gotchas
type: module-page
summary: "What surprises people about bw_timex: environments, dated databases and caches."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs]
---

# bw_timex gotchas

- **It cannot share an environment with Brightway 2.** bw_timex depends on
  Brightway 2.5 and installs bw25-compatible versions of the Brightway packages, so it
  cannot be added to an environment based on Brightway 2, including one holding the
  stable Activity Browser (source: bw-timex-docs). Give it its own environment.
- **The conda package does not bring pypardiso.** The conda build is noarch and cannot
  pin platform-specific run dependencies, so the fastest solver for `lci()` is not
  installed unless you name it. The documented conda command names it explicitly
  (source: bw-timex-docs). See [../pypardiso/README.md](../pypardiso/README.md).
- **macOS needs a different solver stack.** pypardiso does not run on Apple silicon.
  The documentation installs `brightway25_nosolver` with `scikit-umfpack`, or the
  `[solvers]` extra with SuiteSparse from Homebrew (source: bw-timex-docs).
- **The premise extra downgrades numpy.** premise requires numpy below 2, so installing
  `bw_timex[premise]` into a working environment pulls numpy and scipy back to the 1.x
  series rather than just adding a package, and on Python 3.13 the install falls back
  to compiling numpy from source, which fails. Use a separate environment on Python
  3.11 or 3.12; Brightway projects are shared between environments, so building the
  vintages in one and calculating in the other costs nothing
  (source: bw-timex-docs).
- **Every database the traversal reaches must be dated.** A background database that is
  not in `database_dates` and carries no metadata raises `UnmappedDatabaseError`. Dating
  a project once with `set_database_metadata` is less fragile than passing the map on
  every call.
- **Interpolation happens between vintages, silently.** A process dated between two
  background databases is linked to an interpolation of both, `linear` by default. The
  result is not "the nearest database"; check `databases_used_by_timeline()` when a
  number surprises you (source: bw-timex-docs).
- **`temporal_grouping` defaults to the year.** Anything finer than a year is grouped
  away unless you change it, which makes short-lived dynamics disappear from the
  timeline.
- **Static and dynamic scores are different quantities.** `static_lcia` applies the
  ordinary characterisation factors of the chosen method; `dynamic_lcia` applies
  characterisation functions over a time horizon and defaults to radiative forcing over
  100 years. They are not two ways of computing the same number, and comparing them
  directly is a common error.
- **`max_calc` and `cutoff` bound the traversal.** They default to 2000 and 1e-9. A
  large foreground can hit the cap; the timeline then covers less of the system than
  you think.
- **`traverse_background` is off by default.** The background is treated as static
  unless you ask for it to be traversed, which is usually what you want and
  occasionally not.
- **Caches survive between runs.** bw_timex keeps module-level supply, aggregate and
  biosphere caches. After changing a database in place, call
  `clear_background_lci_cache` or you will compare a new model against an old solution.
- **Releases come fast.** Four releases went out between 2026-08-14 and 2026-09-18.
  Pin the version in anything you want to reproduce (source: pypi-bw-timex).
