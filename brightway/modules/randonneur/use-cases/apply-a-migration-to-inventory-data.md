---
title: Apply a migration to inventory data
type: use-case
summary: Rewrite the edge names of an inventory with a randonneur transformation, and find the published transformation for your database pair in the registry.
audience: [P1]
updated: 2026-09-22
sources: [randonneur-repo, pypi-randonneur, randonneur-data-repo, pypi-randonneur-data]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with randonneur 0.7.2 and randonneur_data 0.7.2, Linux x86-64
related: [../commands.md, ../datasets.md, ../gotchas.md, ../../flowmapper/use-cases/map-two-flow-lists.md]
---

# Apply a migration to inventory data

**Persona:** P1 practitioner whose inventory was written against one database release
and has to link against another · **GICS sector:** any

## Goal

An inventory whose edges carry the names, locations and reference products the target
database uses, rewritten by a declarative transformation file rather than by hand or by
a one-off script.

## Prerequisites

- `randonneur` 0.7.2 for the engine, and `randonneur_data` for the registry of published
  transformations. They version independently; pin both when a result has to be
  reproducible.
- Your inventory as a list of dictionaries, each with an `edges` list. Nothing here
  touches a Brightway project: randonneur works on plain data.
- No network access. The registry ships bundled.

## Steps

1. Look at what the public registry already has, before writing anything yourself.

   ```python
   import randonneur_data as rd

   registry = rd.Registry()
   sorted(registry)
   ```

2. Read one entry's metadata, including its licence.

   ```python
   entry = registry["SimaPro-9-ecoinvent-3.9-biosphere"]
   sorted(entry)
   entry["name"], entry["licenses"]
   ```

3. Apply a published transformation to your data by name. The engine downloads or reads
   it and applies it in one call.

   ```python
   import randonneur as rn

   transformed = rn.migrate_edges_with_stored_data(
       my_lci, "SimaPro-9-ecoinvent-3.9-biosphere",
       config=rn.MigrationConfig(fields=["name"]),
   )
   ```

4. Or write your own. A transformation is a dictionary of verbs to lists of
   `{source, target}` pairs.

   ```python
   inventory = [
       {"name": "bread production", "edges": [
           {"name": "Electricity, low voltage {CH}| market for | Cut-off, U",
            "amount": 0.16, "unit": "kWh"},
           {"name": "Tap water {CH}| market for | Cut-off, U",
            "amount": 0.6, "unit": "kg"},
       ]},
   ]

   migration = {"update": [
       {"source": {"name": "Electricity, low voltage {CH}| market for | Cut-off, U"},
        "target": {"name": "market for electricity, low voltage", "location": "CH",
                   "reference product": "electricity, low voltage"}},
       {"source": {"name": "Tap water {CH}| market for | Cut-off, U"},
        "target": {"name": "market for tap water", "location": "CH",
                   "reference product": "tap water"}},
   ]}
   ```

5. Apply it. `fields` says which keys are compared; everything else in a `source` block
   is ignored for matching.

   ```python
   result = rn.migrate_edges(
       inventory, migration, config=rn.MigrationConfig(fields=["name"])
   )
   ```

6. Check the result before writing it anywhere.

   ```python
   import json

   print(json.dumps(result, indent=1))
   ```

## Expected output

- `sorted(registry)` returned 57 entries on the verification day, grouped by the
  database pair they translate between: 31 beginning `ecoinvent`, 15 SimaPro entries
  under two spellings, 4 `agribalyse`, 4 `agrifootprint`, 2 `generic` and one
  flowmapper unit harmonisation package.
- A registry entry carries eleven or twelve metadata keys, depending on the entry:
  always `name`, `description`, `version`, `created`, `contributors`, `licenses`,
  `filename`, `mapping`, `graph_context` and `compression`, plus `source_id` and
  `target_id` where the entry names a database pair, or `case-insensitive` where it sets
  that behaviour. `graph_context` for the entry checked was `['edges']`, and its licence
  CC BY 4.0. Licences are stated per entry and differ.
- `migrate_edges` logs
  `Can apply the following transformation verbs: ['update']`, naming what it found in
  your file and is allowed to run.
- The returned structure is your inventory with the two edges rewritten: the `name` is
  the target's, `location` and `reference product` have been added, and `amount` and
  `unit` are untouched. The node's own `name` is unchanged, because this was an edge
  migration.

## Pitfalls

- **`create` and `delete` do not run unless you ask.** The default verbs are the safe
  ones: `update`, `replace`, `disaggregate`. A `delete` block sits inert until you pass
  `MigrationConfig(verbs=[...])` including it. See [../gotchas.md](../gotchas.md).
- **`replace` throws away the rest of the edge.** Use `update` when you meant to fix a
  few fields.
- **Nested values are overwritten wholesale,** not merged. A target giving a new value
  for one nested key loses the keys it did not mention.
- **`edges_label` defaults to `edges`.** Data calling them `exchanges` or `flows`
  matches nothing until you say so.
- **Matching is case insensitive by default,** deliberately. Set `case_sensitive=True`
  if your data genuinely distinguishes two flows by case only.
- **There is no command line.** Anything you read about running randonneur from a shell
  is about a package wrapping it, usually `flowmapper`; see
  [../../flowmapper/use-cases/map-two-flow-lists.md](../../flowmapper/use-cases/map-two-flow-lists.md).
- **Transformations are JSON,** so only JSON types survive. Dates, sets and numpy values
  have to be strings or numbers in the file.
- **Check the licence of a registry entry before you redistribute a result.** They are
  stated per entry and they differ.

## Related vocabulary

- [Randonneur package](../../../../vocabulary.md#randonneur-package)
- [Bridge](../../../../vocabulary.md#bridge)
- [Relink](../../../../vocabulary.md#relink)
- [Linking](../../../../vocabulary.md#linking)
- [Edge](../../../../vocabulary.md#edge)
- [Nomenclature](../../../../vocabulary.md#nomenclature)
- [Reference product](../../../../vocabulary.md#reference-product)
- [Flow mapper](../../../../vocabulary.md#flow-mapper)
- [System model](../../../../vocabulary.md#system-model)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`randonneur` 0.7.2 and `randonneur_data` 0.7.2, Linux x86-64, with no network access
needed: the registry is bundled with `randonneur_data`. Steps 1, 2, 4, 5 and 6 ran, and
every count and field name above is what the run printed. Step 3 was not run: applying a
published SimaPro to ecoinvent transformation would need SimaPro data to apply it to.
The registry entry read in step 2 was `SimaPro-9-ecoinvent-3.9-biosphere`, version
1.0.0. Duration: under 2 seconds.
