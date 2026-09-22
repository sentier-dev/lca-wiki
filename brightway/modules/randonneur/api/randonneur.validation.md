**Generated API reference** · package `randonneur` 0.7.2 · module `randonneur.validation` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m randonneur.validation cfg.yml > randonneur.validation.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="randonneur.validation"></a>

# randonneur.validation

<a id="randonneur.validation.VERBS"></a>

#### VERBS

<a id="randonneur.validation.Contributor"></a>

## Contributor Objects

```python
class Contributor(BaseModel)
```

<a id="randonneur.validation.Contributor.title"></a>

#### title

<a id="randonneur.validation.Contributor.roles"></a>

#### roles

<a id="randonneur.validation.Contributor.path"></a>

#### path

<a id="randonneur.validation.MappingFields"></a>

## MappingFields Objects

```python
class MappingFields(BaseModel)
```

<a id="randonneur.validation.MappingFields.expression_language"></a>

#### expression\_language

<a id="randonneur.validation.MappingFields.labels"></a>

#### labels

<a id="randonneur.validation.DatapackageMetadata"></a>

## DatapackageMetadata Objects

```python
class DatapackageMetadata(BaseModel)
```

Validate given Datapackage metadata.

Pydantic gives us nice error messages for free.

<a id="randonneur.validation.DatapackageMetadata.name"></a>

#### name

<a id="randonneur.validation.DatapackageMetadata.description"></a>

#### description

<a id="randonneur.validation.DatapackageMetadata.source_id"></a>

#### source\_id

<a id="randonneur.validation.DatapackageMetadata.target_id"></a>

#### target\_id

<a id="randonneur.validation.DatapackageMetadata.homepage"></a>

#### homepage

<a id="randonneur.validation.DatapackageMetadata.created"></a>

#### created

<a id="randonneur.validation.DatapackageMetadata.version"></a>

#### version

<a id="randonneur.validation.DatapackageMetadata.licenses"></a>

#### licenses

<a id="randonneur.validation.DatapackageMetadata.graph_context"></a>

#### graph\_context

<a id="randonneur.validation.DatapackageMetadata.contributors"></a>

#### contributors

<a id="randonneur.validation.validate_data_for_verb"></a>

#### validate\_data\_for\_verb

```python
def validate_data_for_verb(verb: str, data: list, mapping: dict) -> None
```
