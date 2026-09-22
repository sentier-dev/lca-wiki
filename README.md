# LCA wiki

A public, agent-maintained wiki about life cycle assessment (LCA) practice with the
[Brightway](https://docs.brightway.dev/) and [Sentier](https://sentier.dev/) tooling.
Plain markdown in git: readable on GitHub by people, cloneable and greppable by any
LLM. No build step is needed to read it.

It grew out of the Brightcon 2026 hackathon proposal by
[Départ de Sentier](https://d-d-s.ch/).

## What is in here

| Path | What it holds |
|---|---|
| [index.md](index.md) | the entry point: every page, one line each, grouped by branch |
| [vocabulary.md](vocabulary.md) | the controlled vocabulary, one bullet per source and context |
| [sources.md](sources.md) | every external source the wiki cites, with URL, access date and licence |
| [core/](core/) | the domain-neutral LCA wiki: concepts, standards, GICS sectors, tool-agnostic use cases |
| [sentier/](sentier/) | the Sentier platform and its modules |
| [brightway/](brightway/) | the Brightway packages, one module folder each |
| [bafu/](bafu/) | the BAFU LCA database as an external data source |
| [ecoinvent/](ecoinvent/) | the ecoinvent database as an external data source (structure only, no amounts) |
| [templates/](templates/) | the page and branch templates a contributor copies |
| [scripts/](scripts/) | one read-only helper: the ILCD glossary extractor |
| [raw/](raw/) | the immutable raw layer: today only the ILCD Handbook PDF |
| [log.md](log.md) | append-only record of what was ingested, queried or reviewed, and when |

## Who it is for

- **P1, LCA practitioner.** You want to do *your* LCA with these tools. Start at
  [index.md](index.md), pick your branch, then the module, then its `use-cases/`, and
  read [core/sectors/](core/sectors/) for what your sector usually needs.
- **P2, potential contributor.** You want to know what exists, what is missing and
  under which licence. Start at [CONTRIBUTING.md](CONTRIBUTING.md), then the
  `roadmap.md` of the branch you care about.
- **P3, wiki developer.** You want to extend the wiki or start a branch for another
  tool or community. Read [CLAUDE.md](CLAUDE.md) (or its tool-neutral mirror
  [AGENTS.md](AGENTS.md)), then [templates/](templates/).

Every page says in its frontmatter which of the three it primarily serves.

## How to read it

1. [index.md](index.md) first: it is the map, one line per page.
2. [vocabulary.md](vocabulary.md) second: LCA terms mean different things in ILCD, in
   Brightway, in Sentier and in a database's own documentation. The wiki keeps those
   meanings side by side instead of merging them.
3. Then the page you actually need. Every claim on it carries a `sources:` id that
   resolves in [sources.md](sources.md).

Feeding the whole thing to an LLM works too: `git clone` it and point the agent at
`CLAUDE.md`.

## How to contribute

Read [CONTRIBUTING.md](CONTRIBUTING.md). In short: keep every claim sourced, keep the
pages short, and before you open a pull request check by hand what nothing checks for
you: that your links resolve, that your terms went into `vocabulary.md`, and that
`index.md` lists every page you touched.

There is no build step, no lint script and no CI. Cloning the repository is the whole
setup.

## Licence

- **Content** (every `.md` page, the templates, the wiki text): CC-BY 4.0, see
  [LICENSE-CONTENT](LICENSE-CONTENT).
- **Code** (`scripts/`, `install.sh`): MIT, see [LICENSE](LICENSE).
- The ILCD Handbook PDF in [raw/ilcd/](raw/ilcd/) is a European Commission document,
  reusable with attribution under Decision 2011/833/EU; its README carries the citation.

Contributions are accepted under the same split.
