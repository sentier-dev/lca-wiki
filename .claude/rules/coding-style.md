# Writing and coding style

This repository is markdown plus one read-only script. These rules apply to both.

## Prose

- English only, plain sentences, no marketing voice.
- Name things as a reader of this domain would: `source id`, `branch`, `unit process`.
- Every claim carries a source id that resolves in `sources.md`. Where no source says
  it, say so instead of writing it as fact.
- Quote short and attribute; never paste a source wholesale. A page that reads like a
  copy of its source has failed.

## File organisation

Many small files beat few large ones. One subject per page; 200 to 400 lines is the
working range and 800 is the hard ceiling. A page that outgrows the range wanted to be
two pages: split it by subject and add both lines to `index.md`.

## Links

Relative links only, and every one of them must resolve before you commit. Anchors into
`vocabulary.md` are the GitHub slug of the `### Term` heading; check the heading is
really there rather than guessing the slug.

## The one script

`scripts/extract_ilcd_glossary.py` reads a PDF and prints text. Keep it that way:

- standard library only, no dependency file, no virtual environment
- it never writes into the tree; a person pastes and edits its output
- type annotations on every signature, functions under 50 lines, no nesting past four
  levels, explicit `encoding="utf-8"` on every file it opens
- `subprocess.run` with a list of arguments, never `shell=True`
- it fails with a sentence a reader can act on, never a traceback

## Before calling it done

- readable, named after the domain, sourced
- pages inside the length range, links resolving, `index.md` and `vocabulary.md` updated
- one line appended to `log.md`
