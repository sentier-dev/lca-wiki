**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper.errors cfg.yml > flowmapper.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.errors"></a>

# flowmapper.errors

<a id="flowmapper.errors.DifferingMatches"></a>

## DifferingMatches Objects

```python
class DifferingMatches(Exception)
```

Multiple different matches given for same flow

<a id="flowmapper.errors.DifferingConversions"></a>

## DifferingConversions Objects

```python
class DifferingConversions(Exception)
```

Multiple, different conversion factors provided for a given match
