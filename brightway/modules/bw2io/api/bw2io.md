**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io cfg.yml > bw2io.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io"></a>

# bw2io

<a id="bw2io.__version__"></a>

#### \_\_version\_\_

<a id="bw2io.create_default_biosphere3"></a>

#### create\_default\_biosphere3

```python
def create_default_biosphere3(overwrite=False)
```

<a id="bw2io.create_default_lcia_methods"></a>

#### create\_default\_lcia\_methods

```python
def create_default_lcia_methods(overwrite=False,
                                rationalize_method_names=False,
                                shortcut=True)
```

<a id="bw2io.bw2setup"></a>

#### bw2setup

```python
def bw2setup()
```

<a id="bw2io.useeio20"></a>

#### useeio20

```python
def useeio20(name="USEEIO-2.0", collapse_products=False, prune=False)
```



<a id="bw2io.exiobase_monetary"></a>

#### exiobase\_monetary

```python
def exiobase_monetary(version=(3, 8, 1),
                      year=2017,
                      products=False,
                      name=None,
                      ignore_small_balancing_corrections=True)
```
