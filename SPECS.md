# SPECS — Public LCA Wiki (Brightway + Sentier community, then the wider LCA community)

Status: v1.0, decisions taken 2026-09-21 · Author: Laurenz Bougan (DdS)
Audience: the sub-agents that will build the wiki, and the humans who review it.
Target repo: `github.com/sentier-dev/lca-wiki` (public).

This document synthesises the requirements given on 2026-09-21, the Brightcon 2026
hackathon proposal by Départ de Sentier, the maintainers' internal agent wiki that
pioneered the conventions, and Karpathy's "LLM
Wiki" gist. Conflicts found in the requirements were put to Laurenz on 2026-09-21;
the answers are binding and recorded in section 12. **Sub-agents build against
section 12 as written.**

---

## 1. Purpose and scope

A public, agent-maintained markdown wiki about LCA practice with the Brightway and
Sentier tooling, hosted on GitHub, readable by humans on GitHub and by any LLM that
clones it. It follows the LLM Wiki pattern: a small immutable raw layer, an
agent-written wiki layer, and a schema file (`CLAUDE.md`, mirrored in `AGENTS.md`)
that tells the agent how to ingest, query and lint.

Two steps:

1. **Step 1 (this build)**: five root branches: `core/` (the domain-neutral "ILCD LCA
   wiki"), `sentier/`, `brightway/`, `bafu/` (the BAFU LCA database as an external
   data source) and `ecoinvent/` (same nature), plus the root orientation files.
2. **Step 2 (later)**: other tool/platform/network communities add their own root
   branch (openLCA, SimaPro, ADEME/Agribalyse, PEF/EF, national databases) by
   copying `templates/community/`.

Out of scope for step 1: MCP servers, any front-end beyond GitHub rendering,
translations, per-datapoint documentation of datasets.

## 2. Users

| Persona | What they come for | Entry point |
|---|---|---|
| **P1 LCA practitioner** (sector- or research-specific) | "How do I do *my* LCA with Brightway and the Sentier platform?" | `index.md` → branch → module → `use-cases/` → `core/sectors/<gics-sector>.md` |
| **P2 Potential contributor** (developer, funder, technical support, any location) | "What exists, what is missing, where can I help, under which licence?" | `index.md` → `CONTRIBUTING.md` → `<branch>/roadmap.md` → module `status.md` |
| **P3 Wiki developer** | "How do I extend core, extend sentier, or create a wiki for another tool?" | `CLAUDE.md` → `templates/` → `templates/community/` |

Every page states in frontmatter which personas it primarily serves (`audience:`).

## 3. Principles (non-negotiable)

- **Plain files, git, no build step needed to read.** Markdown, YAML frontmatter,
  relative links. Renders on GitHub; greppable; clone-and-feed-to-LLM.
- **Every claim carries a source.** Pages list `sources:` ids that resolve in
  `sources.md`; a page without one is not accepted.
- **ILCD first.** Definitions come from the ILCD Handbook (2010) when it defines the
  term; otherwise from the first source using it, marked `provenance: first-use` and
  `review: needed`. Diverging definitions stay side by side, one per source/context.
- **DdS privacy and licensing constraints apply** (section 10): no ecoinvent
  amounts, no private-repo content, no LFS, no release artifacts.
- **Small pages.** 200–400 lines; split beyond that. `index.md`, `vocabulary.md`,
  `sources.md`, `SPECS.md` and any `api/` file are the exemptions (section 6).
- **Open to extension.** Every folder has a `README.md` saying in plain words what
  belongs there, the naming rule, and how to add to it.
- **English only** in step 1 (D13).

## 4. Repository

- `sentier-dev/lca-wiki`, public (D1). Licence: CC-BY 4.0 for content, MIT for
  `scripts/` (same split as `sentier.dev`).
- No CI, no lint or build scripts (D15). The rules of section 3 are conventions an
  agent or a reviewer checks by hand; `.claude/skills/wiki-lint/SKILL.md` is that check
  written down, with the greps to start from.
- `index.md` and `vocabulary.md` are hand-maintained files, edited directly like any
  other page (D15).
- No LFS, no GitHub Releases. The one binary is the ILCD PDF in `raw/` (about 5 MB,
  committed directly, D4).

## 5. Tree structure

