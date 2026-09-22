---
title: bw2io gotchas
type: module-page
summary: What surprises people about bw2io 0.9.17, and what to do instead.
audience: [P1, P3]
updated: 2026-09-21
sources: [brightway-cheatsheet, bw2io-docs, pypi-bw2io, brightway-faq-versions, brightway-lca-org]
related: [commands.md, datasets.md, status.md]
---

# bw2io gotchas

- **`bw2setup()` is deprecated.** The documentation says so twice, and points at
  `bi.remote.install_project('<tag>', '<name>')` instead
  (source: brightway-cheatsheet). It still exists in 0.9.17 and still works, which is why
  it keeps appearing in old notebooks. It returns early and prints a message when
  `biosphere3` already exists.

- **An import does nothing to your project until `write_database()`.** Everything before
  that is a list of dictionaries in memory. This is a feature: it is why you can inspect
  and fix the unlinked edges first.

- **The order of strategies matters and the list is editable.** `imp.strategies` is a
  plain list; appending a linking strategy before the naming strategies have run will
  quietly link less (source: brightway-cheatsheet).

- **`drop_unlinked(i_am_reckless=True)` is named that way on purpose.** Dropping unlinked
  edges silently changes the inventory. Prefer `write_excel(only_unlinked=True)` or
  `create_randonneur_excel_template_for_unlinked()` and fix the mapping.

- **The SimaPro block CSV importer is an optional extra.** Importing `bw2io` 0.9.17
  without `multifunctional` and `bw_simapro_csv` prints a warning and leaves
  `SimaProBlockCSVImporter` undefined (observed on 2026-09-21). Install with
  `pip install "bw2io[multifunctional]"`.

- **`bw2io` pulls in nearly the whole stack.** It requires `bw2data >= 4.6.2`,
  `bw2calc >= 2.0`, `randonneur` and `randonneur_data`, among others
  (source: pypi-bw2io). Pinning `bw2io` therefore pins much more than `bw2io`.

- **Version 0.9 is the 2.5 line.** `bw2io < 0.8.9` belongs to Brightway 2
  (source: brightway-faq-versions). The old line's API differs.

- **The biosphere you get depends on how you started the project.** A project from
  `ecoinvent-3.8-biosphere` does not have the same flow list as one from
  `ecoinvent-3.9.1-biosphere`, and an ecoinvent release imported with
  `import_ecoinvent_release` gets its own namespaced biosphere database. Linking across
  projects built differently is where most unlinked edges come from.

- **`import_ecoinvent_release` wants credentials.** Keep them out of the notebook and out
  of version control; `ecoinvent_interface` has a settings object for them. Never commit
  them anywhere, including to this wiki.

- **Elementary flow lists and migration tables age.** The shipped tables cover ecoinvent
  up to 3.9 and SimaPro mappings up to ecoinvent 3.5. Newer releases need `randonneur`
  transformations or `ecoinvent_migrate`, not these files. See
  [../randonneur/](../randonneur/).

- **97 open issues is the most in the core stack.** Import problems are the commonest
  Brightway problem; before writing a new strategy, search the tracker
  (source: brightway-lca-org).
