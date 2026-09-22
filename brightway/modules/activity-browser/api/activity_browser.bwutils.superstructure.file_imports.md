**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.file_imports` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.file_imports cfg.yml > activity_browser.bwutils.superstructure.file_imports.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.file_imports"></a>

# activity\_browser.bwutils.superstructure.file\_imports

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter"></a>

## ABFileImporter Objects

```python
class ABFileImporter(ABC)
```

Activity Browser abstract base class for scenario file imports

Contains a set of static methods for checking the file contents
to conform to the desired standard. These include:
- correct spelling of key and database names (checking they match)
- correct spelling of databases (if few instances are found)
- that all production exchanges do not have a value of 0
- that NAs are properly interpreted

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.ABStandardProcessColumns"></a>

#### ABStandardProcessColumns

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.ABScenarioColumnsErrorIfNA"></a>

#### ABScenarioColumnsErrorIfNA

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.ABStandardBiosphereColumns"></a>

#### ABStandardBiosphereColumns

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.read_file"></a>

#### read\_file

```python
@abstractmethod
def read_file(path: Optional[Union[str, Path]], **kwargs)
```

Abstract method must be implemented in child classes.

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.database_and_key_check"></a>

#### database\_and\_key\_check

```python
@staticmethod
def database_and_key_check(data: pd.DataFrame) -> None
```

Will check the values in the 'xxxx database' and the 'xxxx key' fields.
If the database names are incongruent an IncompatibleDatabaseNamingError is raised.
The source and destination keys are provided for the first exchange where
this error occurs.

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.production_process_check"></a>

#### production\_process\_check

```python
@staticmethod
def production_process_check(data: pd.DataFrame, scenario_names: list) -> None
```

Runs a check on a dataframe over the scenario names (provided by the second argument)
If for a production exchange a value of 0 is observed for one of the scenarios an
ActivityProductionValueError is thrown with the source and destination activity names of the
exchanges being provided

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.na_value_check"></a>

#### na\_value\_check

```python
@staticmethod
def na_value_check(data: pd.DataFrame, fields: list) -> None
```

Runs checks on the dataframe to ensure that those fields specified by the field argument do not
contain NaNs.
If an NaN is discovered an InvalidSDFEntryValue Error is thrown that contains two lists:
The first contains the list of the source activity names, the second the destination activity names
of the exchange

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.check_for_calculation_errors"></a>

#### check\_for\_calculation\_errors

```python
@staticmethod
def check_for_calculation_errors(data: pd.DataFrame) -> None
```

Will check for calculation errors in the scenario exchanges columns indicate the first elements in the
scenario difference file that contain an ERROR value (only deals with divide by zero and NaN manipulations).

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.fill_nas"></a>

#### fill\_nas

```python
@staticmethod
def fill_nas(data: pd.DataFrame) -> pd.DataFrame
```

Will replace NaNs in the dataframe with a string holding "NA" for the following subsection of columns:
'from activity name', 'from reference product', 'to reference product', 'to location',
'from location', 'to activity name', 'from database', 'to database', 'from unit', 'to unit',
'from categories' and 'to categories'

Note: How NaNs are treated depends on the 'flow type'

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.all_checks"></a>

#### all\_checks

```python
@staticmethod
def all_checks(data: pd.DataFrame,
               fields: set = None,
               scenario_names: list = None) -> None
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABFileImporter.scenario_names"></a>

#### scenario\_names

```python
@staticmethod
def scenario_names(data: pd.DataFrame) -> list
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABFeatherImporter"></a>

## ABFeatherImporter Objects

```python
class ABFeatherImporter(ABFileImporter)
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABFeatherImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABFeatherImporter.read_file"></a>

#### read\_file

```python
@staticmethod
def read_file(path: Optional[Union[str, Path]], **kwargs)
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABCSVImporter"></a>

## ABCSVImporter Objects

```python
class ABCSVImporter(ABFileImporter)
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABCSVImporter.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.superstructure.file_imports.ABCSVImporter.read_file"></a>

#### read\_file

```python
@staticmethod
def read_file(path: Optional[Union[str, Path]], **kwargs)
```