```
lca-wiki/
├── README.md            # human landing page: what this is, how to read it, how to contribute
├── CLAUDE.md            # schema: page types, frontmatter, link rules, ingest/query/lint workflows, constraints
├── AGENTS.md            # tool-neutral mirror of CLAUDE.md for Codex / OpenCode / Gemini users (D5)
├── index.md             # LLM entry point: every page, one line + path, grouped by branch and folder; hand-maintained
├── vocabulary.md        # the controlled vocabulary, per-context definitions (section 7); hand-maintained
├── sources.md           # registry of every external source cited: id, title, URL, accessed date, licence
├── log.md               # append-only: "## [YYYY-MM-DD] <ingest|query|lint|task> | <desc>"
├── CONTRIBUTING.md      # for P2/P3: add a source, a page, a module, a community; PR checklist
├── install.sh           # recommended global plugin kit, pinned versions (section 9)
├── LICENSE  LICENSE-CONTENT
├── .claude/
│   ├── settings.json    # allowed tools and refused paths; no hooks (D15)
│   ├── rules/           # trimmed copies of the writing/coding-style and security rules
│   └── skills/          # wiki-ingest, wiki-query, wiki-lint, wiki-new-module, wiki-new-community
├── scripts/             # one read-only helper (D15)
│   ├── extract_ilcd_glossary.py   # prints ILCD chapter 3 Table 1 in vocabulary.md's bullet format
│   └── README.md
├── raw/
│   └── ilcd/            # ONLY the ILCD Handbook PDF (EUR 24708 EN) + README.md with citation and licence
├── templates/
│   ├── community/       # what a new root branch must contain (README, roadmap, modules/)
│   └── pages/           # module-codebase/, module-database/, use-case.md, sector.md, concept.md, standard.md, vocab-entry.md, frontmatter.schema.yaml
├── core/                # the domain-neutral "ILCD LCA wiki"
│   ├── README.md
│   ├── concepts/        # goal & scope, functional unit, LCI, LCIA, interpretation, allocation, cut-off, system boundary, data quality, uncertainty, ...
│   ├── standards/       # ISO 14040/44, ILCD Handbook, ILCD format 1.1 / eILCD, EF/PEF (PEFCR/OEFSR), EN 15804
│   ├── sectors/         # GICS: 11 sector pages + crosswalk.md (section 8)
│   └── use-cases/       # tool-agnostic: screening LCA, comparative LCA, EPD, PEF study
├── sentier/
│   ├── README.md        # what Sentier is, who runs it, layers (Application / Data / mappings)
│   ├── platform.md      # architecture from sentier.dev (public parts of the private concept page only, D12)
│   ├── commands.md      # one table: every runnable command across sentier-* packages
│   ├── roadmap.md       # open work, where contributors can help
│   └── modules/
│       ├── sentier-brightway/  sentier-vocab/  sentier-importers/
│       ├── sentier-inventory/  # documents BAFU-2026 as imported by Sentier (11 sector folders) and links to ../../bafu/ (D3)
│       ├── sentier-methods/  sentier-mappings/
│       └── sentier-agribalyse/ # public twin only; private adapter repositories are never documented
├── brightway/
│   ├── README.md  roadmap.md
│   ├── packages.md      # landscape table: name, version, one-line descriptor, base commands and classes
│   ├── commands.md
│   └── modules/         # D7: bw2data, bw2calc, bw2io, bw_processing, matrix_utils, bw2parameters, bw2analyzer,
│                        #     randonneur, flowmapper, ecoinvent_interface, bw_graph_tools, bw_timex, bw_temporalis, activity-browser, pypardiso
├── bafu/                # the BAFU LCA database as an external data source (D3)
│   ├── README.md  roadmap.md
│   ├── knowledge/       # methodology, format (openLCA package), versions, licence, access route, sector coverage (GICS + own groups), provenance, schemas, methods (EF 3.1), vocab
│   ├── data/            # D6: fetch/access notes and scripts for what exists (download of the openLCA zip); no open API today
│   └── use-cases/
└── ecoinvent/           # same shape as bafu/, structure-only (section 10)
    ├── README.md  roadmap.md
    ├── knowledge/  data/  use-cases/
```

Notes:

- `index.md` and `vocabulary.md` are ordinary files, written and kept current by hand.
  Adding, renaming or removing a page means editing `index.md` in the same change;
  adding a term means editing `vocabulary.md` (D15). There are no per-branch
  vocabulary files.
