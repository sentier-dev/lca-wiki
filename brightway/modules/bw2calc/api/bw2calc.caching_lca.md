**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.caching_lca` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2calc==2.5.0'
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
  -I "$SP" -m bw2calc.caching_lca cfg.yml > bw2calc.caching_lca.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.caching_lca"></a>

# bw2calc.caching\_lca

<a id="bw2calc.caching_lca.CachingLCA"></a>

## CachingLCA Objects

```python
class CachingLCA(LCA)
```

Custom class which caches supply vectors.

Cache resets upon iteration. If you do weird stuff outside of iteration you should probably
use the regular LCA class.

<a id="bw2calc.caching_lca.CachingLCA.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

<a id="bw2calc.caching_lca.CachingLCA.__next__"></a>

#### \_\_next\_\_

```python
def __next__() -> None
```

<a id="bw2calc.caching_lca.CachingLCA.lci_calculation"></a>

#### lci\_calculation

```python
def lci_calculation() -> None
```

The actual LCI calculation.

Separated from ``lci`` to be reusable in cases where the matrices are already built, e.g.
``redo_lci`` and Monte Carlo classes.
