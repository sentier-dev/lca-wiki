**Generated API reference** · package `bw2data` 4.7 · module `bw2data.project` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.project cfg.yml > bw2data.project.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.project"></a>

# bw2data.project

<a id="bw2data.project.READ_ONLY_PROJECT"></a>

#### READ\_ONLY\_PROJECT

<a id="bw2data.project.lockable"></a>

#### lockable

```python
def lockable()
```

<a id="bw2data.project.ProjectDataset"></a>

## ProjectDataset Objects

```python
class ProjectDataset(Model)
```

<a id="bw2data.project.ProjectDataset.is_sourced"></a>

#### is\_sourced

<a id="bw2data.project.ProjectDataset.revision"></a>

#### revision

<a id="bw2data.project.ProjectDataset.data"></a>

#### data

<a id="bw2data.project.ProjectDataset.name"></a>

#### name

<a id="bw2data.project.ProjectDataset.full_hash"></a>

#### full\_hash

<a id="bw2data.project.ProjectDataset.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.project.ProjectDataset.__repr__"></a>

#### \_\_repr\_\_

<a id="bw2data.project.ProjectDataset.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw2data.project.ProjectDataset.dir"></a>

#### dir

```python
@property
def dir()
```

<a id="bw2data.project.ProjectDataset.set_sourced"></a>

#### set\_sourced

```python
def set_sourced() -> None
```

Set the project to be event sourced.

<a id="bw2data.project.ProjectDataset.add_revision"></a>

#### add\_revision

```python
def add_revision(delta: Sequence["revisions.Delta"],
                 metadata: Optional[dict[str, Any]] = None) -> Optional[int]
```

Add a revision to the project changing the state of one or more objects.

