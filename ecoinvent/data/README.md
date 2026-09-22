---
title: ecoinvent/data
type: readme
summary: How a licensed user obtains ecoinvent data; pointer files only, no open route.
audience: [P1, P3]
updated: 2026-09-21
sources: []
---

# ecoinvent/data

How a licensed user reaches the data. There is no open access route, so this folder
holds pointers and notes, never files.

## What belongs here

Notes on the access routes that exist (the ecoinvent website, the release formats, the
API and the tooling built on it), what a licence entitles you to, and what a tool needs
from you before it can download anything. Pointer files where there is nothing to
automate.

## What does not belong here

Credentials, tokens, downloaded files, extracts, amounts, and scripts that would work
around the licence gate.

## The pages

| Page | What it is |
|---|---|
| [access.md](access.md) | the routes a licence opens, what `ecoinvent_interface` does, how credentials are supplied, and why nothing is downloaded here |

There is no open access route and therefore no fetch script in this folder. That is not
an omission: the licence is the access mechanism, and a script that worked around it
would be the one thing this branch must never ship.

## Naming rule

`access.md` for the access notes, `pointer-<what>.md` for a pointer file.

## How to add here

1. Never write a credential, an environment variable value or a token into a page.
2. Describe what the user must do themselves; link the tooling module rather than
   restating its commands.
3. Check by hand before committing: every link resolves, every `sources:` id is a row of
   `sources.md`, and `index.md` lists the page.
