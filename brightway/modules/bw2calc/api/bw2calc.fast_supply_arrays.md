**Generated API reference** · package `bw2calc` 2.5.0 · module `bw2calc.fast_supply_arrays` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2calc.fast_supply_arrays cfg.yml > bw2calc.fast_supply_arrays.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2calc.fast_supply_arrays"></a>

# bw2calc.fast\_supply\_arrays

<a id="bw2calc.fast_supply_arrays.FastSupplyArraysMixin"></a>

## FastSupplyArraysMixin Objects

```python
class FastSupplyArraysMixin()
```

Mixin class for `LCA` which allows for fast calculations of multiple inventories.

Requires either `scikits-umfpack` or `pypardiso`. Must be mixed into an `LCA` class.

<a id="bw2calc.fast_supply_arrays.FastSupplyArraysMixin.chunk_size"></a>

#### chunk\_size

<a id="bw2calc.fast_supply_arrays.FastSupplyArraysMixin.set_chunk_size"></a>

#### set\_chunk\_size

```python
def set_chunk_size(chunk_size: int) -> None
```

<a id="bw2calc.fast_supply_arrays.FastSupplyArraysMixin.calculate_supply_arrays"></a>

#### calculate\_supply\_arrays

```python
def calculate_supply_arrays(demand_arrays: list[np.ndarray]) -> np.ndarray
```

Calculate multiple supply arrays in a single calculation.

Much faster than individual calculations, especially when using PARDISO.

Returns a numpy array with dimensions `[process scaling amounts, demands]`. `demands` are
given in the same order as `demand_arrays`.
