**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.characterization_factors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.characterization_factors cfg.yml > activity_browser.bwutils.characterization_factors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.characterization_factors"></a>

# activity\_browser.bwutils.characterization\_factors

LCIA characterization-factor helpers (Brightway ``Method`` / ``methods``).

Brightway stores characterization factors (CFs) as rows ``(elementary_flow, amount)``
on impact assessment methods. Activity Browser uses these helpers when adding or
removing CFs and when cleaning up references to deleted elementary flows.

<a id="activity_browser.bwutils.characterization_factors.elementary_flow_activity_id"></a>

#### elementary\_flow\_activity\_id

```python
def elementary_flow_activity_id(key: tuple | int) -> int
```

Return the Brightway activity id for an elementary-flow key or id.

<a id="activity_browser.bwutils.characterization_factors.cf_row_references_flow_ids"></a>

#### cf\_row\_references\_flow\_ids

```python
def cf_row_references_flow_ids(row, flow_ids: set[int]) -> bool
```

Return whether a CF row references any of *flow_ids*.

Integer keys are compared directly so we do not hit the database for every
row when scanning LCIA methods.

<a id="activity_browser.bwutils.characterization_factors.valid_characterization_factor_rows"></a>

#### valid\_characterization\_factor\_rows

```python
def valid_characterization_factor_rows(
        rows: list) -> tuple[list, set[int], int]
```

Normalize CF rows to integer activity ids and drop orphaned references.

Returns ``(rows, site_generic_flow_ids, dropped_count)``. Site-generic CFs
are rows with fewer than three elements (no regionalization location).

<a id="activity_browser.bwutils.characterization_factors.remove_orphaned_characterization_factors"></a>

#### remove\_orphaned\_characterization\_factors

```python
def remove_orphaned_characterization_factors(method: bd.Method) -> int
```

Drop CFs whose elementary flow no longer exists. Returns rows removed.

<a id="activity_browser.bwutils.characterization_factors.impact_methods_with_flows"></a>

#### impact\_methods\_with\_flows

```python
def impact_methods_with_flows(flow_ids: set[int]) -> list[tuple]
```

Return LCIA method names that contain a CF for any of *flow_ids*.

<a id="activity_browser.bwutils.characterization_factors.remove_characterization_factors_for_flows"></a>

#### remove\_characterization\_factors\_for\_flows

```python
def remove_characterization_factors_for_flows(flow_ids: set[int]) -> int
```

Remove CFs for the given elementary flows from all LCIA methods.

Returns the number of methods updated.

<a id="activity_browser.bwutils.characterization_factors.activity_ids_in_database"></a>

#### activity\_ids\_in\_database

```python
def activity_ids_in_database(database_name: str) -> set[int]
```

Brightway activity ids for all nodes in *database_name*.

<a id="activity_browser.bwutils.characterization_factors.remove_characterization_factors_for_database"></a>

#### remove\_characterization\_factors\_for\_database

```python
def remove_characterization_factors_for_database(db_name: str) -> int
```

Remove CFs for all elementary flows in *db_name* from every LCIA method.