{
  "metadata": {
    "revision": <this-revision-id>
    "parent_revision": <parent-revision-id>
    "title": "<optional>"
    "description": "<optional>"
    "authors": "<optional>" (maybe shouldn't be optional)
  },
  "data": [
            {
              "type": "database object type" (e.g. "activity", "exchange", "parameter"),
              "id": "database object id" (e.g. "foo", "bar", "baz"),
              "delta": <difference between revisions>
            }, ...
         ]
}

<a id="bw2data.project.ProjectDataset.apply_revision"></a>

#### apply\_revision

```python
def apply_revision(revision: dict) -> None
```

Load a patch generated from a previous `add_revision` into the project.

<a id="bw2data.project.ProjectDataset.load_revisions"></a>

#### load\_revisions

```python
def load_revisions(head: Optional[int] = None) -> None
```

Load all revisions unapplied for this project.

<a id="bw2data.project.add_full_hash_column"></a>

#### add\_full\_hash\_column

```python
def add_full_hash_column(base_data_dir: Path, db: SqliteDatabase) -> None
```

<a id="bw2data.project.add_sourced_columns"></a>

#### add\_sourced\_columns

```python
def add_sourced_columns(base_data_dir: Path, db: SqliteDatabase) -> None
```

<a id="bw2data.project.ProjectManager"></a>

## ProjectManager Objects

```python
class ProjectManager(Iterable)
```

<a id="bw2data.project.ProjectManager.read_only"></a>

#### read\_only

<a id="bw2data.project.ProjectManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2data.project.ProjectManager.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2data.project.ProjectManager.__contains__"></a>

#### \_\_contains\_\_

```python
def __contains__(name)
```

<a id="bw2data.project.ProjectManager.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.project.ProjectManager.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="bw2data.project.ProjectManager.change_base_directories"></a>

#### change\_base\_directories

```python
def change_base_directories(base_dir: Path,
                            base_logs_dir: Optional[Path] = None,
                            project_name: Optional[str] = "default",
                            update: Optional[bool] = True) -> None
```

<a id="bw2data.project.ProjectManager.current"></a>

#### current

```python
@property
def current()
```

<a id="bw2data.project.ProjectManager.twofive"></a>

#### twofive

```python
@property
def twofive()
```

<a id="bw2data.project.ProjectManager.set_current"></a>

#### set\_current

```python
def set_current(name, writable=True, update=True)
```

<a id="bw2data.project.ProjectManager.dir"></a>

#### dir

```python
@property
def dir()
```

<a id="bw2data.project.ProjectManager.logs_dir"></a>

#### logs\_dir

```python
@property
def logs_dir()
```

<a id="bw2data.project.ProjectManager.output_dir"></a>

#### output\_dir

```python
@property
def output_dir()
```

Get directory for output files.

Uses environment variable ``BRIGHTWAY2_OUTPUT_DIR``; ``preferences['output_dir']``; or directory ``output`` in current project.

Returns output directory path.

<a id="bw2data.project.ProjectManager.create_project"></a>

#### create\_project

```python
def create_project(name=None, **kwargs)
```

<a id="bw2data.project.ProjectManager.copy_project"></a>

#### copy\_project

```python
def copy_project(new_name, switch=True)
```

Copy current project to a new project named ``new_name``. If ``switch``, switch to new project.

<a id="bw2data.project.ProjectManager.request_directory"></a>

#### request\_directory

```python
def request_directory(name)
```

Return the absolute path to the subdirectory `dirname`, creating it if necessary.

Returns `False` if directory can't be created.

<a id="bw2data.project.ProjectManager.migrate_project_25"></a>

#### migrate\_project\_25

```python
def migrate_project_25()
```

Migrate project to Brightway 2.5.

Reprocesses all databases and LCIA objects.

<a id="bw2data.project.ProjectManager.delete_project"></a>

#### delete\_project

```python
def delete_project(name=None, delete_dir=False)
```

Delete project ``name``, or the current project.

``name`` is the project to delete. If ``name`` is not provided, delete the current project.

By default, the underlying project directory is not deleted; only the project name is removed from the list of active projects. If ``delete_dir`` is ``True``, then also delete the project directory.

If deleting the current project, this function sets the current directory to ``default`` if it exists, or to a random project.

Returns the current project.

<a id="bw2data.project.ProjectManager.purge_deleted_directories"></a>

#### purge\_deleted\_directories

```python
def purge_deleted_directories()
```

Delete project directories for projects which are no longer registered.

Returns number of directories deleted.

<a id="bw2data.project.ProjectManager.report"></a>

#### report

```python
def report()
```

Give a report on current projects, including installed databases and file sizes.

Returns tuples of ``(project name, number of databases, size of all databases (GB))``.

<a id="bw2data.project.ProjectManager.rename_project"></a>

#### rename\_project

```python
def rename_project(new_name: str) -> None
```

Rename current project, and switch to the new project.

<a id="bw2data.project.ProjectManager.use_short_hash"></a>

#### use\_short\_hash

```python
def use_short_hash()
```

<a id="bw2data.project.ProjectManager.use_full_hash"></a>

#### use\_full\_hash

```python
def use_full_hash()
```

<a id="bw2data.project.signal_dispatcher"></a>

#### signal\_dispatcher

```python
def signal_dispatcher(sender,
                      old: Optional[Any] = None,
                      new: Optional[Any] = None,
                      operation: Optional[str] = None) -> Union[int, None]
```

Not sure why this is necessary, but fails silently if call `add_revision` directly

<a id="bw2data.project.signal_dispatcher_generic_no_diff"></a>

#### signal\_dispatcher\_generic\_no\_diff

```python
def signal_dispatcher_generic_no_diff(sender, name: str, verb: str,
                                      prefix: str, obj_type: str) -> int
```

<a id="bw2data.project.signal_dispatcher_on_database"></a>

#### signal\_dispatcher\_on\_database

<a id="bw2data.project.signal_dispatcher_on_project_parameter"></a>

#### signal\_dispatcher\_on\_project\_parameter

<a id="bw2data.project.signal_dispatcher_on_database_parameter"></a>

#### signal\_dispatcher\_on\_database\_parameter

<a id="bw2data.project.signal_dispatcher_on_activity_parameter"></a>

#### signal\_dispatcher\_on\_activity\_parameter

<a id="bw2data.project.signal_dispatcher_on_database_write"></a>

#### signal\_dispatcher\_on\_database\_write

```python
def signal_dispatcher_on_database_write(sender, name: str) -> int
```

<a id="bw2data.project.signal_dispatcher_on_update_formula_parameter_name"></a>

#### signal\_dispatcher\_on\_update\_formula\_parameter\_name

```python
def signal_dispatcher_on_update_formula_parameter_name(sender,
                                                       old: str,
                                                       new: str,
                                                       kind: str,
                                                       extra: str = "") -> int
```

<a id="bw2data.project.signal_dispatcher_on_project_parameter_update_formula_parameter_name"></a>

#### signal\_dispatcher\_on\_project\_parameter\_update\_formula\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_database_parameter_update_formula_project_parameter_name"></a>

#### signal\_dispatcher\_on\_database\_parameter\_update\_formula\_project\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_database_parameter_update_formula_database_parameter_name"></a>

#### signal\_dispatcher\_on\_database\_parameter\_update\_formula\_database\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_activity_parameter_update_formula_project_parameter_name"></a>

#### signal\_dispatcher\_on\_activity\_parameter\_update\_formula\_project\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_activity_parameter_update_formula_database_parameter_name"></a>

#### signal\_dispatcher\_on\_activity\_parameter\_update\_formula\_database\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_activity_parameter_update_formula_activity_parameter_name"></a>

#### signal\_dispatcher\_on\_activity\_parameter\_update\_formula\_activity\_parameter\_name

<a id="bw2data.project.signal_dispatcher_on_activity_database_change"></a>

#### signal\_dispatcher\_on\_activity\_database\_change

<a id="bw2data.project.signal_dispatcher_on_activity_code_change"></a>

#### signal\_dispatcher\_on\_activity\_code\_change

<a id="bw2data.project.signal_dispatcher_on_database_metadata_change"></a>

#### signal\_dispatcher\_on\_database\_metadata\_change

<a id="bw2data.project.signal_dispatcher_on_database_reset"></a>

#### signal\_dispatcher\_on\_database\_reset

<a id="bw2data.project.signal_dispatcher_on_database_delete"></a>

#### signal\_dispatcher\_on\_database\_delete

<a id="bw2data.project.signal_dispatcher_on_project_parameter_recalculate"></a>

#### signal\_dispatcher\_on\_project\_parameter\_recalculate

<a id="bw2data.project.signal_dispatcher_on_database_parameter_recalculate"></a>

#### signal\_dispatcher\_on\_database\_parameter\_recalculate

<a id="bw2data.project.signal_dispatcher_on_activity_parameter_recalculate"></a>

#### signal\_dispatcher\_on\_activity\_parameter\_recalculate

<a id="bw2data.project.signal_dispatcher_on_activity_parameter_recalculate_exchanges"></a>

#### signal\_dispatcher\_on\_activity\_parameter\_recalculate\_exchanges

<a id="bw2data.project.projects"></a>

#### projects

<a id="bw2data.project.writable_project"></a>

#### writable\_project

```python
@wrapt.decorator
def writable_project(wrapped, instance, args, kwargs)
```
