**Generated API reference** · package `bw2data` 4.7 · module `bw2data.backends.schema` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.backends.schema cfg.yml > bw2data.backends.schema.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.backends.schema"></a>

# bw2data.backends.schema

<a id="bw2data.backends.schema.ActivityDataset"></a>

## ActivityDataset Objects

```python
class ActivityDataset(SnowflakeIDBaseClass)
```

<a id="bw2data.backends.schema.ActivityDataset.data"></a>

#### data

Canonical, except for other C fields

<a id="bw2data.backends.schema.ActivityDataset.code"></a>

#### code

Canonical

<a id="bw2data.backends.schema.ActivityDataset.database"></a>

#### database

Canonical

<a id="bw2data.backends.schema.ActivityDataset.location"></a>

#### location

Reset from `data`

<a id="bw2data.backends.schema.ActivityDataset.name"></a>

#### name

Reset from `data`

<a id="bw2data.backends.schema.ActivityDataset.product"></a>

#### product

Reset from `data`

<a id="bw2data.backends.schema.ActivityDataset.type"></a>

#### type

Reset from `data`

<a id="bw2data.backends.schema.ActivityDataset.key"></a>

#### key

```python
@property
def key()
```

<a id="bw2data.backends.schema.ExchangeDataset"></a>

## ExchangeDataset Objects

```python
class ExchangeDataset(SnowflakeIDBaseClass)
```

<a id="bw2data.backends.schema.ExchangeDataset.data"></a>

#### data

Canonical, except for other C fields

<a id="bw2data.backends.schema.ExchangeDataset.input_code"></a>

#### input\_code

Canonical

<a id="bw2data.backends.schema.ExchangeDataset.input_database"></a>

#### input\_database

Canonical

<a id="bw2data.backends.schema.ExchangeDataset.output_code"></a>

#### output\_code

Canonical

<a id="bw2data.backends.schema.ExchangeDataset.output_database"></a>

#### output\_database

Canonical

<a id="bw2data.backends.schema.ExchangeDataset.type"></a>

#### type

Reset from `data`

<a id="bw2data.backends.schema.get_id"></a>

#### get\_id

```python
def get_id(key)
```
