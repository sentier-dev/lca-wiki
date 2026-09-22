# AGENTS.md — the schema of this wiki

This file tells an agent how to read, extend and check this repository, in tool-neutral
terms: it names no vendor, no product and no tool-specific mechanism. It mirrors
`CLAUDE.md`, the same contract with the Claude Code kit named; if the two ever disagree
they are both wrong, so fix both in the same change. There are no lints, builders, hooks
or CI here: every rule below is a convention you follow, and check, by hand.

## Read order, always

1. [index.md](index.md) — every page, one line each. It is the map.
2. [vocabulary.md](vocabulary.md) — LCA terms mean different things in ILCD, in a tool
   and in a database; this file keeps those meanings side by side. Read it before you
   write a definition, so you add a context instead of overwriting one.
3. The pages the index points you at, then [sources.md](sources.md) for what they cite.

Never answer from memory when a page exists, and never write a page without reading the
index first: the answer may already be somewhere else, and duplicating it creates the
contradictions a later review then has to find.

## Page types

A public, agent-maintained markdown wiki about LCA practice with the Brightway and
Sentier tooling. `raw/` is an immutable layer nothing may write to; everything else is
the wiki layer, `index.md` and `vocabulary.md` included. `type:` is one of these, and decides
which template the page follows.

| type | What it is | Template |
|---|---|---|
| `readme` | a folder README: what belongs here, the naming rule, how to add | written by hand |
| `branch` | a root branch overview page | `templates/community/README.md` |
| `concept` | one LCA concept, defined from the standards | `templates/pages/concept.md` |
| `standard` | one standard, guidance document or data format | `templates/pages/standard.md` |
| `sector` | one GICS sector | `templates/pages/sector.md` |
| `use-case` | one end-to-end thing a practitioner does | `templates/pages/use-case.md` |
| `module` | a module's front page: purpose, install, version, Datasets | `templates/pages/module-codebase/README.md` |
| `module-page` | a page inside a module folder: layout, classes, commands, datasets, gotchas, status | `templates/pages/module-codebase/` |
| `database` | a page describing an external database | `templates/pages/module-database/` |
| `roadmap` | what is missing in a branch and where help is welcome | `templates/community/roadmap.md` |

## Frontmatter

Required on every markdown page except those in `scripts/`, `templates/`, `raw/`,
`.claude/`, the generated `api/` folders, and the root files `README.md`, `CLAUDE.md`, `AGENTS.md`, `CONTRIBUTING.md`,
`SPECS.md`, `log.md`, `sources.md`, `index.md` and `vocabulary.md`.

```yaml
---
title: Functional unit          # what a reader would call the page
type: concept                   # from the table above
summary: One line, reused verbatim in index.md.
audience: [P1, P3]              # P1 practitioner, P2 contributor, P3 wiki developer
updated: 2026-09-21             # the day the content was last checked
sources: [ilcd-2010]            # ids that resolve in sources.md
related: [../standards/iso-14040-14044.md]   # optional
---
```

`sources:` may be empty only on `readme` and `roadmap` pages: a folder README and a
roadmap make no sourced claims. Every other page carries at least one resolving source,
by design: every claim in this wiki carries a source.

Use-case pages must carry `verified:` (`yes` or `no`), and when yes, `verified_on:`
(the date) and `verified_env:` (the environment). Say `no` honestly rather than claiming
a run you did not make. By convention a page a later phase will fill carries
`status: stub` until it has real content and real sources; no page carries it today.

[templates/pages/frontmatter.schema.yaml](templates/pages/frontmatter.schema.yaml), a
JSON Schema written as YAML, is the reference for these fields. Nothing runs it.

## Link rules

- Relative markdown links only. No absolute paths, no links to a host that serves this
  repository. External links are allowed; register the source in `sources.md` too, so
  the claim survives the link rotting.
- Every relative link, image and `related:` entry must resolve to a file that exists.
  Open the target before you commit the link.
- Link a term as `vocabulary.md#term-anchor`, with the anchor GitHub's slug of the
  `### Term` heading: lower case, spaces to hyphens, punctuation dropped. Check the
  heading exists; a guessed slug is the most common broken link here. The same holds
  for an `#anchor` into any other page.

Page length: 200 to 400 lines is the working range, 800 the hard ceiling (generated
`api/` files are exempt). Split by
subject, not by size; a module page that outgrows the range usually wanted `classes.md`,
`commands.md` and `gotchas.md`, which the module template provides. `index.md`,
`vocabulary.md`, `sources.md` and `SPECS.md` are exempt.

## Vocabulary

Every term lives in the single root [vocabulary.md](vocabulary.md). Edit it directly;
there is no per-branch delta file and nothing to regenerate.

The file's own header states the entry format and the list of contexts; follow it.

- One `### Term` heading per term, alphabetical, listed in the table of contents.
- One bullet per source and context, each naming a `source:` id that resolves in
  `sources.md`. Two bullets for the same context under one term is a mistake, and
  **diverging definitions are never merged**: add your context beside the existing one.
