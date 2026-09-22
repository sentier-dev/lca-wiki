---
title: Run a scenario difference file
type: use-case
summary: Sweep a set of scenarios through Activity Browser's superstructure layer by handing it a spreadsheet of changed exchange values.
audience: [P1]
updated: 2026-09-22
sources: [activity-browser-repo, activity-browser-docs, pypi-activity-browser]
verified: no
related: [install-and-open-a-project.md, ../classes.md, ../gotchas.md, ../../bw2parameters/use-cases/define-and-evaluate-parameters.md]
---

# Run a scenario difference file

**Persona:** P1 practitioner comparing a handful of futures, or a modeller handing a
sweep to someone who will not run Python · **GICS sector:** any

## Goal

One calculation setup scored under several scenarios in one pass, with the scenarios
defined in a spreadsheet a domain expert can edit rather than in code.

## Prerequisites

- Activity Browser installed and a project open; see
  [install-and-open-a-project.md](install-and-open-a-project.md). Nothing on this page
  was run: the interface is a Qt desktop application and the verification environment is
  headless.
- A project whose databases are already imported and linked. A scenario difference file
  changes **values on existing exchanges**; it does not create nodes or edges.
- A spreadsheet tool. The file is an ordinary workbook.

## Steps

1. Build the calculation setup you want to sweep: reference flows and impact categories,
   in the LCA setup tab. This is the same object `bd.calculation_setups` holds in
   Python.

2. Write the scenario difference file. Each row identifies one exchange by both of its
   ends, and carries one column per scenario holding the value that exchange takes in
   that scenario. The identifying columns name the database, the node and the flow on
   each side; the exact column names belong to the version you are running, so take them
   from the template the interface offers rather than from memory.

3. Load it. The superstructure layer reads the workbook, resolves each row against the
   project's databases, and builds one modified technosphere per scenario
   (source: activity-browser-repo).

4. Read the unresolved rows before calculating. A row whose ends do not resolve is
   dropped, and a silently smaller sweep is the failure mode to watch for.

5. Run the calculation. The results tab gains a scenario selector, and the contribution
   views follow it.

6. Export the results if you need them outside the interface. The export wizard writes
   the results table; the project itself stays where it was.

## Expected output

Described from the repository's structure and its architecture notes, not from a run:

- The superstructure layer lives in `bwutils/superstructure/` and covers scenario
  handling, scenario difference files and a scenario-aware graph traversal
  (source: activity-browser-repo).
- Loading the file produces one scenario column per scenario named in the workbook, and
  a count of the exchanges it matched.
- The results table gains a scenario dimension on top of the reference flows and impact
  categories already in the setup, so a sweep of five scenarios over two reference flows
  and three impact categories is thirty numbers.
- Nothing in the project changes. The modified values live in the calculation, not in the
  databases.

## Pitfalls

- **A scenario difference file changes values, not structure.** Adding a supplier is a
  database edit, not a scenario.
- **Rows that do not resolve are dropped.** Check the count the loader reports against
  the number of rows you wrote.
- **The column names are version specific.** Use the template the interface gives you.
  The 2.11 line and the 3.0 beta are different applications; see
  [../gotchas.md](../gotchas.md).
- **The interface and your Python session share the project,** so a database edited in a
  script while the sweep is loaded gives a stale or inconsistent result until the
  interface refreshes.
- **This is not the same thing as parameters.** A parameterised model computes its
  amounts from formulas; see
  [../../bw2parameters/use-cases/define-and-evaluate-parameters.md](../../bw2parameters/use-cases/define-and-evaluate-parameters.md).
  A scenario difference file states the amounts outright. They can be combined, and the
  combination is where most confusion about which number won comes from.
- **The graph explorer is not graph traversal.** Do not read a contribution result off
  the explorer; the project's own architecture notes say the mathematics lives elsewhere
  (source: activity-browser-docs). For traversal in Python, see
  [../../bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md](../../bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md).
- **A scenario sweep is not an uncertainty analysis.** Monte Carlo and global sensitivity
  analysis are separate features in `bwutils/`, answering a different question.

## Related vocabulary

- [Assumption scenario](../../../../vocabulary.md#assumption-scenario)
- [Analysed decision](../../../../vocabulary.md#analysed-decision)
- [Exchange](../../../../vocabulary.md#exchange)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Foreground](../../../../vocabulary.md#foreground)
- [Background](../../../../vocabulary.md#background)
- [Comparative life cycle assessment](../../../../vocabulary.md#comparative-life-cycle-assessment)
- [Uncertainty](../../../../vocabulary.md#uncertainty)
- [Impact category](../../../../vocabulary.md#impact-category)

## Verification

`verified: no`. Activity Browser is a Qt desktop application, the verification
environment is headless, and the agent's instructions forbade launching it. This page is
therefore deliberately short on exact column names and exact dialogue wording: writing
them from memory would be guessing, and the interface's own template is authoritative.

What is here comes from the repository source tree, read on 2026-09-21 in a local
read-only clone for [../classes.md](../classes.md) and
[../datasets.md](../datasets.md), and from the project's published architecture notes
(source: activity-browser-repo, activity-browser-docs).

A verifier needs a desktop machine, a linked project and a scenario workbook. Worth
recording: the template's column names for the line they are on, how many rows resolved,
and whether the results export carries the scenario dimension.
