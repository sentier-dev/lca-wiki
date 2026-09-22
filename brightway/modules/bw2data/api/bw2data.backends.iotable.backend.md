**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.iotable.backend` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.iotable.backend cfg.yml > bw2data.backends.iotable.backend.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.iotable.backend"></a>

# bw2data.backends.iotable.backend

<a id="bw2data.backends.iotable.backend.IOTableBackend"></a>

## IOTableBackend Objects

```python
class IOTableBackend(SQLiteBackend)
```

IO tables have too much data to store each value in a database; instead, we only store the processed data in NumPy arrays.

Activities will not seem to have any exchanges.

<a id="bw2data.backends.iotable.backend.IOTableBackend.backend"></a>

#### backend

<a id="bw2data.backends.iotable.backend.IOTableBackend.node_class"></a>

#### node\_class

<a id="bw2data.backends.iotable.backend.IOTableBackend.write"></a>

#### write

```python
def write(data, process=False, searchable=True, check_typos=True, signal=None)
```

<a id="bw2data.backends.iotable.backend.IOTableBackend.write_exchanges"></a>

#### write\_exchanges

```python
def write_exchanges(technosphere, biosphere, dependents)
```

Write IO data directly to processed arrays.

Product data is stored in SQLite as normal activities.
Exchange data is written directly to NumPy structured arrays.

Technosphere and biosphere data has format ``(row id, col id, value, flip)``.

<a id="bw2data.backends.iotable.backend.IOTableBackend.process"></a>

#### process

```python
def process()
```

No-op; no intermediate data to process

<a id="bw2data.backends.iotable.backend.IOTableBackend.edges_to_dataframe"></a>

#### edges\_to\_dataframe

```python
def edges_to_dataframe() -> pd.DataFrame
```

Return a pandas DataFrame with all database exchanges. DataFrame columns are:

    target_id: int,
    target_database: str,
    target_code: str,
    target_name: Optional[str],
    target_reference_product: Optional[str],
    target_location: Optional[str],
    target_unit: Optional[str],
    target_type: Optional[str]
    source_id: int,
    source_database: str,
    source_code: str,
    source_name: Optional[str],
    source_product: Optional[str],  # Note different label
    source_location: Optional[str],
    source_unit: Optional[str],
    source_categories: Optional[str]  # Tuple concatenated with "::" as in `bw2io`
    edge_amount: float,
    edge_type: str,

Target is the node consuming the edge, source is the node or flow being consumed. The terms target and source were chosen because they also work well for biosphere edges.

As IO Tables are normally quite large, the DataFrame building will operate directly on Numpy arrays, and therefore special formatters are not supported in this function.

Returns a pandas ``DataFrame``.
