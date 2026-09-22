---
title: sentier/modules
type: readme
summary: One folder per Sentier package or data repository, each following the codebase template.
audience: [P1, P2, P3]
updated: 2026-09-22
sources: []
---

# sentier/modules

A module is one thing a practitioner installs, reads or connects to. Each folder here
documents one Sentier package or data repository.

## The folders

| Folder | Layer | One line |
|---|---|---|
| [sentier-importers/](sentier-importers/) | Application | The plugin framework that reads external data and delivers it into the data repositories by pull request. |
| [sentier-brightway/](sentier-brightway/) | Application | The loader that installs the platform data into a Brightway project, or writes it as plain files. |
| [sentier-agribalyse/](sentier-agribalyse/) | Application | The public Agribalyse-facing work of the platform. |
| [sentier-vocab/](sentier-vocab/) | Data | The controlled vocabulary of the platform. |
| [sentier-inventory/](sentier-inventory/) | Data | The life cycle inventory data, organised per sector. |
| [sentier-methods/](sentier-methods/) | Data | The impact assessment methods and characterisation factors. |
| [sentier-mappings/](sentier-mappings/) | Cross-cutting | The bridge packages that map one nomenclature onto another. |

## What belongs here

One folder per public Sentier module. A filled module folder holds `README.md` (purpose,
install, version as of the build date and how it was obtained, Datasets section),
`layout.md`, `classes.md`, `commands.md`, `datasets.md`, `gotchas.md`, `status.md`,
the generated `api/` folder and `use-cases/`.

A data repository with no package to install still follows the same template: its
`commands.md` covers the validator and the readers its README documents, and its
`classes.md` may be a short page saying there is no importable surface.

The four code packages have an `api/` folder, generated with pydoc-markdown 4.8.2 on
2026-09-22; each one carries the exact command that produced it. The three data
repositories have no importable package, so they have no `api/` folder and are not
expected to grow one; see [../roadmap.md](../roadmap.md).

## What does not belong here

Private repositories, and the source databases themselves. A module that imports a
database links to that database's branch instead of describing it.

## Naming rule

The upstream package or repository name, unchanged: `sentier-brightway`,
`sentier-vocab`. No version in the folder name; the version lives in the module README.

## How to add here

1. Copy [../../templates/pages/module-codebase/](../../templates/pages/module-codebase/)
   to `<name>/`.
2. Record the version you documented and how you obtained it, at the top of `README.md`.
3. If the module owes an API reference, run pydoc-markdown by hand into
   `sentier/modules/<name>/api/`, one file per submodule, each stamped with the package,
   the version, the date and the command that produced it. Copy the command from a
   sibling module's `api/README.md` and change the module name. No script does this.
4. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to [../../log.md](../../log.md).
