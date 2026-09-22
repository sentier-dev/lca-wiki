---
title: bafu roadmap
type: roadmap
summary: What is missing in the BAFU branch and where a contributor can help.
audience: [P2, P3]
updated: 2026-09-22
sources: []
---

# bafu roadmap

Where this branch stands and where help is welcome. Items move off this list by being
written, not by being ticked: when the page exists and its links and sources check out,
delete the item.

## Status

The eight `knowledge/` pages, the `data/` fetch notes and script, and this branch's
contexts in [../vocabulary.md](../vocabulary.md) are written and sourced. What they are sourced from is the public release pages,
the openLCA release announcement, the terms of use document, one contractor's public
description of the database, and the structure of the BAFU:2026 v1 release files
themselves. Four use cases are written, three of them verified by a real run; see
[use-cases/README.md](use-cases/README.md).

## Open work

### Unsourced today, and worth sourcing

- **Allocation and multifunctionality.** The public pages state no database-wide rule,
  and [knowledge/methodology.md](knowledge/methodology.md) says so rather than guessing.
  The answer is in the LCI reports that ship in the documentation component of a release.
  Reading them and writing that section is the biggest single gap in this branch.
- **System boundary conventions.** Same source, same gap: what a BAFU dataset includes
  and excludes is stated per dataset, and no page here can yet generalise it.
- **The data quality requirements document.** Datasets are stated to comply with a BAFU
  document referred to as DQRv2:2023, but this wiki has not found a public copy of it.
  Find it, register it in [../sources.md](../sources.md), and give it its own page or a
  proper section in [knowledge/methodology.md](knowledge/methodology.md).
- **Release history before BAFU:2025.** The UVEK and KBOB databases that preceded it are
  mentioned in one source and documented in none that this wiki has read. A sourced
  timeline would make [knowledge/versions-and-provenance.md](knowledge/versions-and-provenance.md)
  much more useful.
- **A BAFU landing page on the publisher's own site.** Everything here is sourced from
  the distribution platform, the release announcement and a contractor. A page on
  `bafu.admin.ch` that describes the database in the publisher's own words would be a
  better primary source for the licence and the Open Government Data framing; the search
  for one has not found it yet.

### Use cases, four written, two and a half still owed

[use-cases/](use-cases/) holds four pages. Obtaining and verifying a release, reading the
structure of the results workbook, and taking a release into Brightway through the
Sentier loader are written and `verified: yes`. Opening the release in openLCA is written
and `verified: no`, because the steps are graphical and openLCA was not installed here; a
verifier with a desktop can close that without writing anything new.

Still owed:

- **Check whether your product is covered.** From a product to a BAFU category, to a
  count of candidate processes, to a decision about whether the database is the right
  background for the study.
- **Report EF 3.1 indicators from the results workbook.**
  [use-cases/inspect-the-lcia-results-workbook-structure.md](use-cases/inspect-the-lcia-results-workbook-structure.md)
  describes the workbook's shape; reporting from it, with the caveat about the flow
  mapping in [knowledge/methods.md](knowledge/methods.md), is a separate page.
- **Compare two releases.** Using the dataset change log that ships in the documentation
  component, not by diffing amounts.

### Smaller items

- A page on the documentation component itself: what reports ship with a release, how
  they are named and how a dataset points at one.
- **Reconcile the top-level category count.**
  [knowledge/sector-coverage.md](knowledge/sector-coverage.md) and
  [README.md](README.md) count 60 distinct top-level categories over the 11,947 processes
  of BAFU:2026 v1, while
  [../core/sectors/crosswalk.md](../core/sectors/crosswalk.md) lists 59, read from the
  v1.1 openLCA package's category tree. Both cite the same release, the components differ
  in version, and no public source settles which reading a reader should quote. Someone
  holding both components should count them side by side and say what the difference is.
- **Reconcile the elementary flow count.**
  [knowledge/schemas-and-nomenclature.md](knowledge/schemas-and-nomenclature.md) counts
  2,460 elementary flows in the openLCA package;
  [../sentier/modules/sentier-brightway/datasets.md](../sentier/modules/sentier-brightway/datasets.md)
  counts 2,679 source elementary flows in the republished inventory. The two are read
  from different components and neither is a restatement of the other, but no page says
  what accounts for the 219 difference.
- The mapping between BAFU elementary flow names and the EF 3.1 reference flow list, if
  the publisher documents it anywhere. A community bridge exists and is documented in
  [../sentier/modules/sentier-mappings/](../sentier/modules/sentier-mappings/); what is
  missing is the publisher's own correspondence, against which that bridge could be
  checked.
- Whether older releases stay downloadable, and for how long. Reproducibility depends on
  it and no page here can answer it.

## How to pick something up

Read [../CONTRIBUTING.md](../CONTRIBUTING.md), claim the item in a pull request
description so two people do not write the same page, and keep the change small: one
page, its sources and its line in `index.md` make a good pull request.

Two house rules apply with particular force here. Describe, never copy: counts, category
names, units and indicator names belong on these pages, per-process amounts and
per-flow factors do not, whatever the licence allows. And cite the release you actually
read, with its component and its version label, because the components of one BAFU
release do not always share a version number.
