**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.errors` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-vocab repo && git -C repo checkout ef440c6
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
  -I "$SP" -m sentier_vocab.errors cfg.yml > sentier_vocab.errors.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.errors"></a>

# sentier\_vocab.errors

<a id="sentier_vocab.errors.GraphFilterError"></a>

## GraphFilterError Objects

```python
class GraphFilterError(Exception)
```

Filter on graph produced undesired result

<a id="sentier_vocab.errors.MissingDimensionVector"></a>

## MissingDimensionVector Objects

```python
class MissingDimensionVector(Exception)
```

Unit is missing `hasDimensionVector` attribute

<a id="sentier_vocab.errors.SchemaValidationError"></a>

## SchemaValidationError Objects

```python
class SchemaValidationError(Exception)
```

A data file failed validation against its LinkML schema.
