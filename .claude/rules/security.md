# Security

This repository holds public documentation. The risk is not code; it is publishing
something that should not be public.

## Before every commit

- no credentials, tokens, passwords or environment variable values, in a page or in the
  script
- no private repository, host or variable names. If a file `.private-names.local.txt`
  exists at the root, it is an uncommitted reminder list: grep the tree against it
  before committing, and keep the file itself out of git (`*.local.txt` is ignored).
- no licensed data: no inventory amounts, no characterisation factors derived from
  licensed databases, no numeric tables under `ecoinvent/`
- no `.env` file, and nothing read from one committed
- error messages that say what is wrong without leaking a path outside the repository

## Secrets

This wiki needs no secrets to write, read or publish. If a future script needs one, it
reads it from the environment, fails loudly when it is missing, and never prints it.
Nothing is ever hardcoded.

## Licensed content

Describe, never copy. Names, units, versions, classifications and short attributed
quotations are fine. Amounts, factors and extracts are not. When in doubt, write what
the data covers and how a licensed user gets it.

## If you find a problem

Stop, do not commit, and say so in the pull request or the issue. If something private
has already been committed, treat it as published: report it before pushing anything
else, and expect the secret to be rotated rather than just deleted.
