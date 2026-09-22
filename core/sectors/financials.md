---
title: Financials
type: sector
summary: "Banks, financial services and insurance: why a product LCA rarely fits the GICS Financials sector, and what this wiki does and does not cover."
audience: [P1, P2]
updated: 2026-09-22
sources: [gics-2023, epd-international-pcr-library, ef-pef-method, sentier-inventory-readme, bafu-2026-release, unsd-isic-rev4]
related: [crosswalk.md, ../../bafu/, ../../sentier/modules/sentier-inventory/]
---

# Financials

GICS code 40, three industry groups (gics-2023):

- 4010 Banks: banks.
- 4020 Financial Services: financial services, consumer finance, capital markets,
  mortgage real estate investment trusts.
- 4030 Insurance: insurance.

This is the one GICS sector with no physical product to declare. There is no mass, no
volume and no unit of delivered energy, so the
[functional unit](../../vocabulary.md#functional-unit) has to be an organisational or
a monetary one: an organisation-year, an account-year, a unit of invested capital.
That choice moves the study out of product LCA and into organisational and
portfolio accounting, which are different methods with different boundaries.
See [../concepts/](../concepts/) for the generic definitions.

## What dominates the results

For the operations of a financial firm: purchased electricity and heat for offices and
data centres, business travel, and the IT hardware the firm buys and replaces. Those
are ordinary inventory questions and the data for them sits in other sectors of this
crosswalk, mainly [information-technology.md](information-technology.md),
[utilities.md](utilities.md) and [real-estate.md](real-estate.md).

For the balance sheet, the financed and underwritten activity dwarfs the operations by
orders of magnitude. That calculation is an attribution of other sectors' inventories
through a financial key, not an inventory of its own. This wiki does not document it;
it is a gap named on [../roadmap.md](../roadmap.md).

## Data usually needed

Nothing that is specific to this sector. A study assembles its inventory from the other
sector pages: office and data-centre energy, IT equipment, business travel, paper and
building services.

- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) -
  no sector folder corresponds to Financials; the folders are
  `01-agriculture` through `10-building-services` plus `99-obsolete`, all of them
  physical (sentier-inventory-readme).
- [../../bafu/](../../bafu/) - no top-level process category corresponds to financial
  activity (bafu-2026-release).
- [../../ecoinvent/](../../ecoinvent/) - structure only, no amounts.

## Data usually missing

Everything that makes the sector material, which is the financed portfolio. There is no
inventory route to it inside this wiki, and pretending otherwise would be worse than
the gap. What a practitioner can do here today is bound the operational footprint and
say explicitly that the portfolio is out of scope.

## Rules that apply

No PEFCR in the Commission's current list covers financial activity (ef-pef-method).

The International EPD System's PCR library carries a general `Services` product
category, which is the only route to a declaration in this sector
(epd-international-pcr-library). The general standards in
[../standards/](../standards/) otherwise apply unmodified.

## Use cases

No sector use case is written for this sector yet, so start from the tool-agnostic study
types in [../use-cases/](../use-cases/) (screening LCA, comparative LCA, EPD, PEF study)
and read this page for what the sector adds to them. The gap is on
[../roadmap.md](../roadmap.md).

- [../use-cases/](../use-cases/) - the study types, written tool-agnostically.
- [../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/) - no
  folder corresponds to this sector; read it for the folders a financed activity resolves
  into instead.
- [../../bafu/](../../bafu/) - the BAFU database as a data source: access, licence, coverage.
- [../../ecoinvent/](../../ecoinvent/) - the licensed background database, documented as
  structure only.

## Crosswalk

| Taxonomy | This sector maps onto |
|---|---|
| Sentier inventory folders | none |
| BAFU:2026 top-level process categories | none |
| ISIC Rev.4 sections | K (financial and insurance activities) |

The mappings are many-to-many in both directions; [crosswalk.md](crosswalk.md) carries
the full table and says which cells are shared with other sectors.
