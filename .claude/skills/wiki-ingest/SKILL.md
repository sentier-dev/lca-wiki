---
name: wiki-ingest
description: Turn an external source into cited wiki pages, vocabulary bullets, an index line and a log line. Use when adding documentation, a standard, a database description or a whole knowledge base to the wiki.
---

# wiki-ingest

Turn a source into pages. The wiki cites; it never mirrors.

## 1. Orient before writing

- Read `index.md`, then `vocabulary.md`.
- Decide the branch and folder. Read that folder's `README.md`: it states what belongs
  there and how files are named.
- Decide whether this extends an existing page. Extending beats adding: a second page on
  the same subject is how contradictions start.

## 2. Register the source

Add one row to `sources.md` before citing it: id (kebab-case, per the convention at the
top of that file), title, URL, the date you actually opened it, the licence the
publisher states. Licence unknown means do not quote.

## 3. The formatting pass, for a knowledge base

If the source is itself structured (a documentation site, a glossary, a handbook), map
its structure onto this wiki's page types before writing a line:

| Source material | Becomes |
|---|---|
| conceptual chapters | `concept` pages in `core/concepts/` |
| a normative document | a `standard` page in `core/standards/` |
| reference material about one package | `module-page` pages in that module's folder |
| a database description | `database` pages under that database's branch |
| a glossary | bullets in the root `vocabulary.md` |
| tutorials and how-tos | `use-case` pages |

Write the mapping into the pull request description. Then ingest section by section in
this wiki's shape. A page that reads like a copy of the source has failed the pass.

## 4. Write the pages

- Copy the template from `templates/pages/`, rename after the subject.
- Fill the frontmatter completely; `sources:` ids must resolve.
- Every claim carries its source id in the prose or the table it sits in.
- 200 to 400 lines. Split by subject when it grows.
- Relative links only, and they must resolve.

## 5. Add the terms

New terms go in the root `vocabulary.md`, edited directly:

- one `### Term` heading, alphabetical, also added to the table of contents at the top
- one bullet per source and context, never merged with an existing bullet
- a `source:` id on every definition bullet
- `provenance: first-use` plus a visible `review: needed` when no standard defines it yet

`python3 scripts/extract_ilcd_glossary.py` prints the ILCD Handbook's own key
definitions already in this format, if the source is that handbook.

## 6. Check by hand, then log

Nothing checks this for you. Before committing:

- open every relative link and every `vocabulary.md#anchor` you wrote, and confirm it
  resolves against a real file and a real `### Term` heading
- confirm every `sources:` id and every vocabulary `source:` id is a row in `sources.md`
- add or update the page's line in `index.md`
- `grep -rnoiFf .private-names.local.txt . --exclude-dir=.git --exclude=.private-names.local.txt`
  if that file exists at the root

Append one line to `log.md`:
`## [YYYY-MM-DD] ingest | <source> into <branch>`

## Refuse

Licensed amounts, numeric tables under `ecoinvent/`, credentials and writes under
`raw/`. Private repository, host and variable names never appear in the tree; a
maintainer keeps them in an uncommitted `.private-names.local.txt` at the root and greps
against it before committing.
