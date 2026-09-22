**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.constants` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.constants cfg.yml > bw_processing.constants.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.constants"></a>

# bw\_processing.constants

<a id="bw_processing.constants.MAX_SIGNED_32BIT_INT"></a>

#### MAX\_SIGNED\_32BIT\_INT

<a id="bw_processing.constants.MAX_SIGNED_64BIT_INT"></a>

#### MAX\_SIGNED\_64BIT\_INT

<a id="bw_processing.constants.UNCERTAINTY_DTYPE"></a>

#### UNCERTAINTY\_DTYPE

<a id="bw_processing.constants.INDICES_DTYPE"></a>

#### INDICES\_DTYPE

<a id="bw_processing.constants.NAME_RE"></a>

#### NAME\_RE

<a id="bw_processing.constants.DEFAULT_LICENSES"></a>

#### DEFAULT\_LICENSES

<a id="bw_processing.constants.MatrixSerializeFormat"></a>

## MatrixSerializeFormat Objects

```python
class MatrixSerializeFormat(str, Enum)
```

Serialization format used when writing numpy arrays to disk.

Because this is a ``str`` enum, values can be compared directly to strings.
The default is ``NUMPY``.  ``PARQUET`` requires the optional ``pyarrow``
dependency.

<a id="bw_processing.constants.MatrixSerializeFormat.NUMPY"></a>

#### NUMPY

<a id="bw_processing.constants.MatrixSerializeFormat.PARQUET"></a>

#### PARQUET

<a id="bw_processing.constants.NUMPY_SERIALIZE_FORMAT_EXTENSION"></a>

#### NUMPY\_SERIALIZE\_FORMAT\_EXTENSION

<a id="bw_processing.constants.NUMPY_SERIALIZE_FORMAT_NAME"></a>

#### NUMPY\_SERIALIZE\_FORMAT\_NAME

<a id="bw_processing.constants.PARQUET_SERIALIZE_FORMAT_EXTENSION"></a>

#### PARQUET\_SERIALIZE\_FORMAT\_EXTENSION

<a id="bw_processing.constants.PARQUET_SERIALIZE_FORMAT_NAME"></a>

#### PARQUET\_SERIALIZE\_FORMAT\_NAME
