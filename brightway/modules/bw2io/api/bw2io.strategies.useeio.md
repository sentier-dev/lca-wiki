**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.useeio` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.useeio cfg.yml > bw2io.strategies.useeio.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.useeio"></a>

# bw2io.strategies.useeio

<a id="bw2io.strategies.useeio.remove_useeio_products"></a>

#### remove\_useeio\_products

```python
def remove_useeio_products(data)
```

Remove products from US EEIO and collapse to only activities

<a id="bw2io.strategies.useeio.remove_random_exchanges"></a>

#### remove\_random\_exchanges

```python
def remove_random_exchanges(data, fraction=0.9)
```

Remove most inputs to make the US EEIO have a structure more like other LCA databases
