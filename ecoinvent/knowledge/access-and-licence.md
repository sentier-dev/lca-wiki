---
title: ecoinvent access and licence
type: database
summary: "How a licensed user reaches ecoinvent, what the licence types are, and what may never leave the licensee's hands."
audience: [P1, P2]
updated: 2026-09-21
sources: [ecoinvent-licences, ecoinvent-eula, ecoinvent-website, ecoinvent-kb-glossary, ecoinvent-kb-activities-products, ecoinvent-interface-repo]
related: [../data/access.md, versions-and-provenance.md]
---

# ecoinvent access and licence

## There is no open route

Access to the database is acquired through an ecoinvent licence (source:
ecoinvent-website). Nothing about that is a formality to be worked around: the licence is
the access mechanism, and every route into the data, web interface or API, authenticates
against it.

What a person without a licence can see: ecoQuery, the web interface to the database,
lets anyone register as a guest and view the metadata and description of every dataset in
it (source: ecoinvent-kb-glossary). The exchanges of a dataset and the undefined unit
processes are for licensees (source: ecoinvent-kb-activities-products). So the names, the
geographies, the time periods, the classifications and the documentation are public
enough to describe; the numbers are not, and this branch is built on exactly that line.

## The licence types

Four are offered (source: ecoinvent-licences):

- **Single-User**, one named user with access to the complete database, aimed at solo
  consultants and individual experts, sold as an annual subscription.
- **Enterprise**, for companies with several users, adding centralised licence
  management, user administration and team collaboration.
- **Developer**, for software integration: all the Enterprise features plus software
  integration rights and an available API add-on, and it is the one type that carries a
  sub-licensing contract, allowing a tool's users to be given access limited to LCIA
  data.
- **Educational**, unlimited access to the whole database including LCI, LCIA, UPR and
  the reports, for an unlimited number of students under one valid professorship.

Sub-licensing is worth spelling out, because it is what allows a software product to ship
ecoinvent-derived results at all: the comparison of licence types shows the sub-licensee
arrangement as available only on the Developer licence, and not available on the others
(source: ecoinvent-licences).

## The binding document

The End User Licence Agreement is the document that governs use of the database, and it
is published with the association's other legal documents, alongside the privacy policy,
the controller clause annex and the standard contractual clauses (source:
ecoinvent-eula). It is accepted before use. This wiki does not paraphrase its clauses,
because it has not read the agreement itself; the page names it, links it, and says what
the public pages say about it. Filling that gap is on [../roadmap.md](../roadmap.md).

The library that automates downloads adds the operational version of the same point: a
user must accept the ecoinvent licence and the personal-information agreement on the
website before credentials will work through it (source: ecoinvent-interface-repo).

## What must never be redistributed

The rule this branch enforces, and the rule any user of this wiki should carry into their
own work:

- **No inventory amounts.** Not one exchange, not one production volume, not one price.
- **No characterisation factors derived from the licensed data**, and no LCIA scores
  taken from it.
- **No table of numbers** that would let a reader reconstruct part of the database. A
  numeric table anywhere under this branch is refused in review, by design, and calling
  a table counts is for counts of things, never for amounts.
- **No extracts** of dataset content dressed up as examples.

What may be published: activity and product names, geographies, units, version numbers,
system model names, classification codes and their meanings, format field names, and
short glossary quotations with attribution and a link. That is enough to describe the
database completely, which is what a wiki is for.

## What a licensee may publish

Results, in the ordinary sense of an LCA study, are what the database exists to produce,
and the citation requirements in
[versions-and-provenance.md](versions-and-provenance.md) are written for exactly that
case. Where the line sits between a study result and a redistribution of the underlying
data is a question the EULA answers and this page does not; when in doubt, ask ecoinvent
rather than this wiki.

## Credentials

Never in a file, never in a page, never in a commit. The access mechanics, including how
`ecoinvent_interface` expects credentials to be supplied, are in
[../data/access.md](../data/access.md), which names the mechanisms and no values.

## Related pages

- [../data/access.md](../data/access.md): the practical route for a licensed user.
- [versions-and-provenance.md](versions-and-provenance.md): how to cite what you used.
- [../../bafu/knowledge/access-and-licence.md](../../bafu/knowledge/access-and-licence.md): the contrasting case: a free database with terms of use.
