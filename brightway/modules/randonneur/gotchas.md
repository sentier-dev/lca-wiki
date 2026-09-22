---
title: randonneur gotchas
type: module-page
summary: "What surprises people about randonneur: defaults, matching and overwriting."
audience: [P1, P3]
updated: 2026-09-21
sources: [randonneur-repo, pypi-randonneur]
---

# randonneur gotchas

- **`create` and `delete` do not run unless you ask for them.** The default `verbs` are
  the safe ones: `update`, `replace` and `disaggregate`. A transformation file can
  contain a `delete` block that silently does nothing until you pass
  `MigrationConfig(verbs=[...])` including it (source: randonneur-repo).
- **Matching is case insensitive by default.** `case_sensitive` defaults to `False`,
  deliberately, because software and users change capitalisation. If your data
  genuinely distinguishes two flows only by case, set it to `True`
  (source: randonneur-repo).
- **`replace` throws away the rest of the edge.** Aside from the quantitative values,
  no data from the original edge survives a `replace`. If you only meant to fix a few
  fields, use `update`. If you did not want the amount rescaled at all, use `delete`
  plus `create` (source: randonneur-repo).
- **Nested values are overwritten wholesale.** The reference implementation replaces a
  nested dictionary rather than merging into it, so a `target` that gives a new value
  for a nested key loses the keys it did not mention (source: randonneur-repo).
- **`mapping` renames the transformation's labels, not your data's.** It takes
  `{"source": {old: new}}` pairs and rewrites the migration file's keys so they match
  your schema. If you then use `fields`, use the renamed labels (source: randonneur-repo).
- **`edges_label` defaults to `edges`.** Data that calls them `exchanges` or `flows`
  matches nothing until you say so (source: randonneur-repo).
- **`fields` narrows the comparison, it does not require the keys.** A transformation
  whose `source` block names a key that is not in `fields` still matches; the extra key
  is simply not compared (source: randonneur-repo).
- **Not every verb is implemented for every graph object.** The README says plainly
  that not all verbs or graph object types are supported by the reference
  implementation, so a file valid against the specification can still be only partly
  applicable (source: randonneur-repo).
- **There is no command line.** The wheel installs no console script, so anything you
  read about running randonneur from a shell is about another package wrapping it
  (source: pypi-randonneur).
- **`randonneur` and `randonneur_data` version independently.** They happened to both
  be at 0.7.2 on 2026-09-21, which is a coincidence of numbering, not a guarantee. Pin
  both if a result has to be reproducible.
- **Transformations are JSON, so only JSON types survive.** Dates, sets and numpy
  values have to be expressed as strings or numbers in the file
  (source: randonneur-repo).
