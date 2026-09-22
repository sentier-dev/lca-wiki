**Generated API reference** · package `bw2data` 4.7 · module `bw2data.database` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.database cfg.yml > bw2data.database.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.database"></a>

# bw2data.database

<a id="bw2data.database.DatabaseChooser"></a>

#### DatabaseChooser

```python
def DatabaseChooser(name: str, backend: str = "sqlite") -> ProcessedDataStore
```

A method that returns a database class instance.

Database types are specified in `databases[database_name]['backend']`.

<a id="bw2data.database.Database"></a>

#### Database
