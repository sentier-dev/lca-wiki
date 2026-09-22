---
title: ecoinvent versions and provenance
type: database
summary: "The release line from version 1 to 3.12, what a yearly update changes, and where ecoinvent says its data comes from."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-kb-releases, ecoinvent-v3.12-release-notes, ecoinvent-kb-sources-citation, ecoinvent-website, ecoinvent-kb]
related: [methodology.md, access-and-licence.md]
---

# ecoinvent versions and provenance

## The line

The project started in the late 1990s, aiming at a consistent and transparent LCI
database for life-cycle-based assessment, and produced version 1 in 2003. The partners
continued under the ecoinvent Centre, the Swiss Centre for Life Cycle Inventories, and
the work grew into the ecoinvent association that publishes the database today (source:
ecoinvent-kb-releases). Version 3 arrived in 2013, and since then the database is updated
yearly, each version expanding the sectorial and geographical coverage and building on
all the previous ones (source: ecoinvent-kb-releases).

The Knowledge Base keeps one page per version. The versions with a page of their own, in
release order, are 2, 3.0, 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.7.1, 3.8, 3.9, 3.9.1,
3.10, 3.10.1, 3.11 and 3.12 (source: ecoinvent-kb). The current version at the time this
page was checked is 3.12, released on 5 November 2025 (source:
ecoinvent-v3.12-release-notes). The database overview states more than 26,000 datasets
(source: ecoinvent-website).

Two consequences for anyone writing things down:

- **The version is part of the citation.** So is the system model; see
  [access-and-licence.md](access-and-licence.md).
- **Point releases exist and are not cosmetic.** 3.7.1, 3.9.1 and 3.10.1 have their own
  pages, so record the third digit.

## What a yearly update changes

Version 3.12 is a representative example. It introduces updates in chemicals and
plastics, fuels, metals, electricity, forestry and wood, textiles, agriculture,
transport, pulp and paper, and batteries and electronics (source:
ecoinvent-v3.12-release-notes). The kinds of change behind that list are worth knowing,
because they are the kinds that move a result between versions:

- **Geographical expansion.** New country and region datasets for products that
  previously had only global ones, and new regional market datasets.
- **Disaggregation.** Previously aggregated data replaced by unit processes, so that the
  chain links properly into the background; 3.12 does this for hydrogen cyanide, several
  polystyrenes and polybutadiene (source: ecoinvent-v3.12-release-notes).
- **New industry data.** Data contributed by industry associations and companies, for
  example the aluminium value chain updated with 2019 data from the International
  Aluminium Institute, and new Finnish forestry datasets covering pine, spruce and birch
  (source: ecoinvent-v3.12-release-notes).
- **Electricity market updates.** Market mixes are refreshed against statistical sources
  each year, with most regions on one reference year and a handful of large countries on
  a more recent one (source: ecoinvent-v3.12-release-notes).
- **Naming harmonisation.** 3.12 harmonises product naming across forestry and wood, to
  separate physical product characteristics from the measurement basis (source:
  ecoinvent-v3.12-release-notes). A rename breaks a mapping as thoroughly as a new
  dataset does.
- **Technical corrections.** Properties, documentation and exchange corrections across
  sectors.

A version upgrade is therefore never only a data refresh, and a mapping or an importer
written against one version should be re-checked against the next. In this wiki that
re-checking is what
[../../brightway/modules/randonneur/](../../brightway/modules/randonneur/) exists for.

## Where the data comes from

ecoinvent describes several routes by which data enters the database; in all of them
ecoinvent obtains the non-exclusive right to publish while the creator stays the owner of
the data (source: ecoinvent-kb-sources-citation). The largest part of the inventory comes
from data collection projects dedicated to specific economic sectors and countries or
regions, carried out with external partners with the local, sectorial and methodological
expertise. Primary data comes from field visits and interviews where possible; secondary
data is preferably taken from publicly available statistics, peer-reviewed literature and
compatible databases. Every dataset, whatever its route, goes through internal and
independent external review before publication (source: ecoinvent-kb-sources-citation).

## Citing the database and a dataset

ecoinvent prescribes both. For the database, version 3 is cited as Wernet, Bauer,
Steubing, Reinhard, Moreno-Ruiz and Weidema, 2016, "The ecoinvent database version 3
(part I): overview and methodology", The International Journal of Life Cycle Assessment
21(9), pages 1218 to 1230; version 2 is cited as Frischknecht and others, 2005, "The
ecoinvent database: Overview and methodological framework", International Journal of Life
Cycle Assessment 10, pages 3 to 9 (source: ecoinvent-kb-sources-citation).

For an individual dataset in version 3 the recommended form is the data generator and
publication, the activity name, the geography short name, the system model and the
version of the database, in that order (source: ecoinvent-kb-sources-citation). Note what
that requires you to have written down: the system model and the version, not just the
activity name.

## Related pages

- [system-models.md](system-models.md): the other half of what a citation has to name.
- [access-and-licence.md](access-and-licence.md): what you may publish about a version.
- [methodology.md](methodology.md): how a dataset is built before it gets a version number.
