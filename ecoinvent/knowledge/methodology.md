---
title: ecoinvent methodology
type: database
summary: "How ecoinvent models the world: activities and products, exchanges, the three levels of data, and how datasets get linked."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-kb-activities-products, ecoinvent-kb-glossary, ecoinvent-kb-releases, ecoinvent-kb-sources-citation, ecoinvent-kb-system-models]
related: [system-models.md, schemas-and-nomenclature.md]
---

# ecoinvent methodology

## The unit: an activity, not a process

Every dataset represents a human activity and its exchanges with the environment and with
other human activities (source: ecoinvent-kb-activities-products). The glossary is
explicit that "process" is the version 2 word, replaced in version 3 by the more generic
"activity" (source: ecoinvent-kb-glossary). The other rename that comes with it: in
version 2 the activity name and the product name were the same string, and in version 3
they are independent, so an activity called "chloroacetic acid production" has a product
called "chloroacetic acid" (source: ecoinvent-kb-glossary).

An activity is identified by name, geography and time period together, and that
combination is what a UUID identifies (source: ecoinvent-kb-activities-products).

Each dataset carries its geography, its time period as a start and an end date, its
documentation, its natural resource consumption, its emission profile, its material flows
in and out, its energy and fuel consumption, its mass, water, biogenic and fossil carbon
accounts, and its annual production volume (source: ecoinvent-kb-activities-products).
The time period is not an expiry date: it is the period the data was collected for or
extrapolated to, and a dataset whose end date has passed can still be the valid one
(source: ecoinvent-kb-activities-products).

## Types of activity

The documentation distinguishes several kinds, and the kind decides how the dataset
behaves in linking (source: ecoinvent-kb-activities-products):

- **Ordinary transforming activities.** The default: inputs go in, something different
  comes out, as in a coal mine turning coal in the ground into marketable coal.
- **Treatment activities.** A transforming activity whose reference product is negative,
  which means the activity supplies the service of treating or disposing of that product.
  Their names begin with "treatment of". Any transforming activity becomes one when one
  of its inputs is a material for treatment; ecoinvent calls that case speciality
  production.
- **Market activities.** Datasets that move a product from the activities producing it to
  the activities consuming it, accounting for transport and for losses, and providing the
  average consumption mix for a region (source: ecoinvent-kb-glossary).
- **Construction activities.** Activities producing infrastructure, defined as products
  with a lifetime over one year that are not meant for consumption; their reference unit
  is usually "unit", and instead of mass properties they carry lifetime and lifetime
  capacity.
- **Operation activities.** Datasets representing the use of an infrastructure product,
  named with "operation", always taking that infrastructure as an input.
- **Service activities.** Activities that perform a service on another product without
  taking that product as an input; the documentation's example is power sawing, which has
  the saw, the fuel and the oil but not the tree.

## Exchanges

Two kinds, and the distinction is the backbone of the data model. An elementary exchange
is an exchange with the natural, social or economic environment: resources taken from
nature, emissions to air, water and soil, physical impacts, working hours under specified
conditions (source: ecoinvent-kb-glossary). An intermediate exchange stays inside the
technosphere, between two activities (source: ecoinvent-kb-glossary). The four direction
labels the format uses are "from environment", "to environment", "from technosphere" and
"to technosphere" (source: ecoinvent-kb-glossary).

On the output side, products split into the reference product, which is the driver of the
activity and the one whose demand changes the production volume, and by-products or
waste, which are co-produced but would not justify running the activity on their own
(source: ecoinvent-kb-activities-products). The split is activity-specific: the same
product can be a reference product in one activity and a by-product in another. By
contrast, the two by-product classifications an intermediate exchange carries, allocatable
against recyclable against waste, and mft against non-mft, are consistent across every
activity the exchange appears in (source: ecoinvent-kb-activities-products).

## Properties and production volumes

Every exchange with a mass can carry properties, and every product in the database has at
least dry mass, wet mass, water in wet mass, water content, fossil carbon content and
non-fossil carbon content (source: ecoinvent-kb-glossary); every product also has a price
(source: ecoinvent-kb-releases).

Production volume is the annual amount of a product generated inside the activity's
boundaries, expressed in the product's own unit; for a treatment activity it is the
amount of waste treated (source: ecoinvent-kb-glossary). Production volumes are additive
between activities producing the same product in the same geography, and they are what
determines the shares in a market activity (source: ecoinvent-kb-glossary). This wiki
records that production volumes exist and what they mean; the values are licensed data.

## Parent and child datasets

Regional datasets can inherit from a global one. Only geographical inheritance is allowed
in version 3: a regional dataset may be modelled as a child of the global dataset, values
in the child can be tied to the parent's, and changing the parent changes the child
(source: ecoinvent-kb-glossary).

Rest of the World is the related dynamic concept. When a global dataset and one or more
non-global datasets exist for the same activity, time period and scenario, a
Rest-of-the-World dataset is generated automatically during linking; since version 3.2 it
is an exact copy of the global dataset with adjusted uncertainty, then linked to
geographically appropriate suppliers (source: ecoinvent-kb-glossary).

## Three levels of data

The same database is published at three levels (source: ecoinvent-kb-activities-products):

- **Unit process (UPR).** The building block: a gate-to-gate process, aggregated neither
  vertically with the rest of its supply chain nor horizontally with processes making the
  same output. UPRs come in two forms, undefined and linked. Undefined UPRs are the data
  as the provider compiled it, unlinked and possibly multi-product; linked UPRs are what
  subdivision, allocation and linking produce under a chosen system model.
- **Cumulative life cycle inventory (LCI).** The UPRs linked into a supply chain, with
  resources and emissions of the same type aggregated across the stages, giving one list
  of elementary exchanges for the life cycle up to the factory gate.
- **Life cycle impact assessment (LCIA).** The cumulative inventory multiplied by the
  characterisation factors of a method. ecoinvent describes itself as focused on the UPRs
  and the LCIs, with LCIA scores provided as well; see [methods.md](methods.md).

Only some of this is visible without a licence: in ecoQuery a guest can see the metadata
and documentation of every dataset, while the exchanges and the undefined UPRs are for
licensees (source: ecoinvent-kb-activities-products, ecoinvent-kb-glossary).

## Where the data comes from and how it is reviewed

Most inventory datasets come from data collection projects dedicated to a sector and a
country or region, run with external partners who have the local and methodological
expertise; ecoinvent obtains the non-exclusive right to publish, while the creator remains
the owner (source: ecoinvent-kb-sources-citation). Primary data comes from field visits
and interviews where possible, secondary data preferably from public statistics,
peer-reviewed literature and compatible databases. Whatever the route, every dataset is
reviewed by internal and independent external experts before publication (source:
ecoinvent-kb-sources-citation).

Individual datasets can also carry an activity link, a direct link from one exchange to a
specific supplying dataset, supplied by the data provider rather than added by the service
layer. The documentation says providers should use it only where a supply chain really is
that tightly coupled, and that the reason goes in the exchange's comment field (source:
ecoinvent-kb-glossary).

## What this page deliberately omits

Every amount. Which exchanges a given activity has, how large they are, what a production
volume or a price actually is: all of that is the licensed database. The rule for this
branch is in [access-and-licence.md](access-and-licence.md).

## Related pages

- [system-models.md](system-models.md): what linking does with all of this.
- [schemas-and-nomenclature.md](schemas-and-nomenclature.md): how it is stored and classified.
- [../../vocabulary.md](../../vocabulary.md): the terms used above, defined.
