---
title: sentier-agribalyse gotchas
type: module-page
summary: "What surprises people: the singular matrix, the licence guard, the two factor sources, and the caches that make a rerun lie."
audience: [P1, P3]
updated: 2026-09-21
sources: [sentier-agribalyse-repo]
---

# sentier-agribalyse gotchas

Each bullet says what happens, why, and what to do instead. Checked against the
repository at commit `3d0df56`, 2026-09-17. (source: sentier-agribalyse-repo)

- **The default sparse solver refuses the matrix.** The linked technosphere carries
  placeholder activities with a zero diagonal, which the SciPy factorisation rejects as
  exactly singular. Install the `pardiso` extra and pass `--solver pardiso`, which the
  flow decomposition and the parameter override already default to. This is why the
  install command in the README carries that extra.

- **Install the guard before you bootstrap.** `pre-commit install` activates the hook
  that refuses to commit the licensed files. Regenerating them first and installing the
  hook afterwards leaves a window in which an ordinary `git add -A` stages licensed
  data. The ignore file covers the same paths, and the hook exists because an ignore
  file can be bypassed.

- **The Brightway export is licensed output.** It embeds the background amounts, so it
  is gitignored and named in the guard. Do not commit it, publish it or attach it to an
  issue. The public thing to share is the skeleton the strip command writes, or the
  mapping packages.

- **Nothing runs without the local inputs.** The export CSV and the harmonised flow list
  are not in git, and neither is anything derived from the background database. A fresh
  clone can run the test suite, which uses synthetic fixtures, but not a real link.

- **The registry has to be built first, in order.** The build command reads every
  artifact under `source/`; the flow universe, the biosphere catalogue, the factor
  tables and the activity catalogue each depend on the step before. Running the link
  against a half-built registry produces a link with silently fewer tiers.

- **Two factor sources disagree.** The adapted SimaPro table and the reference export
  are both present on purpose. The comparison command and two audits exist because the
  difference is real and per flow. If a score looks wrong, compare the factors before
  suspecting the inventory.

- **Caches survive a change you meant to be a fresh start.** Replacing the export
  without running the reset leaves the parsed import, the linked cache and the parameter
  overrides in place, so the next run reports on a mixture. Run the reset, optionally
  keeping the overrides, then relink.

- **The fast rescore path needs a full link first.** It skips parsing, transforms and
  matching and reads the linked cache, which raises a typed error when the cache is
  missing, corrupt or stale rather than silently rebuilding.

- **Two commands want a local assistant binary.** The mapping suggestion and the outlier
  note commands shell out to a local assistant by default and only use an API with
  `--use-api`, which needs the `llm-api` extra and a key in the environment. Both are
  optional: `--no-llm` on the link keeps the model out of the mapping path entirely,
  together with the curated synonym fallback.

- **Model suggestions are proposals, not mappings.** They land in a reviewed spreadsheet
  with an explicit decision column, and only accepted rows become a tier. Nothing a model
  writes reaches the registry without that column being set.

- **Tiers are data, so tier order is a data change.** Changing which mapping wins means
  changing a row or adding an ingester, not editing the matcher. The tier ladder and the
  row counts of the last build are recorded in the committed registry metadata.

- **A backtest name match is not exact by default.** The backtest falls back to other
  ways of matching a reference row to a product unless `--exact-name-only` is given. Use
  the flag when you are comparing coverage rather than exploring.

- **The dashboard is a static folder.** Serve it with any static file server and open
  the page; the front-end libraries are committed, so there is no build step and no
  network access needed.

- **Deep-dive design notes are not in the public repository.** The README points at an
  internal page for the mapping tiers and the solver notes. What is public is the code,
  the bootstrap document and the command help, which is what these pages document.
