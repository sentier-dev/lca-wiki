**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.validate` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.validate cfg.yml > sentier_importers.core.validate.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.validate"></a>

# sentier\_importers.core.validate

Validator-strategy registry. ``none`` is a no-op for bulk-data targets; ``linkml``
validates each row against a named class in a target repo's LinkML schema.

<a id="sentier_importers.core.validate.ValidatorFn"></a>

#### ValidatorFn

<a id="sentier_importers.core.validate.register_validator"></a>

#### register\_validator

```python
def register_validator(name: str, fn: ValidatorFn) -> None
```

Register (or override) a validation strategy.

<a id="sentier_importers.core.validate.validate"></a>

#### validate

```python
def validate(payload: Payload, validator: str, schema_path: Path | None,
             schema_id: str | None) -> None
```

Validate ``payload`` using the named strategy. Raises ``ValidationError`` on failure.
