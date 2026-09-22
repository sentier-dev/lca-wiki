---
title: flowmapper gotchas
type: module-page
summary: "What surprises people about flowmapper: input shape, rule order and partial matches."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-flowmapper, flowmapper-repo]
---

# flowmapper gotchas

- **The input must already be in the core ontology.** flowmapper does not sniff
  formats. Source and target lists have to be lists of flows with `name`,
  `identifier`, `context`, `unit`, optional sector labels and optional `synonyms`. The
  `extract-` subcommands exist to produce that shape from ecospold2 and SimaPro files;
  anything else you convert yourself (source: flowmapper-repo).
- **Matching is strategy driven, and the order matters.** Rules are tried in the order
  of the list passed as `rules=`, defaulting to `match_rules`. A permissive rule placed
  early will claim pairs a stricter rule would have matched differently
  (source: pypi-flowmapper).
- **There are no partial matches.** The library never emits "the names match but the
  contexts do not". A pair either matches or lands in the unmatched files. This makes
  mapping files larger but keeps them explicit (source: flowmapper-repo).
- **Chemical formulas are ignored.** They are not used as a matching signal, so two
  flows that only agree on formula will not match (source: flowmapper-repo).
- **Units are checked, not compared.** After a match, flowmapper verifies the units
  share a dimension and converts with Pint. A dimension mismatch is a failure of the
  match, not a conversion problem (source: flowmapper-repo).
- **Default transformations are applied unless you turn them off.** `flowmapper map`
  runs the bundled unit harmonisation and SimaPro context packages by default. Pass
  `--no-default-transformations` when you want to see the raw matching behaviour
  (source: pypi-flowmapper).
- **`-t` applies only to the source side.** The `--transformations` files are applied
  to the source flows before matching. Fixing the target list means fixing the file you
  pass as `TARGET` (source: pypi-flowmapper).
- **Matched-flow output is off by default.** `--unmatched-source` and
  `--unmatched-target` are on, the two `--matched-` switches are off. If you wanted the
  matched flows written out, ask for them (source: pypi-flowmapper).
- **The repository moved.** The PyPI homepage points at a personal account that now
  redirects to `cauldron/flowmapper`, and the README badges still point at an earlier
  fork. Follow the redirect rather than the badges (source: flowmapper-repo).
- **The distribution states no licence.** The PyPI metadata carries no licence field or
  classifier; the repository LICENSE file is MIT. Cite the repository, not the registry,
  when the licence matters (source: pypi-flowmapper, flowmapper-repo).
- **The documentation badge does not resolve.** The README links to a Read the Docs
  site which returned 404 on 2026-09-21. The README itself is the documentation
  (source: flowmapper-repo).
