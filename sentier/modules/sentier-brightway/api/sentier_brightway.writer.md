**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.writer` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
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
  -I "$SP" -m sentier_brightway.writer cfg.yml > sentier_brightway.writer.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.writer"></a>

# sentier\_brightway.writer

The only module that touches bw2data. Writes the three databases and the methods.

<a id="sentier_brightway.writer.log"></a>

#### log

<a id="sentier_brightway.writer.ExistingDatabaseError"></a>

## ExistingDatabaseError Objects

```python
class ExistingDatabaseError(RuntimeError)
```

The project already holds one of our databases and ``overwrite`` is False.

<a id="sentier_brightway.writer.write"></a>

#### write

```python
def write(result: BuildResult, project: str, overwrite: bool = False) -> None
```

Write the three databases and the methods into ``project`` (created if missing).

With ``overwrite`` a previous install is removed *before* the new one is written; if
the write then fails part-way the project holds a partial set, and re-running with
``overwrite=True`` (CLI: ``--overwrite``) is the recovery step.

<a id="sentier_brightway.writer.get_node"></a>

#### get\_node

```python
def get_node(database: str, code: str)
```

Resolve ``(database, code)`` on bw2data 3.x and 4.x alike.

<a id="sentier_brightway.writer.score"></a>

#### score

```python
def score(activity, method_key: tuple[str, ...]) -> float
```

One LCIA score with stock bw2calc; used by the smoke test and the CLI verify step.
