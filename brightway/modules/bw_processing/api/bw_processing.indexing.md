**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.indexing` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.indexing cfg.yml > bw_processing.indexing.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.indexing"></a>

# bw\_processing.indexing

<a id="bw_processing.indexing.reset_index"></a>

#### reset\_index

```python
def reset_index(datapackage: Union[Datapackage, AbstractFileSystem],
                metadata_name: str) -> Datapackage
```

Reset the numerical indices in ``datapackage`` to sequential integers starting from zero.

Updates the datapackage in place.

**Arguments**:

  
  * datapackage: datapackage or `Filesystem`. Input to `load_datapackage` function.
  * metadata_name: Name identifying a CSV metadata resource in ``datapackage``
  

**Returns**:

  
  Datapackage instance with modified data

<a id="bw_processing.indexing.reindex"></a>

#### reindex

```python
def reindex(datapackage: Union[Datapackage, AbstractFileSystem],
            metadata_name: str,
            data_iterable: Iterable,
            fields: List[str] = None,
            id_field_datapackage: str = "id",
            id_field_destination: str = "id") -> None
```

Use the metadata to set the integer indices in ``datapackage`` to those used in ``data_iterable``.

Used in data exchange. Often, the integer ids provided in the data package are arbitrary, and need to be mapped to the values present in your database.

Updates the datapackage in place.

**Arguments**:

  
  * datapackage: datapackage of `Filesystem`. Input to `load_datapackage` function.
  * metadata_name: Name identifying a CSV metadata resource in ``datapackage``
  * data_iterable: Iterable which returns objects that support ``.get()``.
  * fields: Optional list of fields to use while matching
  * id_field_datapackage: String identifying the column providing an integer id in the datapackage
  * id_field_destination: String identifying the column providing an integer id in ``data_iterable``
  

**Raises**:

  
  * KeyError: ``data_iterable`` is missing ``id_field_destination`` field
  * KeyError: ``metadata_name`` is missing ``id_field_datapackage`` field
  * NonUnique: Multiple objects found in ``data_iterable`` which matches fields in ``datapackage``
  * KeyError: ``metadata_name`` is not in ``datapackage``
  * KeyError: No object found in ``data_iterable`` which matches fields in ``datapackage``
  * ValueError: ``metadata_name`` is not CSV metadata.
  * ValueError: The resources given for ``metadata_name`` are not present in this ``datapackage``
  * AttributeError: ``data_iterable`` doesn't support field retrieval using ``.get()``.
  

**Returns**:

  
  Datapackage instance with modified data
