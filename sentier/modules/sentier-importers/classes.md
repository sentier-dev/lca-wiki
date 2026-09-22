---
title: sentier-importers classes and functions
type: module-page
summary: The plugin contract, the pipeline driver and the shared services a source relies on.
audience: [P1, P3]
updated: 2026-09-22
sources: [sentier-importers-repo]
---

# sentier-importers classes and functions

Hand-written companion to the generated [api/](api/README.md) folder. Read at
commit `dac2e67`, version 0.0.1. (source: sentier-importers-repo)

## The plugin contract

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `core.source.Source` | abstract class | The base class every plugin subclasses. `transform` is abstract; `fetch` and `parse` have working defaults. | the pipeline driver |
| `core.source.Source.transform` | method | Maps parsed records to rows shaped for the target. The only source-specific step. | `pipeline.run_source`, `pipeline.validate_source` |
| `core.source.Source.fetch` / `.parse` | methods | Defaults that call the cached fetcher and the parser for the declared format; overridden only for awkward inputs. | the pipeline driver |
| `core.source.SourceConfig` | frozen dataclass | One parsed registry block: name, module, target, category, input URL and format, output format, validation class, collection and package settings, dedup settings, named secondary inputs, enabled flag. | `registry.load_registry` |
| `core.context.RunContext` | frozen dataclass | The per-run configuration: cache folder, output folder, dry-run, offline, schema folder, local delivery root. | the command line, every stage |
| `core.targets.Target` | frozen dataclass | One target repository: remote, the folder emitted files land in, the pinned schema reference, the validator strategy. | `targets.get_target` |

## The pipeline

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `core.pipeline.run_source` | function | Runs one source through every stage and returns the emitted path. | `sentier-importers run` |
| `core.pipeline.validate_source` | function | Runs the same pipeline up to validation and returns the row count, emitting nothing. | `sentier-importers validate` |
| `core.registry.load_registry` | function | Parses the registry file into configurations. | `run`, `validate`, `list` |
| `core.registry.get_config` / `load_source` | functions | Find one configuration by name and import its plugin. | `run`, `validate` |
| `core.fetch.fetch` | function | Cached retrieval of a local or remote input, keyed by the hash of the URL. | the default `Source.fetch` |
| `core.parse.parse` / `register_parser` | functions | Turn raw bytes into records for a declared format, and register a new format. | the default `Source.parse` |
| `core.dedup.dedup` | function | Collapses identical rows within a source, refuses conflicting ones, and skips or overwrites rows the target already has. | the pipeline driver |
| `core.dedup.slugify` | function | The deterministic slug behind a minted identifier, so a re-run produces identical ones. | the sources |
| `core.validate.validate` / `register_validator` | functions | Apply the target's validator strategy, and register a new one. | the pipeline driver |
| `core.schema_provider.resolve_schema` | function | Fetch and cache a target's schema file at its pinned reference, imports included. | the LinkML validator, the parquet writer |
| `core.write.write` / `register_writer` | functions | Write the payload as json, yaml or parquet, and register a new format. | the pipeline driver |
| `core.write.arrow_schema_for` | function | Build the explicit Arrow schema for a parquet delivery from the target's schema. | the pipeline driver |
| `core.deliver.deliver` | function | Clone, branch, copy, commit, push and open the pull request. A no-op in a dry run. | `sentier-importers run --deliver` |
| `core.deliver.deliver_local` | function | Copy the emitted files into a local checkout of the target: no git, no pull request. | `run --deliver-local` |
| `core.randonneur.codes_of` | function | The source codes a mapping package names. | the mapping sources |
| `core.errors.SentierImporterError` | exception | The base of the hierarchy: fetch, parse, validation, delivery and registry errors. | every stage |

## Flow matching

Used by the inventory-facing sources rather than by the framework.

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `matching.pipeline` | module | Matches one source flow to one method flow: matchers in tier order, then placement, then disambiguation; anything unresolved comes back with a reason a reviewer can act on. | the mapping sources |
| `matching.matchers` | module | One class per lookup strategy: exact name, synonyms, CAS number, qualifier spellings, carbon oxide rewrites, ion stripping, land-use classes, ore composites, curated aliases, region-stripped names. | `matching.pipeline` |
| `matching.ef_index.EfFlowIndex` | class | The method flow index built from public inputs only: which flows carry a factor, their context path, their labels, synonyms and CAS numbers. | the matchers |
| `matching.compartments.place` | function | Decides whether a candidate belongs in the source flow's compartment and sub-compartment. | `matching.pipeline` |
| `matching.bw_context.context_for` | function | The context crosswalk for method flows that carry no factor. | the mapping sources |

## Notes

- **The stages are fixed, the sources are not.** A plugin cannot reorder the pipeline; it
  can only replace `fetch`, `parse` and `transform`.
- **Deduplication has two layers.** Inside one source, identical rows collapse and
  conflicting rows with the same identifier are an error, because that is a transform
  bug. Against the target, an existing identifier is skipped, refused or overwritten
  according to the source's declared setting.
- **Identity is the IRI.** Sources mint identifiers deterministically from a stable key,
  so re-running a source produces the same identifiers and the same pull request diff.
- **RDF is an input concern.** The framework reads Turtle but never emits it: outputs are
  YAML or JSON for vocabulary terms, parquet for bulk tables and randonneur JSON for
  mappings.

(source: sentier-importers-repo)
