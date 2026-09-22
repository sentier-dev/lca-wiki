**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.locations` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.strategies.locations cfg.yml > bw2io.strategies.locations.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.locations"></a>

# bw2io.strategies.locations

<a id="bw2io.strategies.locations.GEO_UPDATE"></a>

#### GEO\_UPDATE

<a id="bw2io.strategies.locations.update_ecoinvent_locations"></a>

#### update\_ecoinvent\_locations

```python
def update_ecoinvent_locations(db)
```

Update location names in ecoinvent database to fix inconsistencies and standardize naming.

Maps the old location names to the updated ones based on a predefined dictionary (GEO_UPDATE).

Parameters
----------
db : list
    A list of dictionaries representing ecoinvent processes with exchanges.

Returns
-------
list
    A list of dictionaries representing the ecoinvent processes with updated location names.

Examples
--------
>>> db = [
...     {
...         "name": "Process 1",
...         "location": "IAI Area 2, North America",
...         "exchanges": [{"name": "Flow 1", "location": "IAI Area 2, North America"}],
...     }
... ]
>>> update_ecoinvent_locations(db)
[
    {
        "name": "Process 1",
        "location": "IAI Area, North America",
        "exchanges": [{"name": "Flow 1", "location": "IAI Area, North America"}],
    }
]

Notes
-----
Includes a hardcoded mapping (GEO_UPDATE) to fix known inconsistencies in location names. This may not
cover all possible inconsistencies and might need to be updated in the future.
