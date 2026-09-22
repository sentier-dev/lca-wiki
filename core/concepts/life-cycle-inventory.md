---
title: Life cycle inventory analysis
type: concept
summary: "The LCA phase that collects flow data, builds the process model and calculates the inventory result."
audience: [P1, P3]
updated: 2026-09-21
sources: [ilcd-2010, iso-14044-2006, ef-compliant-data-guide-2.0]
related: [../standards/iso-14040-14044.md, ../standards/ilcd-format.md]
---

# Life cycle inventory analysis

Life cycle inventory analysis (LCI) is the second LCA phase: identifying the processes in
the system, collecting their input and output flows, modelling how the processes connect,
and calculating the result. ISO defines LCI results as the outcome of a life cycle
inventory analysis that catalogues the flows crossing the system boundary and provides
the starting point for life cycle impact assessment (ilcd-2010, chapter 3, citing
ISO 14040). The smallest element for which input and output data are quantified is the
[unit process](../../vocabulary.md#unit-processes) (ilcd-2010, chapter 3, citing ISO 14040).

## Why it matters

The inventory is where almost all of the work and almost all of the uncertainty sit. It
is also where data becomes reusable or does not: an inventory built as
[black box](../../vocabulary.md#unit-process-black-box) processes is harder to review and
is regularly distorted among co-functions, whereas single-operation unit processes are
undistorted and allow a more reliable review (ilcd-2010, chapters 3 and 6.5.3.2).

## What the standards say

**ISO 14044 (iso-14044-2006, clause 4.3).** Data collection, validation, relating data to
the unit process and to the functional unit, and refining the system boundary. The ILCD
Handbook's chapter 7 follows this structure and adds detail
(ilcd-2010, chapter 7.1).

**ILCD Handbook (ilcd-2010, chapter 7).** The inventory work is laid out as a sequence:

- *Which flows.* Three kinds are collected:
  [elementary flows](../../vocabulary.md#elementary-flow) such as resources, emissions and
  land use; [product flows](../../vocabulary.md#product-flow), the goods and services that
  link the process to other processes; and
  [waste flows](../../vocabulary.md#waste-flow), which have to be linked to waste
  management processes for the model to be complete (ilcd-2010, chapter 7.1).
- *Which processes.* Identified differently for attributional modelling, where the
  processes attributable to the system are collected, and for consequential modelling,
  where the marginal processes affected by the decision are identified
  (ilcd-2010, chapters 7.2.3 and 7.2.4).
- *Avoiding black boxes.* Subdivision and virtual subdivision are applied to turn black
  box unit processes into single-operation ones before any allocation is considered
  (ilcd-2010, chapter 7.4.2.2).
- *Interim quality control.* Data gaps are handled explicitly: obtain better unit process
  data, then deal with remaining gaps, and document what was done. Remaining data gaps
  shall be reported (ilcd-2010, chapters 7.4.2.11 and 9.3.2).
- *Naming conventions.* The ILCD reference elementary flows should be used wherever
  possible, to keep inventories compatible and to avoid the same flow appearing twice in
  an aggregated inventory (ilcd-2010, chapter 7.1 footnote and chapter 7.4.5).
- *Averaging and secondary data.* Averaging LCI data and selecting secondary data sets are
  separate, documented steps (ilcd-2010, chapters 7.6 and 7.7).
- *Calculating the result.* Once the system is modelled, LCI results are calculated
  (ilcd-2010, chapter 7.10).

**ILCD data format and EF (ef-compliant-data-guide-2.0, chapter 1).** The format
distinguishes the inventory deliverables that a study can produce: "Unit process, single
operation", "Unit process, black box", "LCI result" (an aggregated data set listing only
the elementary flows and the reference product, for example cradle to gate or cradle to
grave), "Partly terminated system" (aggregated but with at least one product flow left
open, such as an electricity input the user must saturate) and parameterised data sets,
where exchange values scale with a characteristic parameter documented in the
mathematical model.

## How it is decided in practice

The practitioner decides, for each process: is this foreground or background; is
specific, average or generic data appropriate; and is the process multifunctional. The
handbook recommends planning data collection around the most relevant data and
information rather than treating every process alike, and using primary data for the
foreground system where available (ilcd-2010, chapters 7.3.2 to 7.3.6). Where a process
cannot be measured, the choice is between a lower-quality data estimate and a declared
cut-off; the handbook prefers the estimate for anything that might matter
(ilcd-2010, chapter 6.6.3).

## Common pitfalls

- Collecting a plant-level black box and then allocating it. Because not all processes
  inside a black box relate to all co-functions to the same extent, the result is
  regularly distorted (ilcd-2010, chapter 6.5.3.2).
- Leaving waste flows unlinked, so the effort and impact of treating them never appear
  (ilcd-2010, chapter 7.1).
- Inventing flow names instead of using the reference elementary flow list, which creates
  duplicates that no impact assessment method will characterise
  (ilcd-2010, chapter 7.1 footnote).
- Leaving sum indicators such as "Metals" or composed emissions such as "Diesel engine
  off-gas" in the inventory. These typically have no characterisation factor and shall
  not remain (ilcd-2010, chapter 8.2).

## Related terms

- [unit process](../../vocabulary.md#unit-processes)
- [unit process, black box](../../vocabulary.md#unit-process-black-box)
- [elementary flow](../../vocabulary.md#elementary-flow)
- [product flow](../../vocabulary.md#product-flow)
- [waste flow](../../vocabulary.md#waste-flow)

## Related pages

- [elementary-and-intermediate-flows.md](elementary-and-intermediate-flows.md) — the flow
  types this phase collects
- [allocation-and-multifunctionality.md](allocation-and-multifunctionality.md) — what to
  do when a process has more than one function
- [data-quality.md](data-quality.md) — how the result of this phase is graded
- [../standards/ilcd-format.md](../standards/ilcd-format.md) — how an inventory is
  exchanged
