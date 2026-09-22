**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.database_metadata` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.database_metadata cfg.yml > bw_timex.database_metadata.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.database_metadata"></a>

# bw\_timex.database\_metadata

Read and write what a Brightway database represents.

`bw_timex` needs to know which point in time each background database stands
for. That information is stored in the database's own Brightway metadata
(`bw2data.databases[name]`), where premise also writes it when it exports a
prospective database:

```python
{
    "premise_version": "2.4.9.2",
    "iam_model": "remind",
    "pathway": "SSP2-PkBudg500",
    "representative_time": "2050-01-01T00:00:00",
    "ecoinvent_version": "3.10.1",
    "system_model": "cutoff",
}
```

premise writes this metadata from version 2.4.9.2 onwards. Databases exported by
an earlier premise carry none of it, and need `set_database_metadata`.

Brightway stores this mapping as JSON, so dates are kept as ISO 8601 strings.

<a id="bw_timex.database_metadata.REPRESENTATIVE_TIME"></a>

#### REPRESENTATIVE\_TIME

<a id="bw_timex.database_metadata.SCENARIOS"></a>

#### SCENARIOS

<a id="bw_timex.database_metadata.SECTORS"></a>

#### SECTORS

<a id="bw_timex.database_metadata.DYNAMIC"></a>

#### DYNAMIC

<a id="bw_timex.database_metadata.SCENARIO_SIGNATURE_KEYS"></a>

#### SCENARIO\_SIGNATURE\_KEYS

Metadata keys that identify the scenario a database represents. Two
databases differing in any of these represent different scenarios.
`premise_version` is deliberately absent: re-running premise on the same
pathway must not look like a second scenario.

<a id="bw_timex.database_metadata.SCENARIO_FILTER_KEYS"></a>

#### SCENARIO\_FILTER\_KEYS

Metadata keys premise writes that identify which scenario a database belongs
to, and that `TimexLCA(scenario=...)` filters on.

<a id="bw_timex.database_metadata.SCENARIO_BUILD_KEYS"></a>

#### SCENARIO\_BUILD\_KEYS

Keys of a `scenario` mapping that describe how to *build* a missing vintage
rather than what to match. They never reach the metadata filter: `years` is a
list, and no database's metadata could ever equal it.

<a id="bw_timex.database_metadata.BRIGHTWAY_METADATA_KEYS"></a>

#### BRIGHTWAY\_METADATA\_KEYS

Keys Brightway maintains itself, filtered out when reporting to the user
which metadata a project's databases carry.

<a id="bw_timex.database_metadata.set_database_metadata"></a>

#### set\_database\_metadata

```python
def set_database_metadata(database: str | bd.Database, **metadata) -> dict
```

Store what a database represents in its Brightway metadata.

Use this for databases that don't bring the metadata themselves, e.g.
databases you built yourself or that were exported by premise < 2.4.9.2,
which is the first version writing this metadata. `TimexLCA` reads
`representative_time` from all databases of the project to map them to
points in time, so this replaces passing `database_dates`.

Parameters
----------
database : str or bw2data.Database
    Name of the database, or the database itself. Must be registered.
**metadata :
    Metadata to store. `representative_time` accepts a `datetime`, an ISO
    8601 string, or `"dynamic"` and is always stored as a string, because
    Brightway serializes database metadata to JSON. Any other key is stored
    as given and must be JSON-serializable. Keys that premise (>= 2.4.9.2)
    writes, and that `TimexLCA(scenario=...)` can select on, are
    `iam_model`, `pathway`, `system_model`, `ecoinvent_version` and
    `premise_version`.

Returns
-------
dict
    The database's metadata after the update.

Examples
--------
```python
set_database_metadata("db_2030", representative_time=datetime(2030, 1, 1))
set_database_metadata(
    "my_2050_variant",
    representative_time="2050-01-01",
    iam_model="remind",
    pathway="SSP2-PkBudg500",
)
```

<a id="bw_timex.database_metadata.split_scenario"></a>

#### split\_scenario

```python
def split_scenario(scenario: dict | None) -> tuple[dict, dict]
```

Separate a `scenario` mapping into its filter keys and its build keys.

<a id="bw_timex.database_metadata.database_matches_scenario"></a>

#### database\_matches\_scenario

```python
def database_matches_scenario(metadata: dict, scenario: dict | None) -> bool
```

Whether a database's metadata survives a `scenario` filter.

A database is kept unless it *declares* a filtered key with a different
value: a hand-built vintage or a foreground carrying no scenario metadata
belongs to every scenario, not to none.

<a id="bw_timex.database_metadata.database_matches_sectors"></a>

#### database\_matches\_sectors

```python
def database_matches_sectors(metadata: dict, sectors: list | None) -> bool
```

Whether a database covers exactly the sectors a build asked for.

premise does not record which sectors it updated, so `sectors` metadata is
written by `ensure_scenario_databases`. A database without it covers all
sectors, which is what a request without `sectors` asks for. This is an
equality, not a superset test: a database updated for other sectors than
the ones asked for is a different database, and an all-sector one is not
what a narrowed request asked to build.

<a id="bw_timex.database_metadata.resolve_database_dates_from_metadata"></a>

#### resolve\_database\_dates\_from\_metadata

```python
def resolve_database_dates_from_metadata(
        scenario: dict | None = None) -> dict[str, datetime | str]
```

Map the databases of the current project to the points in time they represent.

Reads the `representative_time` metadata of every registered database (see
[`set_database_metadata`][bw_timex.database_metadata.set_database_metadata]).

If the project holds databases from more than one scenario (differing in
any of `SCENARIO_SIGNATURE_KEYS`, e.g. two premise pathways), this raises
a `ValueError` unless `scenario` narrows the selection down to one.

Parameters
----------
scenario : dict, optional
    Metadata a database must match to be included, e.g.
    `{"iam_model": "remind", "pathway": "SSP2-PkBudg500"}`. Databases that
    don't declare a filtered key at all are kept, so a filter narrows down
    an ambiguous project without excluding databases that carry no
    scenario metadata (e.g. a dynamic foreground). Raises `ValueError` if
    a filter key is not declared by any database in the project.

Returns
-------
dict
    Mapping of database name to `datetime` or `"dynamic"`, ready to be used
    as `TimexLCA.database_dates`.