- Folder `README.md` files are hand-written: purpose, naming rule, "how to add here".
- Conventions mirror the maintainers' internal wiki so pages port both ways after a
  privacy pass.

## 6. Modules

A module is one thing a practitioner installs, reads or connects to. Three natures:

| Nature | Where | Folder contents |
|---|---|---|
| **codebase** | `sentier/modules/*`, `brightway/modules/*` | `README.md` (purpose, install, name + version as of build date and how obtained), `layout.md` (tree with file descriptors), `api/` (pdoc markdown run by hand, one file per submodule, D8), `classes.md` (hand-written: public classes/functions with one-line descriptors and the base commands that invoke them), `commands.md` (CLI and notebook entry points), `datasets.md` (what data the module ships or fetches: name, version, sectors, provenance, schema, methods, vocab), `gotchas.md`, `status.md`, `use-cases/` |
| **database** (external) | `bafu/`, `ecoinvent/` (a whole root branch each) | `knowledge/` (methodology, format, versions, licence, access, sector coverage, provenance of inventory, schemas, methods such as EF 3.1, vocabulary used), `data/` (access notes and fetch scripts where an access route exists; pointer files otherwise, D6), `use-cases/` |
| **knowledge base** (imported) | folded into the branch it extends | Imported through the `wiki-ingest` **formatting pass** that maps the source's structure onto the page types above; the source is registered in `sources.md`, never mirrored wholesale |

Rules:

- Every module `README.md` has a **Datasets** section (or links `datasets.md`) so
  dataset descriptors are reachable from the module page. Descriptors stay broad:
  never per datapoint.
- `sentier/modules/sentier-inventory/datasets.md` describes BAFU-2026 as Sentier
  ships it (11 sector folders, unit-keyed flow ids, parquet + YAML schema) and links
  to `bafu/knowledge/` for the source database itself (D3).
- `api/` files: an API reference generated by running pdoc by hand, one file per
  submodule, against the version recorded in `README.md`; every file stamped with
  package, version and date; exempt from the 200–400 line rule; capped at 1 MB per
  file. No script produces them (D15).
- `use-cases/` holds one file per use case (`templates/pages/use-case.md`): persona +
  GICS sector, goal, prerequisites, steps with commands, expected output, pitfalls,
  related vocabulary anchors, `verified: yes|no` with date and environment.

## 7. Vocabulary

There is one vocabulary file: root `vocabulary.md`, edited directly (D15). It is the
file an LLM reads second, after `index.md`. Its header states the contexts in use, the
entry format and the precedence rule. Entry format (alphabetical, stable anchors):

```markdown
### Activity
- **ILCD (2010)** — not defined as such; see Process. — source: ilcd-2010 §6.x
- **Brightway (bw2data ≥4)** — a node in the technosphere graph carrying exchanges;
  Python class `Activity`. — source: bw2data-docs · provenance: first-use · review: needed
- **Sentier** — a row of the inventory `processes` table … — source: sentier-inventory-schema
- **ecoinvent** — <ecoinvent KB definition, quoted with attribution> — source: ecoinvent-kb-glossary
- Disambiguation: not "activity data" (EF/PEF: quantitative inputs to a process); see [Activity data](#activity-data).
```

Rules of precedence and marking:

1. **ILCD Handbook 2010** (General guide for LCA, detailed guidance, EUR 24708 EN) is
   the reference. Its chapter 3 Table 1 "Key definitions", 32 terms, is extracted from
   the PDF in `raw/ilcd/` by `scripts/extract_ilcd_glossary.py` and pasted into
   `vocabulary.md`, each entry with its page reference.
2. The EF/PEF starter terms from the brief (activity data, direct emissions,
   EF-compliant dataset, ILCD format, ILCD-EL, eILCD, foreground process, background
   process, PEF/OEF, PEFCR/OEFSR, LCA software, LCDN, single overall score) are tagged
   **EF/PEF (European Commission)** (D9). Where the ILCD PDF also defines the term,
   the ILCD bullet comes first.
3. The **ecoinvent Knowledge Base glossary** is open access (D10): definitions are
   imported with attribution and a link, as the "ecoinvent" context bullet.
4. Terms absent from ILCD are defined by the first source using them, tagged
   `provenance: first-use` and `review: needed`, rendered as a visible marker.
