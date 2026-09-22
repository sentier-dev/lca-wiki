# templates

The two skeletons a contributor copies. Nothing here is a wiki page: files in this
folder carry placeholder frontmatter and are not listed in `index.md`, so copy them out
before you fill them in.

## What belongs here

| Folder | What it is |
|---|---|
| [pages/](pages/) | one template per page type, plus the frontmatter reference every page follows |
| [community/](community/) | the folder skeleton a new root branch starts from |

## How to use pages/

1. Pick the template whose `type:` matches what you are writing.
2. Copy it to its destination and rename it after the subject, not after the template.
3. Replace every `<...>` placeholder, including the ones in the frontmatter.
4. Register your sources in [../sources.md](../sources.md) before you cite them.
5. Add the page to `index.md`, add any new terms to `vocabulary.md`, and check by hand
   that your links resolve.

## How to use community/

A new tool, platform, network or database community gets its own root branch. Copy the
whole [community/](community/) folder to `<name>/` at the root of the repository, then:

1. Fill `README.md`: what the community is, what belongs in the branch, the naming rule,
   how to add to it.
2. Add the terms your community uses differently to the root `../vocabulary.md`, as new
   context bullets; do not rewrite another community's bullet and do not merge two
   definitions into one.
3. Fill `roadmap.md` so a contributor can see where to help.
4. Add module folders under `modules/` from [pages/module-codebase/](pages/module-codebase/)
   or [pages/module-database/](pages/module-database/), whichever fits.
5. Add every page to [../index.md](../index.md), check by hand that your links and
   `vocabulary.md#anchor` targets resolve, and append one line to
   [../log.md](../log.md).

The skill kit in `.claude/` applies to every branch equally: the same schema
([../CLAUDE.md](../CLAUDE.md), mirrored in [../AGENTS.md](../AGENTS.md)), the same
skills and the same house rules. A new branch starts with the same discipline as
`core/`.
