**Generated API reference** · package `activity-browser` 3.0.0b202608291724 · module `activity_browser.bwutils.superstructure.activities` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m activity_browser.bwutils.superstructure.activities cfg.yml > activity_browser.bwutils.superstructure.activities.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="activity_browser.bwutils.superstructure.activities"></a>

# activity\_browser.bwutils.superstructure.activities

<a id="activity_browser.bwutils.superstructure.activities.FROM_ACT"></a>

#### FROM\_ACT

<a id="activity_browser.bwutils.superstructure.activities.TO_ACT"></a>

#### TO\_ACT

<a id="activity_browser.bwutils.superstructure.activities.FROM_BIOS"></a>

#### FROM\_BIOS

<a id="activity_browser.bwutils.superstructure.activities.TO_BIOS"></a>

#### TO\_BIOS

<a id="activity_browser.bwutils.superstructure.activities.FROM_ALL"></a>

#### FROM\_ALL

<a id="activity_browser.bwutils.superstructure.activities.TO_ALL"></a>

#### TO\_ALL

<a id="activity_browser.bwutils.superstructure.activities.process_ad_namedtuple"></a>

#### process\_ad\_namedtuple

```python
def process_ad_namedtuple(row) -> tuple
```

Take a given ActivityDataset namedtuple and return two hashable tuples.

Allows for matching on name/product/location

<a id="activity_browser.bwutils.superstructure.activities.process_ad_flow"></a>

#### process\_ad\_flow

```python
def process_ad_flow(row) -> tuple
```

<a id="activity_browser.bwutils.superstructure.activities.construct_ad_data"></a>

#### construct\_ad\_data

```python
def construct_ad_data(row) -> tuple
```

Take a namedtuple from the method below and convert it into two tuples.

Used to fill out missing information in the superstructure.

<a id="activity_browser.bwutils.superstructure.activities.data_from_index"></a>

#### data\_from\_index

```python
def data_from_index(index: tuple) -> dict
```

Take the given 'Index' tuple and build a complete SUPERSTRUCTURE row
from it.

<a id="activity_browser.bwutils.superstructure.activities.get_relevant_activities"></a>

#### get\_relevant\_activities

```python
def get_relevant_activities(df: pd.DataFrame, part: str = "from") -> dict
```

Build a dictionary of (name, product, location) -> (database, key) pairs.

<a id="activity_browser.bwutils.superstructure.activities.get_relevant_flows"></a>

#### get\_relevant\_flows

```python
def get_relevant_flows(df: pd.DataFrame, part: str = "from") -> dict
```

Determines if all activities from the given 'from' or 'to' chunk

<a id="activity_browser.bwutils.superstructure.activities.match_fields_for_key"></a>

#### match\_fields\_for\_key

```python
def match_fields_for_key(df: pd.DataFrame, matchbook: dict) -> pd.Series
```

<a id="activity_browser.bwutils.superstructure.activities.fill_df_keys_with_fields"></a>

#### fill\_df\_keys\_with\_fields

```python
def fill_df_keys_with_fields(df: pd.DataFrame) -> pd.DataFrame
```

<a id="activity_browser.bwutils.superstructure.activities.get_activities_from_keys"></a>

#### get\_activities\_from\_keys

```python
def get_activities_from_keys(df: pd.DataFrame,
                             db: str = bd.config.biosphere) -> pd.DataFrame
```

Uses the BW SQL database to generate a list of Activities from the input dataframe.
Returns a pandas dataframe that contains any keys that do not identify to an Activity in BW.

parameters
----------
df: pandas dataframe for a scenario

db: the database name to check the Activities from the dataframe to
