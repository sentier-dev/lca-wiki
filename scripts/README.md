# scripts

One script, and it only reads: `extract_ilcd_glossary.py` prints chapter 3, Table 1
"Key definitions" of the ILCD Handbook in `vocabulary.md`'s bullet format, so the 32
entries can be pasted and edited by hand instead of retyped. Standard library only; it
needs `pdftotext` from poppler-utils on the PATH.

```bash
python3 scripts/extract_ilcd_glossary.py            # reads the PDF in raw/ilcd/
```

The wiki has no lints, builders or CI: `index.md` and `vocabulary.md` are written by
hand, and the checks live in [../CLAUDE.md](../CLAUDE.md) as a procedure an agent runs.
