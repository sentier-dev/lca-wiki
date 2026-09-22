**Generated API reference** · package `bw2data` 4.7 · module `bw2data.updates` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.updates cfg.yml > bw2data.updates.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.updates"></a>

# bw2data.updates

<a id="bw2data.updates.hash_re"></a>

#### hash\_re

<a id="bw2data.updates.is_hash"></a>

#### is\_hash

<a id="bw2data.updates.UPDATE_WARNING"></a>

#### UPDATE\_WARNING

<a id="bw2data.updates.UPDATE_ACTIVITYDATASET"></a>

#### UPDATE\_ACTIVITYDATASET

<a id="bw2data.updates.UPDATE_EXCHANGEDATASET"></a>

#### UPDATE\_EXCHANGEDATASET

<a id="bw2data.updates.Updates"></a>

## Updates Objects

```python
class Updates()
```

<a id="bw2data.updates.Updates.UPDATES"></a>

#### UPDATES

<a id="bw2data.updates.Updates.explain"></a>

#### explain

```python
@classmethod
def explain(cls, key)
```

<a id="bw2data.updates.Updates.do_update"></a>

#### do\_update

```python
@classmethod
def do_update(cls, key)
```

<a id="bw2data.updates.Updates.check_status"></a>

#### check\_status

```python
@classmethod
def check_status(cls, verbose=True)
```

Check if updates need to be applied.

**Returns**:

  List of needed updates (strings), if any.

<a id="bw2data.updates.Updates.set_initial_updates"></a>

#### set\_initial\_updates

```python
@classmethod
def set_initial_updates(cls)
```

<a id="bw2data.updates.Updates.check_automatic_updates"></a>

#### check\_automatic\_updates

```python
@classmethod
def check_automatic_updates(cls)
```

Get list of automatic updates to be applied

<a id="bw2data.updates.Updates.reprocess_all_1_0"></a>

#### reprocess\_all\_1\_0

```python
@classmethod
def reprocess_all_1_0(cls)
```

1.0: Reprocess all to make sure default 'loc' value inserted when not specified.

<a id="bw2data.updates.Updates.schema_change_20_compound_keys"></a>

#### schema\_change\_20\_compound\_keys

```python
@classmethod
def schema_change_20_compound_keys(cls)
```

<a id="bw2data.updates.Updates.database_search_directories_20"></a>

#### database\_search\_directories\_20

```python
@classmethod
def database_search_directories_20(cls)
```

<a id="bw2data.updates.Updates.database_search_directories_40"></a>

#### database\_search\_directories\_40

```python
@classmethod
def database_search_directories_40(cls)
```

<a id="bw2data.updates.Updates.processed_data_format_change_23"></a>

#### processed\_data\_format\_change\_23

```python
@classmethod
def processed_data_format_change_23(cls)
```

<a id="bw2data.updates.Updates.expire_all_processed_data_40"></a>

#### expire\_all\_processed\_data\_40

```python
@classmethod
def expire_all_processed_data_40(cls)
```

<a id="bw2data.updates.Updates.expire_all_processed_data_47"></a>

#### expire\_all\_processed\_data\_47

```python
@classmethod
def expire_all_processed_data_47(cls)
```

<a id="bw2data.updates.Updates.fix_migrations_filename"></a>

#### fix\_migrations\_filename

```python
@classmethod
def fix_migrations_filename(cls)
```

"Fix migration data filenames to use shorter hash.

See https://github.com/brightway-lca/brightway2-io/issues/115
