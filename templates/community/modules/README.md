---
title: <community name> modules
type: readme
summary: One folder per module of this community.
audience: [P1, P2, P3]
updated: <YYYY-MM-DD>
sources: []
---

# <community name> modules

A module is one thing a practitioner installs, reads or connects to. Each folder here
documents one of them.

## What belongs here

One folder per module. A codebase module follows `templates/pages/module-codebase/`;
an external database large enough to stand alone gets its own root branch from
`templates/pages/module-database/` instead.

## Naming rule

The upstream package or repository name, unchanged, with no version in the folder name.
The version belongs in the module `README.md`.

## How to add here

1. Copy `templates/pages/module-codebase/` to `<name>/`.
2. Record the version documented and how it was obtained.
3. If the module owes an API reference, run pydoc-markdown by hand into
   `<branch>/modules/<name>/api/`, one file per submodule, each stamped with the
   package, the version, the date and the command (copy the recipe from any existing
   `api/README.md`). No script does this.
4. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to `log.md`.
