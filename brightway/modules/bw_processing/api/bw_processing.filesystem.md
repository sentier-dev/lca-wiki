**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.filesystem` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.filesystem cfg.yml > bw_processing.filesystem.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.filesystem"></a>

# bw\_processing.filesystem

<a id="bw_processing.filesystem.re_slugify"></a>

#### re\_slugify

<a id="bw_processing.filesystem.SUBSTITUTION_RE"></a>

#### SUBSTITUTION\_RE

<a id="bw_processing.filesystem.MULTI_RE"></a>

#### MULTI\_RE

<a id="bw_processing.filesystem.clean_datapackage_name"></a>

#### clean\_datapackage\_name

```python
def clean_datapackage_name(name: str) -> str
```

Clean string ``name`` of characters not allowed in data package names.

Replaces with underscores, and drops multiple underscores.

<a id="bw_processing.filesystem.safe_filename"></a>

#### safe\_filename

```python
def safe_filename(string: Union[str, bytes],
                  add_hash: bool = True,
                  full: bool = False) -> str
```

Convert arbitrary strings to make them safe for filenames. Substitutes strange characters, and uses unicode normalization.

if `add_hash`, appends hash of `string` to avoid name collisions.

From http://stackoverflow.com/questions/295135/turn-a-string-into-a-valid-filename-in-python

<a id="bw_processing.filesystem.md5"></a>

#### md5

```python
def md5(filepath: Union[str, Path], blocksize: int = 65536) -> str
```

Generate MD5 hash for file at `filepath`
