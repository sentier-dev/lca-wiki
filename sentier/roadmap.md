---
title: sentier roadmap
type: roadmap
summary: What is missing in the Sentier branch and where a contributor can help.
audience: [P2, P3]
updated: 2026-09-22
sources: []
---

# sentier roadmap

Where this branch stands and where help is welcome. Items move off this list by being
written, not by being ticked: when the page exists and its links and sources check out,
delete the item.

## Status

The branch pages exist and are sourced: [README.md](README.md),
[platform.md](platform.md), [commands.md](commands.md), this branch's contexts in
[../vocabulary.md](../vocabulary.md), and this page. All seven module folders are filled
from their repositories, each with a layout, classes, commands, datasets, gotchas and
status page and at least two use cases; see [modules/README.md](modules/README.md).

## Done: use cases

Every module has use cases: 16 pages in all, 14 of them `verified: yes` from a run
recorded with its environment and its duration. Two stay `verified: no` and say why:
[modules/sentier-agribalyse/use-cases/understand-the-public-twin-workflow.md](modules/sentier-agribalyse/use-cases/understand-the-public-twin-workflow.md),
which needs a licensed background database, and
[modules/sentier-importers/use-cases/add-a-new-source-plugin.md](modules/sentier-importers/use-cases/add-a-new-source-plugin.md),
which describes work a contributor does rather than a command that can be run.

Still owed, the one candidate from the first pass that no page covers:

- review what a mapping run inferred, and accept or reject an entry. The matching tiers
  it would rest on are themselves an owed page, listed below.

## Done: generated API references

The four code packages (sentier-brightway, sentier-importers, sentier-vocab,
sentier-agribalyse) have `api/` folders generated with pydoc-markdown 4.8.2 on 2026-09-22
from the commits named in each module README. The three data repositories have no API
and no `api/` folder.

## Owed: content this pass left out

- **The dashboard the loader produces** is described in prose on
  [modules/sentier-brightway/commands.md](modules/sentier-brightway/commands.md) but has
  no page of its own; a reader who wants to interpret the comparison needs one.
- **The importer source families** are summarised in one table on
  [modules/sentier-importers/datasets.md](modules/sentier-importers/datasets.md). A
  source family that a contributor is likely to extend deserves more than a row.
- **The matching tiers** of the importers, the part that is genuinely hard, are listed
  but not explained. A page on how a flow is matched, placed and disambiguated would
  serve both branches.
- **The data acquisition routes.** Several importer sources read local files with no open
  download route. What a contributor must obtain, and from where, belongs on the
  data-source branches rather than being left implicit.

## Where a contributor can help upstream

- **Mapping coverage.** 113 inventory elementary flows still have no counterpart in the
  Environmental Footprint nomenclature, so their exchanges sit in the residual database
  and contribute nothing to a score. Closing that gap is data work in the mappings
  repository, reviewable in a pull request, and needs no code.
- **Method coverage.** The methods repository carries scaffolding for further method
  families beside the Environmental Footprint one; the loader supports one family today.
- **Uncertainty in file mode.** The file-mode registry carries uncertainty columns that
  the datapackage export does not yet write, so a Monte Carlo run over an export sees
  fixed amounts.
- **A new importer source.** The smallest useful contribution to the platform: a folder
  under the sources package with a class implementing one method, a registry block, and
  tests with a cached fetch fixture.
- **Console-script metadata in sentier-agribalyse.** A clone installed more than once
  leaves stale distribution metadata behind, so `importlib.metadata.entry_points`
  returned 41 raw names for the 24 distinct commands. Anything that counts entry points
  has to take a set; cleaning the metadata on install would remove the trap. See
  [modules/sentier-agribalyse/use-cases/list-the-console-scripts.md](modules/sentier-agribalyse/use-cases/list-the-console-scripts.md).
- **Dereferenceable vocabulary IRIs.** Terms are identified by
  `https://vocab.sentier.dev/...` IRIs, but a request for one with a Turtle `Accept`
  header answered 404 on 2026-09-22, so an IRI is an identifier and not yet an address.
  Serving the generated SKOS at those addresses would make the namespace resolvable. See
  [modules/sentier-vocab/use-cases/look-up-a-term-iri.md](modules/sentier-vocab/use-cases/look-up-a-term-iri.md).

## How to pick something up

Read [../CONTRIBUTING.md](../CONTRIBUTING.md), claim the item in a pull request
description so two people do not write the same page, and keep the change small: one
page, its sources and its line in `index.md` make a good pull request.
