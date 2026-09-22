---
title: activity-browser datasets
type: module-page
summary: Activity Browser bundles interface assets, not inventory data.
audience: [P1, P2]
updated: 2026-09-21
sources: [activity-browser-repo, pypi-activity-browser]
---

# activity-browser datasets

## No inventory data is bundled

Activity Browser ships no database, no flow list, no nomenclature and no impact
assessment method. Everything a project contains is imported by the user, from
ecoinvent, from a SimaPro export, from an Excel file or from the default Brightway
setup. The bundled files listed below are interface assets and reference lists, read
from the 3.0 source tree in a local read-only clone
(source: activity-browser-repo).

## What is in the package

| Path | What it is |
|---|---|
| `static/icons/` | the application and toolbar icons |
| `static/css/` | stylesheets for the web views |
| `static/javascript/` | the scripts behind the graph explorer and the Sankey view |
| `static/navigator.html`, `static/sankey_navigator.html`, `static/spinner.html` | the HTML shells those views load |
| `static/startscreen/` | the start screen assets |
| `static/database_classifications/` | classification lists offered when working with databases |
| `docs/wiki/` | the user wiki, shipped inside the package |
| `bwutils/ecoinvent_biosphere_versions/compatible_ei_versions.txt` | which ecoinvent versions each Activity Browser version supports |

- **Version:** as of the 3.0 line, clone of `main` at commit 03fe1cb, 2026-06-17.
- **Licence:** the package licence, LGPL-3.0-or-later
  (source: pypi-activity-browser).
- **Sectors, methods, vocabulary:** not applicable; none of this is inventory data.

## The one thing it fetches

At start-up, `info.py` reads the compatible ecoinvent versions list from the project's
own repository over HTTPS. If that fails it falls back to the copy bundled in the
package, and if that fails too it uses a hard-coded list of older versions. The result
decides which ecoinvent versions the interface offers
(source: activity-browser-repo).

This is the only network call the package makes on its own account. Downloading an
ecoinvent release is done through `ecoinvent_interface`, with the user's own
credentials; see [../ecoinvent_interface/README.md](../ecoinvent_interface/README.md).

## What it reads and writes

| Object | Where it lives |
|---|---|
| projects, databases, activities, exchanges, methods, parameters | the Brightway project directory, through `bw2data` |
| application settings and the startup project | Activity Browser's own settings files, through `settings.py` |
| scenario difference files | spreadsheets the user supplies, read by the superstructure layer |
| exported databases and results | wherever the export wizard is pointed |
| the log file | a per-platform location reported at start-up by the logger |

Because the project directory is shared, a database imported in the interface is
visible to a Python session on the same project, and the reverse
(source: activity-browser-repo).

- **Source branch:** whichever branch the data came from. For ecoinvent, see
  [../../../ecoinvent/](../../../ecoinvent/).
