**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.parameters.formula_exchanges` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.parameters.formula_exchanges cfg.yml > activity_browser.bwutils.parameters.formula_exchanges.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.parameters.formula_exchanges"></a>

# activity\_browser.bwutils.parameters.formula\_exchanges

Rebuild Brightway's parameterized-flow index after a database write.

<a id="activity_browser.bwutils.parameters.formula_exchanges.INDEX_FLOW_CAP"></a>

#### INDEX\_FLOW\_CAP

<a id="activity_browser.bwutils.parameters.formula_exchanges.flow_formula"></a>

#### flow\_formula

```python
def flow_formula(exc: ExchangeDataset) -> str
```

Return the stripped formula on a flow document, or ``""``.

Parameters
----------
exc : ExchangeDataset
    Brightway flow document.

<a id="activity_browser.bwutils.parameters.formula_exchanges.index_parameterized_flows_for_process"></a>

#### index\_parameterized\_flows\_for\_process

```python
def index_parameterized_flows_for_process(key: tuple) -> None
```

Index formula-bearing flows on one process and recalculate that group.

Parameters
----------
key : tuple
    Process ``(database, code)``. Non-process nodes are ignored.

<a id="activity_browser.bwutils.parameters.formula_exchanges.rebuild_parameterized_flow_index"></a>

#### rebuild\_parameterized\_flow\_index

```python
def rebuild_parameterized_flow_index(database: str) -> None
```

Rebuild Brightway's parameterized-flow index for one database.

Skips databases with more than ``INDEX_FLOW_CAP`` outgoing flows and no
database or activity parameters. Does not delete project, database, or
activity parameters.

Parameters
----------
database : str
    Name of the database that was written.

<a id="activity_browser.bwutils.parameters.formula_exchanges.indexed_parameterized_flows"></a>

#### indexed\_parameterized\_flows

```python
def indexed_parameterized_flows()
```

Yield parameterized-flow index rows as dicts.

Each dict has ``formula``, ``amount``, ``comment``, ``uncertainty``,
``input_key``, ``output_key``, and ``exchange`` (a live proxy, or ``None``).
