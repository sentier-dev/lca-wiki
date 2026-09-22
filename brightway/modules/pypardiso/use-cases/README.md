---
title: pypardiso use cases
type: readme
summary: End-to-end things a practitioner does with pypardiso.
audience: [P1]
updated: 2026-09-22
sources: []
---

# pypardiso use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## What belongs here

There is little to do with pypardiso directly, so a use case here is usually about the
environment rather than the code: making Brightway calculations faster on Linux or
Windows, choosing a solver on macOS where MKL is unavailable, or checking that the
faster solver is actually the one in use.

## Pages here

- [Solve with PARDISO in bw2calc](solve-with-pardiso-in-bw2calc.md) — Install pypardiso so bw2calc picks the MKL PARDISO solver, and verify it did, on a calculation whose score you already know. *(verified)*

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `speed-up-calculations-with-a-faster-solver.md`, not `call-spsolve.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean environment and record `verified:` honestly, naming the
   platform, the MKL version and whether the solver was actually used.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
