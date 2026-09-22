---
name: wiki-new-community
description: Start a new root branch for another tool, platform, network or database community from the community template. Use when the wiki should cover an ecosystem it has no branch for.
---

# wiki-new-community

A community is a tool, platform, network or database with its own vocabulary and its own
modules. It gets a root branch, not a folder inside someone else's.

## 1. Decide it is a branch

- Does it have terms it uses differently from `core/`? Then it needs its own contexts in
  `vocabulary.md`, which means a branch.
- Does it have more than one module, or one module plus data? Then it is a branch.
- Is it one package inside an ecosystem this wiki already covers? Then it is a module in
  that branch: use `wiki-new-module` instead.

## 2. Copy the template

```bash
cp -r templates/community <name>
```

`<name>` is lower case, hyphenated, and is what the community calls itself.

Fill:

1. `README.md` — what the community is, what belongs in the branch, what does not, the
   naming rule, how to add here. Say who maintains the upstream, and link it.
2. `roadmap.md` — what is missing, specific enough for a contributor to start on.
3. `modules/README.md` — the naming rule for this branch's modules.

Then add the terms this community uses in its own sense to the root `vocabulary.md`, as
new contexts beside the existing bullets. Never rewrite a bullet another community
wrote, and never merge two definitions into one.

## 3. Register the community's sources

Its documentation, its repositories, its registry entries, its licence page, each with
the date you opened it, in `sources.md`.

## 4. Add the first module

Use `wiki-new-module`. A branch with no module is a promise; a branch with one filled
module is a pattern the next contributor can copy.

## 5. Finish

Add a line to `index.md` for every page the branch adds, and check by hand that every
relative link and `vocabulary.md#anchor` you wrote resolves. Then append one line to
`log.md`:
`## [YYYY-MM-DD] task | new community branch <name>`

Open the pull request early and say what the branch will cover: a new branch is a
conversation with the maintainers, not a drop.

## The kit travels with the branch

The schema in `CLAUDE.md` (mirrored in `AGENTS.md`), the skills in `.claude/skills/` and
the house rules in `.claude/rules/` apply to the new branch from its first commit.
Nothing about them is per-branch, and nothing in a branch may opt out of them.
