# Contributing

Thank you for helping. This wiki is written by people and by agents under the same
rules. There are no lint scripts and no CI: the rules below are checked by reading, and
the checklist at the end is what a reviewer will actually look at.

## Before anything

```bash
git clone https://github.com/sentier-dev/lca-wiki
cd lca-wiki
```

That is the whole setup. There is nothing to install and nothing to build.

Then read [index.md](index.md) and [vocabulary.md](vocabulary.md). They are short, they
are maintained by hand, and they tell you what already exists. The schema an agent
follows is [CLAUDE.md](CLAUDE.md), mirrored tool-neutrally in [AGENTS.md](AGENTS.md); it
is worth reading even if you write by hand.

Optional, and only if you work with a coding agent: `./install.sh` installs the plugin
kit the wiki was built with. It pins what can be pinned (`get-shit-done` by npm version,
`gstack` by its `VERSION` file) and, for the two Claude Code plugins, which have no
version syntax on the install command, it installs and then warns when the installed
version differs from the pinned one. `./install.sh --check` only reports. The
repository's own kit in `.claude/` needs no installation.

## The four things you are likely to add

### A source

Every claim in this wiki carries a source, so a source is registered before it is cited.

1. Open [sources.md](sources.md) and add one row: `id`, title, URL, the date you
   actually opened it, the licence the publisher states.
2. Use the id convention described at the top of that file. Ids are kebab-case and
   stable: once a page cites an id, it is not renamed.
3. Write "unknown" for a licence you could not establish, and do not quote that source.

### A page

1. Find the folder it belongs to and read that folder's `README.md`: it says what
   belongs there, how files are named, and how to add.
2. Copy the matching template from [templates/pages/](templates/pages/). Rename it after
   your subject, not after the template.
3. Fill the frontmatter: `title`, `type`, one-line `summary`, `audience`, `updated`,
   and `sources` ids that resolve. Only `readme` and `roadmap` pages may have an empty
   `sources` list. Use-case pages also carry `verified:`, and `verified_on:` and
   `verified_env:` when it is yes.
4. Keep the page between 200 and 400 lines, 800 at the very most. Split by subject.
5. Add any new terms to [vocabulary.md](vocabulary.md), one bullet per source and
   context. Never merge a definition into an existing bullet: diverging definitions stay
   side by side.
6. Add the page's line to [index.md](index.md) and one line to [log.md](log.md).

### A module

A module is one thing a practitioner installs, reads or connects to.

1. Copy [templates/pages/module-codebase/](templates/pages/module-codebase/) to
   `<branch>/modules/<name>/`, named exactly as the package is named upstream.
2. Record in `README.md` which version you documented and how you obtained it. A module
   page without a version is a page that will quietly go stale.
3. Fill the Datasets section, or `datasets.md` when it is longer than a paragraph.
   Descriptors stay broad: name, version, sectors, provenance, schema, methods,
   vocabulary. Never per datapoint.
4. If the module owes an API reference, run pydoc-markdown by hand, one file per
   submodule, into `<branch>/modules/<name>/api/`, and stamp each file with the package,
   the version, the date and the command (copy the recipe from any existing
   `api/README.md`). No script does this for you.
5. Write at least one use case, and set `verified:` honestly.

### A community branch

A new tool, platform, network or database community gets its own root branch.

1. Copy [templates/community/](templates/community/) to `<name>/` at the repository root.
2. Fill `README.md`, `roadmap.md` and `modules/README.md`.
3. Add module folders from the page templates.
4. Add your terms to the root [vocabulary.md](vocabulary.md) as new contexts. Never
   rewrite a bullet another community wrote; add yours beside it.
5. Open the pull request early: a new branch is a conversation, not a drop.

## What the wiki refuses

- **Unsourced claims.** A page whose `sources:` ids do not resolve in `sources.md` is
  sent back.
- **Licensed amounts.** Under `ecoinvent/`, structure only: names, units, versions,
  classifications, glossary text quoted with attribution. No inventory amounts, no
  characterisation factors derived from licensed data, no numeric tables.
- **Private content.** This wiki documents public repositories only, and no private
  repository, host or variable name may appear in its text. Maintainers keep those names
  in an uncommitted `.private-names.local.txt` at the repository root and grep the tree
  against it before committing; the file is ignored by git and is never published, so
  naming the private things is never needed to check for them.
- **Credentials**, tokens and environment variable values, anywhere.
- **git-LFS and release artifacts.** Besides the ILCD Handbook PDF in `raw/`, files stay
  under 1 MB.
- **Writes under `raw/`.** It is the immutable layer.
- Languages other than English, for now.

## The one script

`scripts/extract_ilcd_glossary.py` prints the ILCD Handbook's key definitions in this
wiki's vocabulary format, so they can be pasted and edited instead of retyped. Standard
library only, no dependency file, no tests; it reads a PDF and writes nothing. Keep it
that way, or delete it. Everything else this wiki needs is done by reading and writing
markdown.

## Pull request checklist

- [ ] Sources registered in `sources.md` before being cited, with access date and licence.
- [ ] Frontmatter complete on every new page; `type` matches the template used.
- [ ] Pages within 200 to 400 lines; long ones split by subject.
- [ ] New terms added to `vocabulary.md`, one bullet per context, none merged, headings
      alphabetical and listed in its table of contents.
- [ ] Every relative link and `vocabulary.md#anchor` opened and confirmed to resolve.
- [ ] `index.md` updated for every page added, renamed or removed.
- [ ] No private repository or host name anywhere in the diff.
- [ ] One line appended to [log.md](log.md).
- [ ] Commit messages in the form `<type>: <description>` (feat, fix, refactor, docs,
      chore).

## Licence

Content is CC BY 4.0 ([LICENSE-CONTENT](LICENSE-CONTENT)), code is MIT
([LICENSE](LICENSE)). By contributing you agree to that split. Material you quote from
third parties keeps its own licence, recorded in `sources.md`.
