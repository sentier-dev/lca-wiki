---
title: Apply a mapping package with randonneur
type: use-case
summary: "Relink a small set of exchanges onto EF 3.1 flows by applying one package of a pair with randonneur, and see what an unmapped flow does."
audience: [P1, P2]
updated: 2026-09-22
sources: [sentier-mappings-repo, randonneur-repo]
verified: yes
verified_on: 2026-09-22
verified_env: "uv 0.11.14, Python 3.11.15, Ubuntu 22.04, a clone of sentier-mappings, randonneur 0.7.2 via uv --with"
---

# Apply a mapping package with randonneur

**Persona:** P1 practitioner or P2 contributor who wants to understand, on a toy example,
exactly what a [randonneur package](../../../../vocabulary.md#randonneur-package) does to
an exchange · **GICS sector:** any

## Goal

A two-exchange frame, one flow that the bridge covers and one it does not, run through
one package of a pair, so you can see the [relink](../../../../vocabulary.md#relink) in
the output: the name, the unit and the context change, the amount does not, and the
uncovered flow is left exactly as it was.

## Prerequisites

- A clone of sentier-mappings. There is no package and no apply command here, on purpose:
  applying is randonneur's job, or the loader's.
- `uv`, and randonneur, supplied for the length of the command.

## Steps

1. Read the pair's [metadata](../../../../vocabulary.md#metadata), which is the
   authoritative order of its packages:

   ```bash
   cat data/bafu-2026-v1__ef-3.1/metadata.json
   ```

2. Look at one entry of the first package, to see the shape you are matching against:

   ```bash
   uv run python -c "import json; d = json.load(open('data/bafu-2026-v1__ef-3.1/biosphere-1-curated.json')); print(d['name'], d['version'], len(d['replace'])); print(json.dumps(d['replace'][0], indent=1))"
   ```

3. Save this as `toy.py` in the repository root. It builds a frame with two exchanges,
   one whose code appears in the package and one whose code does not, and applies the
   package to it:

   ```python
   import json
   from randonneur import MigrationConfig, migrate_edges

   package = json.load(open("data/bafu-2026-v1__ef-3.1/biosphere-1-curated.json"))
   graph = [{"name": "toy process", "exchanges": [
       {"name": "Sulfur hexafluoride",
        "code": "d3cf003e-5199-5d5f-9bde-68abbb3bb5d7",
        "unit": "kg", "context": ["emissions to air", "unspecified"], "amount": 1.0},
       {"name": "not in the bridge",
        "code": "00000000-0000-0000-0000-000000000000",
        "unit": "kg", "context": ["emissions to air", "unspecified"], "amount": 2.0},
   ]}]
   out = migrate_edges(graph, package, config=MigrationConfig(
       edges_label="exchanges", fields=["code"], add_extra_attributes=True))
   for edge in out[0]["exchanges"]:
       print(edge["name"], "|", edge["unit"], "|", edge["context"], "|", edge["amount"])
   ```

4. Run it:

   ```bash
   uv run --with randonneur python toy.py
   ```

5. Apply the rest of the pair in the order the metadata lists, never in file-system
   order, by repeating steps 3 and 4 for each package in turn.

## Expected output

Step 2 prints the package name, its version and its entry count, then one entry: a
`source` object and a `target` object, each with a name, a code, a unit and a context.
Only `replace` entries relink a flow; `update` entries edit fields on the same flow and
the loader ignores them.

Step 4 prints two lines. The first exchange comes back relinked: the EF 3.1 name and unit
spelling, and the three-level EF context in place of the two-level source context. Its
amount is unchanged, which is the whole point: a mapping changes identity, not quantity.
The second exchange comes back untouched, because no entry matched its code. It is what
would end up in a [residual database](../../../../vocabulary.md#residual-database) after a
full install.

## Pitfalls

- **randonneur's default edge key is `edges`, not `exchanges`.** Without
  `edges_label="exchanges"` the call runs, logs that it can apply the `replace` verb, and
  changes nothing. A silent no-op is the most common mistake here.
- **Match on the code, not on everything.** With no `fields` restriction, every key of the
  source object has to match, and a single spelling difference in the name or the context
  drops the entry. Restricting to the [flow code](../../../../vocabulary.md#flow-code) is
  both faster and closer to what the package means.
- **Order matters.** Within one [ordered pair](../../../../vocabulary.md#ordered-pair) the
  packages are numbered and an earlier package wins on a shared source key. The validator
  guarantees they never conflict, but only if you apply them in the listed order.
- **The frame is changed in place.** `migrate_edges` returns the same graph it was given,
  mutated. Copy first if you need the original.
- **The last package in this pair is nomenclature only.** It places flows onto correctly
  named EF flows that carry no factor, so those exchanges score zero. Leave it out, or
  count it separately, when you are reporting coverage.
- **Do not hand-apply a pair in production.** The loader in
  [../../sentier-brightway/](../../sentier-brightway/) reads a pinned commit of this
  repository and applies the packages of a pair in order, with unit normalisation and a
  residual database. This use case is for understanding, not for building.

## Related vocabulary

[Randonneur package](../../../../vocabulary.md#randonneur-package),
[bridge](../../../../vocabulary.md#bridge),
[relink](../../../../vocabulary.md#relink),
[ordered pair](../../../../vocabulary.md#ordered-pair),
[flow code](../../../../vocabulary.md#flow-code),
[compartment](../../../../vocabulary.md#compartment),
[sub-compartment](../../../../vocabulary.md#sub-compartment),
[residual database](../../../../vocabulary.md#residual-database).

## Verification

Run on 2026-09-22 on Ubuntu 22.04 with uv 0.11.14 and Python 3.11.15, in a clone of
sentier-mappings with randonneur 0.7.2. Steps 1 to 4 were executed as written and took
1.9 s for the run itself. The covered exchange came back with the EF 3.1 name spelling,
the unit `kilogram` in place of `kg`, the three-level EF emissions-to-air context and its
amount unchanged; the uncovered exchange came back byte-identical. The no-op described
under Pitfalls was observed first hand: the same script without `edges_label` changed
neither exchange. Step 5 was not run.
