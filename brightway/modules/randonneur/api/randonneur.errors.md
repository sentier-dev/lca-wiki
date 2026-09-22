**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'randonneur==0.7.2'
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
  -I "$SP" -m randonneur.errors cfg.yml > randonneur.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.errors"></a>

# randonneur.errors

<a id="randonneur.errors.UnmappedData"></a>

## UnmappedData Objects

```python
class UnmappedData(Exception)
```

Given data doesn't match provided data mapping schema

<a id="randonneur.errors.WrongGraphContext"></a>

## WrongGraphContext Objects

```python
class WrongGraphContext(Exception)
```

Migration attempted in wrong context (e.g. nodes instead of edges)

<a id="randonneur.errors.MultipleTransformations"></a>

## MultipleTransformations Objects

```python
class MultipleTransformations(Exception)
```

Multiple transformations given for same set of input fields

<a id="randonneur.errors.ConflictingConversionFactors"></a>

## ConflictingConversionFactors Objects

```python
class ConflictingConversionFactors(Exception)
```

Multiple different conversion factors given for same migration
