**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.elementary_flows` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.elementary_flows cfg.yml > activity_browser.bwutils.elementary_flows.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.elementary_flows"></a>

# activity\_browser.bwutils.elementary\_flows

Elementary-flow (biosphere) helpers.

Brightway ``Activity.delete()`` removes technosphere upstream exchanges and
calculation-setup references, but not biosphere exchanges on other activities
nor characterization factors on LCIA methods. Activity Browser handles those
explicitly when deleting elementary flows.

<a id="activity_browser.bwutils.elementary_flows.create_elementary_flow"></a>

#### create\_elementary\_flow

```python
def create_elementary_flow(
    db_name: str,
    *,
    name: str,
    unit: str,
    flow_type: str,
    categories: tuple[str, ...] = ()) -> bd.Node
```

Create and save an elementary flow (emission or resource) in *db_name*.

On ``functional_sqlite`` backends, ``Database.new_node()`` returns a process
wrapper whose ``save()`` overwrites biosphere ``type`` values. A plain
``bd.Node`` is used so the elementary-flow type is preserved.

<a id="activity_browser.bwutils.elementary_flows.update_elementary_flow"></a>

#### update\_elementary\_flow

```python
def update_elementary_flow(
    flow,
    *,
    name: str,
    unit: str,
    flow_type: str,
    categories: tuple[str, ...] = ()) -> bd.Node
```

Update metadata for an existing elementary flow, preserving biosphere type.

On ``functional_sqlite`` backends, ``Process.save()`` overwrites biosphere
``type`` values. Updates go through ``MFActivity`` instead.

<a id="activity_browser.bwutils.elementary_flows.count_biosphere_exchanges_for_flow"></a>

#### count\_biosphere\_exchanges\_for\_flow

```python
def count_biosphere_exchanges_for_flow(flow) -> int
```

Count technosphere biosphere exchanges that reference *flow* as input.

<a id="activity_browser.bwutils.elementary_flows.delete_biosphere_exchanges_for_flow"></a>

#### delete\_biosphere\_exchanges\_for\_flow

```python
def delete_biosphere_exchanges_for_flow(flow) -> int
```

Delete technosphere biosphere exchanges on other activities that use *flow*.
