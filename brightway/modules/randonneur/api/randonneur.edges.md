**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.edges` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m randonneur.edges cfg.yml > randonneur.edges.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.edges"></a>

# randonneur.edges

<a id="randonneur.edges.verb_dispatch"></a>

#### verb\_dispatch

<a id="randonneur.edges.migrate_edges"></a>

#### migrate\_edges

```python
def migrate_edges(graph: List[dict],
                  migrations: dict,
                  config: Optional[MigrationConfig] = None) -> List[dict]
```

For each edge in each node in ``graph``, check each transformation in ``migrations``. For
each transformation for which there is a match, make the given changes to the edge.

Here is an example:

```python
migrate_edges(
    graph=[{"edges": [{"name": "foo"}]}],
    migrations={"update": [{"source": {"name": "foo"}, "target": {"location": "bar"}}]},
)
>>> [{"edges": [{"name": "foo", "location": "bar"}]}]
```

The changes can be customized with a `MigrationConfig` object. See the `MigrationConfig` docs
for information on its input arguments.

*Changes graph in place*, and returns `graph` with altered content.

<a id="randonneur.edges.migrate_edges_with_stored_data"></a>

#### migrate\_edges\_with\_stored\_data

```python
def migrate_edges_with_stored_data(
        graph: List[dict],
        label: str,
        data_registry_path: Optional[Path] = None,
        config: Optional[MigrationConfig] = None) -> List[dict]
```

A simple wrapper to load from a `randonneur_data.Registry` with some basic sanity checks.
