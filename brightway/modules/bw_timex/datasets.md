---
title: bw_timex datasets
type: module-page
summary: One reference data file for dynamic characterisation, plus a built example system.
audience: [P1, P2]
updated: 2026-09-21
sources: [pypi-bw-timex, bw-timex-docs]
---

# bw_timex datasets

Descriptors stay broad: shapes and counts, never the values themselves.

## Bundled: decay multipliers

- **What it is:** `bw_timex/data/decay_multipliers.json`, the only data file in the
  wheel. It supports the dynamic characterisation path, which has to turn an emission
  occurring at a date into an effect spread over the years that follow.
- **Version:** ships with bw_timex 1.4.0 (2026-09-18).
- **Shape:** a JSON object with 243 keys. Each key is a CAS registry number in the
  zero-padded form, and each value is a list of 2000 numbers, one per step of the time
  horizon. Counted by opening the file in a throwaway environment; no values are
  reproduced here.
- **Coverage:** 243 substances. These are greenhouse gases and related species, keyed
  by CAS, not a full elementary flow list.
- **Provenance:** shipped by the bw_timex developers as part of the package
  (source: pypi-bw-timex).
- **Licence:** the package licence, BSD 3-Clause (source: pypi-bw-timex).
- **Methods:** this file is not an impact assessment method in the Brightway sense. The
  dynamic characterisation functions are Python callables, registered through
  `add_flows_to_characterization_functions`, and the multipliers are an input to them.
  The default metric is radiative forcing over a 100 year horizon
  (source: pypi-bw-timex).
- **Vocabulary:** CAS registry numbers, which is how a characterisation function is
  matched to an elementary flow independently of the flow list in use.

## Built on demand: the electric vehicle example

`create_electric_vehicle_example(background_database_name, foreground_database_name="foreground", overwrite_existing=False)`
writes a small temporalised product system into the current Brightway project: an
electric vehicle whose battery, use phase and disposal happen at different times. It is
the system the tutorials use (source: bw-timex-docs).

- **Sectors:** a single illustrative transport system. Not a database.
- **Provenance:** written by the bw_timex developers as teaching material.
- **What it needs:** an existing background database, named by the caller. The example
  builds the foreground only, so the background is whatever you already have.

## Fetched: nothing, by default

bw_timex downloads no data on its own. The one exception is the optional `premise`
extra: `ensure_scenario_databases` and `TimexLCA(..., create_missing=True)` build the
prospective background vintages a scenario names, which means premise fetching an
ecoinvent release and its own integrated assessment scenarios
(source: bw-timex-docs).

- **Credentials:** that path needs a premise decryption key and ecoinvent credentials,
  read from named environment variables when not passed. No values appear in this wiki.
- **Licence:** whatever the underlying ecoinvent licence says. See
  [../ecoinvent_interface/README.md](../ecoinvent_interface/README.md) and
  [../../../ecoinvent/](../../../ecoinvent/).
- **Source branch:** [../../../ecoinvent/](../../../ecoinvent/) for the background
  releases those vintages are derived from.

## What a calculation writes

Nothing to disk by default. A run produces, in memory, the timeline as a dataframe, a
modified set of datapackages, a dynamic biosphere matrix whose rows are flow-and-date
pairs, and the labelled dataframes the `create_labelled_*` methods build. The
module-level caches that speed up repeated runs are cleared with
`clear_background_lci_cache`.
