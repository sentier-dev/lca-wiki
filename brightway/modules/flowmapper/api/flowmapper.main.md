**Generated API reference** · package `flowmapper` 0.4 · module `flowmapper.main` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'flowmapper==0.4'
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
  -I "$SP" -m flowmapper.main cfg.yml > flowmapper.main.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="flowmapper.main"></a>

# flowmapper.main

<a id="flowmapper.main.logger"></a>

#### logger

<a id="flowmapper.main.sorting_function"></a>

#### sorting\_function

```python
def sorting_function(obj: dict) -> tuple
```

<a id="flowmapper.main.OutputFormat"></a>

## OutputFormat Objects

```python
class OutputFormat(str, Enum)
```

<a id="flowmapper.main.OutputFormat.all"></a>

#### all

<a id="flowmapper.main.OutputFormat.glad"></a>

#### glad

<a id="flowmapper.main.OutputFormat.randonneur"></a>

#### randonneur

<a id="flowmapper.main.flowmapper"></a>

#### flowmapper

```python
def flowmapper(source: Path,
               target: Path,
               mapping_source: dict,
               mapping_target: dict,
               source_id: str,
               target_id: str,
               contributors: list,
               output_dir: Path,
               format: OutputFormat,
               version: str = "1.0.0",
               default_transformations: bool = True,
               transformations: Optional[list[Path | str]] = None,
               unmatched_source: bool = True,
               unmatched_target: bool = True,
               matched_source: bool = False,
               matched_target: bool = False,
               licenses: Optional[list] = None,
               homepage: Optional[str] = None,
               name: Optional[str] = None) -> Flowmap
```

Generate mappings between elementary flows lists
