**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.json_ld` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2io==0.9.17'
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
  -I "$SP" -m bw2io.extractors.json_ld cfg.yml > bw2io.extractors.json_ld.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.json_ld"></a>

# bw2io.extractors.json\_ld

<a id="bw2io.extractors.json_ld.FILES_TO_IGNORE"></a>

#### FILES\_TO\_IGNORE

<a id="bw2io.extractors.json_ld.DIRECTORIES_TO_IGNORE"></a>

#### DIRECTORIES\_TO\_IGNORE

<a id="bw2io.extractors.json_ld.JSONLDExtractor"></a>

## JSONLDExtractor Objects

```python
class JSONLDExtractor(object)
```

Extract JSON-LD from a directory.

Attributes
----------
FILES_TO_IGNORE: set
    Files to ignore when extracting JSON-LD data.
DIRECTORIES_TO_IGNORE: set
    Directories to ignore when extracting JSON-LD data.

<a id="bw2io.extractors.json_ld.JSONLDExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls, filepath, add_filename=True, **kwargs)
```

Extracts JSON-LD data from the filepath.

Parameters
----------
filepath : str or Path
    The path of the directory from which data will be extracted
add_filename : bool, optional
    Add the name to the extracted data. By default, True.

Returns
-------
dict
    A dictionary with the extracted JSON-LD data.

Raises
------
ValueError
    If the file is not a zip archive.
NotImplementedError
    If extraction of zip archives is not yet supported.
