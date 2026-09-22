---
title: bafu/data
type: readme
summary: "How to obtain the BAFU data: access notes and fetch scripts where a route exists."
audience: [P1, P3]
updated: 2026-09-21
sources: []
---

# bafu/data

How to get the data, not the data itself. This wiki stores no inventory data: the only
binary it carries is the ILCD Handbook PDF in [../../raw/](../../raw/).

## What belongs here

Access notes (where the release lives, what you have to accept or register for, what
you receive), and fetch scripts or command lines where an open route exists. Where
there is no open route, a pointer file saying so, naming what a user has to do instead.

## What does not belong here

Downloaded files of any kind, extracted tables, and amounts.

## The pages

| Page | What it is |
|---|---|
| [fetch.md](fetch.md) | where the release files are, why the download cannot be automated, what to verify and what unpacks to what |
| [fetch.sh](fetch.sh) | verify the checksums of a release you downloaded and unpack its archives |

There is no open API for this database: the only route is the publisher's download page,
after accepting the terms of use. [fetch.md](fetch.md) says so and says what to do
instead.

## Naming rule

`fetch.md` and `fetch.sh` for the download route, `pointer-<what>.md` where there is
nothing to automate.

## How to add here

1. Check the licence before writing a fetch script, and record it in the page.
2. Keep every script runnable with `uv run`, and say what it writes and where.
3. Add the page to `index.md` and check by hand that every link and anchor resolves.
