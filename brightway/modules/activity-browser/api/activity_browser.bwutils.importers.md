**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.importers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.importers cfg.yml > activity_browser.bwutils.importers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.importers"></a>

# activity\_browser.bwutils.importers

<a id="activity_browser.bwutils.importers.ABExcelImporter"></a>

## ABExcelImporter Objects

```python
class ABExcelImporter(ExcelImporter)
```

Customized Excel importer for the AB.

<a id="activity_browser.bwutils.importers.ABExcelImporter.database_class"></a>

#### database\_class

```python
def database_class(db_name: str,
                   requested_backend: str = "sqlite") -> bd.ProcessedDataStore
```

<a id="activity_browser.bwutils.importers.ABExcelImporter.needs_multifunctional_database"></a>

#### needs\_multifunctional\_database

```python
@property
def needs_multifunctional_database() -> bool
```

<a id="activity_browser.bwutils.importers.ABExcelImporter.write_database"></a>

#### write\_database

```python
def write_database(**kwargs)
```

Go to the parent of the ExcelImporter class, not the ExcelImporter itself.

This is important because we want to return a Database instance

<a id="activity_browser.bwutils.importers.ABExcelImporter.simple_automated_import"></a>

#### simple\_automated\_import

```python
@classmethod
def simple_automated_import(cls,
                            filepath,
                            db_name: str,
                            relink: dict = None) -> list
```

Handle a lot of the customizable things that can happen
when doing an import in a script or notebook.

<a id="activity_browser.bwutils.importers.ABExcelImporter.automated_import"></a>

#### automated\_import

```python
def automated_import(db_name: str, relink: dict = None) -> list
```

<a id="activity_browser.bwutils.importers.ABExcelImporter.apply_basic_strategies"></a>

#### apply\_basic\_strategies

```python
def apply_basic_strategies()
```

<a id="activity_browser.bwutils.importers.ABExcelImporter.apply_db_name"></a>

#### apply\_db\_name

```python
def apply_db_name(db_name: str)
```

Apply a database name change strategy.

<a id="activity_browser.bwutils.importers.ABExcelImporter.apply_linking"></a>

#### apply\_linking

```python
def apply_linking(relink: dict)
```

<a id="activity_browser.bwutils.importers.ABExcelImporter.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(strategies=None, verbose=False)
```

<a id="activity_browser.bwutils.importers.ABPackage"></a>

## ABPackage Objects

```python
class ABPackage(BW2Package)
```

Inherits from brightway2 `BW2Package` and handles importing BW2Packages.

This implementation is done to raise exceptions and show errors on imports
much faster.

<a id="activity_browser.bwutils.importers.ABPackage.APPROVED"></a>

#### APPROVED

<a id="activity_browser.bwutils.importers.ABPackage.unrestricted_export"></a>

#### unrestricted\_export

```python
@classmethod
def unrestricted_export(cls, obj, path: Path) -> Path
```

Export a BW2Package outside the project folder.

<a id="activity_browser.bwutils.importers.ABPackage.missing_dependencies"></a>

#### missing\_dependencies

```python
@classmethod
def missing_dependencies(cls, filepath) -> set[str]
```

Return dependency database names from the package that are not in the project.

<a id="activity_browser.bwutils.importers.ABPackage.evaluate_metadata"></a>

#### evaluate\_metadata

```python
@classmethod
def evaluate_metadata(cls, metadata: dict, ignore_dbs: set)
```

Take the given metadata dictionary and test it against realities
of the current brightway project.

<a id="activity_browser.bwutils.importers.ABPackage.load_file"></a>

#### load\_file

```python
@classmethod
def load_file(cls, filepath, whitelist=True, **kwargs)
```

<a id="activity_browser.bwutils.importers.ABPackage.import_file"></a>

#### import\_file

```python
@classmethod
def import_file(cls, filepath, whitelist=True, **kwargs)
```

Import bw2package file, and create the loaded objects, including registering, writing, and processing the created objects.

**Arguments**:

  * *filepath* (str): Path of file to import
  * *whitelist* (bool): Apply whitelist to allowed types. Default is ``True``.
  Kwargs:
  * *relink* (dict): A dictionary of keys with which to relink exchanges
  within the imported package file.
  

**Returns**:

  Created object or list of created objects.
