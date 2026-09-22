**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.exiobase3_hybrid` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.importers.exiobase3_hybrid cfg.yml > bw2io.importers.exiobase3_hybrid.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.exiobase3_hybrid"></a>

# bw2io.importers.exiobase3\_hybrid

<a id="bw2io.importers.exiobase3_hybrid.Exiobase3HybridImporter"></a>

## Exiobase3HybridImporter Objects

```python
class Exiobase3HybridImporter(object)
```

<a id="bw2io.importers.exiobase3_hybrid.Exiobase3HybridImporter.format"></a>

#### format

<a id="bw2io.importers.exiobase3_hybrid.Exiobase3HybridImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath, db_name="EXIOBASE 3.3.17 hybrid")
```

<a id="bw2io.importers.exiobase3_hybrid.Exiobase3HybridImporter.write_database"></a>

#### write\_database

```python
def write_database()
```
