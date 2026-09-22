---
title: activity-browser classes and functions
type: module-page
summary: The small public surface of Activity Browser, and the structures behind the windows.
audience: [P1, P3]
updated: 2026-09-21
sources: [activity-browser-repo, activity-browser-docs, pypi-activity-browser]
---

# activity-browser classes and functions

Activity Browser is an application, not a library, so its public surface is small: one
function to start it and one class to extend it. Everything else is internal structure
that a contributor needs and a user does not. The names below were read from the source
of the 3.0 line in a local read-only clone of `main` at commit 03fe1cb
(source: activity-browser-repo). The application was not launched.

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `run_activity_browser` | function | Start the application: set up logging, build the main window, load settings, show it | the `activity-browser` console script, or `from activity_browser import run_activity_browser` |
| `Plugin` | class | The base class a plugin subclasses | `class MyPlugin(Plugin)` |
| `application` | object | The Qt application instance | internal, exported |
| `signals` | object | The application-wide signal bus | internal, exported |
| `ab_settings`, `project_settings` | objects | The two settings scopes | internal, exported |
| `MainWindow` | class | The window itself | built by `run_activity_browser` |
| `version` | string | The installed version, read from the package metadata | `activity_browser.version` |

## The Plugin base class

```python
from activity_browser import Plugin

class MyPlugin(Plugin):
    def load(self): ...    # runs on every plugin import
    def close(self): ...   # runs when Activity Browser closes
    def remove(self): ...  # runs when the plugin is removed from the project
```

The three methods are abstract, and the plugin receives an `infos` dictionary on
construction. Plugins are managed per project through a wizard in the interface, and
the project keeps a list of the ones it loads (source: activity-browser-repo).

## The structures behind the interface

These are not a public API and they change between versions, but they are the map a
contributor needs (source: activity-browser-repo).

| Layer | What lives there |
|---|---|
| `layouts/main.py` | `MainWindow`, holding the left and right panels |
| `layouts/tabs/` | one module per tab: project manager, activity, LCA setup, LCA results, impact categories, parameters, history, plugin |
| `ui/tables/` | the table views, with their Qt models and delegates, one module per object kind |
| `ui/wizards/` | database import and export, project setup, settings, plugin management, uncertainty |
| `ui/widgets/` | dialogs, the contribution cutoff menu, the comparison switch, the biosphere update prompt |
| `ui/web/` | the graph explorer and the Sankey view |
| `actions/` | one module per user action, grouped by the object it acts on |
| `bwutils/` | everything that talks to Brightway |
| `mod/` | the monkey patches over bw2data, bw2io, bw2analyzer, ecoinvent_interface and pyprind |

## The Brightway-facing layer

`bwutils/` is where the interface meets the framework, and its module names are the
best short description of what Activity Browser can compute
(source: activity-browser-repo):

| Module | What it does |
|---|---|
| `calculations.py`, `multilca.py` | calculations across several reference flows and impact categories |
| `montecarlo.py` | Monte Carlo uncertainty analysis |
| `sensitivity_analysis.py` | global sensitivity analysis |
| `superstructure/` | scenario handling, including scenario difference files and a scenario-aware graph traversal |
| `importers.py`, `exporters.py`, `strategies.py` | database import and export on top of `bw2io` |
| `metadata.py` | the cached activity metadata store the tables read from |
| `pedigree.py`, `uncertainty.py` | pedigree matrix entry and uncertainty distributions |

## Architecture notes worth knowing

The project publishes its own decision records, and three of them explain behaviour a
reader will otherwise find surprising (source: activity-browser-docs):

- Domain data reaches Qt through the application signal bus, not by widgets calling
  Brightway directly.
- Graph mathematics lives in the traversal code, not in the navigator tabs; the graph
  explorer is not the same thing as graph traversal.
- Activity metadata is read through the metadata store rather than from `bw2data` on
  every table refresh.
- Heavy dependencies are imported lazily, so start-up time is not the measure of how
  much the application does.

## Notes

- There is no documented Python API for driving the interface. Scripting a Brightway
  project is done with `bw2data`, `bw2calc` and `bw2io` directly; see
  [../bw2data/README.md](../bw2data/README.md).
- `version` comes from the installed distribution metadata, so a source checkout that
  was never installed reports `0.0.0`.
