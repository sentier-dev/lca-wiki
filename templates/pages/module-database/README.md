---
title: <database name>
type: readme
summary: "<One line: what this database is and who publishes it.>"
audience: [P1, P2]
updated: <YYYY-MM-DD>
sources: []
---

# <database name>

<What the database is, who publishes it, and why a practitioner would use it.>

Copy this folder to the root of the repository as `<name>/` when a database gets its
own branch.

## What belongs here

| Path | What it holds |
|---|---|
| `knowledge/` | methodology, format, versions, licence, access route, coverage, provenance, schemas, methods, vocabulary |
| `data/` | how to obtain the data; pointer files where there is no open route |
| `use-cases/` | end-to-end things a practitioner does with it |
| `../vocabulary.md` | the root vocabulary, where this database adds its own contexts |
| `roadmap.md` | what is missing and where a contributor can help |

## What does not belong here

The data itself, amounts of any kind, credentials, and what a tool does with the data:
that belongs to the tool's module page, which links back here.

## Naming rule

`lower-case-with-hyphens.md`, one subject per file.

## How to add here

1. Register the publisher's pages in `sources.md` first.
2. Describe, never copy.
3. Add every page you created to `index.md`, check by hand that your links resolve, and append one line to `log.md`.
