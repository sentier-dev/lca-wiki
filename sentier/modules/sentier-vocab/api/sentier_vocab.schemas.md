**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.schemas` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_vocab.schemas cfg.yml > sentier_vocab.schemas.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.schemas"></a>

# sentier\_vocab.schemas

Validate native term YAML files against their LinkML schemas.

<a id="sentier_vocab.schemas.validate_data_file"></a>

#### validate\_data\_file

```python
def validate_data_file(data_path: Path | str, schema_path: Path | str) -> bool
```

Validate a data file against a LinkML schema.

Returns True on success; raises SchemaValidationError listing every problem
on failure. Uses the schema's ``tree_root`` class as the validation target.

.. note::
    This function uses ``SchemaView`` to resolve schema imports relative to
    the schema file's directory (bypassing a ``linkml.validator.validate_file``
    limitation where imports are resolved relative to the process cwd).  It
    also explicitly passes ``JsonschemaValidationPlugin(closed=True)`` so that
    required-slot enforcement is active; the default ``validate_file`` plugin
    set omits required-field checking in this version of LinkML.

<a id="sentier_vocab.schemas.validate_collection"></a>

#### validate\_collection

```python
def validate_collection(scheme: str, records: list[dict], items_key: str,
                        schema_path: Path | str) -> bool
```

Validate an in-memory collection ``{scheme, <items_key>: records}`` against a schema.

The format-agnostic counterpart of :func:`validate_data_file`: it validates records
that may have come from YAML *or* Parquet, with no file or YAML materialization.
Returns True on success; raises ``SchemaValidationError`` listing every problem.
