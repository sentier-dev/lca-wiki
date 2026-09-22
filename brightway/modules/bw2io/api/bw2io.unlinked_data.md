**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.unlinked_data` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.unlinked_data cfg.yml > bw2io.unlinked_data.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.unlinked_data"></a>

# bw2io.unlinked\_data

<a id="bw2io.unlinked_data._UnlinkedData"></a>

## \_UnlinkedData Objects

```python
class _UnlinkedData(SerializedDict)
```

<a id="bw2io.unlinked_data._UnlinkedData.filename"></a>

#### filename

<a id="bw2io.unlinked_data.unlinked_data"></a>

#### unlinked\_data

<a id="bw2io.unlinked_data.UnlinkedData"></a>

## UnlinkedData Objects

```python
class UnlinkedData(DataStore)
```

<a id="bw2io.unlinked_data.UnlinkedData.validate"></a>

#### validate

```python
def validate(*args, **kwargs)
```
