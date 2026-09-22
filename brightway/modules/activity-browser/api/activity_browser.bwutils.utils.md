**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.utils cfg.yml > activity_browser.bwutils.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.utils"></a>

# activity\_browser.bwutils.utils

<a id="activity_browser.bwutils.utils.Parameter"></a>

## Parameter Objects

```python
class Parameter(NamedTuple)
```

<a id="activity_browser.bwutils.utils.Parameter.name"></a>

#### name

<a id="activity_browser.bwutils.utils.Parameter.group"></a>

#### group

<a id="activity_browser.bwutils.utils.Parameter.amount"></a>

#### amount

<a id="activity_browser.bwutils.utils.Parameter.data"></a>

#### data

<a id="activity_browser.bwutils.utils.Parameter.param_type"></a>

#### param\_type

<a id="activity_browser.bwutils.utils.Parameter.deletable"></a>

#### deletable

```python
@property
def deletable()
```

<a id="activity_browser.bwutils.utils.Parameter.uncertainty"></a>

#### uncertainty

```python
@property
def uncertainty()
```

<a id="activity_browser.bwutils.utils.Parameter.as_gsa_tuple"></a>

#### as\_gsa\_tuple

```python
def as_gsa_tuple() -> tuple
```

Return the parameter data formatted as follows:
- Parameter name
- Scope [global/activity]
- Associated activity [or None]
- Value

<a id="activity_browser.bwutils.utils.Parameter.to_peewee_model"></a>

#### to\_peewee\_model

```python
def to_peewee_model()
```

<a id="activity_browser.bwutils.utils.Key"></a>

## Key Objects

```python
class Key(NamedTuple)
```

<a id="activity_browser.bwutils.utils.Key.database"></a>

#### database

<a id="activity_browser.bwutils.utils.Key.code"></a>

#### code

<a id="activity_browser.bwutils.utils.Key.database_type"></a>

#### database\_type

```python
@property
def database_type() -> str
```

<a id="activity_browser.bwutils.utils.Index"></a>

## Index Objects

```python
class Index(NamedTuple)
```

<a id="activity_browser.bwutils.utils.Index.input"></a>

#### input

<a id="activity_browser.bwutils.utils.Index.output"></a>

#### output

<a id="activity_browser.bwutils.utils.Index.flow_type"></a>

#### flow\_type

<a id="activity_browser.bwutils.utils.Index.input_id"></a>

#### input\_id

<a id="activity_browser.bwutils.utils.Index.output_id"></a>

#### output\_id

<a id="activity_browser.bwutils.utils.Index.build_from_exchange"></a>

#### build\_from\_exchange

```python
@classmethod
def build_from_exchange(cls, exc: ExchangeDataset) -> "Index"
```

<a id="activity_browser.bwutils.utils.Index.build_from_tuple"></a>

#### build\_from\_tuple

```python
@classmethod
def build_from_tuple(cls, data: tuple) -> "Index"
```

<a id="activity_browser.bwutils.utils.Index.build_from_dict"></a>

#### build\_from\_dict

```python
@classmethod
def build_from_dict(cls, data: dict) -> "Index"
```

<a id="activity_browser.bwutils.utils.Index.input_document_id"></a>

#### input\_document\_id

```python
@property
def input_document_id() -> int
```

<a id="activity_browser.bwutils.utils.Index.output_document_id"></a>

#### output\_document\_id

```python
@property
def output_document_id() -> int
```

<a id="activity_browser.bwutils.utils.Index.exchange_type"></a>

#### exchange\_type

```python
@property
def exchange_type() -> int
```

Legacy type code for Monte Carlo parameter rows (0/1 technosphere, 2 biosphere).

<a id="activity_browser.bwutils.utils.Index.flip"></a>

#### flip

```python
@property
def flip() -> bool
```

<a id="activity_browser.bwutils.utils.Parameters"></a>

## Parameters Objects

