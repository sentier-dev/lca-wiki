---
name: wiki-query
description: Answer a question from the wiki alone, with the pages and source ids the answer rests on. Use when asked an LCA, Brightway, Sentier or database question that this repository might already cover.
---

# wiki-query

Answer from the wiki, with citations, or say the wiki cannot.

## 1. Read in order

1. `index.md` — every page, one line each. Pick the candidates from the summaries.
2. `vocabulary.md` — check what the question's terms mean here. A term often has an
   ILCD meaning, a tool meaning and a database meaning; the answer depends on which one
   the asker means.
3. The candidate pages, then `sources.md` for what they cite.

Grep is a second step, not the first: the index exists so you do not have to guess file
names.

## 2. Answer

- Give the answer, then the paths you used, then the source ids those pages cite.
- Name the context whenever a term is contested: "in ILCD terms", "as bw2data uses it".
- Quote the page rather than paraphrasing when the wording is the point.
- Where two branches disagree, show both. Disagreement between a tool and a standard is
  information, not an error to smooth over.

## 3. When the wiki cannot answer

Say so plainly. Do not fill the gap from memory: an unsourced answer that looks like a
wiki answer is worse than no answer.

Then choose:

- **Small and in scope** — ingest it: follow `wiki-ingest`, write the page, cite it, and
  answer from the new page.
- **Large, or outside scope** — add an item to the relevant `roadmap.md`, specific
  enough for someone to start on, and say in your answer that you did.

## 4. If you wrote anything

Finish the ingest workflow by hand: add or update the page's line in `index.md`, add any
new terms to `vocabulary.md`, and open every link you wrote to confirm it resolves.

Append one line to `log.md`:
`## [YYYY-MM-DD] query | <question> answered from <pages>`
