**Generated API reference** · package `bw2data` 4.7 · module `bw2data.revisions` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.revisions cfg.yml > bw2data.revisions.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.revisions"></a>

# bw2data.revisions

<a id="bw2data.revisions.T"></a>

#### T

<a id="bw2data.revisions.U"></a>

#### U

<a id="bw2data.revisions.ID"></a>

#### ID

<a id="bw2data.revisions.Revision"></a>

#### Revision

<a id="bw2data.revisions.RevisionGraph"></a>

## RevisionGraph Objects

```python
class RevisionGraph()
```

Graph of revisions, edges are based on `metadata.parent_revision`.

<a id="bw2data.revisions.RevisionGraph.Iterator"></a>

## Iterator Objects

```python
class Iterator()
```

Helper class implementing iteration from child to parent.

<a id="bw2data.revisions.RevisionGraph.Iterator.__init__"></a>

#### \_\_init\_\_

```python
def __init__(g: "RevisionGraph", head: Optional[ID] = None)
```

<a id="bw2data.revisions.RevisionGraph.Iterator.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__() -> "typing.Iterator"
```

<a id="bw2data.revisions.RevisionGraph.Iterator.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> Optional[dict]
```

<a id="bw2data.revisions.RevisionGraph.__init__"></a>

#### \_\_init\_\_

```python
def __init__(head: ID, revisions: Sequence[Revision])
```

<a id="bw2data.revisions.RevisionGraph.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

Iterates the graph from head to root.

<a id="bw2data.revisions.RevisionGraph.range"></a>

#### range

```python
def range(r0: Optional[ID] = None,
          r1: Optional[ID] = None) -> Iterable[Revision]
```

Creates an iterator for a revision range (reversed).

- `range()`: same as `range(self.head)`
- `range(r)`: all revisions starting from `r`
- `range(None, r)`: same as `range(r)`
- `range(r0, r1)`: `r0..r1`

<a id="bw2data.revisions.RevisionGraph.is_ancestor"></a>

#### is\_ancestor

```python
def is_ancestor(parent: Optional[ID], child: ID) -> bool
```

Checks whether a revision can be reached by another.

<a id="bw2data.revisions.RevisionGraph.merge_base"></a>

#### merge\_base

```python
def merge_base(revision0: Optional[ID],
               revision1: Optional[ID]) -> Optional[ID]
```

Finds the nearest common ancestor between two revisions.

<a id="bw2data.revisions.RevisionGraph.set_head"></a>

#### set\_head

```python
def set_head(revision: ID)
```

<a id="bw2data.revisions.RevisionGraph.rebase"></a>

#### rebase

```python
def rebase(onto: ID, upstream: ID, revision: ID) -> Revision
```

Transplants the sequence `upstream..revision` on top of `onto`.

<a id="bw2data.revisions.Delta"></a>

## Delta Objects

```python
class Delta()
```

The difference between two versions of an object.

Can be serialized, transferred, and applied to the same previous version to
change it to the new state.

<a id="bw2data.revisions.Delta.__init__"></a>

#### \_\_init\_\_

```python
def __init__(delta: Optional[Union[deepdiff.Delta, dict]],
             obj_type: Optional[str] = None,
             obj_id: Optional[Union[int, str]] = None,
             change_type: Optional[str] = None)
```

Private, exists only for type-checking.

Use one of the class-method constructors to create objects.

<a id="bw2data.revisions.Delta.apply"></a>

#### apply

```python
def apply(obj)
```

<a id="bw2data.revisions.Delta.from_dict"></a>

#### from\_dict

```python
@classmethod
def from_dict(cls, d: dict) -> Self
```

<a id="bw2data.revisions.Delta.from_difference"></a>

#### from\_difference

```python
@classmethod
def from_difference(cls, obj_type: str, obj_id: Optional[Union[int, str]],
                    change_type: str, diff: deepdiff.DeepDiff) -> Self
```

<a id="bw2data.revisions.Delta.activity_code_change"></a>

#### activity\_code\_change

```python
@classmethod
def activity_code_change(cls, old: dict, new: dict) -> Self
```

Special handling to change the `database` attribute of an activity node.

<a id="bw2data.revisions.Delta.activity_database_change"></a>

#### activity\_database\_change

```python
@classmethod
def activity_database_change(cls, old: dict, new: dict) -> Self
```

Special handling to change the `database` attribute of an activity node.

<a id="bw2data.revisions.Delta.database_metadata_change"></a>

#### database\_metadata\_change

```python
@classmethod
def database_metadata_change(cls, old: dict, new: dict) -> Union[Self, None]
```

Special handling to change the `database` attribute of an activity node.

<a id="bw2data.revisions.Delta.generate"></a>

#### generate

