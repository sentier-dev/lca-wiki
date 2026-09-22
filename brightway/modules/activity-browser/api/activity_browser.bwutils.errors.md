**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.errors cfg.yml > activity_browser.bwutils.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.errors"></a>

# activity\_browser.bwutils.errors

A series of defined Errors and Warnings for the Activity Browser

Both Warnings and Exceptions are customized to enable custom handling (in bulk) of non-critical
errors.

<a id="activity_browser.bwutils.errors.ABError"></a>

## ABError Objects

```python
class ABError(Exception)
```

To be used as a generic Activity-Browser Error that will not lead to the AB crashing out

<a id="activity_browser.bwutils.errors.ABWarning"></a>

## ABWarning Objects

```python
class ABWarning(Warning)
```

To be used as a generic Activity-Browser Warning

<a id="activity_browser.bwutils.errors.ImportCanceledError"></a>

## ImportCanceledError Objects

```python
class ImportCanceledError(ABError)
```

Import of data was cancelled by the user.

<a id="activity_browser.bwutils.errors.LinkingFailed"></a>

## LinkingFailed Objects

```python
class LinkingFailed(ABError)
```

Unlinked exchanges remain after relinking.

<a id="activity_browser.bwutils.errors.IncompatibleDatabaseNamingError"></a>

## IncompatibleDatabaseNamingError Objects

```python
class IncompatibleDatabaseNamingError(ABError)
```

Database and keys do not match.

<a id="activity_browser.bwutils.errors.ActivityProductionValueError"></a>

## ActivityProductionValueError Objects

```python
class ActivityProductionValueError(ABError)
```

Production value for an activity == 0

<a id="activity_browser.bwutils.errors.InvalidSDFEntryValue"></a>

## InvalidSDFEntryValue Objects

```python
class InvalidSDFEntryValue(ABError)
```

NA values found for data type that cannot hold "NA".

<a id="activity_browser.bwutils.errors.ExchangeErrorValues"></a>

## ExchangeErrorValues Objects

```python
class ExchangeErrorValues(ABError)
```

In Brightway2 if there is an error in an exchange calculation the 'amount' field is not available for the
Exchange

<a id="activity_browser.bwutils.errors.ScenarioExchangeError"></a>

## ScenarioExchangeError Objects

```python
class ScenarioExchangeError(ABError)
```

In the AB we require the exchanges from the scenario file to be mappable to the databases. If this is not the
case we MUST throw an error.

<a id="activity_browser.bwutils.errors.ReferenceFlowValueError"></a>

## ReferenceFlowValueError Objects

```python
class ReferenceFlowValueError(ABWarning)
```

While a user can technically perform a calculation with the reference flows all set to 0, such a calculation
makes no logical sense and will lead to downstream errors (due to 0 results).

<a id="activity_browser.bwutils.errors.DuplicatedScenarioExchangeWarning"></a>

## DuplicatedScenarioExchangeWarning Objects

```python
class DuplicatedScenarioExchangeWarning(ABWarning)
```

Will warn the user that a loaded scenario table contains duplicate exchanges. Only the last added exchange value
will be used.

<a id="activity_browser.bwutils.errors.CriticalCalculationError"></a>

## CriticalCalculationError Objects

```python
class CriticalCalculationError(ABError)
```

Should be raised if some action during the running of the calculation causes a critical Exception that will fail
the calculation. This is intended to be used with a Popup warning system that catches the original exception.

<a id="activity_browser.bwutils.errors.CriticalScenarioExtensionError"></a>

## CriticalScenarioExtensionError Objects

```python
class CriticalScenarioExtensionError(ABError)
```

Should be raised when combinging multiple scenario files by extension leads to zero scenario columns. Due to no
scenario columns being found in common between the scenario files.

<a id="activity_browser.bwutils.errors.ScenarioDatabaseNotFoundError"></a>

## ScenarioDatabaseNotFoundError Objects

```python
class ScenarioDatabaseNotFoundError(ABError)
```

Should be raised when looking up one of the processes in an SDF file and the values used don't match those
present in the local AB/BW databases.

<a id="activity_browser.bwutils.errors.ScenarioExchangeNotFoundError"></a>

## ScenarioExchangeNotFoundError Objects

```python
class ScenarioExchangeNotFoundError(ABError)
```

Should be raised when looking up a process key from the metadata in a scenario difference file, if THAT process
key cannot be located in the local databases.

<a id="activity_browser.bwutils.errors.ScenarioExchangeDataNotFoundError"></a>

## ScenarioExchangeDataNotFoundError Objects

```python
class ScenarioExchangeDataNotFoundError(ABError)
```

Should be raised if no actual quantities for the exchanges can be found in the scenario difference file

<a id="activity_browser.bwutils.errors.ScenarioExchangeDataNonNumericError"></a>

## ScenarioExchangeDataNonNumericError Objects

```python
class ScenarioExchangeDataNonNumericError(ABError)
```

Should be raised if non-numeric data is provided for the exchanges in a scenario difference file.

<a id="activity_browser.bwutils.errors.UnalignableScenarioColumnsWarning"></a>

## UnalignableScenarioColumnsWarning Objects

```python
class UnalignableScenarioColumnsWarning(ABWarning)
```

Should be raised if there is a mismatch between the scenario columns from multiple scenario difference files

<a id="activity_browser.bwutils.errors.WrongFileTypeImportError"></a>

## WrongFileTypeImportError Objects

```python
class WrongFileTypeImportError(ABError)
```

Should be raised when a user tries to import the wrong type of file for the import in question.
For example a database file with the scenario import dialog, or vice versa.
