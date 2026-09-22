**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.edge_functions` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
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
  -I "$SP" -m randonneur.edge_functions cfg.yml > randonneur.edge_functions.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.edge_functions"></a>

# randonneur.edge\_functions

<a id="randonneur.edge_functions.WarningSemaphore"></a>

## WarningSemaphore Objects

```python
class WarningSemaphore()
```

<a id="randonneur.edge_functions.WarningSemaphore.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="randonneur.edge_functions.warning_semaphore"></a>

#### warning\_semaphore

<a id="randonneur.edge_functions.migrate_edges_create"></a>

#### migrate\_edges\_create

```python
def migrate_edges_create(node: dict, migration_fld: List[dict],
                         config: MigrationConfig) -> dict
```

<a id="randonneur.edge_functions.migrate_edges_delete"></a>

#### migrate\_edges\_delete

```python
def migrate_edges_delete(node: dict, migration_fld: FlexibleLookupDict,
                         config: MigrationConfig) -> dict
```

<a id="randonneur.edge_functions.migrate_edges_disaggregate"></a>

#### migrate\_edges\_disaggregate

```python
def migrate_edges_disaggregate(node: dict, migration_fld: FlexibleLookupDict,
                               config: MigrationConfig) -> dict
```

<a id="randonneur.edge_functions.migrate_edges_replace"></a>

#### migrate\_edges\_replace

```python
def migrate_edges_replace(node: dict, migration_fld: FlexibleLookupDict,
                          config: MigrationConfig) -> dict
```

<a id="randonneur.edge_functions.migrate_edges_update"></a>

#### migrate\_edges\_update

```python
def migrate_edges_update(node: dict, migration_fld: FlexibleLookupDict,
                         config: MigrationConfig) -> dict
```

Difference is in intent of data developer, not in implementation.