```python
@classmethod
def generate(cls,
             old: Optional[SignaledDataset],
             new: Optional[SignaledDataset],
             operation: Optional[str] = None) -> Optional[Self]
```

Generates a patch object from one version of an object to another.

Both `old` and `new` should be instances of `bw2data.backends.schema.SignaledDataset`.

`old` can be `None` if an object is being created.

`new` can be `None` is an object is being deleted.

Raises `IncompatibleClasses` is `old` and `new` have different classes.

<a id="bw2data.revisions.JSONEncoder"></a>

## JSONEncoder Objects

```python
class JSONEncoder(json.JSONEncoder)
```

<a id="bw2data.revisions.JSONEncoder.default"></a>

#### default

```python
def default(obj)
```

<a id="bw2data.revisions.generate_metadata"></a>

#### generate\_metadata

```python
def generate_metadata(metadata: Optional[dict[str, Any]] = None,
                      parent_revision: Optional[int] = None,
                      revision: Optional[int] = None) -> dict[str, Any]
```

<a id="bw2data.revisions.generate_revision"></a>

#### generate\_revision

```python
def generate_revision(metadata: dict, delta: Sequence[Delta]) -> dict
```

<a id="bw2data.revisions.generate_delta"></a>

#### generate\_delta

<a id="bw2data.revisions.RevisionedORMProxy"></a>

## RevisionedORMProxy Objects

```python
class RevisionedORMProxy()
```

Class that encapsulates logic around applying revisions. Used for `Activity` and `Exchange`.

We need a separate class because we apply the changes to `ActivityDataset`, but need to save
`Node` (and similar for edges).

<a id="bw2data.revisions.RevisionedORMProxy.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedORMProxy.PROXY_CLASS"></a>

#### PROXY\_CLASS

<a id="bw2data.revisions.RevisionedORMProxy.orm_as_dict"></a>

#### orm\_as\_dict

<a id="bw2data.revisions.RevisionedORMProxy.handle"></a>

#### handle