5. Diverging definitions get one bullet per source/context. Never merged.
6. Required terms even if ILCD lacks them (high level): Software, Module, LCIA
   calculator, Flow mapper, Importer, Models, Inventory, LCIA methods, LCA database,
   LCA data, LCI data, LCI, LCIA results, Data format, Schema, File format, Activity,
   Flows, Intermediate flows, Reference flow, Substitution flow, Elementary flows,
   Exchanges, Unit Processes, Processes, Characterization factors, Foreground,
   Background, Field, Metadata, Uncertainty, Data quality, Modelling principles,
   Substance, Compartment, Sub-compartment, Nomenclature. "Module" carries at least
   three contexts: wiki module (this spec), EN 15804 life cycle module (A1–A3 …),
   Python module.
7. The Sentier contexts in `vocabulary.md` cover the three groups the brief asks for:
   (a) Sentier/Brightway-specific terms, (b) terms whose Sentier meaning differs from
   ILCD (both meanings shown), (c) sector-regulation (PCR/PEFCR) terms.

## 8. Sectors

Sector pages use the **Global Industry Classification Standard (GICS)**: 11 sector
pages; industry-group pages only when a use case needs one. `core/sectors/crosswalk.md`
maps each GICS sector to sentier-inventory folders (`01-agriculture …
10-building-services`), BAFU's own groups and ecoinvent's ISIC divisions (D11). Use
cases and dataset descriptors reference sectors by GICS name.

## 9. Skill kit

Goal: a contributor or inspector who clones the repo and opens a coding agent gets
the minimum discipline with no further setup; heavier global plugins are recommended
through `install.sh`, not required.

| Layer | Shipped how | Content |
|---|---|---|
| Schema | `CLAUDE.md`, mirrored in `AGENTS.md` (D5) | page types, frontmatter, link rules, ingest/query/lint workflows, constraints, "read index.md then vocabulary.md first" |
| Repo-local skills | `.claude/skills/*/SKILL.md` | `wiki-ingest` (source → pages → vocabulary → index → log, with the formatting pass for knowledge bases), `wiki-query` (index → pages → cited answer → optional new page), `wiki-lint` (the manual review pass: greps, then contradictions, stale versions, orphans, missing sources, vocab drift, forbidden content), `wiki-new-module`, `wiki-new-community`. No step in any skill runs a wiki script (D15). |
| House rules | `.claude/rules/` | trimmed copies of the writing/coding-style and security rules, cut down to a markdown repository with one script |
| Permissions | `.claude/settings.json` | allowed tools and refused paths (`raw/`, `.env`). No hooks (D15) |
| Recommended global plugins | `install.sh`, pinned | superpowers 5.0.6 (brainstorming, writing-plans, executing-plans, test-driven-development, systematic-debugging, verification-before-completion, using-git-worktrees); everything-claude-code 1.8.0 (python-patterns, python-testing, tdd-workflow, coding-standards, search-first, documentation-lookup, deep-research, verification-loop, security-review); gstack 1.58.5 (`/spec`, `/investigate`, `/review`, `/ship`, `/browse`, `/retro`); get-shit-done 1.27.0 (planner, researcher, verifier agents, context-monitor hooks) |

`templates/community/` carries the same kit references so a new branch starts equal.

## 10. Privacy, licensing, forbidden content

Inherited from the maintainers' internal rules:

- **Never** document or copy from DdS private repositories or infrastructure (private
  data pipelines, hosting, identity provider, secrets files). The names live in an
  uncommitted `.private-names.local.txt` at the repository root, ignored by git and
  greppable against the tree before a commit; the maintainers keep the full list
  internally. Only pages about public repos are ported from the maintainers' internal
  wiki, after a privacy pass (D12).
- **ecoinvent branch is structure-only**: activity names, units, versions,
  classification, glossary text. No LCI amounts, no CFs derived from licensed data. A
  numeric table under `ecoinvent/`, a secret-looking assignment, or any name from the
  local list is refused in review.
- **ILCD PDF**: EC document, reusable with attribution (Decision 2011/833/EU);
  `raw/ilcd/README.md` carries the citation; every vocabulary entry keeps its
  reference.
- No git-LFS, no release artifacts; besides the PDF, files stay under 1 MB.

## 11. Build plan for sub-agents

Each phase lists tasks, agent, inputs, outputs, acceptance. Tasks within a phase run
in parallel unless marked *serial*. Every task ends by updating `index.md`, updating
`vocabulary.md` where relevant, and appending one `log.md` line. The checks are the
manual pass of `.claude/skills/wiki-lint/SKILL.md` (D15).

