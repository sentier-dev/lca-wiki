---
title: sentier-agribalyse datasets
type: module-page
summary: The public Agribalyse 3.2 inputs the adapter expects, the licensed files a user regenerates locally, and the artifacts a run writes.
audience: [P1, P2]
updated: 2026-09-21
sources: [sentier-agribalyse-repo]
related: [../../../ecoinvent/README.md, ../sentier-mappings/datasets.md]
---

# sentier-agribalyse datasets

Three groups: what the repository expects you to bring, what it commits, and what it
writes. No inventory amount and no characterisation factor value appears on this page.
Read from the repository at commit `3d0df56`, 2026-09-17.
(source: sentier-agribalyse-repo)

## What you bring: the public Agribalyse 3.2 release

- **The SimaPro export of Agribalyse 3.2**, the publisher's CSV, placed under `source/`.
  It is not in git and the README says so: the repository expects it to be fetched from
  the publisher. It is parsed by the repository's own SimaPro reader rather than by a
  Brightway importer.
- **A harmonised flow list**, a gzipped JSON, also local only. It supplies one of the
  mapping tiers.

Everything downstream is derived from those two plus the committed files below.

## What the repository commits

- **The publisher's reference results table**, as parquet. This is what the backtest
  compares against, so that a score can be checked rather than believed.
- **The public EF 3.1 characterisation factor export** from the Joint Research Centre,
  as parquet, and the adapted factor table used by the SimaPro side, as parquet and as a
  spreadsheet. They exist side by side because the two disagree, and the repository
  ships audits of the difference rather than picking silently.
- **Curated mapping and correction data**: the targeted override file, a placeholder
  flow classification sheet, an edge-label correction list, two delete lists for
  aggregated processes and products, an activity location override list, an extra unit
  conversion list, a water-use bridge, and the reviewed residuals spreadsheet the
  model-assisted command appends to.
- **A biosphere flow list and a set of migration reference files** lifted from the
  Brightway import tooling, used for label normalisation.
- **The mapping packages the repository authors**, under `source/randonneur_packages/`,
  in the same randonneur format as [../sentier-mappings/](../sentier-mappings/).
- **`registry/registry.meta.json`**, the provenance record of the last registry build:
  when it was built, the Agribalyse, background and method versions it was built from, a
  row count per registry table, a hash per input file and the tier ladder. It is the
  only committed file of the registry folder.

## What a licensed user regenerates locally

The repository is public because none of the following is in it. A holder of an
ecoinvent 3.9.1 licence regenerates them from their own credentials, following
`BOOTSTRAP.md`, and they stay on that machine:

| Local file | What it holds |
|---|---|
| the background exchange table | the licensed inventory amounts |
| the background activity list | the licensed activity nomenclature: name, location, reference product, code |
| the background biosphere flow list | the licensed elementary-flow nomenclature |
| the method file inherited against that biosphere | factors carried onto licensed flow identifiers |
| the per-method factor folders under the registry | the same, as parquet keyed by the licensed flow identifiers |

Two protections back the rule up. The ignore file keeps those paths out of a commit, and
a pre-commit hook refuses them even when they were force-added. The bootstrap document
states the reason plainly: publishing more than a handful of data points, or any of the
nomenclature, breaches the licence. The database itself is documented on
[../../../ecoinvent/](../../../ecoinvent/).

## What a run writes

| Artifact | Committed | What it is |
|---|---|---|
| the registry parquets | no, regenerable | the tiered mapping tables the matchers read |
| the parsed export and the scoring packages under `cache/` | no | the reproducible intermediate state of a run |
| `dashboard/` tables and reports | the interface and the first-pass table are committed, generated data is not | the static review interface: backtest results, factor comparison, per-product flow decomposition, outlier notes |
| `to_review/` | yes for the current spreadsheet | the mapping comparison a human reviews |
| `unlinked/` | yes for the current exports | the flows and processes that did not link, so the gap is visible |
| the mapping packages under `source/randonneur_packages/` | yes | the reusable output of the linking work |
| the Brightway export | no, guarded | datapackages plus a standalone importer, which embed licensed amounts |
| the public-only skeleton | no, written to a separate checkout | a scoring package with the licensed amounts stripped out |

## Methods

The repository registers the headline EF 3.1 categories rather than the full set. The
factors come from the public Joint Research Centre export and from the adapted SimaPro
table, joined per flow, with regionalised factors for the categories that have them and
a dedicated bridge for water use. Which of the two sources a factor came from, and where
they disagree, is recorded by the comparison command and by two audits.

## Vocabulary

The nomenclature here is the publisher's: SimaPro process and flow names, compartment
and sub-compartment strings, and the method names of the EF package. Alignment to the
platform's own term IRIs is not done in this repository; the packages it authors are the
artifact that can be reused elsewhere.

## Licence

MIT for the code. The Agribalyse release and the EF factor export keep their publishers'
terms, and the background database is licensed separately and never ships here.
