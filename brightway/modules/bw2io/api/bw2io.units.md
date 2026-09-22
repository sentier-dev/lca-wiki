**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.units` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.units cfg.yml > bw2io.units.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.units"></a>

# bw2io.units

<a id="bw2io.units.UNITS_NORMALIZATION"></a>

#### UNITS\_NORMALIZATION

<a id="bw2io.units.normalize_units"></a>

#### normalize\_units

<a id="bw2io.units.DEFAULT_UNITS_CONVERSION"></a>

#### DEFAULT\_UNITS\_CONVERSION

<a id="bw2io.units.get_default_units_migration_data"></a>

#### get\_default\_units\_migration\_data

```python
def get_default_units_migration_data()
```

<a id="bw2io.units.get_unusual_units_migration_data"></a>

#### get\_unusual\_units\_migration\_data

```python
def get_unusual_units_migration_data()
```

Only convert units that are not used in ecoinvent at all
