---
title: Reaching ecoinvent data as a licensed user
type: database
summary: "The access routes a licence opens, how ecoinvent_interface expects credentials, and why nothing is committed here."
audience: [P1, P3]
updated: 2026-09-21
sources: [ecoinvent-website, ecoinvent-licences, ecoinvent-interface-repo, ecoinvent-kb-glossary, ecoinvent-kb-activities-products]
related: [../knowledge/access-and-licence.md, ../../brightway/modules/ecoinvent_interface/README.md]
---

# Reaching ecoinvent data as a licensed user

## There is no open route, and no fetch script here

Access to the database is acquired through an ecoinvent licence (source:
ecoinvent-website). There is no public download, no anonymous API and therefore no
`fetch.sh` in this folder. This page describes the routes a licence opens and stops
there.

What a guest can reach without a licence: ecoQuery registration as a guest, which shows
the metadata and description of every dataset but not its exchanges (source:
ecoinvent-kb-glossary, ecoinvent-kb-activities-products). That is enough to check whether
an activity exists, in which geography and for which period, which is often the question
a reader of this wiki actually has.

## The routes

- **ecoQuery**, the web interface. Every licensed user can use it, including users who
  normally reach the database through a tool such as openLCA, SimaPro or GaBi (source:
  ecoinvent-kb-glossary). It is also where the files section lives: the release
  downloads, the cumulative inventory and result spreadsheets, and the supporting
  documents including the LCIA implementation report (source:
  ecoinvent-kb-activities-products).
- **An LCA tool's own integration.** The tool authenticates with your licence and manages
  the download itself.
- **The ecoinvent API**, available as an add-on on a Developer licence (source:
  ecoinvent-licences).
- **`ecoinvent_interface`**, an unofficial and unsupported Python library that
  authenticates as a licensed user and downloads releases, reports and individual process
  documents (source: ecoinvent-interface-repo). This is the route the tooling in this
  wiki uses.

## What `ecoinvent_interface` does

The library is distributed under the MIT licence and is explicit that it is unofficial
and unsupported: the licence of the library says nothing about the licence of the data it
downloads (source: ecoinvent-interface-repo). Before it can do anything, the user has to
have accepted the ecoinvent licence and the personal-information agreement on the
ecoinvent website (source: ecoinvent-interface-repo).

Two objects carry the work (source: ecoinvent-interface-repo):

- **`EcoinventRelease`** lists the available database versions and the system models
  available for a version, downloads and extracts a release, and lists and fetches the
  extra files and the reports published with it.
- **`EcoinventProcess`** works at the level of one process: set the version and system
  model, select a process by id, filename or attributes, read its basic information and
  its documentation, and download its unit process, inventory, impact assessment or PDF
  document.

Six release types are available through it: ecospold, matrix, lci, lcia, cumulative_lci
and cumulative_lcia (source: ecoinvent-interface-repo). Which to ask for is a
[../knowledge/format.md](../knowledge/format.md) question.

The commands and the API surface belong to the module page,
[../../brightway/modules/ecoinvent_interface/](../../brightway/modules/ecoinvent_interface/),
not here. This page says what the route is; that page says how to drive it.

## Credentials

Three mechanisms are supported, in this order of precedence: values passed directly when
building the settings object, then environment variables, then a secrets directory
managed for you by the library's own helper for storing a setting permanently (source:
ecoinvent-interface-repo). The environment variables are named `EI_USERNAME` and
`EI_PASSWORD`.

Naming the mechanism is as far as this wiki goes. Rules, without exception:

- **Never write a credential into a page, a script, a notebook or a commit.** Not as an
  example, not redacted, not in a code fence.
- **Never write the value of one of those environment variables anywhere in this
  repository.** Not in a page, not in an example, not in a commit message, and a review
  that finds one treats the credential as published.
- **Set them in your shell or your secrets store**, outside the repository, and let the
  library read them.
- **Do not commit a settings or secrets file**, and check before you stage that you have
  not.

## Nothing is downloaded into this repository

No ecoinvent release, no extract, no cached file, no derived table. The wiki carries one
binary, the ILCD Handbook PDF in [../../raw/](../../raw/), and that is the whole of it. A
use case in [../use-cases/](../use-cases/) may show the commands that fetch a release and
describe the result; it writes the files outside the repository and pastes none of their
contents.

## Related pages

- [../knowledge/access-and-licence.md](../knowledge/access-and-licence.md): what the licence permits.
- [../knowledge/format.md](../knowledge/format.md): which release type to ask for.
- [../../brightway/modules/ecoinvent_interface/](../../brightway/modules/ecoinvent_interface/): the library itself.
