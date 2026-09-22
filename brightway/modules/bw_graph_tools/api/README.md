# API reference: bw_graph_tools 0.10

Generated on 2026-09-22 with pydoc-markdown 4.8.2 (markdown renderer), one file per
public submodule of `bw_graph_tools` 0.10. Generated files: do not edit them by hand;
each one carries the command that produced it and regenerating overwrites it.

The package source is the `bw_graph_tools` 0.10 distribution from PyPI, installed
without dependencies into a throwaway environment; pydoc-markdown reads the source
statically, so nothing here required importing the package.

The command, with the module name changed per file:

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
  -I "$SP" -m bw_graph_tools cfg.yml > bw_graph_tools.md
```

Left out by that walk: private modules (a name beginning with `_`), tests, vendored and
third-party code, and directories of data rather than code. Undocumented public
functions and classes are kept, with their signatures; imported names are not
re-documented where they are imported.

A module whose `__init__.py` only re-exports names from its submodules renders as a
heading and nothing else: the names it re-exports are documented where they are defined,
and the short list worth knowing first is in the module's hand-written `classes.md`.

## Licence

The signatures and docstrings in this folder are reproduced from `bw_graph_tools` and stay under
that package's own licence: BSD 3-Clause. This generated folder is not covered by the CC BY 4.0
that applies to the hand-written pages; see [LICENSE-CONTENT](../../../../LICENSE-CONTENT).

## Modules

- [bw_graph_tools](bw_graph_tools.md) — 1 KB
- [bw_graph_tools.errors](bw_graph_tools.errors.md) — 1 KB
- [bw_graph_tools.graph_traversal](bw_graph_tools.graph_traversal.md) — 1 KB
- [bw_graph_tools.graph_traversal.assumed_diagonal](bw_graph_tools.graph_traversal.assumed_diagonal.md) — 2 KB
- [bw_graph_tools.graph_traversal.base](bw_graph_tools.graph_traversal.base.md) — 3 KB
- [bw_graph_tools.graph_traversal.graph_objects](bw_graph_tools.graph_traversal.graph_objects.md) — 9 KB
- [bw_graph_tools.graph_traversal.new_node_each_visit](bw_graph_tools.graph_traversal.new_node_each_visit.md) — 15 KB
- [bw_graph_tools.graph_traversal.same_node_each_visit](bw_graph_tools.graph_traversal.same_node_each_visit.md) — 3 KB
- [bw_graph_tools.graph_traversal.settings](bw_graph_tools.graph_traversal.settings.md) — 3 KB
- [bw_graph_tools.graph_traversal.tagged_nodes](bw_graph_tools.graph_traversal.tagged_nodes.md) — 7 KB
- [bw_graph_tools.graph_traversal.utils](bw_graph_tools.graph_traversal.utils.md) — 5 KB
- [bw_graph_tools.graph_traversal_utils](bw_graph_tools.graph_traversal_utils.md) — 2 KB
- [bw_graph_tools.matrix_tools](bw_graph_tools.matrix_tools.md) — 9 KB
- [bw_graph_tools.shortest_path](bw_graph_tools.shortest_path.md) — 6 KB

Total: 14 files, 72 KB.
