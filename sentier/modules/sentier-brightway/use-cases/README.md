---
title: sentier-brightway use cases
type: readme
summary: End-to-end things a practitioner does with sentier-brightway.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-brightway use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [install-bafu-2026-into-a-brightway-project.md](install-bafu-2026-into-a-brightway-project.md):
  project mode, from one command to a scored activity.
- [export-bafu-2026-as-file-mode-datapackages.md](export-bafu-2026-as-file-mode-datapackages.md):
  file mode, then scoring with stock `bw2calc` and no `bw2data`.
- [check-bridge-coverage.md](check-bridge-coverage.md): read the coverage report before
  committing to the data.
- [run-the-backtest-against-bafu-results.md](run-the-backtest-against-bafu-results.md):
  compare every score with the published reference results.

## What belongs here

An end-to-end thing a practitioner does with this module, run start to finish, with the
commands as they were actually typed and the result as it actually came back. Candidates,
in the order a newcomer meets them: install the data into a Brightway project, write a
files export and score a process with stock `bw2calc`, read the coverage report before
committing to the data, and run the backtest against the published reference results.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `score-a-process-without-bw2data.md`, not `run-lca.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, with the date
   and the environment when the answer is yes.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
