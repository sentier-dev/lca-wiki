**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.strategies` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.strategies cfg.yml > activity_browser.bwutils.strategies.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.strategies"></a>

# activity\_browser.bwutils.strategies

Activity Browser import strategies used on top of bw2io.

These run during Excel and scripted imports to fix AB-specific linking issues
(functional product/processor relationships, metadata-store fallbacks, etc.).

<a id="activity_browser.bwutils.strategies.TECHNOSPHERE_TYPES"></a>

#### TECHNOSPHERE\_TYPES

<a id="activity_browser.bwutils.strategies.BIOSPHERE_TYPES"></a>

#### BIOSPHERE\_TYPES

<a id="activity_browser.bwutils.strategies.RELINK_FIELDS"></a>

#### RELINK\_FIELDS

<a id="activity_browser.bwutils.strategies.PROCESS_NODE_TYPES"></a>

#### PROCESS\_NODE\_TYPES

<a id="activity_browser.bwutils.strategies.PRODUCT_NODE_TYPES"></a>

#### PRODUCT\_NODE\_TYPES

<a id="activity_browser.bwutils.strategies.MDS_EXCHANGE_FIELDS"></a>

#### MDS\_EXCHANGE\_FIELDS

<a id="activity_browser.bwutils.strategies.link_technosphere_same_database"></a>

#### link\_technosphere\_same\_database

```python
def link_technosphere_same_database(data: list) -> list
```

Link technosphere exchanges internally, respecting exchange ``database``.

``bw2io``'s ``link_technosphere_by_activity_hash`` matches on name/location/unit
fields only. That wrongly self-links exchanges that already name another
database (e.g. a local market activity that also imports the same-named market
from an external DB). Leave those unlinked for later external linking.

<a id="activity_browser.bwutils.strategies.link_functional_processors"></a>

#### link\_functional\_processors

```python
def link_functional_processors(data: list) -> list
```

Ensure product ``processor`` fields reference process nodes in the same import.

Excel re-import can leave stale processor codes when ``set_code_by_activity_hash``
assigns new activity codes while ``processor`` still references spreadsheet codes.

<a id="activity_browser.bwutils.strategies.metadatastore_link"></a>

#### metadatastore\_link

```python
def metadatastore_link(data: list) -> list
```

Link remaining unlinked exchanges using the project MetaDataStore.

<a id="activity_browser.bwutils.strategies.relink_exchanges_with_db"></a>

#### relink\_exchanges\_with\_db

```python
def relink_exchanges_with_db(data: list, old: str, new: str) -> list
```

<a id="activity_browser.bwutils.strategies.link_exchanges_without_db"></a>

#### link\_exchanges\_without\_db

```python
def link_exchanges_without_db(data: list, db: str) -> list
```

<a id="activity_browser.bwutils.strategies.relink_exchanges_bw2package"></a>

#### relink\_exchanges\_bw2package

```python
def relink_exchanges_bw2package(data: dict, relink: dict) -> dict
```

Relink exchange inputs during a BW2Package import (keyed activity dict).

<a id="activity_browser.bwutils.strategies.rename_db_bw2package"></a>

#### rename\_db\_bw2package

```python
def rename_db_bw2package(data: dict, old: str, new: str) -> dict
```

Replace the given `old` database name with the `new`.

<a id="activity_browser.bwutils.strategies.relink_exchanges"></a>

#### relink\_exchanges

```python
def relink_exchanges(exchanges: list, candidates: dict,
                     duplicates: dict) -> tuple
```

<a id="activity_browser.bwutils.strategies.relink_exchanges_existing_db"></a>

#### relink\_exchanges\_existing\_db

```python
def relink_exchanges_existing_db(db: bd.Database, old: str,
                                 other: bd.Database) -> tuple
```

Relink exchanges after the database has been created/written.

This means possibly doing a lot of sqlite update calls.

<a id="activity_browser.bwutils.strategies.relink_activity_exchanges"></a>

#### relink\_activity\_exchanges

```python
def relink_activity_exchanges(act, old: str, other: bd.Database) -> tuple
```

<a id="activity_browser.bwutils.strategies.alter_database_name"></a>

#### alter\_database\_name

```python
def alter_database_name(data: list, old: str, new: str) -> list
```

For ABExcelImporter, go through data and replace all instances
of the `old` database name with `new`.

<a id="activity_browser.bwutils.strategies.alter_exchange_database_name"></a>

#### alter\_exchange\_database\_name

```python
def alter_exchange_database_name(data: list, linking_dict: dict[str,
                                                                str]) -> list
```

For ABExcelImporter, go through data and replace all instances
of the `old` database name with `new` in exchanges only.

<a id="activity_browser.bwutils.strategies.hash_parameter_group"></a>

#### hash\_parameter\_group

```python
def hash_parameter_group(data: list) -> list
```

For ABExcelImporter, go through `data` and change all the activity parameter
`group` fields to use a md5 hash instead of the given group name.

<a id="activity_browser.bwutils.strategies.csv_rewrite_product_key"></a>

#### csv\_rewrite\_product\_key

```python
def csv_rewrite_product_key(data)
```

Convert exchange 'product' key to a 'reference product' one.

<a id="activity_browser.bwutils.strategies.excel_error_detection"></a>

#### excel\_error\_detection

```python
def excel_error_detection(data: Collection)
```

<a id="activity_browser.bwutils.strategies.parse_JSON_fields"></a>

#### parse\_JSON\_fields

```python
def parse_JSON_fields(data: list) -> list
```

Parse JSON fields in the data.
