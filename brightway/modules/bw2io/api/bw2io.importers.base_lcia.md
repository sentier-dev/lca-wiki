**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.base_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.base_lcia cfg.yml > bw2io.importers.base_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.base_lcia"></a>

# bw2io.importers.base\_lcia

<a id="bw2io.importers.base_lcia.LCIAImporter"></a>

## LCIAImporter Objects

```python
class LCIAImporter(ImportBase)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, biosphere=None)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.write_methods"></a>

#### write\_methods

```python
def write_methods(overwrite=False, verbose=True)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.write_excel"></a>

#### write\_excel

```python
def write_excel(name)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.drop_unlinked"></a>

#### drop\_unlinked

```python
def drop_unlinked(verbose=True)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.add_missing_cfs"></a>

#### add\_missing\_cfs

```python
def add_missing_cfs()
```

<a id="bw2io.importers.base_lcia.LCIAImporter.statistics"></a>

#### statistics

```python
def statistics(print_stats=True)
```

<a id="bw2io.importers.base_lcia.LCIAImporter.all_linked"></a>

#### all\_linked

```python
@property
def all_linked()
```

<a id="bw2io.importers.base_lcia.LCIAImporter.migrate"></a>

#### migrate

```python
def migrate(migration_name)
```
