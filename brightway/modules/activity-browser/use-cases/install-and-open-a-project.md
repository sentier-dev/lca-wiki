---
title: Install Activity Browser and open a project
type: use-case
summary: Install the graphical interface from conda-forge, start it, and open a Brightway project a Python session created.
audience: [P1]
updated: 2026-09-22
sources: [activity-browser-repo, activity-browser-docs, activity-browser-conda-forge, pypi-activity-browser, bw-timex-docs]
verified: no
related: [../commands.md, ../layout.md, ../gotchas.md, run-a-scenario-difference-file.md]
---

# Install Activity Browser and open a project

**Persona:** P1 practitioner who would rather click than type, or who wants to show a
model to someone who would · **GICS sector:** any

## Goal

Activity Browser running on your machine, showing a project you already have, with the
right line of the two current ones installed on purpose rather than by accident.

## Prerequisites

- A desktop. Activity Browser is a Qt application; there is no batch mode and no headless
  mode. Nothing on this page was run: the verification environment is headless, and
  launching a GUI to look at it would have proved nothing (source:
  activity-browser-repo).
- A decision about which line you want:
  - **2.11.2 on conda-forge**, built on Brightway 2. The stable line
    (source: activity-browser-conda-forge).
  - **the 3.0 beta**, built on Brightway 2.5, with multifunctionality support. Every one
    of the versions on PyPI is a `3.0.0b...` pre-release
    (source: pypi-activity-browser).
- conda or mamba, for the documented route.
- An environment of its own. Activity Browser cannot share one with Brightway 2.5-only
  packages, and `bw_timex` says the same thing from the other side
  (source: bw-timex-docs).

## Steps

1. Put conda-forge first, once (source: activity-browser-repo).

   ```bash
   conda config --prepend channels conda-forge
   ```

2. Install the stable line into its own environment.

   ```bash
   conda create -n ab -c conda-forge activity-browser
   conda activate ab
   ```

3. Or install the 3.0 beta from PyPI. A plain `pip install activity-browser` fails to
   find a release, because there are no final releases there
   (source: pypi-activity-browser).

   ```bash
   pip install --pre activity-browser
   ```

4. Start it.

   ```bash
   activity-browser
   ```

   Or from Python, which helps when the console script is not on the path. The
   repository's own `run-activity-browser.py` is exactly these two lines
   (source: activity-browser-repo).

   ```python
   from activity_browser import run_activity_browser

   run_activity_browser()
   ```

5. Open a project. Activity Browser reads the same Brightway data directory your Python
   sessions use, so a project created by
   [../../bw2data/use-cases/create-a-project-and-a-database.md](../../bw2data/use-cases/create-a-project-and-a-database.md)
   or installed by
   [../../bw2io/use-cases/install-a-remote-example-project.md](../../bw2io/use-cases/install-a-remote-example-project.md)
   appears in the project selector without any import step.

6. Do the work in the interface, or in Python against the same project, whichever suits.
   The task table in [../commands.md](../commands.md) says which is which.

## Expected output

Described from the documentation and the distribution metadata, not from a run:

- The install brings a Qt stack and the whole Brightway line the version depends on. It
  is the largest install on this branch.
- `activity-browser` starts a window with no arguments; it takes no options, because it
  is configured from its own settings, not from a command line
  (source: pypi-activity-browser).
- The project selector lists the projects in the shared data directory, the same names
  `sorted(bd.projects)` returns in Python.
- The compatible ecoinvent version list is fetched at start-up. Offline, a bundled
  fallback applies, and if that fails a hard-coded older list does, so an offline machine
  may offer fewer ecoinvent versions than one with network
  (source: activity-browser-repo).

## Pitfalls

- **Decide which line you are on first.** That is the first question to answer about any
  Activity Browser problem (source: activity-browser-conda-forge,
  activity-browser-repo). See [../gotchas.md](../gotchas.md).
- **PyPI has only the beta.** `pip install activity-browser` without `--pre` fails.
- **The beta version numbers are timestamps.** `3.0.0b202608291724` is a build from
  2026-08-29. Comparing two of them alphabetically works by accident, and earlier beta
  numbering used plain counters, so the two schemes sort badly against each other.
- **The project directory is shared with your Python sessions.** That is a feature and
  also why a table goes stale: change a database in a script while the interface is open
  and it shows the old state until it refreshes.
- **`mod/` monkey patches five upstream packages** deliberately: `bw2data`, `bw2io`,
  `bw2analyzer`, `ecoinvent_interface` and `pyprind`. Behaviour inside Activity Browser
  can therefore differ from the same call in a plain Python session
  (source: activity-browser-repo).
- **`activity-browser-cleanup` may not exist.** It is declared in the development conda
  recipe but not in the PyPI wheel.
- **Do not launch it on a server to check something.** Use `bw2data` against the same
  project instead.

## Related vocabulary

- [LCA software](../../../../vocabulary.md#lca-software)
- [Software](../../../../vocabulary.md#software)
- [Project](../../../../vocabulary.md#project)
- [Project directory](../../../../vocabulary.md#project-directory)
- [Data root](../../../../vocabulary.md#data-root)
- [Database](../../../../vocabulary.md#database)
- [Backend](../../../../vocabulary.md#backend)
- [Module](../../../../vocabulary.md#module)

## Verification

`verified: no`. Activity Browser is a Qt desktop application and the verification
environment is headless; the agent's instructions forbade launching it. Everything above
comes from the repository README and its bundled installation guide, from the
conda-forge package page, and from the PyPI metadata, all read on 2026-09-21 for
[../commands.md](../commands.md) and [../gotchas.md](../gotchas.md). The one thing
checked by running anything was the console script declaration, read out of the wheel's
`entry_points.txt`.

A verifier needs a machine with a desktop. Worth recording: which line they installed,
how long the conda solve took, and whether the project selector showed the projects they
expected.
