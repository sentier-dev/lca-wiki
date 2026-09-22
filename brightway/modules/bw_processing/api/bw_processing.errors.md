**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw_processing==1.6'
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
  -I "$SP" -m bw_processing.errors cfg.yml > bw_processing.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.errors"></a>

# bw\_processing.errors

<a id="bw_processing.errors.BrightwayProcessingError"></a>

## BrightwayProcessingError Objects

```python
class BrightwayProcessingError(Exception)
```

<a id="bw_processing.errors.InconsistentFields"></a>

## InconsistentFields Objects

```python
class InconsistentFields(BrightwayProcessingError)
```

Given fields not the same for each element

<a id="bw_processing.errors.NonUnique"></a>

## NonUnique Objects

```python
class NonUnique(BrightwayProcessingError)
```

Nonunique elements when uniqueness is required

<a id="bw_processing.errors.WrongDatatype"></a>

## WrongDatatype Objects

```python
class WrongDatatype(BrightwayProcessingError)
```

Wrong type of data written to a resource

<a id="bw_processing.errors.ShapeMismatch"></a>

## ShapeMismatch Objects

```python
class ShapeMismatch(BrightwayProcessingError)
```

Array shapes in a resource group are not consistent

<a id="bw_processing.errors.InvalidName"></a>

## InvalidName Objects

```python
class InvalidName(BrightwayProcessingError)
```

Name fails datapackage requirements:

A short url-usable (and preferably human-readable) name of the package. This MUST be lower-case and contain only alphanumeric characters along with ".", "_" or "-" characters.

<a id="bw_processing.errors.FileIntegrityError"></a>

## FileIntegrityError Objects

```python
class FileIntegrityError(BrightwayProcessingError)
```

MD5 hash does not agree with file contents

<a id="bw_processing.errors.Closed"></a>

## Closed Objects

```python
class Closed(BrightwayProcessingError)
```

Datapackage closed, can't be written to anymore.

<a id="bw_processing.errors.LengthMismatch"></a>

## LengthMismatch Objects

```python
class LengthMismatch(BrightwayProcessingError)
```

Number of resources doesn't match the number of data objects

<a id="bw_processing.errors.InvalidMimetype"></a>

## InvalidMimetype Objects

```python
class InvalidMimetype(BrightwayProcessingError)
```

Provided mimetype missing or not understood

<a id="bw_processing.errors.PotentialInconsistency"></a>

## PotentialInconsistency Objects

```python
class PotentialInconsistency(BrightwayProcessingError)
```

Given operation could cause inconsistent data
