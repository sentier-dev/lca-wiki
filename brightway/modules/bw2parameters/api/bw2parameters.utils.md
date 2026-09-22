**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2parameters==1.1.0'
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
  -I "$SP" -m bw2parameters.utils cfg.yml > bw2parameters.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.utils"></a>

# bw2parameters.utils

<a id="bw2parameters.utils.isidentifier"></a>

#### isidentifier

```python
def isidentifier(ident)
```

Determines, if string is valid Python identifier.

Stolen from http://stackoverflow.com/questions/12700893/how-to-check-if-a-string-is-a-valid-python-identifier-including-keyword-check

<a id="bw2parameters.utils.get_version_tuple"></a>

#### get\_version\_tuple

```python
def get_version_tuple() -> tuple
```
