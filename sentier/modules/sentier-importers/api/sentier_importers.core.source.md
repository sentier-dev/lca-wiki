**Generated API reference** · package `sentier-importers` 0.0.1 · module `sentier_importers.core.source` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_importers.core.source cfg.yml > sentier_importers.core.source.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_importers.core.source"></a>

# sentier\_importers.core.source

Source plugin contract.

A source's declarative configuration lives in ``registry.yaml`` and is parsed into a
:class:`SourceConfig`. Behavior lives in a :class:`Source` subclass that implements
``transform`` (and may override ``fetch``/``parse`` for non-trivial inputs). The
framework supplies validate → emit → deliver via the pipeline driver.

<a id="sentier_importers.core.source.SourceConfig"></a>

## SourceConfig Objects

```python
@dataclass(frozen=True)
class SourceConfig()
```

Declarative configuration for one source, parsed from ``registry.yaml``.

<a id="sentier_importers.core.source.SourceConfig.name"></a>

#### name

<a id="sentier_importers.core.source.SourceConfig.module"></a>

#### module

<a id="sentier_importers.core.source.SourceConfig.target"></a>

#### target

<a id="sentier_importers.core.source.SourceConfig.category"></a>

#### category

<a id="sentier_importers.core.source.SourceConfig.fetch_url"></a>

#### fetch\_url

<a id="sentier_importers.core.source.SourceConfig.fetch_format"></a>

#### fetch\_format

<a id="sentier_importers.core.source.SourceConfig.output_format"></a>

#### output\_format

<a id="sentier_importers.core.source.SourceConfig.validate_against"></a>

#### validate\_against

<a id="sentier_importers.core.source.SourceConfig.enabled"></a>

#### enabled

<a id="sentier_importers.core.source.SourceConfig.emit_filename"></a>

#### emit\_filename

<a id="sentier_importers.core.source.SourceConfig.collection_class"></a>

#### collection\_class

tree-root class to validate the collection against

<a id="sentier_importers.core.source.SourceConfig.collection_items_key"></a>

#### collection\_items\_key

plural slot holding the items (e.g. "products")

<a id="sentier_importers.core.source.SourceConfig.collection_scheme"></a>

#### collection\_scheme

ConceptScheme IRI for the collection's ``scheme``

<a id="sentier_importers.core.source.SourceConfig.schema_file"></a>

#### schema\_file

schema-file id to resolve (decoupled from the class name)

<a id="sentier_importers.core.source.SourceConfig.dedup_on_existing"></a>

#### dedup\_on\_existing

skip | error | overwrite

<a id="sentier_importers.core.source.SourceConfig.dedup_check_existing"></a>

#### dedup\_check\_existing

Layer B on/off (only active when target has a schema_ref)

<a id="sentier_importers.core.source.SourceConfig.package_name"></a>

#### package\_name

<a id="sentier_importers.core.source.SourceConfig.package_version"></a>

#### package\_version

<a id="sentier_importers.core.source.SourceConfig.package_verb"></a>

#### package\_verb

<a id="sentier_importers.core.source.SourceConfig.inputs"></a>

#### inputs

<a id="sentier_importers.core.source.Source"></a>

## Source Objects

```python
class Source(ABC)
```

Base class for all source plugins.

Default ``fetch`` and ``parse`` delegate to the shared services using the
declared ``fetch_url`` / ``fetch_format``. Only ``transform`` is required.

<a id="sentier_importers.core.source.Source.__init__"></a>

#### \_\_init\_\_

```python
def __init__(config: SourceConfig) -> None
```

<a id="sentier_importers.core.source.Source.fetch"></a>

#### fetch

```python
def fetch(ctx: RunContext) -> RawData
```

Retrieve raw data (default: cached fetch of ``config.fetch_url``).

Named ``config.inputs`` are fetched the same way and stored on
:attr:`inputs` for ``parse``/``transform`` to join against.

<a id="sentier_importers.core.source.Source.parse"></a>

#### parse

```python
def parse(raw: RawData) -> Records
```

Turn raw bytes into records (default: parser for ``config.fetch_format``).

<a id="sentier_importers.core.source.Source.transform"></a>

#### transform

```python
@abstractmethod
def transform(records: Records) -> Rows
```

Map parsed records to rows shaped for the target. Source-specific.
