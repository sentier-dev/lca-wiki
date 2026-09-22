---
title: Map ecoinvent flows to EF 3.1
type: use-case
summary: "Build a flow bridge from an ecoinvent elementary flow list onto the EF 3.1 nomenclature with flowmapper, and publish it as a codes-only mapping package."
audience: [P1, P2]
updated: 2026-09-22
sources: [flowmapper-repo, randonneur-repo, sentier-mappings-repo, ecospold2-format]
verified: no
---

# Map ecoinvent flows to EF 3.1

**Persona:** P2 contributor with a licence who wants the mapping, not the amounts, to be
public · **GICS sector:** any

## Goal

A reviewed bridge from an ecoinvent [elementary flow](../../vocabulary.md#elementary-flow)
list onto the EF 3.1 [nomenclature](../../vocabulary.md#nomenclature), written as
[randonneur packages](../../vocabulary.md#randonneur-package) that anyone can read, and a
diagnostic file naming every flow that did not match and why.

## Prerequisites

- A licence and an extracted release, as in
  [download-a-release-with-ecoinvent-interface.md](download-a-release-with-ecoinvent-interface.md).
  Only the flow list is needed, not the amounts.
- The EF 3.1 flow list as the target, which the platform publishes as the elementary-flow
  shards of its vocabulary; see
  [../../sentier/modules/sentier-vocab/use-cases/look-up-a-term-iri.md](../../sentier/modules/sentier-vocab/use-cases/look-up-a-term-iri.md).
- `flowmapper`, which extracts flow lists and writes the mapping.

## Steps

1. Extract the source flow list from the ecoSpold documents into the shape flowmapper
   expects, a canonical name, an identifier, a hierarchical
   [context](../../vocabulary.md#compartment), a unit, a CAS number and synonyms:

   ```bash
   flowmapper extract-ecospold2 --help
   ```

2. Prepare the target list, the EF 3.1 flows, in the same shape.

3. Match them, writing a randonneur transformation file and the diagnostics:

   ```bash
   flowmapper map source-flows.json target-flows.json --output-dir out/ --format randonneur
   ```

4. Read what did not match. The unmatched source and target files are written by default,
   and they are the review surface:

   ```bash
   ls out/
   ```

5. Iterate with a fixup file applied to the source before matching, rather than by editing
   the source list:

   ```bash
   flowmapper map source-flows.json target-flows.json -t fix-source-names.json --output-dir out/
   ```

6. Publish the result as an [ordered pair](../../vocabulary.md#ordered-pair) in
   [../../sentier/modules/sentier-mappings/](../../sentier/modules/sentier-mappings/),
   marked as targeting proprietary data, and validate it:
   [../../sentier/modules/sentier-mappings/use-cases/validate-a-mapping-package.md](../../sentier/modules/sentier-mappings/use-cases/validate-a-mapping-package.md).

## Expected output

Step 3 writes a mapping file in randonneur transformation format, plus the unmatched
source and unmatched target lists. The mapping entries pair a source flow with a target
flow on name, context, unit and CAS number, through a sequence of matching strategies;
the unmatched lists are what a human then works through.

Step 6 is where the licence line falls. A bridge whose target is a licensed database may
carry nothing but the database name and an opaque code, no readable names and no amounts,
and the mappings repository's validator enforces that on every pull request. Here the
licensed side is the source rather than the target, so the same caution applies in
reverse: publish the ecoinvent side as codes, and keep any name or amount you extracted on
your own machine.

## Pitfalls

- **Do not publish the ecoinvent flow list.** The names and identifiers of a licensed
  database are licensed content. What may be published is a mapping keyed by opaque codes.
- **A match is a hypothesis.** Automated matching on names, contexts and CAS numbers
  produces plausible pairs, and plausible is not reviewed. Keep the diagnostics beside the
  mapping so a reviewer can see why each pair was proposed.
- **Contexts are the hard part, not the substances.** Two nomenclatures rarely agree on
  [sub-compartment](../../vocabulary.md#sub-compartment) depth or naming, and a substance
  matched into the wrong context is worse than an unmatched one.
- **Fix the source with a transformation file, not by hand.** A fixup applied before
  matching is reviewable and repeatable; an edited flow list is neither.
- **Units are part of the match.** A pair that changes dimension needs an explicit
  conversion factor and a comment, or it should be withheld.
- **The platform already publishes a reviewed bridge for its own inventory.** Before
  building one, check whether
  [../../sentier/modules/sentier-mappings/](../../sentier/modules/sentier-mappings/)
  already carries the pair you need.

## Related vocabulary

[Elementary flow](../../vocabulary.md#elementary-flow),
[flow mapper](../../vocabulary.md#flow-mapper),
[nomenclature](../../vocabulary.md#nomenclature),
[bridge](../../vocabulary.md#bridge),
[randonneur package](../../vocabulary.md#randonneur-package),
[ordered pair](../../vocabulary.md#ordered-pair),
[compartment](../../vocabulary.md#compartment),
[sub-compartment](../../vocabulary.md#sub-compartment),
[EF 3.1](../../vocabulary.md#ef-31).

## Verification

`verified: no`. No ecoinvent licence or release was available in this environment, so no
source flow list could be extracted and no step was executed. The commands and their flags
are the ones this wiki's flowmapper module pages record from the tool's own `--help`, read
on 2026-09-22:
[../../brightway/modules/flowmapper/commands.md](../../brightway/modules/flowmapper/commands.md).
The publication rule in step 6 is the mappings repository's own, and it is verified as
enforced on
[../../sentier/modules/sentier-mappings/use-cases/validate-a-mapping-package.md](../../sentier/modules/sentier-mappings/use-cases/validate-a-mapping-package.md).
A verifier with a licence would run steps 1 to 5 and record the matched and unmatched
counts, never the flow lists themselves.
