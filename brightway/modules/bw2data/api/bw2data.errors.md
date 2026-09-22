**Generated API reference** · package `bw2data` 4.7 · module `bw2data.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.errors cfg.yml > bw2data.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.errors"></a>

# bw2data.errors

<a id="bw2data.errors.BW2Exception"></a>

## BW2Exception Objects

```python
class BW2Exception(Exception)
```

Base class for exceptions in Brightway2

<a id="bw2data.errors.InvalidExchange"></a>

## InvalidExchange Objects

```python
class InvalidExchange(BW2Exception)
```

Exchange is missing 'amount' or 'input'

<a id="bw2data.errors.DuplicateNode"></a>

## DuplicateNode Objects

```python
class DuplicateNode(BW2Exception)
```

Can't have nodes with same unique identifiers

<a id="bw2data.errors.MissingIntermediateData"></a>

## MissingIntermediateData Objects

```python
class MissingIntermediateData(BW2Exception)
```

<a id="bw2data.errors.UnknownObject"></a>

## UnknownObject Objects

```python
class UnknownObject(BW2Exception)
```

<a id="bw2data.errors.MultipleResults"></a>

## MultipleResults Objects

```python
class MultipleResults(BW2Exception)
```

<a id="bw2data.errors.UntypedExchange"></a>

## UntypedExchange Objects

```python
class UntypedExchange(BW2Exception)
```

Exchange doesn't have 'type' attribute

<a id="bw2data.errors.WebUIError"></a>

## WebUIError Objects

```python
class WebUIError(BW2Exception)
```

Can't find running instance of bw2-web

<a id="bw2data.errors.ValidityError"></a>

## ValidityError Objects

```python
class ValidityError(BW2Exception)
```

The activity or exchange dataset does not have all the required fields

<a id="bw2data.errors.NotAllowed"></a>

## NotAllowed Objects

```python
class NotAllowed(BW2Exception)
```

This operation is not allowed

<a id="bw2data.errors.WrongDatabase"></a>

## WrongDatabase Objects

```python
class WrongDatabase(BW2Exception)
```

Can't save activities from database `x` to database `y`.

<a id="bw2data.errors.NotFound"></a>

## NotFound Objects

```python
class NotFound(BW2Exception)
```

Requested web resource not found

<a id="bw2data.errors.PickleError"></a>

## PickleError Objects

```python
class PickleError(BW2Exception)
```

Pickle file can't be loaded due to updated library file structure

<a id="bw2data.errors.Brightway2Project"></a>

## Brightway2Project Objects

```python
class Brightway2Project(BW2Exception)
```

This project is not yet migrated to Brightway 2.5

<a id="bw2data.errors.InvalidDatapackage"></a>

## InvalidDatapackage Objects

```python
class InvalidDatapackage(BW2Exception)
```

The given datapackage can't be used for the requested task.

<a id="bw2data.errors.IncompatibleClasses"></a>

## IncompatibleClasses Objects

```python
class IncompatibleClasses(BW2Exception)
```

Revision comparison across two different classes doesn't make sense and isn't allowed

<a id="bw2data.errors.DifferentObjects"></a>

## DifferentObjects Objects

```python
class DifferentObjects(BW2Exception)
```

Revision comparison of two different objects doesn't make sense and isn't allowed

<a id="bw2data.errors.InconsistentData"></a>

## InconsistentData Objects

```python
class InconsistentData(BW2Exception)
```

Attempted a change on data which was in an inconsistent state with the changeset.

<a id="bw2data.errors.PossibleInconsistentData"></a>

## PossibleInconsistentData Objects

```python
class PossibleInconsistentData(BW2Exception)
```

Attempted a change on data which was in an inconsistent state with the changeset.

<a id="bw2data.errors.NoRevisionNeeded"></a>

## NoRevisionNeeded Objects

```python
class NoRevisionNeeded(BW2Exception)
```

No revision needed given the presented previous and current data