- A term no standard defines yet is `provenance: first-use · review: needed`.
- `Disambiguation:` bullets need no source.

Precedence: the ILCD Handbook 2010 is the reference, so where it defines a term its
bullet comes first; where a term is absent from ILCD, the first source using it defines
it, marked first-use. `scripts/extract_ilcd_glossary.py` prints the handbook's own key
definitions in this format if you need them again.

## Sources

Register a source in [sources.md](sources.md) **before** you cite it: id, title, URL,
the date you actually opened it, the licence the publisher states. Ids are kebab-case
and stable. Never invent an id on a page and fix `sources.md` later: the point is that
the claim was checked when it was written.

## The three workflows

### Ingest: a source becomes pages

1. Read `index.md` and `vocabulary.md`. Decide which branch and folder the material
   belongs to, and whether it extends an existing page instead of adding one.
2. Register the source in `sources.md`.
3. Write or extend pages from the templates, each claim carrying its source id, each
   page in the 200 to 400 line range.
4. Add the terms the source introduces to `vocabulary.md`, one bullet per context,
   never merging with an existing bullet.
5. Add or update the page's line in `index.md`, then append one line to `log.md`.

**The formatting pass, for an imported knowledge base.** When the source is itself a
structured body of knowledge (a documentation site, a glossary, a handbook), do not
mirror it. Map its structure onto this wiki's page types first: concepts become
`concept` pages, reference material becomes `module-page` or `database` pages, a
glossary becomes bullets in `vocabulary.md`, tutorials become use cases. A page that
reads like a copy of its source has failed the pass.

### Query: a question becomes a cited answer

1. `index.md`, then `vocabulary.md`, then the pages.
2. Answer with the page paths you used and the source ids those pages cite. If the
   answer rests on a term, say which context you used: ILCD, a tool or a database.
3. If the wiki could not answer, say so plainly and consider whether the gap is worth a
   new page or a roadmap item; never fill it with unsourced memory. If you did write a
   page, finish the ingest workflow: index, vocabulary, log.

### Lint: a review pass you run when asked

There is no lint script. When asked to lint, look for: contradictions between a `core/`
definition and a branch page; versions that have moved on since a page's `updated:`
date; orphan pages nothing links to; claims with no source; vocabulary drift, the same
term defined twice in one context; private names; licensed amounts under `ecoinvent/`.
Start from these greps:

```bash
grep -rnoiFf .private-names.local.txt . --exclude-dir=.git --exclude=.private-names.local.txt
grep -rho "vocabulary.md#[a-z0-9-]*" --include='*.md' . | sort -u   # against grep -n '^### ' vocabulary.md
grep -rhn ']([^)#]*\.md' --include='*.md' .                         # every target must exist
grep -rh "^sources:\|source: " --include='*.md' .                   # every id must be a row of sources.md
grep -rEn '\| *-?[0-9]*\.[0-9]+([eE][-+]?[0-9]+)? *\|' ecoinvent    # no licensed amounts (decimals; counts with thousands separators are fine)
```

Fix what you find, update `index.md` and `vocabulary.md`, and log the pass.

## Hard constraints

- **Never write under `raw/`.** It is the immutable layer.
- **Never publish licensed amounts.** Under `ecoinvent/`, structure only: activity
  names, units, versions, classifications, glossary text quoted with attribution. No
  inventory amounts, no characterisation factors from licensed data, no table of numbers
  that amounts to redistribution.
- **Never mention or copy from private repositories, hosts or secrets.** This wiki
  documents public repositories only. If a file `.private-names.local.txt` exists at the
  root, grep the tree against it before committing; it is never committed itself. When a
  page would need private content to be true, leave the gap and put it on the roadmap.
- **No credentials, tokens or environment variable values**, anywhere, ever.
- **No git-LFS and no release artifacts.** Besides the ILCD PDF, files stay under 1 MB.
  English only.

## After every task

Update [index.md](index.md) if you added, renamed or removed a page; update
[vocabulary.md](vocabulary.md) if terms changed; append one line to [log.md](log.md):

```
## [YYYY-MM-DD] <ingest|query|lint|task> | <short description>
```

Commit messages are `<type>: <description>`, type one of feat, fix, refactor, docs or
chore, one logical change per commit.

## Where things live

| Path | What it is |
|---|---|
| `core/` | LCA as the standards describe it, with no tool attached |
| `sentier/`, `brightway/` | tool branches, one module folder per package |
| `bafu/`, `ecoinvent/` | external databases, documented as data sources |
| `templates/` | page templates and the skeleton for a new community branch |
| `scripts/` | one read-only helper, the ILCD glossary extractor |
| `.claude/` | a repo-local agent kit in one vendor's format; its rules are this file's rules |
| `raw/` | the immutable raw layer |

A new community branch is a copy of `templates/community/`; see [CONTRIBUTING.md](CONTRIBUTING.md).