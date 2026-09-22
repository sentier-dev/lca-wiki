**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.ecoinvent` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.ecoinvent cfg.yml > bw2io.ecoinvent.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.ecoinvent"></a>

# bw2io.ecoinvent

<a id="bw2io.ecoinvent.get_excel_sheet_names"></a>

#### get\_excel\_sheet\_names

```python
def get_excel_sheet_names(file_path: Path) -> list[str]
```

Read XML metadata file instead of using openpyxl, which loads the whole workbook.

From https://stackoverflow.com/questions/12250024/how-to-obtain-sheet-names-from-xls-files-without-loading-the-whole-file.

<a id="bw2io.ecoinvent.header_dict"></a>

#### header\_dict

```python
def header_dict(array: list) -> list[dict]
```

<a id="bw2io.ecoinvent.drop_unspecified"></a>

#### drop\_unspecified

```python
def drop_unspecified(a: str, b: str, c: str) -> tuple
```

<a id="bw2io.ecoinvent.pick_a_unit_label_already"></a>

#### pick\_a\_unit\_label\_already

```python
def pick_a_unit_label_already(obj: dict) -> str
```

<a id="bw2io.ecoinvent.import_ecoinvent_release"></a>

#### import\_ecoinvent\_release

```python
def import_ecoinvent_release(version: str,
                             system_model: str,
                             username: Optional[str] = None,
                             password: Optional[str] = None,
                             lci: bool = True,
                             lcia: bool = True,
                             biosphere_name: Optional[str] = None,
                             biosphere_write_mode: str = "patch",
                             importer_signal: Any = None,
                             namespace_lcia_methods: bool = True,
                             use_mp: bool = True,
                             separate_products: bool = False) -> None
```

Import an ecoinvent LCI and/or LCIA release.

Uses [ecoinvent_interface](https://github.com/brightway-lca/ecoinvent_interface).
Auth credentials are optional as they can be set externally (see the
`ecoinvent_interface` documentation), and such permanent storage is highly
recommended.

**DO NOT** run `bw2setup` before using this function - it isn't needed and
will cause broken results.

System model strings follow the ecoinvent unofficial API. They can be given
in a short or long form. The short forms:

* cutoff
* consequential
* apos
* EN15804

And the long forms:

* Allocation cut-off by classification
* Substitution, consequential, long-term
* Allocation at the Point of Substitution
* Allocation, cut-off, EN15804"

Parameters
----------
version
    The ecoinvent release version as a string, e.g. '3.9.1'
system_model
    The system model as a string in short or long form, e.g. 'apos' or
    'Allocation cut-off by classification'
username
    ecoinvent username
password
    ecoinvent password
lci
    Flag on whether to import the inventory database
lcia
    Flag on whether to import the LCIA impact categories. The biosphere
    database must exist if `lci` is `False`
biosphere_name
    Name of database to store biosphere flows. They will be stored in the
    main LCI database if not specified.
biosphere_write_mode
    How to handle an existing biosphere database. Must be either `replace` or `patch`
importer_signal
    Used by the Activity Browser to provide feedback during the import
namespace_lcia_methods
    Add ecoinvent version as a prefix to LCIA impact categories, e.g.
    `("ecoinvent-3.9.1", "global warming")`. Helps clarify the version intended for use, and
    allows for multiple LCIA implementation versions to be installed in parallel
use_mp
    Use a multiprocessing pool when importing ecospold2 XML files

Examples
--------

Get ecoinvent 3.9.1 cutoff in a new project (**without** running `bw2setup` first):

>>> import bw2data as bd
>>> import bw2io as bi
>>> bd.projects.set_current("some new project")
>>> bi.import_ecoinvent_release(
...     version="3.9.1",
...     system_model="cutoff",
...     username="XXX",
...     password="XXX"",
...     )
>>> bd.databases
Databases dictionary with 2 object(s):
    ecoinvent-3.9.1-biosphere
    ecoinvent-3.9.1-cutoff
>>> len(bd.methods)
762

Add ecoinvent 3.9.1 apos to the same project:

>>> bi.import_ecoinvent_release(
...     version="3.9.1",
...     system_model="apos",
...     username="XXX",
...     password="XXX"",
...     use_existing_biosphere=True
...     )
>>> bd.databases
Databases dictionary with 3 object(s):
    ecoinvent-3.9.1-apos
    ecoinvent-3.9.1-biosphere
    ecoinvent-3.9.1-cutoff

Create a new database but use `biosphere3` for the biosphere database name
and don't add LCIA methods:

>>> bd.projects.set_current("some other project")
>>> bi.import_ecoinvent_release(
...     version="3.9.1",
...     system_model="cutoff",
...     username="XXX",
...     password="XXX",
...     biosphere_name="biosphere3",
...     lcia=False
...     )
>>> bd.databases
Databases dictionary with 2 object(s):
    biosphere3
    ecoinvent-3.9.1-cutoff
>>> len(bd.methods)
0
