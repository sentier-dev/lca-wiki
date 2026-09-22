---
title: bw_timex layout
type: module-page
summary: How the bw_timex package is organised, module by module.
audience: [P2, P3]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs]
---

# bw_timex layout

The installed package tree of bw_timex 1.4.0, read from the wheel installed from PyPI
(source: pypi-bw-timex). The order below follows the order of a calculation rather than
the alphabet.

```
bw_timex/
├── __init__.py                  the public surface, re-exported through __all__
├── timex_lca.py                 TimexLCA and TimexLCASettings: the whole calculation
├── validation.py                checks on the demand, method and scenario inputs
├── database_metadata.py         what a database represents, stored in its metadata
├── scenario_builder.py          building the missing background vintages
├── edge_extractor.py            a bw_temporalis traversal that yields dated edges
├── timeline_builder.py          the dated edges become a process timeline
├── matrix_modifier.py           time-explicit process copies, relinked per vintage
├── dynamic_biosphere_builder.py the biosphere matrix indexed by flow and date
├── block_structure.py           the block layout of the modified matrices
├── background_solver.py         solving the background once and reusing it
├── solvers.py                   the solver choices and their wiring
├── _lci_cache.py                the module-level supply and biosphere caches
├── helper_classes.py            SetList and the inter-database activity mapping
├── errors.py                    UnmappedDatabaseError and friends
├── utils.py                     the user-facing helper functions and the widget
└── data/decay_multipliers.json  reference data for dynamic characterisation
```

## Key files

- `timex_lca.py` is by far the largest file and the one to read first: `TimexLCA` and
  `TimexLCASettings` between them name every option a calculation has.
- `timeline_builder.py` and `matrix_modifier.py` are the two steps that make the
  result time explicit. The first decides when each process happens; the second
  rewrites the matrices so it is calculated with the right vintage.
- `dynamic_biosphere_builder.py` is where an emission gains a date: its matrix rows are
  flow-and-date pairs rather than flows.
- `edge_extractor.py` subclasses the `bw_temporalis` traversal, which is itself built
  on `bw_graph_tools`. A change in either shows up here first. See
  [../bw_temporalis/layout.md](../bw_temporalis/layout.md).
- `scenario_builder.py` and `database_metadata.py` are the newer scenario surface:
  they build missing background vintages and record what each database stands for.
- `_lci_cache.py` and `background_solver.py` exist for speed; `clear_background_lci_cache`
  in the public surface is how you reset them.
- `data/decay_multipliers.json` is the only data file, described in
  [datasets.md](datasets.md).

## Documentation structure

The documentation site is organised as a user guide with a four-step walkthrough, a
theory section, an example collection of tutorials and case studies, and a generated
API reference with one page per module listed above (source: bw-timex-docs).
