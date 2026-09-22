**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.grid` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.grid cfg.yml > bw2calc.grid.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.grid"></a>

# bw2calc.grid

<a id="bw2calc.grid.TwoDimensionalGrid"></a>

## TwoDimensionalGrid Objects

```python
class TwoDimensionalGrid(Mapping)
```

<a id="bw2calc.grid.TwoDimensionalGrid.__init__"></a>

#### \_\_init\_\_

```python
def __init__(keys: Sequence[tuple[Any, Any]], values: Sequence[Any])
```

Read-only dictionary wrapper for a strictly 2-dimensional grid.

Supports a very limited type of slicing - only `foo["something", ...]`.

<a id="bw2calc.grid.TwoDimensionalGrid.__getitem__"></a>

#### \_\_getitem\_\_

```python
def __getitem__(key: Any)
```

<a id="bw2calc.grid.TwoDimensionalGrid.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

<a id="bw2calc.grid.TwoDimensionalGrid.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```
