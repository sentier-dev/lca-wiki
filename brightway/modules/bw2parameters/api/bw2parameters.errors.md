**Generated API reference** · package `bw2parameters` 1.1.0 · module `bw2parameters.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2parameters.errors cfg.yml > bw2parameters.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2parameters.errors"></a>

# bw2parameters.errors

<a id="bw2parameters.errors.ValidationError"></a>

## ValidationError Objects

```python
class ValidationError(Exception)
```

Base class for errors with variables and formulas

<a id="bw2parameters.errors.ParameterError"></a>

## ParameterError Objects

```python
class ParameterError(ValidationError)
```

<a id="bw2parameters.errors.CapitalizationError"></a>

## CapitalizationError Objects

```python
class CapitalizationError(ParameterError)
```

Parameter(s) names are case-sensitive

<a id="bw2parameters.errors.DuplicateName"></a>

## DuplicateName Objects

```python
class DuplicateName(ValidationError)
```

This variable name has already been defined elsewhere

<a id="bw2parameters.errors.MissingName"></a>

## MissingName Objects

```python
class MissingName(ValidationError)
```

Formula refers to a variable which is not defined

<a id="bw2parameters.errors.SelfReference"></a>

## SelfReference Objects

```python
class SelfReference(ValidationError)
```

Formula refers to itself

<a id="bw2parameters.errors.BroadcastingError"></a>

## BroadcastingError Objects

```python
class BroadcastingError(ValidationError)
```

Formula returns Monte Carlo results with wrong dimensions
