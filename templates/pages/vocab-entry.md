# Shape of one vocabulary entry

This file is not a page: it shows the shape of one entry inside the root
`vocabulary.md`. Copy the block, not the file.

```markdown
### Activity

- **ILCD (2010)** — <definition as the ILCD Handbook gives it>. — source: ilcd-2010 §6.x
- **Brightway (bw2data >=4)** — <definition in this context>. — source: bw2data-docs · provenance: first-use · review: needed
- **Sentier** — <definition in this context>. — source: sentier-inventory-schema
- Disambiguation: not "activity data" (EF/PEF); see the Activity data entry.
```

Rules, checked by reading:

- One `### Term` heading per term, headings in alphabetical order, each also listed in
  the table of contents at the top of `vocabulary.md`.
- One bullet per source and context. Two bullets for the same context under one term is
  a mistake; diverging definitions are never merged into one bullet.
- Every definition bullet names a `source:` id that resolves in `sources.md`.
- A term no standard defines yet is marked `provenance: first-use` and must carry the
  visible `review: needed` marker.
- A `Disambiguation:` bullet needs no source.

Precedence: the ILCD Handbook bullet comes first when ILCD defines the term, then the
EF/PEF bullet, then tool and database contexts.
