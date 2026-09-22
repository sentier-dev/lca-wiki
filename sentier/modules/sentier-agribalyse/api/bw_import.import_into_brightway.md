**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `bw_import.import_into_brightway` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
SP=repo/src
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
  -I "$SP" -m bw_import.import_into_brightway cfg.yml > bw_import.import_into_brightway.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_import.import_into_brightway"></a>

# bw\_import.import\_into\_brightway

Import the Agribalyse 3.2 x ecoinvent 3.9.1 x EF v3.1 export into Brightway.

Run this **inside the Python environment where Brightway (or Activity Browser)
is installed** — it writes into *your* Brightway data directory using *your*
``bw2data``. It works on both Brightway generations (legacy ``bw2data`` 3.x and
``bw2data`` 4.x / bw2.5); nothing here is pinned, and it imports nothing from the
``sentier-agribalyse`` package. Besides ``bw2data`` it needs only ``pandas``
plus a parquet engine (``pyarrow``): a fresh Activity Browser environment has
pandas but NOT pyarrow, so run ``conda install pyarrow`` (or ``pip install
pyarrow``) in that environment first. Its only inputs are the exported files:

    metadata/activities.parquet     col_id -> (database, code, name, unit,
                                    location, reference_product,
                                    production_product_id)
    metadata/biosphere.parquet      bioflow_id -> (database, code, name,
                                    categories, unit, is_synthetic_correction)
    metadata/methods.json           method keys + datapackage paths
    metadata/parity_samples.json    products with expected scores (--verify)
    inventory/                      technosphere + biosphere bw_processing arrays
    methods/<slug>/                 one characterization datapackage per method

The technosphere is a square, diagonal-aligned matrix: the activity at column
index ``i`` produces the product at row index ``i`` (its reference product). The
shipped ``production_product_id`` records that pairing per column, which is what
lets us tell a **production** exchange (not sign-flipped by bw2data) from a
**technosphere** input (sign-flipped). We reproduce the exact signs the export's
backtested scores were computed with, then ``--verify`` re-scores a few products
to prove it.

Usage::

    python import_into_brightway.py --verify 3
    python import_into_brightway.py --project my-project --overwrite --no-verify

<a id="bw_import.import_into_brightway.ImportError_"></a>

## ImportError\_ Objects

```python
class ImportError_(RuntimeError)
```

A fatal, user-actionable importer error (message is printed verbatim).

<a id="bw_import.import_into_brightway.main"></a>

#### main

```python
def main(argv: list[str] | None = None) -> int
```

<a id="bw_import.import_into_brightway.build_biosphere_data"></a>

#### build\_biosphere\_data

```python
def build_biosphere_data(biosphere: pd.DataFrame) -> dict
```

``biosphere.parquet`` -> ``{key: node_dict}`` for ``Database.write``.

<a id="bw_import.import_into_brightway.build_activities_data"></a>

#### build\_activities\_data

```python
def build_activities_data(activities: pd.DataFrame,
                          technosphere_indices: np.ndarray,
                          technosphere_data: np.ndarray,
                          biosphere_indices: np.ndarray,
                          biosphere_data: np.ndarray) -> dict
```

Reconstruct the activities database (with exchanges) from the datapackages.

Sign convention, matching the bundle's published scores exactly:

* the production exchange (row product == the column's
  ``production_product_id``) keeps its stored amount (bw2data does not flip
  production);
* every other technosphere entry is a technosphere input whose amount is
  **negated** (bw2data re-applies the technosphere sign flip, so negating
  here restores the stored matrix value — a positive off-diagonal becomes a
  negative amount, i.e. a substitution);
* biosphere entries keep their stored amount (no sign flip).

<a id="bw_import.import_into_brightway.build_methods"></a>

#### build\_methods

```python
def build_methods(
    bundle_dir: Path, methods_index: list[dict]
) -> list[tuple[tuple[str, ...], list[tuple[tuple[str, str], float]]]]
```

Read each method's characterization datapackage into ``(name, cfs)``.
