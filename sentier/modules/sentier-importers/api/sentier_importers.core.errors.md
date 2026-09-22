**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-importers repo && git -C repo checkout dac2e67
SP=repo/app
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
  -I "$SP" -m sentier_importers.core.errors cfg.yml > sentier_importers.core.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.errors"></a>

# sentier\_importers.core.errors

Exception hierarchy for the importer framework.

<a id="sentier_importers.core.errors.SentierImporterError"></a>

## SentierImporterError Objects

```python
class SentierImporterError(Exception)
```

Base class for all importer errors.

<a id="sentier_importers.core.errors.FetchError"></a>

## FetchError Objects

```python
class FetchError(SentierImporterError)
```

Raised when a fetch stage cannot retrieve data.

<a id="sentier_importers.core.errors.ParseError"></a>

## ParseError Objects

```python
class ParseError(SentierImporterError)
```

Raised when raw data cannot be parsed into records.

<a id="sentier_importers.core.errors.ValidationError"></a>

## ValidationError Objects

```python
class ValidationError(SentierImporterError)
```

Raised when transformed rows fail target-schema validation.

<a id="sentier_importers.core.errors.DeliveryError"></a>

## DeliveryError Objects

```python
class DeliveryError(SentierImporterError)
```

Raised when the deliver stage fails.

<a id="sentier_importers.core.errors.RegistryError"></a>

## RegistryError Objects

```python
class RegistryError(SentierImporterError)
```

Raised when the source registry is malformed or a source is missing.
