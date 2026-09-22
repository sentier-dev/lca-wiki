#!/usr/bin/env python3
"""Print chapter 3, Table 1 "Key definitions" of the ILCD Handbook as vocabulary entries.

The handbook PDF lives in raw/ilcd/. This script shells out to `pdftotext -layout`,
reads the two-column table off the pages that carry it, and writes each row in the
bullet format vocabulary.md uses. Paste the output into vocabulary.md and edit it into
the wiki's voice; nothing here writes to the tree.

Usage: python3 scripts/extract_ilcd_glossary.py [path/to/handbook.pdf]
"""

from __future__ import annotations

import glob
import os
import re
import subprocess
import sys

COLUMN = 33  # where the definition column starts in `pdftotext -layout` output
SOURCE_ID = "ilcd-2010"
FOOTER = re.compile(r"^3 Key definitions\s+(\d+)\s*$")
ROW_START = re.compile(r" \S")


def find_pdf(argv: list[str]) -> str:
    if len(argv) > 1:
        return argv[1]
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    found = sorted(glob.glob(os.path.join(here, "raw", "ilcd", "*.pdf")))
    if not found:
        sys.exit("no PDF found under raw/ilcd/; pass the path as an argument")
    return found[0]


def pdf_pages(path: str) -> list[str]:
    try:
        out = subprocess.run(
            ["pdftotext", "-layout", path, "-"],
            capture_output=True,
            text=True,
            check=True,
        ).stdout
    except FileNotFoundError:
        sys.exit("pdftotext is not installed (Debian/Ubuntu: apt install poppler-utils)")
    except subprocess.CalledProcessError as exc:
        sys.exit("pdftotext failed on %s: %s" % (path, exc))
    return out.split("\f")


def table_pages(pages: list[str]) -> list[tuple[int, str]]:
    """Return (printed page number, text) for the pages holding Table 1."""
    wanted = []
    for page in pages:
        match = FOOTER.search(page.rstrip().rsplit("\n", 1)[-1])
        if match and ("Table 1" in page or wanted):
            wanted.append((int(match.group(1)), page))
        elif wanted:
            break
    if not wanted:
        sys.exit("chapter 3 Table 1 not found in the PDF; has the edition changed?")
    return wanted


def join(parts: list[str]) -> str:
    text = ""
    for part in parts:
        if not part:
            continue
        if not text:
            text = part
        elif text.endswith("-"):
            text += part
        else:
            text += " " + part
    return re.sub(r"\s+", " ", text).strip()


def rows(pages: list[tuple[int, str]]) -> list[tuple[str, str, int]]:
    found: list[tuple[str, str, int]] = []
    for number, page in pages:
        for block in re.split(r"\n\s*\n", page):
            lines = [line for line in block.split("\n") if line.strip()]
            # Body text that follows the table without a blank line ends the row.
            for index, line in enumerate(lines[1:], 1):
                if line[:COLUMN].strip() and not ROW_START.match(line):
                    lines = lines[:index]
                    break
            if not lines:
                continue
            left = [line[:COLUMN].strip() for line in lines]
            right = [line[COLUMN:].strip() for line in lines]
            if ROW_START.match(lines[0]) and right[0]:
                term = join(left)
                if term in ("Term", ""):
                    continue
                found.append((term, join(right), number))
            elif found and not any(left):
                term, definition, start = found[-1]
                found[-1] = (term, join([definition] + right), start)
    return found


def entry(term: str, definition: str, page: int) -> str:
    alias = ""
    if "[" in term:
        term, _, rest = term.partition("[")
        alias = rest.rstrip("]").strip().rstrip(".") + ": "
        term = term.strip()
    definition = definition.strip().rstrip(".")
    if not definition[1:2].isupper():  # keep acronyms such as LCI intact
        definition = definition[:1].lower() + definition[1:]
    return "### %s\n\n- **ILCD (2010)** — %s%s — source: %s p.%d\n" % (
        term,
        alias,
        definition,
        SOURCE_ID,
        page,
    )


def main() -> int:
    extracted = rows(table_pages(pdf_pages(find_pdf(sys.argv))))
    for term, definition, page in extracted:
        print(entry(term, definition, page))
    print("# %d terms" % len(extracted), file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