### Phase 0 — Skeleton, templates and kit (serial, 1 agent)

- Create the tree of section 5 with folder READMEs, `templates/`, `CLAUDE.md`,
  `AGENTS.md`, `CONTRIBUTING.md`, licences, `.claude/` kit, `install.sh`, `sources.md`
  header.
- A lint and build toolchain was written in this phase and removed again by decision
  D15: no lint scripts, no builders, no CI, no hooks. `scripts/` keeps only
  `extract_ilcd_glossary.py`.
- Acceptance: the tree of section 5 exists; every folder has a README; the frontmatter
  reference and the page templates are written; `index.md` and `vocabulary.md` exist.

### Phase 1 — Sources (parallel, 2 agents)

| Agent | Task | Output |
|---|---|---|
| R1 | Download the ILCD Handbook PDF into `raw/ilcd/`, write its README (citation, licence, size); extract the chapter 3 key definitions with page refs into `vocabulary.md` | `raw/ilcd/*.pdf`, `raw/ilcd/README.md`, ILCD bullets of `vocabulary.md` |
| R2 | Register every external source the build will cite in `sources.md`: EF/PEF glossary (EC), ILCD Format 1.1 process data set docs, ecoinvent KB glossary, BAFU LCA database release page, docs.brightway.dev, PyPI JSON per package, sentier.dev + sentier-* READMEs and schemas; add the EF/PEF starter terms to `vocabulary.md` tagged EF/PEF | `sources.md`, EF bullets of `vocabulary.md` |

Acceptance: every `sources.md` row has id, URL, accessed date, licence.

### Phase 2 — Core (parallel, 3 agents)

| Agent | Task | Output |
|---|---|---|
| C1 | Complete `vocabulary.md`: required terms of section 7.6 with first-use markers; ecoinvent-context bullets from the KB glossary; disambiguation lines | `vocabulary.md` |
| C2 | Concept pages and standards pages | `core/concepts/*.md`, `core/standards/*.md` |
| C3 | 11 GICS sector pages ("what an LCA in this sector typically needs") and `crosswalk.md` | `core/sectors/` |

Acceptance: every term of 7.6 has an entry; each concept page links ≥3 vocabulary
anchors, and every one of those anchors matches a `### Term` heading.

### Phase 3 — Branches and modules (parallel, 7 agents)

| Agent | Task | Output |
|---|---|---|
| S1 | `sentier/README.md`, `platform.md`, `commands.md`, `roadmap.md`, the Sentier contexts of `vocabulary.md` (groups a/b/c) | `sentier/` root |
| S2 | Modules sentier-brightway, sentier-importers (full codebase template incl. `classes.md`, `datasets.md`, use-cases) | `sentier/modules/{sentier-brightway,sentier-importers}/` |
| S3 | Modules sentier-vocab, sentier-inventory (BAFU-2026 dataset descriptor, link to `bafu/`), sentier-methods, sentier-mappings, sentier-agribalyse | remaining sentier modules |
| B1 | `brightway/README.md`, `packages.md` (name, version, descriptor, base commands and classes), `commands.md`, `roadmap.md`, the Brightway contexts of `vocabulary.md` | `brightway/` root |
| B2 | The 15 Brightway package modules of D7 (codebase template) | `brightway/modules/*/` |
| A1 | Run pdoc by hand against the pinned version of each sentier-* and Brightway package, one file per submodule, stamped with package, version and date; commit the `api/` folders | `*/modules/*/api/` |
| D1 | `bafu/` and `ecoinvent/` branches: `knowledge/`, `data/`, `use-cases/`, `roadmap.md`, their contexts in `vocabulary.md`; sector coverage in GICS terms plus own groups | `bafu/`, `ecoinvent/` |

Acceptance: every module has a Datasets section; every command in a `commands.md`
was run or checked against `--help` (recorded in `sources:`); `vocabulary.md` and
`index.md` updated; no private-repo names; `ecoinvent/` free of amounts.

### Phase 4 — Use cases (parallel, 2 agents)

- U1: per-module practitioner use cases (install BAFU-2026 + EF 3.1 with
  sentier-brightway in db and file mode; score an activity; coverage report; add a
  mapping package; regenerate vocab TTL; import a SimaPro CSV with bw2io; time-explicit
  LCA with bw_timex; open a project in activity-browser).
