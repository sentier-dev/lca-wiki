**Generated API reference** · package `bw_graph_tools` 0.10 · module `bw_graph_tools.graph_traversal.assumed_diagonal` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_graph_tools==0.10'
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
  -I "$SP" -m bw_graph_tools.graph_traversal.assumed_diagonal cfg.yml > bw_graph_tools.graph_traversal.assumed_diagonal.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_graph_tools.graph_traversal.assumed_diagonal"></a>

# bw\_graph\_tools.graph\_traversal.assumed\_diagonal

<a id="bw_graph_tools.graph_traversal.assumed_diagonal.AssumedDiagonalGraphTraversal"></a>

## AssumedDiagonalGraphTraversal Objects

```python
class AssumedDiagonalGraphTraversal(NewNodeEachVisitGraphTraversal)
```

<a id="bw_graph_tools.graph_traversal.assumed_diagonal.AssumedDiagonalGraphTraversal.get_production_exchanges"></a>

#### get\_production\_exchanges

```python
@classmethod
def get_production_exchanges(
        cls, mapped_matrix: mu.MappedMatrix) -> (np.ndarray, np.ndarray)
```

Assume production exchanges are always on the diagonal instead of
examining matrix structure and input data.

Parameters
----------
mapped_matrix : matrix_utils.MappedMatrix
    A matrix and mapping data (from database ids to matrix indices)
    from the ``matrix_utils`` library. Normally built automatically by
    an ``LCA`` class. Should be the ``technosphere_matrix`` or
    equivalent.

Returns
-------
(numpy.array, numpy.array)
    The matrix row and column indices of the production exchanges.
