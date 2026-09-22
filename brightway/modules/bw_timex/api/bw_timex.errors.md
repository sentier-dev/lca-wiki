**Generated API reference** · package `bw_timex` 1.4.0 · module `bw_timex.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_timex==1.4.0'
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
  -I "$SP" -m bw_timex.errors cfg.yml > bw_timex.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_timex.errors"></a>

# bw\_timex.errors

Errors raised by `bw_timex`.

<a id="bw_timex.errors.UnmappedDatabaseError"></a>

## UnmappedDatabaseError Objects

```python
class UnmappedDatabaseError(ValueError)
```

A database reached by the graph traversal is missing from the mapping.

`bw_timex` places every traversed process in time via the database it
lives in, so each of them must either represent a point in time or be
marked as `"dynamic"`. Databases holding the functional unit are treated
as dynamic automatically; every other database has to say what it
represents, through its `representative_time` metadata or through
`database_dates`.
