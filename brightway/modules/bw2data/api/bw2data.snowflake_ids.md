**Generated API reference** · package `bw2data` 4.7 · module `bw2data.snowflake_ids` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.snowflake_ids cfg.yml > bw2data.snowflake_ids.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.snowflake_ids"></a>

# bw2data.snowflake\_ids

<a id="bw2data.snowflake_ids.EPOCH_START_MS"></a>

#### EPOCH\_START\_MS

<a id="bw2data.snowflake_ids.snowflake_id_generator"></a>

#### snowflake\_id\_generator

<a id="bw2data.snowflake_ids.SnowflakeIDBaseClass"></a>

## SnowflakeIDBaseClass Objects

```python
class SnowflakeIDBaseClass(SignaledDataset)
```

<a id="bw2data.snowflake_ids.SnowflakeIDBaseClass.id"></a>

#### id

<a id="bw2data.snowflake_ids.SnowflakeIDBaseClass.save"></a>

#### save

```python
def save(**kwargs)
```
