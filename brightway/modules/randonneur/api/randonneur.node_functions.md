**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.node_functions` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m randonneur.node_functions cfg.yml > randonneur.node_functions.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.node_functions"></a>

# randonneur.node\_functions

<a id="randonneur.node_functions.migrate_nodes_disaggregate"></a>

#### migrate\_nodes\_disaggregate

```python
def migrate_nodes_disaggregate(*args, **kwargs)
```

<a id="randonneur.node_functions.migrate_nodes_replace"></a>

#### migrate\_nodes\_replace

```python
def migrate_nodes_replace(*args, **kwargs)
```

<a id="randonneur.node_functions.migrate_nodes_update"></a>

#### migrate\_nodes\_update

```python
def migrate_nodes_update(graph: List[dict], migration_fld: FlexibleLookupDict,
                         config: MigrationConfig) -> List[dict]
```

<a id="randonneur.node_functions.migrate_nodes_delete"></a>

#### migrate\_nodes\_delete

```python
def migrate_nodes_delete(graph: List[dict], migration_fld: FlexibleLookupDict,
                         config: MigrationConfig) -> List[dict]
```

<a id="randonneur.node_functions.migrate_nodes_create"></a>

#### migrate\_nodes\_create

```python
def migrate_nodes_create(graph: List[dict], migration_fld: List[dict],
                         config: MigrationConfig) -> List[dict]
```
