---
title: flowmapper classes and functions
type: module-page
summary: The public surface of flowmapper 0.4, from flow objects to mapping output.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-flowmapper, flowmapper-repo]
---

# flowmapper classes and functions

Hand-written companion to the generated `api/` folder. Names and signatures were read
by importing flowmapper 0.4 from PyPI and inspecting `__all__` and the signatures
(source: pypi-flowmapper); the design intent follows the repository README
(source: flowmapper-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `Flow` | class | One elementary flow expressed in the core ontology, built from a dictionary | `Flow(data, transformations=None)` |
| `Flowmap` | class | The crosswalk from a source flow list to a target flow list | `Flowmap(source_flows, target_flows, rules=None)` |
| `flowmapper` | function | The whole job in one call: read, transform, match, write | `flowmapper(source, target, ...)` |
| `OutputFormat` | enum | Which mapping files to write: `all`, `glad`, `randonneur` | `OutputFormat.randonneur` |
| `CASField` | class | A CAS registry number that compares equal whether or not it is padded | `CASField("007440-05-3")` |
| `ContextField` | class | A hierarchical context, with an original and a transformed form | `ContextField(original, transformed)` |
| `UnitField` | class | A unit, with dimension checking and conversion through Pint | `UnitField("kg")` |

## Flowmap

`Flowmap` is what a notebook user works with. Its public members, read from the class:

| Member | What it gives you |
|---|---|
| `mappings` | the matched pairs, as records |
| `statistics` | counts of matched and unmatched flows on both sides |
| `matched_source`, `matched_target` | the flows that were matched, per side |
| `matched_source_statistics`, `matched_target_statistics` | per-side breakdowns |
| `unmatched_source`, `unmatched_target` | the flows that were not matched, per side |
| `get_single_match` | the match for one source flow, for debugging a rule |
| `to_glad` | write the mapping in GLAD format |
| `to_randonneur` | write the mapping as a randonneur transformation file |

## The driver function

```python
flowmapper(
    source: Path, target: Path,
    mapping_source: dict, mapping_target: dict,
    source_id: str, target_id: str,
    contributors: list, output_dir: Path, format: OutputFormat,
    version: str = "1.0.0",
    default_transformations: bool = True,
    transformations: list[Path | str] | None = None,
    unmatched_source: bool = True, unmatched_target: bool = True,
    matched_source: bool = False, matched_target: bool = False,
    licenses: list | None = None, homepage: str | None = None, name: str | None = None,
) -> Flowmap
```

The `mapping_source` and `mapping_target` arguments are randonneur-style label
mappings, so the same constants `randonneur.MappingConstants` provides can be reused
here. See [../randonneur/datasets.md](../randonneur/datasets.md).

## Matching strategies

`flowmapper.match` holds the strategy functions and `match_rules`, the default ordered
list. The strategies present in 0.4 are, by name:

- identity on a single field: `match_identical_names`, `match_identical_cas_numbers`,
  `match_identical_identifier`, `match_identical_names_in_synonyms`
- tolerant name comparison: `match_identical_names_without_commas`,
  `match_identical_names_except_missing_suffix`,
  `match_names_with_roman_numerals_in_parentheses`, `match_custom_names_with_location_codes`,
  `match_names_with_location_codes`
- chemistry: `match_non_ionic_state`, `match_emissions_with_suffix_ion`,
  `match_biogenic_to_non_fossil`
- resources and contexts: `match_resources_with_suffix_in_air`,
  `match_resources_with_suffix_in_ground`, `match_resources_with_suffix_in_water`,
  `match_resources_with_wrong_subcontext`,
  `match_resource_names_with_location_codes_and_parent_context`,
  `match_flows_with_suffix_unspecified_origin`

A rule is a callable taking the two flows and returning a boolean, so a project can add
its own and pass the list as `rules=`.

## Extraction

`flowmapper.extraction` exposes `ecospold2_biosphere_extractor`,
`simapro_csv_biosphere_extractor` and `simapro_ecospold1_biosphere_extractor`. Each
turns a file of that format into the list of flow dictionaries the rest of the library
expects.

## Notes

- Units are rarely compared directly. After a match is found, flowmapper checks that
  the units share a dimension and applies a Pint conversion where they differ
  (source: flowmapper-repo).
- Partial matches are not produced. A pair either matches fully or is reported as
  unmatched, which keeps the mapping file explicit at the cost of size
  (source: flowmapper-repo).
- Chemical formulas are not used for matching; the README says they are expressed too
  inconsistently to help (source: flowmapper-repo).
