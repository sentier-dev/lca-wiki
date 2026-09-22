**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.impact_categories.ecoinvent_lcia` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'activity-browser==3.0.0b202608291724'
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
  -I "$SP" -m activity_browser.bwutils.impact_categories.ecoinvent_lcia cfg.yml > activity_browser.bwutils.impact_categories.ecoinvent_lcia.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia"></a>

# activity\_browser.bwutils.impact\_categories.ecoinvent\_lcia

Ecoinvent LCIA Implementation Excel import (vendor multi-method workbook).

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter"></a>

## EcoinventLCIAImporter Objects

```python
class EcoinventLCIAImporter(LCIAImporter)
```

Import ecoinvent-compatible LCIA Implementation Excel workbooks.

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, biosphere=None)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.setup_with_ei_excel"></a>

#### setup\_with\_ei\_excel

```python
@classmethod
def setup_with_ei_excel(cls, file: str, biosphere_database: str | None = None)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.set_biosphere"></a>

#### set\_biosphere

```python
def set_biosphere(biosphere_database: str, *, relink: bool = False)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.add_rationalize_method_names_strategy"></a>

#### add\_rationalize\_method\_names\_strategy

```python
def add_rationalize_method_names_strategy()
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.separate_methods"></a>

#### separate\_methods

```python
def separate_methods()
```

Split flat CF rows into distinct method datasets.

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(strategies=None, verbose=False)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.prepend_methods"></a>

#### prepend\_methods

```python
def prepend_methods(prepend: str)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.EcoinventLCIAImporter.write_methods"></a>

#### write\_methods

```python
def write_methods(overwrite=False, verbose=True)
```

<a id="activity_browser.bwutils.impact_categories.ecoinvent_lcia.convert_lcia_methods_data"></a>

#### convert\_lcia\_methods\_data

```python
def convert_lcia_methods_data(filename: str)
```
