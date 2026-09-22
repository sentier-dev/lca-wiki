**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.io_helpers` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.io_helpers cfg.yml > bw_processing.io_helpers.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.io_helpers"></a>

# bw\_processing.io\_helpers

<a id="bw_processing.io_helpers.generic_directory_filesystem"></a>

#### generic\_directory\_filesystem

```python
def generic_directory_filesystem(*, dirpath: Path) -> DirFileSystem
```

Return a ``DirFileSystem`` rooted at ``dirpath``, creating it if needed.

**Arguments**:

- `dirpath` - Path to the target directory. Created if it does not exist;
  its parent must already exist.
  

**Returns**:

  A ``fsspec`` ``DirFileSystem`` pointing at ``dirpath``.
  

**Raises**:

- `ValueError` - Parent directory does not exist.
- `AssertionError` - ``dirpath`` is not a ``pathlib.Path``.

<a id="bw_processing.io_helpers.generic_zipfile_filesystem"></a>

#### generic\_zipfile\_filesystem

```python
def generic_zipfile_filesystem(
        *,
        dirpath: Path,
        filename: str,
        write: bool = True,
        compression: int = zipfile.ZIP_DEFLATED,
        compresslevel: Optional[int] = None) -> ZipFileSystem
```

Return a ``ZipFileSystem`` for ``dirpath / filename``.

**Arguments**:

- `dirpath` - Directory that contains (or will contain) the zip file.
  Must already exist.
- `filename` - Name of the zip file (e.g. ``"my-dp.zip"``).
- `write` - If ``True`` (default), open for writing; otherwise open for
  reading.
- `compression` - ``zipfile`` compression constant.  Defaults to
  ``zipfile.ZIP_DEFLATED`` which gives good compression speed.
  Pass ``zipfile.ZIP_STORED`` for no compression or
  ``zipfile.ZIP_LZMA`` for maximum compression.
- `compresslevel` - Compression level passed to ``zipfile.ZipFile``;
  ``None`` uses the default for the chosen algorithm.
  

**Returns**:

  A ``fsspec`` ``ZipFileSystem``.
  

**Raises**:

- `ValueError` - ``dirpath`` does not exist.
- `AssertionError` - ``dirpath`` is not a ``pathlib.Path``.

<a id="bw_processing.io_helpers.file_reader"></a>

#### file\_reader

```python
def file_reader(*,
                fs: AbstractFileSystem,
                resource: str,
                mimetype: str,
                proxy: bool = False,
                mmap_mode: Union[str, None] = None,
                **kwargs) -> Any
```

<a id="bw_processing.io_helpers.file_writer"></a>

#### file\_writer

```python
def file_writer(*,
                data: Any,
                fs: AbstractFileSystem,
                resource: str,
                mimetype: str,
                matrix_serialize_format_type:
                MatrixSerializeFormat = MatrixSerializeFormat.NUMPY,
                meta_object: Optional[str] = None,
                meta_type: Optional[str] = None,
                **kwargs) -> None
```
