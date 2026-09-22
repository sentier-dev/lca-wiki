---
name: wiki-lint
description: Review the wiki by hand for broken links, missing sources, contradictions, stale versions, orphans, vocabulary drift, private names and licensed amounts, and fix what you find. Use before a pull request, after an ingest, or on request for a health pass.
---

# wiki-lint

There is no lint script in this repository. This skill is the check, written down: a
mechanical pass you can run with grep, then a judgement pass only a reader can make.

## 1. The mechanical pass

Run these from the repository root and turn each list into a check.

```bash
# every vocabulary anchor a page links to, against the headings that exist
grep -rho "vocabulary.md#[a-z0-9-]*" --include='*.md' . | sed 's/.*#//' | sort -u
grep -n '^### ' vocabulary.md

# every relative markdown link target must exist
grep -rEno '\]\([^)]+\.md[^)]*\)' --include='*.md' .

# every sources: id and every vocabulary source: id must be a row of sources.md
grep -rh '^sources:' --include='*.md' . ; grep -rho 'source: [a-z0-9-]*' --include='*.md' .
grep -n '^| ' sources.md

# frontmatter present and complete on every branch page
grep -rLn '^title:' --include='*.md' core sentier brightway bafu ecoinvent

# no licensed amounts under the database branches
grep -rEn '\| *[0-9]+[.,][0-9]+ *\|' ecoinvent bafu

# no private names, if the maintainer's reminder list is present
grep -rnoiFf .private-names.local.txt . --exclude-dir=.git --exclude=.private-names.local.txt

# pages that outgrew the range
find . -name '*.md' -not -path './.git/*' | xargs wc -l | sort -rn | head -20
```

Expected: every anchor has a `### Term` heading, every link target opens, every id is a
row in `sources.md`, no page under a branch lacks frontmatter, no numeric amount table,
no private name, and nothing over 400 lines except `vocabulary.md`, `index.md`,
`sources.md` and `SPECS.md`.

Fix errors at the source, never by weakening a rule.

## 2. The judgement pass

Read, in this order, and fix what you find:

- **Contradictions.** Does a branch page define a term differently from `core/` without
  saying so? Either add the context to `vocabulary.md`, or align the page. Never
  silently overwrite the other meaning.
- **Stale versions.** Every module page names the version it documented and the date.
  Anything much older than its upstream release deserves a `status.md` note or a roadmap
  item.
- **Orphans.** Pages nothing links to, and pages missing from `index.md`. Either link
  them from their folder README or the branch page, or ask whether they should exist.
- **Missing sources.** A claim with no source id nearby, especially numbers, versions and
  "it is recommended that". Find the source or delete the claim.
- **Vocabulary drift.** The same term defined twice for the same context, or a first-use
  bullet that a standard has since defined. Merge contexts never; retag first-use bullets
  when a real definition arrives.
- **Forbidden content.** Amounts under `ecoinvent/`, anything private, anything that
  looks like a credential. The greps above find the obvious cases; you catch the rest.
- **Length and shape.** Pages over 400 lines, pages that are lists of links with no
  prose, module folders missing their Datasets section.

## 3. Finish

Update `index.md` and `vocabulary.md` if the fixes changed either. Commit as `fix:` or
`docs:` changes, one subject per commit, then append one line to `log.md`:
`## [YYYY-MM-DD] lint | <what you checked and what you fixed>`
