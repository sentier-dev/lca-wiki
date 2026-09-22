---
title: raw/ilcd
type: readme
summary: "The ILCD Handbook (EUR 24708 EN): its citation, its licence, its checksum and the rules for using it."
audience: [P1, P3]
updated: 2026-09-21
sources: []
---

# raw/ilcd

The ILCD Handbook, the reference document for this wiki's vocabulary.

## The file

| Field | Value |
|---|---|
| File | `ILCD-Handbook-General-guide-for-LCA-DETAILED-GUIDANCE-12March2010-ISBN-fin-v1.0-EN.pdf` |
| Size | 5092535 bytes (about 4.9 MiB) |
| SHA-256 | `7de4b9126536894b0b2594ab268b23b4de7de228146390ed6ade9954625e0c0f` |
| Retrieved | 2026-09-21 |

The file is committed directly, byte for byte as the publisher serves it: no git-LFS, no
release artifact, no re-encoding.

## Citation

European Commission, Joint Research Centre, Institute for Environment and
Sustainability. *International Reference Life Cycle Data System (ILCD) Handbook:
General guide for Life Cycle Assessment, Detailed guidance.* First edition, March 2010.
EUR 24708 EN. Publications Office of the European Union, Luxembourg, 2010.

## Licence

A European Commission document. Reuse is authorised with attribution under Commission
Decision 2011/833/EU on the reuse of Commission documents. Every vocabulary entry taken
from it keeps its page or section reference, and the `ilcd-2010` row in
[../../sources.md](../../sources.md) carries the URL and the date it was retrieved.

## What has been taken from it

Chapter 3, "Key definitions" (Table 1, pages 21 to 23), is the handbook's glossary. Its
32 terms are in [../../vocabulary.md](../../vocabulary.md), one bullet each, with the
page number on every bullet. `scripts/extract_ilcd_glossary.py` prints them again from
this PDF, in that format, if they ever need rechecking. The "Terms and concepts" boxes
spread through the body supply the longer explanations for a handful of terms the
glossary does not carry, and are cited by their own page numbers. The handbook has no
separate abbreviations annex.

## Rules

Do not edit, re-encode, split or re-upload the file. Quote it in pages, with the page
or section reference, and never paste long extracts: the wiki cites, it does not mirror.