- U2: per-GICS-sector use cases in `core/use-cases/` (at least Materials, Utilities,
  Industrials, Consumer Staples/agriculture, Real Estate/construction) pointing to
  module use cases.
- Acceptance: each use case ran end to end in a clean `uv` environment, or carries
  `verified: no` with the reason.

### Phase 5 — Lint, index, cold review (serial, 2 agents)

- L1: the manual `wiki-lint` pass of `.claude/skills/wiki-lint/SKILL.md`: the greps
  (anchors, links, source ids, frontmatter, amounts, private names, page length), then
  the judgement pass (core vs branch definition contradictions, stale versions,
  orphans, missing sources, vocabulary drift); fixes committed.
- L2: independent reviewer reads `index.md` cold and answers five P1/P2/P3
  questions from the wiki alone; gaps become items in the relevant `roadmap.md`.
- Update the maintainers' internal wiki: repo page, status page, index, log.

### Phase 6 — Publish (human gate)

Laurenz creates `sentier-dev/lca-wiki`, pushes, enables CI, announces on the
Brightway and Sentier channels. Not automated.

## 12. Decisions (taken 2026-09-21)

| ID | Question | Decision |
|---|---|---|
| D1 | Repo | New public repo `sentier-dev/lca-wiki` |
| D2 | Top-level layout | Pure per-community root branches (`core/`, `sentier/`, `brightway/`, `bafu/`, `ecoinvent/`) with `index.md`, `vocabulary.md`, `log.md`, `CLAUDE.md` at root |
| D3 | BAFU placement | `bafu/` is its own root branch (the database as data source); Sentier's BAFU-2026 import is also documented under `sentier/modules/sentier-inventory/` with cross-links |
| D4 | `raw/` | Kept, for data only; today it holds just the ILCD Handbook PDF, the only official raw source stored. Everything else is cited by URL in `sources.md` |
| D5 | Tool neutrality | `.claude/` kit plus a tool-neutral `AGENTS.md` mirror |
| D6 | `data/` when no open API | Default kept: access notes and fetch scripts for what exists, pointer files otherwise |
| D7 | Brightway package list | Core + ecosystem: bw2data, bw2calc, bw2io, bw_processing, matrix_utils, bw2parameters, bw2analyzer, randonneur, flowmapper, ecoinvent_interface, bw_graph_tools, bw_timex, bw_temporalis, activity-browser, pypardiso |
| D8 | Codebase doc depth | Hand-written pages plus a generated pdoc markdown API reference per package |
| D9 | Starter vocab labelling | Tagged EF/PEF (European Commission); ILCD bullet first where both define a term |
| D10 | ecoinvent glossary | Open access per Laurenz: import with attribution and link |
| D11 | Sectors | GICS taxonomy plus `core/sectors/crosswalk.md` to sentier-inventory folders, BAFU groups, ISIC |
| D12 | Porting from the maintainers' internal wiki | Public-repo pages only, after a privacy pass |
| D13 | Language | English only |
| D14 | Local build folder | the maintainer's local checkout |
| D15 | Tooling | 2026-09-21, Laurenz: no lint/build scripts or CI; the wiki is written and checked by agents; the only script is the ILCD glossary extractor; index.md and vocabulary.md are hand-maintained |

## 13. Definition of done (step 1)

1. Tree of section 5 exists; every folder has a README; `index.md` lists every page;
   `log.md` has one line per task.
2. `vocabulary.md` covers the ILCD glossary, the EF/PEF starter terms, the ecoinvent
   contexts and all terms of section 7.6, with per-context entries and first-use
   markers.
3. `sentier/` and `brightway/` have every step-1 module documented with Datasets,
   `classes.md`, `commands.md`, an `api/` reference and at least one use case each;
   `packages.md` and both `commands.md` tables are complete with versions.
4. `bafu/` and `ecoinvent/` exist with `knowledge/`, `data/`, use cases and their own
   contexts in `vocabulary.md`; `ecoinvent/` contains no amounts.
5. No private repository or host name anywhere in the tree or in the commit history;
   every relative link and vocabulary anchor resolves; `scripts/extract_ilcd_glossary.py`
   runs and prints the 32 ILCD key definitions.
6. A cold-start agent answers five persona questions from the wiki alone.
7. Maintainers' internal wiki updated: repo page, status page, index, log.
