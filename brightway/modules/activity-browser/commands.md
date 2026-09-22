---
title: activity-browser commands
type: module-page
summary: The activity-browser launcher, and the conda commands around it.
audience: [P1]
updated: 2026-09-21
sources: [pypi-activity-browser, activity-browser-repo]
---

# activity-browser commands

The 3.0 wheel on PyPI declares exactly one console script, checked by reading the
wheel's `entry_points.txt` directly (source: pypi-activity-browser):

```
[console_scripts]
activity-browser = activity_browser:run_activity_browser
```

The application was **not launched** for this page, and it takes no options: it is a
graphical program, so `--help` is not the way it is configured. Everything below comes
from the entry point declarations and the installation documentation.

| Command | What it does | Key options |
|---|---|---|
| `activity-browser` | start the graphical interface | none; the application is configured from its own settings wizard |
| `activity-browser-cleanup` | reset or clean up Activity Browser state | declared in the conda recipe of the development channel, not in the PyPI wheel |

The second entry point appears in the repository's conda recipe as
`activity_browser.bwutils:cleanup` but is absent from the 3.0 wheel, so whether you
have it depends on how you installed (source: activity-browser-repo,
pypi-activity-browser).

## Installing and starting

The documented route, from the README and the bundled installation guide
(source: activity-browser-repo):

```bash
conda create -n ab -c conda-forge activity-browser
conda activate ab
activity-browser
```

The installation guide also recommends putting conda-forge first, once:

```bash
conda config --prepend channels conda-forge
```

The 3.0 beta, which is published only as a pre-release on PyPI
(source: pypi-activity-browser):

```bash
pip install --pre activity-browser
activity-browser
```

## Starting it from Python

```python
from activity_browser import run_activity_browser

run_activity_browser()
```

The repository ships `run-activity-browser.py`, which is exactly those two lines. This
is useful when the console script is not on the path, for example inside an IDE
(source: activity-browser-repo).

## What you do instead of a command line

Activity Browser has no batch mode. The things a command line would be used for are
done either in the interface or with the Brightway packages directly:

| Task | Where it happens |
|---|---|
| import a database | the database import wizard, or `bw2io`, see [../bw2io/commands.md](../bw2io/commands.md) |
| set up a calculation | the LCA setup tab, or `bw2calc`, see [../bw2calc/README.md](../bw2calc/README.md) |
| run a scenario sweep | the scenario difference file machinery in the interface |
| script anything repeatable | `bw2data` and friends, against the same project |

A project is the shared ground: the interface and a Python session work on the same
Brightway project directory, so a model built in one is visible in the other
(source: activity-browser-repo).
