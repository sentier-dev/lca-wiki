**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.extraction.ecospold2` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
SP="$(pkg/bin/python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
cat > cfg.yml <<'YML'
processors:
  - type: filter
    documented_only: false
    expression: "type(obj).__name__ != 'Indirection' and default()"
  - type: smart
renderer:
  type: markdown
  render_toc: false
YML
uvx --python 3.11 --from pydoc-markdown==4.8.2 pydoc-markdown \
  -I "$SP" -m flowmapper.extraction.ecospold2 cfg.yml > flowmapper.extraction.ecospold2.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.extraction.ecospold2"></a>

# flowmapper.extraction.ecospold2

<a id="flowmapper.extraction.ecospold2.reformat"></a>

#### reformat

```python
def reformat(obj: dict) -> dict
```

<a id="flowmapper.extraction.ecospold2.ecospold2_biosphere_extractor"></a>

#### ecospold2\_biosphere\_extractor

```python
def ecospold2_biosphere_extractor(input_path: Path, output_path: Path) -> None
```
