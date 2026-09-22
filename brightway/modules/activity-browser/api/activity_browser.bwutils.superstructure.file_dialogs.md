**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.file_dialogs` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.file_dialogs cfg.yml > activity_browser.bwutils.superstructure.file_dialogs.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.file_dialogs"></a>

# activity\_browser.bwutils.superstructure.file\_dialogs

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel"></a>

## ProblemDataModel Objects

```python
class ProblemDataModel(QtCore.QAbstractTableModel)
```

A simple table model for use in the ABPopup dialogs for error reporting.

Intentionally coupled with the ABPopup class and not intended for use externally.

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.updated"></a>

#### updated

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.rowCount"></a>

#### rowCount

```python
def rowCount(*args, **kwargs)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.columnCount"></a>

#### columnCount

```python
def columnCount(*args, **kwargs)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.data"></a>

#### data

```python
def data(index, role=QtCore.Qt.DisplayRole)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.sync"></a>

#### sync

```python
def sync(*args, **kwargs) -> None
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataModel.headerData"></a>

#### headerData

```python
def headerData(section, orientation, role=QtCore.Qt.DisplayRole)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataFrame"></a>

## ProblemDataFrame Objects

```python
class ProblemDataFrame(QtWidgets.QTableView)
```

A simple view class coupled with the ABPopup class.

Not intended for external use.

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataFrame.__init__"></a>

#### \_\_init\_\_

```python
def __init__(parent: QtWidgets.QWidget, dataframe: pd.DataFrame,
             cols: pd.Index)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataFrame.update"></a>

#### update

```python
def update(dataframe: pd.DataFrame, cols: pd.Index)
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ProblemDataFrame.update_proxy"></a>

#### update\_proxy

```python
def update_proxy()
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup"></a>

## ABPopup Objects

```python
class ABPopup(QtWidgets.QDialog)
```

Holds AB defined message boxes to enable a more consistent popup message structure for errors.

Primarily concerned with the creation of errors for the purposes of scenario file imports.

Contains a tightly coupled dataframe that is intended to hold a limited sample set for user guidance.
Dataframe management is through the dataframe() method that takes the dataframe with the data of interest
and the columns to be extract for the creation of the internal table

Contains the option of saving the warning output to a file with the option of printing the data that
generated the throwing of the popup, or the full file with the error causing entries highlighted

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.dataframe"></a>

#### dataframe

```python
def dataframe(data: pd.DataFrame, columns: list = None)
```

Handles the creation of the internal dataframe using just those columns provided

Arguments
---------
data: a dataframe with the exchanges/rows that generate the error
columns: a list of columns to provide the dataframe with for the popup message

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.save_options"></a>

#### save\_options

```python
def save_options()
```

Creates a checkbox for determining the format for saved files

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.dataframe_to_file"></a>

#### dataframe\_to\_file

```python
def dataframe_to_file(dataframe: pd.DataFrame, flags: pd.Index = None) -> None
```

Sets the class variables for determining those elements of the dataframe that contain error causing data

Arguments
---------
dataframe: the pandas dataframe with the full data from importing into the AB
flags: the pandas row index indicating those rows with the data causing the error

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.save_dataframe"></a>

#### save\_dataframe

```python
def save_dataframe()
```

Saves the dataframe according to pre-specified conditions with the dataframe_to_file and save_options class
methods

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.affirmative"></a>

#### affirmative

```python
@QtCore.Slot(name="affirmative")
def affirmative()
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.rejection"></a>

#### rejection

```python
@QtCore.Slot(name="rejection")
def rejection()
```

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.abQuestion"></a>

#### abQuestion

```python
@staticmethod
def abQuestion(title, message, button1, button2)
```

Creates an ABPopup object that contains a title message and multiple options

Arguments
---------
title: The Popup's title, should be relevant for the request to the user
message: A detailed explanation providing why a response from the user is required, what is done
according to the type of response and what the user should expect
button1: a QPushButton instance MUST BE PROVIDED
button2: a QPushButton instance MUST BE PROVIDED

Returns
-------
An ABPopup instance that provides the basic format and dialog for the popup window.
Further manipulation of the object and execution (via .exec_()) is performed upon instantiation

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.abWarning"></a>

#### abWarning

```python
@staticmethod
def abWarning(title, message, button1, button2=None, default=1)
```

Creates an ABPopup object that contains a title message and a user response for a raised warning

Arguments
---------
title: The Popup's title, should be relevant for the request to the user
message: A detailed explanation providing why a response from the user is required, what is done
according to the type of response and what the user should expect
button1: a QPushButton instance MUST BE PROVIDED
button2: a QPushButton instance OPTIONAL
default: the default button to be used (default set to button1)

Returns
-------
An ABPopup instance that provides the basic format and dialog for the popup window to provide a warning.
Further manipulation of the object and execution (via .exec_()) is performed upon instantiation

<a id="activity_browser.bwutils.superstructure.file_dialogs.ABPopup.abCritical"></a>

#### abCritical

```python
@staticmethod
def abCritical(title, message, button1, button2=None, default=1)
```

Creates an ABPopup object that contains a title message and a user response for a critical error

Arguments
---------
title: The Popup's title, should be relevant for the request to the user
message: A detailed explanation providing why a response from the user is required, what is done
according to the type of response and what the user should expect
button1: a QPushButton instance MUST BE PROVIDED
button2: a QPushButton instance OPTIONAL
default: the default button to be used (default set to button1)

Returns
-------
An ABPopup instance that provides the basic format and dialog for the popup window to provide a warning.
Further manipulation of the object and execution (via .exec_()) is performed upon instantiation
