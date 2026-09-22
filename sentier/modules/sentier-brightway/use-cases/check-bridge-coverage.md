---
title: Check bridge coverage before installing
type: use-case
summary: "Read the coverage report to see how much of the BAFU-2026 flow list reaches EF 3.1, and what stays in the residual database, before writing anything."
audience: [P1]
updated: 2026-09-22
sources: [sentier-brightway-repo, sentier-mappings-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, sentier-brightway 0.1.0 from a clone, four sibling data clones under one data root"
---

# Check bridge coverage before installing

**Persona:** P1 practitioner deciding whether this inventory and method pair is fit for a
study · **GICS sector:** any

## Goal

A defensible answer to "how much of this inventory actually gets characterised", taken
from the build itself rather than from documentation, in a few seconds and without
touching a Brightway project or writing a single file.

## Prerequisites

- Python 3.10 or newer, `uv`, and a clone of sentier-brightway. No `bw2data`.
- Network access on the first run, or local clones of the four Sentier data repositories
  under one [data root](../../../../vocabulary.md#data-root).

## Steps

1. Print the report:

   ```bash
   uv run sentier-brightway coverage --data-root /path/to/data-root
   ```

2. See what the last, nomenclature-only mapping package contributes by leaving it out:

   ```bash
   uv run sentier-brightway coverage --data-root /path/to/data-root --skip-nomenclature
   ```

3. When you want the numbers as an object rather than as text, for a report or a test:

   ```bash
   uv run python -c "from sentier_brightway import coverage; c = coverage(); print(c)"
   ```

## Expected output

Four blocks. First, what would be installed: 11,947 processes, an EF 3.1 biosphere and
25 methods. Second, the linking line: about 2,570 of about 2,680 source
[elementary flows](../../../../vocabulary.md#elementary-flow) reach EF 3.1, close to 96
per cent, and about 284,000 of about 294,000 biosphere exchange rows, close to 97 per
cent. Third, the qualification that matters for a score: roughly five hundred of the
linked flows land on EF flows that carry no
[characterisation factor](../../../../vocabulary.md#characterization-factors), so they
are correctly named and contribute zero. Fourth, the unlinked remainder, counted per
[compartment](../../../../vocabulary.md#compartment): a little over a hundred flows
across economic issues, emissions to air, soil and water, non material emissions and
resources. The report closes with the citation the release requires.

Step 2 prints the same shape with a smaller linked count, because the flows the
nomenclature package would have placed stay in the
[residual database](../../../../vocabulary.md#residual-database) instead.

Read the two together. The first number is nomenclature coverage, the second is coverage
weighted by how often a flow is actually used, and the nomenclature-only count is the
part of the first number that buys you no impact.

## Pitfalls

- **Coverage is not accuracy.** A flow that bridges is a flow that found a plausible EF
  counterpart; whether that counterpart is the right one is a mapping review question,
  and belongs in [../../sentier-mappings/](../../sentier-mappings/).
- **The command still reads all four repositories.** It is cheap only once the data is
  cached or a data root is given; the first run downloads.
- **Percentages move when the pins move.** The numbers are those of the commits pinned in
  `sources.toml` at the version you have, not a property of BAFU-2026 in the abstract.
  Record the version alongside the number.
- **Do not quote the exchange-row percentage as a mass balance.** Unlinked exchanges keep
  their amounts in the residual database; they are missing from the score, not from the
  inventory.

## Related vocabulary

[Bridge](../../../../vocabulary.md#bridge),
[relink](../../../../vocabulary.md#relink),
[nomenclature](../../../../vocabulary.md#nomenclature),
[residual database](../../../../vocabulary.md#residual-database),
[compartment](../../../../vocabulary.md#compartment),
[characterization factors](../../../../vocabulary.md#characterization-factors),
[ordered pair](../../../../vocabulary.md#ordered-pair).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-brightway at version 0.1.0, with `--data-root` pointing at four sibling clones of
the data repositories. Step 1 was executed as written and took 8.6 s on a cold start and
4.1 s on a warm one. It reported 2,566 of 2,679 flows and 284,443 of 293,747 biosphere
exchange rows linked, 518 nomenclature-only flows, and 113 unlinked flows split across
six compartments. Steps 2 and 3 were not run in this session.
