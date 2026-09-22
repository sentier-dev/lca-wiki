**Generated API reference** · package `bw_processing` 1.6 · module `bw_processing.proxies` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw_processing.proxies cfg.yml > bw_processing.proxies.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw_processing.proxies"></a>

# bw\_processing.proxies

<a id="bw_processing.proxies.UndefinedInterface"></a>

## UndefinedInterface Objects

```python
class UndefinedInterface()
```

An interface to external data that isn't saved to disk.

<a id="bw_processing.proxies.Proxy"></a>

## Proxy Objects

```python
class Proxy()
```

Deferred file-read wrapper returned when ``proxy=True`` is passed to ``file_reader``.

Stores the reader function and its arguments without executing them. The
actual data is loaded the first time the proxy is called (i.e. when
``get_resource`` resolves it). The file or buffer is rewound to position 0
before each call so that repeated calls return the same data.

<a id="bw_processing.proxies.Proxy.__init__"></a>

#### \_\_init\_\_

```python
def __init__(func, label, kwargs)
```

<a id="bw_processing.proxies.Proxy.__call__"></a>

#### \_\_call\_\_

```python
def __call__()
```

Retrieve the data.

Rewinds the file or buffer to 0, see https://github.com/brightway-lca/bw_processing/issues/9.
