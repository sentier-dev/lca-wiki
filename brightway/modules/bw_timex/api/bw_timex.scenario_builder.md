**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.scenario_builder` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_timex.scenario_builder cfg.yml > bw_timex.scenario_builder.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.scenario_builder"></a>

# bw\_timex.scenario\_builder

Find the background vintages a scenario names, or build them with premise.

`TimexLCA(scenario=...)` selects background databases by their metadata. When
the project does not hold them yet, `ensure_scenario_databases` builds the
missing ones with premise instead of leaving the user at a dead end.

premise and bw2io are imported inside `_run_premise` and `_import_ecoinvent`
only, so `bw_timex` keeps working without them installed and a run that finds
everything it needs never touches either.

<a id="bw_timex.scenario_builder.find_existing_vintages"></a>

#### find\_existing\_vintages

```python
def find_existing_vintages(
        filters: dict,
        sectors: list[str] | None = None) -> dict[int, tuple[str, datetime]]
```

Map each year the project already covers to the database covering it.

A year is covered by a registered database whose `representative_time`
falls in it and that the scenario filter keeps. "Keeps" is the resolver's
own rule (`database_matches_scenario`): a database is dropped only if it
declares a filtered key with a different value. Any stricter rule would
build a second database for a year `TimexLCA` already resolves.

`sectors` is not part of that filter - it never reaches
`TimexLCA(scenario=...)` - but a vintage built for other sectors is not the
vintage this build asked for, so it is compared separately
(`database_matches_sectors`).

Returns the database's own `representative_time`, not a date derived from
the year: a hand-built vintage need not sit on 1 January.

<a id="bw_timex.scenario_builder.vintage_name"></a>

#### vintage\_name

```python
def vintage_name(filters: dict, year: int) -> str
```

The database name a built vintage gets.

<a id="bw_timex.scenario_builder.ensure_scenario_databases"></a>

#### ensure\_scenario\_databases

```python
def ensure_scenario_databases(
    scenario: dict,
    premise_key: str | None = None,
    ecoinvent_credentials: tuple[str, str] | None = None
) -> dict[str, datetime]
```

Make sure every year of `scenario` has a background database, building what is missing.

Parameters
----------
scenario : dict
    The same mapping `TimexLCA` takes, plus the build keys `years`
    (required), `sectors` and `source_database`.
premise_key : str, optional
    premise decryption key. Falls back to `$PREMISE_KEY`.
ecoinvent_credentials : tuple, optional
    `(username, password)`, used only if ecoinvent has to be imported.
    Falls back to `$ECOINVENT_USERNAME` / `$ECOINVENT_PASSWORD`.

Returns
-------
dict
    Database name to the point in time it represents, for the vintages
    found or built.
