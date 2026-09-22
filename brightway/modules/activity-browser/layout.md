---
title: activity-browser layout
type: module-page
summary: How the activity_browser package is organised, layer by layer.
audience: [P2, P3]
updated: 2026-09-21
sources: [activity-browser-repo, activity-browser-docs, pypi-activity-browser]
---

# activity-browser layout

The tree below is the `activity_browser` package of the 3.0 line, read from a local
read-only clone of `main` at commit 03fe1cb, dated 2026-06-17
(source: activity-browser-repo). The published wheel ships the same package
(source: pypi-activity-browser).

```
activity_browser/
├── __init__.py          run_activity_browser(), the entry point, plus the re-exports
├── application.py       the Qt application object
├── layouts/
│   ├── main.py          MainWindow
│   ├── panels/          the left and right panel containers
│   └── tabs/            project manager, activity, LCA setup, LCA results,
│                        impact categories, parameters, history, plugin
├── ui/
│   ├── tables/          the table views, their models and delegates
│   ├── widgets/         dialogs, the cutoff menu, the comparison switch, messages
│   ├── wizards/         database import and export, project setup, plugins, settings,
│   │                    uncertainty
│   ├── web/             the graph and Sankey views
│   ├── menu_bar.py, statusbar.py, icons.py, style.py, figures.py, threading.py
├── actions/             one module per user action, grouped by object: activity,
│                        database, exchange, method, parameter, project,
│                        calculation_setup, plus plugin and settings wizards
├── controllers/         the plugin controller
├── bwutils/             the Brightway-facing layer: calculations, multilca,
│                        montecarlo, sensitivity_analysis, importers, exporters,
│                        strategies, metadata, pedigree, uncertainty, superstructure/
├── mod/                 monkey patches over bw2data, bw2io, bw2analyzer,
│                        ecoinvent_interface and pyprind
├── plugin.py            the Plugin base class
├── settings.py          ab_settings and project_settings
├── signals.py           the application-wide Qt signals
├── info.py              the version and the compatible ecoinvent versions
├── logger.py            logging setup and the log file location
├── static/              icons, stylesheets, JavaScript, HTML shells, start screen
└── docs/wiki/           the wiki pages, shipped with the package
```

## The three layers

The project's own architecture notes describe the separation the tree follows: `ui/`,
the application layer and `bwutils/` are kept apart, domain data reaches Qt through
application signals, graph mathematics lives in the traversal code rather than in the
navigator tabs, and monkey patches are confined to `mod/`
(source: activity-browser-docs).

## Key files

- `__init__.py` defines `run_activity_browser`, which is both the console script target
  and what a launcher script calls.
- `layouts/main.py` is the window; `layouts/tabs/` is the list of things the window can
  show, and is the fastest map of the features.
- `actions/` is the pattern to know: a user action is a module, not a method on a
  widget, which is how the same action can be triggered from a menu, a button and a
  context menu.
- `bwutils/` is the only layer that talks to Brightway. `multilca.py` is calculations
  across several reference flows and categories; `superstructure/` is the scenario
  machinery.
- `mod/` holds deliberate monkey patches over five upstream packages. When upstream
  behaviour differs from what the interface shows, look here first.
- `info.py` fetches the list of compatible ecoinvent versions from the repository at
  start-up, with a bundled file as a fallback and a hard-coded list as a last resort.
- `docs/wiki/` ships the user wiki inside the package: installation, getting started,
  projects, databases, activities, impact categories, calculation setups, LCA results,
  parameters, flow scenarios, the graph explorer, uncertainty, settings, plugins,
  tutorials and where to get help.

## The repository around it

`recipe/meta.yaml` is the conda recipe used for development builds on a personal
channel; the official package comes from conda-forge
(source: activity-browser-repo). `run-activity-browser.py` is a two-line launcher that
calls `run_activity_browser()`.