```python
@classmethod
def handle(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedORMProxy.previous_state_as_dict"></a>

#### previous\_state\_as\_dict

```python
@classmethod
def previous_state_as_dict(cls, revision_data: dict) -> dict
```

<a id="bw2data.revisions.RevisionedORMProxy.current_state_as_dict"></a>

#### current\_state\_as\_dict

```python
@classmethod
def current_state_as_dict(cls, obj: SignaledDataset) -> dict
```

<a id="bw2data.revisions.RevisionedORMProxy.update"></a>

#### update

```python
@classmethod
def update(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedORMProxy.delete"></a>

#### delete

```python
@classmethod
def delete(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedORMProxy.prepare_data_dict_for_orm_class"></a>

#### prepare\_data\_dict\_for\_orm\_class

```python
@classmethod
def prepare_data_dict_for_orm_class(cls, data: dict) -> dict
```

<a id="bw2data.revisions.RevisionedORMProxy.create"></a>

#### create

```python
@classmethod
def create(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedParameter"></a>

## RevisionedParameter Objects

```python
class RevisionedParameter(RevisionedORMProxy)
```

<a id="bw2data.revisions.RevisionedParameter.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedParameter.current_state_as_dict"></a>

#### current\_state\_as\_dict

```python
@classmethod
def current_state_as_dict(cls, obj: ParameterBase) -> dict
```

<a id="bw2data.revisions.RevisionedParameter.previous_state_as_dict"></a>

#### previous\_state\_as\_dict

```python
@classmethod
def previous_state_as_dict(cls, revision_data: dict) -> dict
```

<a id="bw2data.revisions.RevisionedParameter.update"></a>

#### update

```python
@classmethod
def update(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedParameter.delete"></a>

#### delete

```python
@classmethod
def delete(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedParameter.create"></a>

#### create

```python
@classmethod
def create(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedGroup"></a>

## RevisionedGroup Objects

```python
class RevisionedGroup(RevisionedParameter)
```

<a id="bw2data.revisions.RevisionedGroup.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedGroup.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedParameterizedExchange"></a>

## RevisionedParameterizedExchange Objects

```python
class RevisionedParameterizedExchange(RevisionedParameter)
```

<a id="bw2data.revisions.RevisionedParameterizedExchange.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedParameterizedExchange.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedProjectParameter"></a>

## RevisionedProjectParameter Objects

```python
class RevisionedProjectParameter(RevisionedParameter)
```

<a id="bw2data.revisions.RevisionedProjectParameter.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedProjectParameter.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedProjectParameter.project_parameter_recalculate"></a>

#### project\_parameter\_recalculate

```python
@classmethod
def project_parameter_recalculate(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedProjectParameter.project_parameter_update_formula_parameter_name"></a>

#### project\_parameter\_update\_formula\_parameter\_name

```python
@classmethod
def project_parameter_update_formula_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedDatabaseParameter"></a>

## RevisionedDatabaseParameter Objects

```python
class RevisionedDatabaseParameter(RevisionedParameter)
```

<a id="bw2data.revisions.RevisionedDatabaseParameter.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedDatabaseParameter.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedDatabaseParameter.database_parameter_recalculate"></a>

#### database\_parameter\_recalculate

```python
@classmethod
def database_parameter_recalculate(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedDatabaseParameter.database_parameter_update_formula_project_parameter_name"></a>

#### database\_parameter\_update\_formula\_project\_parameter\_name

```python
@classmethod
def database_parameter_update_formula_project_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedDatabaseParameter.database_parameter_update_formula_database_parameter_name"></a>

#### database\_parameter\_update\_formula\_database\_parameter\_name

```python
@classmethod
def database_parameter_update_formula_database_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedActivityParameter"></a>

## RevisionedActivityParameter Objects

```python
class RevisionedActivityParameter(RevisionedParameter)
```

<a id="bw2data.revisions.RevisionedActivityParameter.KEYS"></a>

#### KEYS

<a id="bw2data.revisions.RevisionedActivityParameter.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedActivityParameter.activity_parameter_recalculate"></a>

#### activity\_parameter\_recalculate

```python
@classmethod
def activity_parameter_recalculate(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedActivityParameter.activity_parameter_recalculate_exchanges"></a>

#### activity\_parameter\_recalculate\_exchanges

```python
@classmethod
def activity_parameter_recalculate_exchanges(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedActivityParameter.activity_parameter_update_formula_project_parameter_name"></a>

#### activity\_parameter\_update\_formula\_project\_parameter\_name

```python
@classmethod
def activity_parameter_update_formula_project_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedActivityParameter.activity_parameter_update_formula_database_parameter_name"></a>

#### activity\_parameter\_update\_formula\_database\_parameter\_name

```python
@classmethod
def activity_parameter_update_formula_database_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedActivityParameter.activity_parameter_update_formula_activity_parameter_name"></a>

#### activity\_parameter\_update\_formula\_activity\_parameter\_name

```python
@classmethod
def activity_parameter_update_formula_activity_parameter_name(
        cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.RevisionedNode"></a>

## RevisionedNode Objects

```python
class RevisionedNode(RevisionedORMProxy)
```

<a id="bw2data.revisions.RevisionedNode.PROXY_CLASS"></a>

#### PROXY\_CLASS

<a id="bw2data.revisions.RevisionedNode.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedNode.orm_as_dict"></a>

#### orm\_as\_dict

```python
@classmethod
def orm_as_dict(cls, orm_object: ORM_CLASS) -> dict
```

<a id="bw2data.revisions.RevisionedNode.prepare_data_dict_for_orm_class"></a>

#### prepare\_data\_dict\_for\_orm\_class

```python
@classmethod
def prepare_data_dict_for_orm_class(cls, data: dict) -> dict
```

<a id="bw2data.revisions.RevisionedNode.activity_database_change"></a>

#### activity\_database\_change

```python
@classmethod
def activity_database_change(cls, revision_data: dict) -> None
```

Special handling for changing activity `database` attributes

<a id="bw2data.revisions.RevisionedNode.activity_code_change"></a>

#### activity\_code\_change

```python
@classmethod
def activity_code_change(cls, revision_data: dict) -> None
```

Special handling for changing activity `code` attributes

<a id="bw2data.revisions.RevisionedEdge"></a>

## RevisionedEdge Objects

```python
class RevisionedEdge(RevisionedORMProxy)
```

<a id="bw2data.revisions.RevisionedEdge.PROXY_CLASS"></a>

#### PROXY\_CLASS

<a id="bw2data.revisions.RevisionedEdge.ORM_CLASS"></a>

#### ORM\_CLASS

<a id="bw2data.revisions.RevisionedEdge.orm_as_dict"></a>

#### orm\_as\_dict

```python
@classmethod
def orm_as_dict(cls, orm_object: ORM_CLASS) -> dict
```

<a id="bw2data.revisions.RevisionedDatabase"></a>

## RevisionedDatabase Objects

```python
class RevisionedDatabase()
```

<a id="bw2data.revisions.RevisionedDatabase.handle"></a>

#### handle

```python
@classmethod
def handle(cls, revision_data: dict) -> None
```

<a id="bw2data.revisions.SIGNALLEDOBJECT_TO_LABEL"></a>

#### SIGNALLEDOBJECT\_TO\_LABEL

<a id="bw2data.revisions.REVISIONED_LABEL_AS_OBJECT"></a>

#### REVISIONED\_LABEL\_AS\_OBJECT

<a id="bw2data.revisions.REVISIONS_OBJECT_AS_LABEL"></a>

#### REVISIONS\_OBJECT\_AS\_LABEL
