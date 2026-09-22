---
title: bw_temporalis gotchas
type: module-page
summary: "What surprises people about bw_temporalis: net amounts, resolution and sums."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-bw-temporalis, bw-temporalis-repo, pypi-bw-graph-tools]
---

# bw_temporalis gotchas

- **It uses the net amount in the matrices.** Where several edges with temporal
  dynamics connect the same two nodes, especially with different signs, the net amount
  is what gets distributed, and the individual timings are lost. The README says to
  split such edges across several processes (source: bw-temporalis-repo).
- **Resolution below a second is rounded up.** A `TemporalDistribution` cannot express
  anything finer than a second (source: bw-temporalis-repo).
- **A distribution must sum to its exchange amount.** If it does not,
  `check_database_exchanges` raises `IncongruentDistribution`. Run that check before
  the calculation rather than debugging a strange timeline afterwards
  (source: pypi-bw-temporalis).
- **Relative and absolute distributions are different things.** A timedelta64 `date`
  array means "relative to the consuming process"; a datetime64 array means an absolute
  moment. Mixing them up moves an entire branch of the supply chain
  (source: pypi-bw-temporalis).
- **`FixedTD` deliberately ignores inherited timing.** That is its purpose. If you
  wanted a shift relative to the consumer, it is the wrong class
  (source: pypi-bw-temporalis).
- **Traverse the background and you will wait.** `static_activity_indices` exists so
  the background is treated as happening at one time. Without it, a full background
  traversal is slow and usually adds nothing, because background exchanges carry no
  distributions.
- **The cutoffs are tight by default.** `cutoff` defaults to 0.0005 and
  `biosphere_cutoff` to 1e-06, with `max_calc` at 2000. A result is only as complete as
  those allowed (source: pypi-bw-temporalis).
- **`__version__` is a tuple, not a string.** `bw_temporalis.__version__` evaluates to
  `(1, 2, 0)`. Code that does string comparison on it breaks
  (source: pypi-bw-temporalis).
- **The README's installation warning is stale.** It warns that Python 3.11 is broken
  because of a scikit-network pin in `bw_graph_tools`. bw_graph_tools 0.10 no longer
  depends on scikit-network, and bw_temporalis 1.2.0 installs and imports on
  Python 3.11 (source: bw-temporalis-repo, pypi-bw-graph-tools).
- **A dynamic result is not a static one computed differently.** Radiative forcing over
  a horizon and a characterised score from a static method are different quantities.
  Report which you used.
- **It is one layer, not the whole story.** bw_temporalis dates flows within the
  databases you already have. Choosing a different background database per date is
  `bw_timex`; see [../bw_timex/README.md](../bw_timex/README.md).
