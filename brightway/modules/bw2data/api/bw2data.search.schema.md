**Generated API reference** · package `bw2data` 4.7 · module `bw2data.search.schema` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.search.schema cfg.yml > bw2data.search.schema.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.search.schema"></a>

# bw2data.search.schema

<a id="bw2data.search.schema.BW2Schema"></a>

## BW2Schema Objects

```python
class BW2Schema(FTS5Model)
```

<a id="bw2data.search.schema.BW2Schema.rowid"></a>

#### rowid

<a id="bw2data.search.schema.BW2Schema.name"></a>

#### name

<a id="bw2data.search.schema.BW2Schema.comment"></a>

#### comment

<a id="bw2data.search.schema.BW2Schema.product"></a>

#### product

<a id="bw2data.search.schema.BW2Schema.categories"></a>

#### categories

<a id="bw2data.search.schema.BW2Schema.synonyms"></a>

#### synonyms

<a id="bw2data.search.schema.BW2Schema.location"></a>

#### location

<a id="bw2data.search.schema.BW2Schema.database"></a>

#### database

<a id="bw2data.search.schema.BW2Schema.code"></a>

#### code

<a id="bw2data.search.schema.BW2Schema.Meta"></a>

## Meta Objects

```python
class Meta()
```

<a id="bw2data.search.schema.BW2Schema.Meta.options"></a>

#### options
