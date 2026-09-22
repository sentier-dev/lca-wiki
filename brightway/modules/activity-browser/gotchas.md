---
title: activity-browser gotchas
type: module-page
summary: "What surprises people about Activity Browser: two lines, conda, and shared projects."
audience: [P1, P3]
updated: 2026-09-22
sources: [activity-browser-repo, pypi-activity-browser, activity-browser-conda-forge, bw-timex-docs, activity-browser-docs]
---

# activity-browser gotchas

- **Two lines are current, and they are not interchangeable.** The stable line is
  2.11.2 on conda-forge and is built on Brightway 2; the 3.0 line is an open beta on
  Brightway 2.5 with multifunctionality support. Deciding which one you are on is the
  first question to answer about any Activity Browser problem
  (source: activity-browser-conda-forge, activity-browser-repo).
- **PyPI has only the beta.** Every one of the 77 versions on PyPI is a
  `3.0.0b...` pre-release, so a plain `pip install activity-browser` fails to find a
  release and `pip install --pre` gets you the beta, not the stable line. The stable
  line is a conda-forge package (source: pypi-activity-browser,
  activity-browser-conda-forge).
- **Conda is the supported route.** The README and the bundled installation guide both
  install from conda-forge; the PyPI wheel exists but is not the documented path
  (source: activity-browser-repo).
- **The beta version numbers are timestamps.** `3.0.0b202608291724` is a build from
  2026-08-29. Comparing two of them alphabetically works by accident, and earlier beta
  numbering used plain build counters, so the two schemes sort against each other
  badly (source: pypi-activity-browser).
- **It cannot share an environment with Brightway 2.5-only packages, and the reverse.**
  `bw_timex` states plainly that it cannot be added to a Brightway 2 environment such
  as one containing Activity Browser (source: bw-timex-docs). Use separate
  environments; the Brightway project directory is shared anyway.
- **The project directory is shared with your Python sessions.** That is a feature, and
  also the reason a table can go stale: change a database in a script while the
  interface is open and the interface is showing you the old state until it refreshes.
- **`mod/` monkey patches five upstream packages.** bw2data, bw2io, bw2analyzer,
  ecoinvent_interface and pyprind are patched deliberately. Behaviour inside Activity
  Browser can therefore differ from the same call in a plain Python session
  (source: activity-browser-repo).
- **The graph explorer is not graph traversal.** The project's own architecture notes
  say so: the explorer is a view, and the mathematics lives elsewhere. Do not read a
  contribution result off the explorer (source: activity-browser-docs).
- **The compatible ecoinvent version list is fetched at start-up.** Offline, the
  bundled fallback applies, and if that fails a hard-coded older list does. A machine
  with no network may therefore offer fewer ecoinvent versions than one with
  (source: activity-browser-repo).
- **`activity-browser-cleanup` may not exist.** It is declared in the development conda
  recipe but not in the PyPI wheel (source: activity-browser-repo,
  pypi-activity-browser).
- **The PyPI licence field is the whole licence text.** The metadata carries the full
  LGPL rather than an identifier, which breaks naive tooling; the classifier says
  LGPL-3.0-or-later (source: pypi-activity-browser).
- **Do not launch it on a headless machine to check something.** It is a Qt desktop
  application. Everything on these pages was established from metadata, source and
  documentation instead.
