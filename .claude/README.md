# .claude

The repo-local kit. Cloning this repository is the whole installation: no plugin, no
global configuration and no network call is needed for an agent to work here under the
same discipline the wiki was built with.

| Path | What it is |
|---|---|
| `settings.json` | allowed tools and refused paths; no hooks |
| `rules/` | house rules for writing and for what must never be committed |
| `skills/` | the five task procedures: ingest, query, lint, new module, new community |

There are no hooks, no lints and no CI. The rules in this repository are conventions an
agent follows and checks by hand; the `wiki-lint` skill is that check written down.

The schema itself is not here: it is [../AGENTS.md](../AGENTS.md), at the root, tool-neutral; `CLAUDE.md` is a symlink to it.
get the rules from those two files.

Recommended global plugins, which are optional, are installed by
[../install.sh](../install.sh).
