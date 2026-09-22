---
title: sentier-vocab use cases
type: readme
summary: End-to-end things a practitioner does with the Sentier vocabulary.
audience: [P1]
updated: 2026-09-22
sources: []
---

# sentier-vocab use cases

One file per use case, copied from
[../../../../templates/pages/use-case.md](../../../../templates/pages/use-case.md).

## Pages here

- [regenerate-the-vocabulary-ttl.md](regenerate-the-vocabulary-ttl.md): run the generator and get one SKOS Turtle file per source file.
- [look-up-a-term-iri.md](look-up-a-term-iri.md): find a flow's canonical IRI from its label.

Further candidates, in the order they would help a reader: resolving a term IRI to its
definition, adding a curated term and regenerating the Turtle, delivering a bulk parquet
import, and aligning a local flow list to the Sentier flow namespace.

## Naming rule

`lower-case-with-hyphens.md`, verb first, naming the outcome rather than the function
called: `add-a-curated-term.md`, not `run-generate.md`.

## How to add here

1. Copy the use-case template.
2. Run the steps in a clean clone and record `verified:` honestly.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
