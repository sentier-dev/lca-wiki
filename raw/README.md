---
title: raw
type: readme
summary: "The immutable raw layer: source documents, never rewritten by an agent."
audience: [P2, P3]
updated: 2026-09-21
sources: []
---

# raw

The immutable raw layer. Files here are sources, not pages: they are never rewritten,
never summarised in place, and never edited by an agent. The guard in
`.claude/settings.json` refuses writes under this folder.

## What belongs here

Official source documents that the wiki must be able to quote exactly and that are not
reliably available at a stable URL. Today that is one folder:

- [ilcd/](ilcd/) — the ILCD Handbook PDF (EUR 24708 EN) and its citation.

## What does not belong here

Anything reachable by URL: cite it in [../sources.md](../sources.md) instead. Inventory
data, database extracts, downloaded releases, and anything licensed. No git-LFS and no
release artifacts: the ILCD PDF is committed directly and is the only binary in the
repository.

## Naming rule

One folder per source, named after it in lower case. Inside it, the file as the
publisher named it, plus a `README.md` with the citation, the licence and the size.

## How to add here

Adding to `raw/` is a decision, not a routine step: it puts a permanent binary in a
public repository. Open an issue first, say why a URL in `sources.md` is not enough,
and keep the file under a few megabytes.
