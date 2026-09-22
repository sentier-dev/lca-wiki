---
title: BAFU access and licence
type: database
summary: The download route, the terms of use, what they permit and what must never be redistributed.
audience: [P1, P2]
updated: 2026-09-21
sources: [bafu-2026-release, bafu-terms-of-use-2025, openlca-bafu-2026-notes, esu-bafu-database]
related: [../data/fetch.md, versions-and-provenance.md]
---

# BAFU access and licence

## The download route

There is one public route: the database's page on openLCA Nexus, where the components of
the current release are listed and can be downloaded (source: bafu-2026-release). The
database is free of charge, and downloading requires accepting the terms of use first
(source: openlca-bafu-2026-notes). There is no open API: nothing in the release is served
as a queryable endpoint, and a script that wants the data downloads the same files a
person would. The mechanics are in [../data/fetch.md](../data/fetch.md).

The publisher frames the availability as part of the Swiss Open Government Data strategy:
the inventories of the Swiss federal administration are freely available under that
strategy, subject to accepting the terms of use (source: esu-bafu-database).

## What the terms permit

The terms of use for the release read as follows, in summary and with the structure of
the document itself (source: bafu-terms-of-use-2025):

- **Definitions.** The Database is the entirety of the Datasets; a Dataset is an
  individual file in an open-source format such as ecoSpold v1; Data is the information
  in the database and its datasets; Reports are the expert reports describing the data
  and the models behind it; Authors are the people named as authors of those reports.
- **Permitted use.** The data as such, without modification and excluding the reports,
  may be freely used, processed, analysed and reused, in particular in life cycle
  assessment studies or in a calculator, as long as it is not sold, resold, distributed
  or marketed separately, either as such or as part of another database.
- **Everything else needs an agreement.** Any other commercial or non-commercial use of
  the data, in any format, is excluded unless BAFU explicitly allows it.
- **Attribution.** Any permitted use must credit the original source, with the quotation
  the terms prescribe for the release in hand.

## What the terms require when you modify the data

Modification is allowed, and it comes with four obligations (source:
bafu-terms-of-use-2025):

1. Do not modify the data in a way that suggests BAFU endorses you or your use.
2. Document every change: which datasets or data points were altered, the nature of the
   change, and the reason for it.
3. Put that documentation in a standalone document that accompanies the modified data
   and is accessible together with it.
4. If the modified data goes to a third party, share it under terms substantially
   equivalent to the original terms, and credit the original source.

Modified data must never be presented as the original dataset: it has to be labelled as
modified, and the original has to be cited as the primary source.

## What must never be redistributed

- The data sold, resold, distributed or marketed separately, or bundled into another
  database that is itself sold or distributed.
- The reports, or parts of them, reused in other work or publications without the
  authors' agreement. Report copyright sits with the authors and is carved out of the
  data licence.
- Modified data passed on without its change documentation, without the attribution, or
  under terms weaker than the original ones.

The terms also forbid adding restrictions of your own: no extra legal terms, technical
barriers or digital rights management that would stop others exercising the rights the
terms grant (source: bafu-terms-of-use-2025).

## Warranty

The database is provided as-is, with no warranty of any kind. The authors do not
guarantee that it is free of errors or fit for any particular purpose, and neither BAFU
nor the authors accept liability for losses arising from using or modifying the datasets
(source: bafu-terms-of-use-2025).

## What this wiki does about it

BAFU data is public, so counts, category names, units and indicator names appear on these
pages. Per-process amounts and per-flow characterisation factors do not: a page of them
would be a distribution of the data rather than a description of it, and describing is
what this branch is for. The same rule is a hard constraint for
[../../ecoinvent/](../../ecoinvent/), where the licence demands it; here it is an
editorial rule, applied for the same reason.

## Related pages

- [../data/fetch.md](../data/fetch.md): the concrete download and unpack route.
- [versions-and-provenance.md](versions-and-provenance.md): which release the terms apply to.
