**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.ecoinvent_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.ecoinvent_lcia cfg.yml > bw2io.importers.ecoinvent_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.ecoinvent_lcia"></a>

# bw2io.importers.ecoinvent\_lcia

<a id="bw2io.importers.ecoinvent_lcia.EcoinventLCIAImporter"></a>

## EcoinventLCIAImporter Objects

```python
class EcoinventLCIAImporter(LCIAImporter)
```

A class for importing ecoinvent-compatible LCIA methods

<a id="bw2io.importers.ecoinvent_lcia.EcoinventLCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(biosphere_database: Optional[str] = None)
```

Initialize an instance of EcoinventLCIAImporter.

Defines strategies in ``__init__`` because ``config.biosphere`` is dynamic.

<a id="bw2io.importers.ecoinvent_lcia.EcoinventLCIAImporter.add_rationalize_method_names_strategy"></a>

#### add\_rationalize\_method\_names\_strategy

```python
def add_rationalize_method_names_strategy()
```

<a id="bw2io.importers.ecoinvent_lcia.EcoinventLCIAImporter.separate_methods"></a>

#### separate\_methods

```python
def separate_methods()
```

Separate the list of CFs into distinct methods
