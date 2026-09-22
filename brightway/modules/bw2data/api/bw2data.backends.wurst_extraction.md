**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.wurst_extraction` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.wurst_extraction cfg.yml > bw2data.backends.wurst_extraction.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.wurst_extraction"></a>

# bw2data.backends.wurst\_extraction

<a id="bw2data.backends.wurst_extraction.extract_activity"></a>

#### extract\_activity

```python
def extract_activity(proxy, add_identifiers=False)
```

Get data in Wurst internal format for an ``ActivityDataset``

<a id="bw2data.backends.wurst_extraction.extract_exchange"></a>

#### extract\_exchange

```python
def extract_exchange(proxy, add_properties=False)
```

Get data in Wurst internal format for an ``ExchangeDataset``

<a id="bw2data.backends.wurst_extraction.add_exchanges_to_consumers"></a>

#### add\_exchanges\_to\_consumers

```python
def add_exchanges_to_consumers(activities,
                               exchange_qs,
                               add_properties=False,
                               add_identifiers=False)
```

Retrieve exchanges from database, and add to activities.

Assumes that activities are single output, and that the exchange code is the same as the activity code. This assumption is valid for ecoinvent 3.3 cutoff imported into Brightway2.

<a id="bw2data.backends.wurst_extraction.add_input_info_for_indigenous_exchanges"></a>

#### add\_input\_info\_for\_indigenous\_exchanges

```python
def add_input_info_for_indigenous_exchanges(activities,
                                            names,
                                            add_identifiers=False)
```

Add details on exchange inputs if these activities are already available

<a id="bw2data.backends.wurst_extraction.add_input_info_for_external_exchanges"></a>

#### add\_input\_info\_for\_external\_exchanges

```python
def add_input_info_for_external_exchanges(activities,
                                          names,
                                          add_identifiers=False)
```

Add details on exchange inputs from other databases

<a id="bw2data.backends.wurst_extraction.extract_brightway_databases"></a>

#### extract\_brightway\_databases

```python
def extract_brightway_databases(database_names,
                                add_properties=False,
                                add_identifiers=False)
```

Extract a Brightway2 SQLiteBackend database to the Wurst internal format.

``database_names`` is a list of database names. You should already be in the correct project.

Returns a list of dataset documents.
