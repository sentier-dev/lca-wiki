**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.extraction.simapro_csv` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m flowmapper.extraction.simapro_csv cfg.yml > flowmapper.extraction.simapro_csv.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.extraction.simapro_csv"></a>

# flowmapper.extraction.simapro\_csv

<a id="flowmapper.extraction.simapro_csv.is_simapro_csv_file"></a>

#### is\_simapro\_csv\_file

```python
def is_simapro_csv_file(fp: Path) -> bool
```

<a id="flowmapper.extraction.simapro_csv.simapro_csv_biosphere_extractor"></a>

#### simapro\_csv\_biosphere\_extractor

```python
def simapro_csv_biosphere_extractor(input_path: Path,
                                    output_path: Path) -> None
```

Load all simapro files in directory `dirpath`, and extract all biosphere flows
