**Generated API reference** · package `bw2data` 4.7 · module `bw2data.fatomic` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2data.fatomic cfg.yml > bw2data.fatomic.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.fatomic"></a>

# bw2data.fatomic

<a id="bw2data.fatomic.open"></a>

#### open

```python
@contextlib.contextmanager
def open(filename, mode, *args, **kwargs)
```

<a id="bw2data.fatomic.write"></a>

#### write

```python
def write(filename, lines, binary=False)
```

<a id="bw2data.fatomic.writeall"></a>

#### writeall

```python
def writeall(filename, contents, binary=None)
```

<a id="bw2data.fatomic.writechunks"></a>

#### writechunks

<a id="bw2data.fatomic.transform"></a>

#### transform

```python
def transform(filename, func, binary=False)
```

<a id="bw2data.fatomic.transformall"></a>

#### transformall

```python
def transformall(filename, func, binary=False)
```

<a id="bw2data.fatomic.transformchunks"></a>

#### transformchunks

```python
def transformchunks(filename, func, chunksize=None, binary=False)
```

<a id="bw2data.fatomic.append"></a>

#### append

```python
def append(filename, lines, binary=False)
```

<a id="bw2data.fatomic.appendall"></a>

#### appendall

```python
def appendall(filename, contents, binary=False)
```

<a id="bw2data.fatomic.appendchunks"></a>

#### appendchunks

<a id="bw2data.fatomic.test"></a>

#### test

```python
def test()
```
