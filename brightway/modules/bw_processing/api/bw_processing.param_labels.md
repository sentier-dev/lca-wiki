**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.param_labels` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.param_labels cfg.yml > bw_processing.param_labels.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.param_labels"></a>

# bw\_processing.param\_labels

<a id="bw_processing.param_labels.VALID_FIELD_TYPES"></a>

#### VALID\_FIELD\_TYPES

<a id="bw_processing.param_labels.StringLabelSchema"></a>

## StringLabelSchema Objects

```python
@dataclass
class StringLabelSchema()
```

Schema for param labels that are plain strings.

<a id="bw_processing.param_labels.StringLabelSchema.description"></a>

#### description

<a id="bw_processing.param_labels.StringLabelSchema.to_json_schema"></a>

#### to\_json\_schema

```python
def to_json_schema() -> Dict
```

<a id="bw_processing.param_labels.StringLabelSchema.validate"></a>

#### validate

```python
def validate(values: List) -> None
```

<a id="bw_processing.param_labels.StringLabelSchema.from_json_schema"></a>

#### from\_json\_schema

```python
@classmethod
def from_json_schema(cls, data: Dict) -> "StringLabelSchema"
```

<a id="bw_processing.param_labels.ParamLabelField"></a>

## ParamLabelField Objects

```python
@dataclass
class ParamLabelField()
```

A single field in a structured param label.

<a id="bw_processing.param_labels.ParamLabelField.name"></a>

#### name

<a id="bw_processing.param_labels.ParamLabelField.type"></a>

#### type

<a id="bw_processing.param_labels.ParamLabelField.required"></a>

#### required

<a id="bw_processing.param_labels.ParamLabelField.description"></a>

#### description

<a id="bw_processing.param_labels.ParamLabelSchema"></a>

## ParamLabelSchema Objects

```python
@dataclass
class ParamLabelSchema()
```

Schema for param labels that are structured objects.

<a id="bw_processing.param_labels.ParamLabelSchema.fields"></a>

#### fields

<a id="bw_processing.param_labels.ParamLabelSchema.description"></a>

#### description

<a id="bw_processing.param_labels.ParamLabelSchema.to_json_schema"></a>

#### to\_json\_schema

```python
def to_json_schema() -> Dict
```

<a id="bw_processing.param_labels.ParamLabelSchema.validate"></a>

#### validate

```python
def validate(values: List) -> None
```

<a id="bw_processing.param_labels.ParamLabelSchema.from_json_schema"></a>

#### from\_json\_schema

```python
@classmethod
def from_json_schema(cls, data: Dict) -> "ParamLabelSchema"
```

<a id="bw_processing.param_labels.AnyLabelSchema"></a>

#### AnyLabelSchema

<a id="bw_processing.param_labels.schema_from_json_schema"></a>

#### schema\_from\_json\_schema

```python
def schema_from_json_schema(data: Dict) -> AnyLabelSchema
```

Reconstruct a StringLabelSchema or ParamLabelSchema from a stored JSON Schema dict.
