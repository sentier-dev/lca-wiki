---
title: BAFU schemas and nomenclature
type: database
summary: Flow lists, compartments and sub-compartments, units and flow properties, and the identifiers that hold them together.
audience: [P2, P3]
updated: 2026-09-22
sources: [bafu-2026-release, openlca-bafu-2026-notes, sentier-brightway-repo]
related: [format.md, ../../vocabulary.md, ../../core/sectors/crosswalk.md]
---

# BAFU schemas and nomenclature

Everything below is read from the BAFU:2026 v1 release itself: the openLCA package for
the entity counts and the ecoSpold v1 archive for the field layout (source:
bafu-2026-release). Names, counts and units are described; amounts and factors are not.

## Flows

The openLCA package carries 14,407 flows, of three kinds (source: bafu-2026-release):

- product flows, 10,835
- elementary flows, 2,460
- waste flows, 1,112

That waste flows are a kind of their own, rather than product flows with a negative
reference, is worth noting when mapping the database onto a tool that has only two kinds.
1,921 flows carry a CAS number (source: bafu-2026-release).

The elementary flow list in the openLCA package of BAFU:2026 v1 was deliberately
restricted to the flows actually used in the database, so that datasets built on top of
it stay consistent (source: openlca-bafu-2026-notes). A mapping written against an
earlier release, or against the full openLCA reference list, will have unmatched entries.

The count above is the openLCA package's. The republished inventory that
[../../sentier/modules/sentier-inventory/](../../sentier/modules/sentier-inventory/)
ships, and that the bridge in
[../../sentier/modules/sentier-brightway/datasets.md](../../sentier/modules/sentier-brightway/datasets.md)
is measured against, carries 2,679 source elementary flows rather than 2,460
(source: sentier-brightway-repo). The two numbers are read from different components of
the release and are not a restatement of each other; quote the one belonging to the
component you are using, and see [../roadmap.md](../roadmap.md) for the open question of
what accounts for the difference.

## Compartments and sub-compartments

Elementary flows sit in a category tree under a root named `Elementary flows`, with seven
compartments at the first level and their sub-compartments below (source:
bafu-2026-release):

| Compartment | Sub-compartments |
|---|---|
| `Emission to air` | `high population density`, `low population density`, `low population density, long-term`, `indoor`, `lower stratosphere + upper troposphere`, `stratosphere`, `unspecified` |
| `Emission to water` | `fresh water`, `fresh water, long-term`, `ground water`, `ground water, long-term`, `lake`, `river`, `river, long-term`, `ocean`, `surface water`, `fossil-`, `unspecified` |
| `Emission to soil` | `agricultural`, `forestry`, `industrial`, `urban, non industrial`, `unspecified` |
| `Resource` | `biotic`, `in air`, `in ground`, `in water`, `land`, `fossil well`, `unspecified` |
| `Waste` | `ecopoints 97, CH`, `unspecified` |
| `Economic` | `unspecified` |
| `Immaterial emission` | `unspecified` |

Two of these will not be in a standard nomenclature: `Economic` and
`Immaterial emission` exist because the Ecological Scarcity method scores things such as
noise that are not substance emissions. `Waste` as a compartment, with an
`ecopoints 97, CH` sub-compartment, is likewise method-driven rather than physical. The
compartment tree holds 42 categories in total, all 2,460 elementary flows among them
(source: bafu-2026-release).

The core wiki's reading of compartment and sub-compartment, and the BAFU senses beside
it, are both in [../../vocabulary.md](../../vocabulary.md).

## Categories for processes and products

Categories are a single tree shared by several entity kinds, each node carrying a model
type that says what it classifies. In BAFU:2026 v1 the tree holds 1,424 category nodes:
695 classify flows, 649 classify processes, 47 classify impact categories, 24 classify
locations, and the rest classify unit groups, flow properties, currencies, parameters and
the impact method (source: bafu-2026-release). The process branch has 59 top-level nodes
and nests up to five levels; the flow branch has 61, the two extra being
`Elementary flows` and `non material emissions` (source: bafu-2026-release).

The ecoSpold v1 files carry the same grouping flat instead of as a tree: the reference
function of a process and every exchange carry a `category` and a `subCategory`, plus a
`localCategory` and `localSubCategory` in German (source: bafu-2026-release).

## Units and flow properties

The openLCA package carries 21 unit groups, 179 units and 23 flow properties (source:
bafu-2026-release). The unit groups and their reference units are:

| Unit group | Reference unit |
|---|---|
| Units of mass | `kg` |
| Units of energy | `MJ` |
| Units of volume | `m3` |
| Units of area | `m2` |
| Units of area\*time | `m2*a` |
| Units of length | `m` |
| Units of length\*time | `km*a` |
| Units of mass\*length | `t*km` |
| Units of mass\*time | `kg*d` |
| Units of volume\*length | `m3*km` |
| Units of volume\*time | `m3*a` |
| Units of person\*length | `p*km` |
| Units of person\*time | `guest night` |
| Units of number | `Item(s)` |
| Units of number\*length | `Items*km` |
| Units of time | `h` |
| Units of power | `W` |
| Units of mole | `mol` |
| Units of mole/mass | `g/mole` |
| Units of radioactivity | `kBq` |
| Units of currency | `USD` |

The flow properties include the physical ones a reader expects (Mass, Energy, Volume,
Area, Length, Time, Power, Mole, Molar mass, Radioactivity, Number) and several that are
specific to this database's subject matter: Gross calorific value, Net calorific value,
Market value, Guest night, Person transport, Mass transport, Item transport, Volume
transport, Area\*Time, Length\*Time, Mass\*Time, Volume\*Time (source: bafu-2026-release).

Only eleven units actually appear as reference units of the published processes:
`kg`, `MJ`, `m3`, `m2`, `m2*a`, `m`, `km*a`, `t*km`, `p*km`, `h` and `Item(s)` (source:
bafu-2026-release). That short list is the practical one to write an importer against.

## Identifiers

- Every process file in the ecoSpold v1 archive is named `process_<uuid>.xml`, and the
  same UUID is repeated inside the general comment of the reference function (source:
  bafu-2026-release).
- Entities in the openLCA package carry both an internal integer id and a stable
  reference id; the reference id is the one that survives a re-import (source:
  bafu-2026-release).
- Locations carry a code as well as a name; the codes follow the familiar LCA convention
  of two-letter country codes plus regional and special codes (source:
  bafu-2026-release).
- The LCIA results workbook identifies a process by its name string plus its category,
  sub-category and unit, not by UUID (source: bafu-2026-release). Joining the workbook to
  the inventory therefore means matching on names, which is the one place in this release
  where identifiers do not carry through.

## Reference to EF 3.1 and to the vocabulary

The elementary flow names in this release are BAFU's own, not the Environmental Footprint
reference list, even though EF 3.1 indicators are published for the database; see
[methods.md](methods.md) for what that means for a mapping. Terms this database uses in
its own sense are collected in [../../vocabulary.md](../../vocabulary.md), beside the
senses the standards give the same words.

## Related pages

- [format.md](format.md): where each of these entities is stored.
- [sector-coverage.md](sector-coverage.md): the category tree read as sectors.
