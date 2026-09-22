**Generated API reference** · package `bw2data` 4.7 · module `bw2data.filesystem` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.filesystem cfg.yml > bw2data.filesystem.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.filesystem"></a>

# bw2data.filesystem

<a id="bw2data.filesystem.re_slugify"></a>

#### re\_slugify

<a id="bw2data.filesystem.create_dir"></a>

#### create\_dir

```python
def create_dir(dirpath)
```

Create directory tree to `dirpath`; ignore if already exists

<a id="bw2data.filesystem.check_dir"></a>

#### check\_dir

```python
def check_dir(directory)
```

Returns ``True`` if given path is a directory and writeable, ``False`` otherwise.

<a id="bw2data.filesystem.md5"></a>

#### md5

```python
def md5(filepath, blocksize=65536)
```

Generate MD5 hash for file at `filepath`
