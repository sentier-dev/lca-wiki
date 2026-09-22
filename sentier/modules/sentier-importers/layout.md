---
title: sentier-importers layout
type: module-page
summary: How the sentier-importers repository is organised, file by file.
audience: [P2, P3]
updated: 2026-09-21
sources: [sentier-importers-repo]
---

# sentier-importers layout

The tree below is the clone of `github.com/sentier-dev/sentier-importers` at commit
`dac2e67` (2026-09-17), read on 2026-09-21, trimmed to the files a reader would open.
The package lives under `app/`, not `src/`. (source: sentier-importers-repo)

```
app/sentier_importers/
  __init__.py        the package version, read by pyproject as the dynamic version
  __main__.py        the argparse entry point behind the sentier-importers command
  registry.yaml      the source registry: one commented block per source
  core/
    pipeline.py      the driver: fetch, parse, transform, dedup, assemble, validate, emit, deliver
    source.py        the plugin contract: SourceConfig and the Source base class
    registry.py      load registry.yaml into configurations and import the plugins
    targets.py       the target repositories, their data folder, pinned ref and validator
    context.py       the per-run configuration shared by every stage
    fetch.py         content-addressed cached fetcher for local and http(s) inputs
    parse.py         input parsers by format: csv, json, yaml, ttl, xlsx
    dedup.py         deterministic deduplication, inside a source and against the target
    validate.py      validator strategies: none, and LinkML for the vocabulary target
    schema_provider.py  resolve a target's LinkML schema at its pinned ref, through the cache
    write.py         output writers: json, yaml and parquet, with an explicit Arrow schema
    deliver.py       clone, branch, copy, commit, push and open the pull request
    randonneur.py    helpers over randonneur mapping packages
    errors.py        the exception hierarchy every stage raises from
    types.py         the record and row types passed between stages
  matching/
    pipeline.py      match one source flow to one method flow: tiers, placement, disambiguation
    matchers.py      one lookup strategy each: exact name, synonym, CAS, qualifiers, land use, ores
    ef_index.py      the method flow index, built from public inputs only
    compartments.py  compartment and sub-compartment placement rules
    bw_context.py    context crosswalk for method flows that carry no factor
    aliases.yaml     curated aliases, data rather than code
    label_defects.yaml  known upstream label defects and their corrections
  sources/
    example_csv/     the reference plugin, with its own tests and sample input
    bafu/            the Swiss federal inventory: vocabulary, inventory and mapping sources
    agribalyse/      the Agribalyse and EF 3.1 sources: flows, methods, factors, mappings
    eaternity/       an extension flow list used to infer further mappings
    foodex2/         the FoodEx2 food classification, delivered as parquet
scripts/             a local regeneration driver and output checks
tests/               core/, matching/ and sources/ suites, all offline
docs/                design notes, plans and per-import specifications
pyproject.toml       metadata, dependencies, extras, the console script, tool settings
```

## Key files

- `app/sentier_importers/registry.yaml`: the human-readable list of every source. Its
  header comment is the reference for what a source block may declare. Adding a source
  is a new folder under `sources/` plus one block here.
- `app/sentier_importers/core/source.py`: the contract. A plugin subclasses `Source` and
  implements `transform`; `fetch` and `parse` are overridden only when the input needs
  it.
- `app/sentier_importers/core/targets.py`: the four target repositories, one entry each,
  with the data folder files land in, the pinned schema reference and which validator
  strategy applies.
- `app/sentier_importers/matching/`: the part that is genuinely hard, kept out of the
  sources: matching an inventory elementary flow to a method flow, tier by tier, with
  placement rules and curated aliases as data.

## Conventions

- Package root `app/`, package `sentier_importers`, distribution `sentier-importers`.
- One folder per source under `sources/`, named as the source family; several registry
  entries may share a folder, one per target category.
- Line length 99, black, isort and ruff through pre-commit, coverage measured on the
  framework core, the matching package and the largest source family.
- Tests never reach the network: a source ships cached fetch fixtures instead.

(source: sentier-importers-repo)
