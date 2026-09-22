**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.errors cfg.yml > bw2io.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.errors"></a>

# bw2io.errors

<a id="bw2io.errors.InvalidPackage"></a>

## InvalidPackage Objects

```python
class InvalidPackage(Exception)
```

bw2package data doesn't validate

<a id="bw2io.errors.UnsafeData"></a>

## UnsafeData Objects

```python
class UnsafeData(Exception)
```

bw2package data comes from a class that isn't recognized by Brightway2

<a id="bw2io.errors.UnsupportedExchange"></a>

## UnsupportedExchange Objects

```python
class UnsupportedExchange(Exception)
```

This exchange uncertainty type can't be rescaled automatically

<a id="bw2io.errors.StrategyError"></a>

## StrategyError Objects

```python
class StrategyError(Exception)
```

The strategy could not be applied

<a id="bw2io.errors.NonuniqueCode"></a>

## NonuniqueCode Objects

```python
class NonuniqueCode(Exception)
```

Not all provided codes are unique

<a id="bw2io.errors.WrongDatabase"></a>

## WrongDatabase Objects

```python
class WrongDatabase(Exception)
```

Dataset does not belong to this database

<a id="bw2io.errors.MultiprocessingError"></a>

## MultiprocessingError Objects

```python
class MultiprocessingError(Exception)
```

Multiprocessing module error or incompatibility

<a id="bw2io.errors.UnallocatableDataset"></a>

## UnallocatableDataset Objects

```python
class UnallocatableDataset(Exception)
```

GIven data cannot be sanely or deterministically allocated

<a id="bw2io.errors.MissingMigration"></a>

## MissingMigration Objects

```python
class MissingMigration(Exception)
```

Needed migration data is missing
