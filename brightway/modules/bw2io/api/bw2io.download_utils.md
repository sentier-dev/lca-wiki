**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.download_utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.download_utils cfg.yml > bw2io.download_utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.download_utils"></a>

# bw2io.download\_utils

<a id="bw2io.download_utils.get_filename"></a>

#### get\_filename

```python
def get_filename(response)
```

Get filename from response headers or URL.

Parameters
----------
response : requests.Response

Returns
-------
str
    Filename

<a id="bw2io.download_utils.download_with_progressbar"></a>

#### download\_with\_progressbar

```python
def download_with_progressbar(url,
                              filename=None,
                              dirpath=None,
                              chunk_size=4096 * 8)
```

Download file from URL and show progress bar.

Parameters
----------
url : str
    URL to download from.
filename : str, optional
    Filename to save to. If not given, will be determined from URL.
dirpath : str, optional
    Directory to save to. If not given, will be current working directory.
chunk_size : int, optional
    Chunk size to use when downloading.

Returns
-------
pathlib.Path
    Path to downloaded file.