```python
class Parameters(UserList)
```

<a id="activity_browser.bwutils.utils.Parameters.data"></a>

#### data

<a id="activity_browser.bwutils.utils.Parameters.from_bw_parameters"></a>

#### from\_bw\_parameters

```python
@classmethod
def from_bw_parameters(cls) -> "Parameters"
```

Construct a Parameters list from brightway2 parameters.

<a id="activity_browser.bwutils.utils.Parameters.by_group"></a>

#### by\_group

```python
def by_group(group: str) -> Iterable[Parameter]
```

<a id="activity_browser.bwutils.utils.Parameters.data_by_group"></a>

#### data\_by\_group

```python
def data_by_group(group: str) -> dict
```

Parses the `data` to extract the relevant subset of parameters.

<a id="activity_browser.bwutils.utils.Parameters.static"></a>

#### static

```python
@staticmethod
def static(data: dict, needed: set) -> dict
```

Similar to the `static` method for each Parameter class where the
``needed`` variable is a set of the keys actually needed from ``data``.

<a id="activity_browser.bwutils.utils.Parameters.update"></a>

#### update

```python
def update(new_values: dict[tuple[str, str], float]) -> None
```

Replace parameters in the list if their linked value is not
NaN.

<a id="activity_browser.bwutils.utils.Parameters.to_gsa"></a>

#### to\_gsa

```python
def to_gsa() -> List[tuple]
```

Formats all of the parameters in the list for handling in a GSA.

<a id="activity_browser.bwutils.utils.Indices"></a>

## Indices Objects

```python
class Indices(UserList)
```

<a id="activity_browser.bwutils.utils.Indices.data"></a>

#### data

<a id="activity_browser.bwutils.utils.Indices.array_dtype"></a>

#### array\_dtype

<a id="activity_browser.bwutils.utils.Indices.mock_params"></a>

#### mock\_params

```python
def mock_params(values) -> np.ndarray
```

Using the given values, construct a numpy array that can be used
to match against the `tech_params` and `bio_params` arrays of the
brightway LCA classes.

<a id="activity_browser.bwutils.utils.StaticParameters"></a>

## StaticParameters Objects

```python
class StaticParameters(object)
```

Contains the initial values for all the parameters in the project.

This object should be initialized once, after which the methods can be
used to read out parameter information as it was stored in the database
originally. This avoids a lot of database calls in repeated recalculations.

<a id="activity_browser.bwutils.utils.StaticParameters.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="activity_browser.bwutils.utils.StaticParameters.project"></a>

#### project

```python
def project() -> dict
```

Mirrors `ProjectParameter.load()`.

<a id="activity_browser.bwutils.utils.StaticParameters.databases"></a>

#### databases

```python
@property
def databases() -> set
```

<a id="activity_browser.bwutils.utils.StaticParameters.by_database"></a>

#### by\_database

```python
def by_database(database: str) -> dict
```

Mirrors `DatabaseParameter.load(database)`.

<a id="activity_browser.bwutils.utils.StaticParameters.groups"></a>

#### groups

```python
@property
def groups() -> set
```

<a id="activity_browser.bwutils.utils.StaticParameters.act_by_group"></a>

#### act\_by\_group

```python
def act_by_group(group: str) -> dict
```

Mirrors `ActivityParameter.load(group)`

<a id="activity_browser.bwutils.utils.StaticParameters.act_by_group_db"></a>

#### act\_by\_group\_db

```python
@property
def act_by_group_db() -> list
```

<a id="activity_browser.bwutils.utils.StaticParameters.exc_by_group"></a>

#### exc\_by\_group

```python
def exc_by_group(group: str) -> dict
```

Mirrors `ParameterizedExchange.load(group)`

<a id="activity_browser.bwutils.utils.StaticParameters.prune_result_data"></a>

#### prune\_result\_data

```python
@staticmethod
def prune_result_data(data: dict) -> dict
```
