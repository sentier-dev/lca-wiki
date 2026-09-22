**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.products` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.products cfg.yml > bw2io.strategies.products.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.products"></a>

# bw2io.strategies.products

<a id="bw2io.strategies.products.EDGE_CORE_COLUMNS"></a>

#### EDGE\_CORE\_COLUMNS

<a id="bw2io.strategies.products.create_products_as_new_nodes"></a>

#### create\_products\_as\_new\_nodes

```python
def create_products_as_new_nodes(data: List[dict]) -> List[dict]
```

Create new product nodes and link to them if needed.

We create new `product` if the following conditions are met:

* The dataset is not multifunctional (
    `dataset.get("type") != bd.labels.multifunctional_node_default`). Multifunctional datasets
    handle product creation separately.
* The edge is functional (`obj.get("functional") is True`)
* The edge is unlinked (`obj.get("input")` is falsey)
* The given edge has a `name`, and that `name` is different than the dataset `name`
* The combination of `name` and `location` is not present in the other dataset nodes. If no
    `location` attribute is given for the edge under consideration, we use the `location` of the
    dataset.

Create new nodes, and links the originating edges to the new product nodes.

Modifies data in-place, and returns the modified `data`.

<a id="bw2io.strategies.products.separate_processes_from_products"></a>

#### separate\_processes\_from\_products

```python
def separate_processes_from_products(
        data: List[dict],
        field_exclusions=["location"],
        code_suffix: str = "-product") -> List[dict]
```

Given a set of processes, and no separate data on products, create copies of the processes
as products and re-link the local supply chain.

Designed for use in importing databases where processes are not strongly typed as different from
products.

Copies over all attributes from the source processes except:

- Those listed in `field_exclusions`
- `type` is set to `bw2data.labels.product_node_default`
- Uses the `code_suffix` to generate a new `code` value (previous plus code suffix)
- No edges are copied over
- If the attribute is present `reference product`, this is used as the product name

Should come late in the import process, when internal links are all present.
