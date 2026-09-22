**Generated API reference** · package `sentier-vocab` 0.0.2 · module `sentier_vocab.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-vocab repo && git -C repo checkout ef440c6
SP=repo/app
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
  -I "$SP" -m sentier_vocab.utils cfg.yml > sentier_vocab.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_vocab.utils"></a>

# sentier\_vocab.utils

<a id="sentier_vocab.utils.DEFAULT_DATA_DIR"></a>

#### DEFAULT\_DATA\_DIR

<a id="sentier_vocab.utils.get_filename"></a>

#### get\_filename

```python
def get_filename(response: requests.Response, url: str) -> str
```

Get filename from response headers or URL.

<a id="sentier_vocab.utils.streaming_download"></a>

#### streaming\_download

```python
def streaming_download(url: str,
                       filename: str | None = None,
                       dirpath: Path | None = None,
                       chunk_size: int = 4096 * 8) -> Path
```

Download file from URL.

Parameters
----------
url : str
    URL to download from.
filename : str, optional
    Filename to save to. If not given, will be determined from URL.
dirpath : Path, optional
    Directory to save to. If not given, will be current working directory.
chunk_size : int, optional
    Chunk size to use when downloading.

Returns
-------
pathlib.Path
    Path to downloaded file.

<a id="sentier_vocab.utils.get_one_in_graph"></a>

#### get\_one\_in\_graph

```python
def get_one_in_graph(graph: Graph, criteria: tuple) -> tuple
```

<a id="sentier_vocab.utils.get_latest_github_file_from_release"></a>

#### get\_latest\_github\_file\_from\_release

```python
def get_latest_github_file_from_release(
        repo_url: str,
        filepath: str,
        data_dir: Path = DEFAULT_DATA_DIR) -> TextIO
```

<a id="sentier_vocab.utils.GithubZipfileRelease"></a>

## GithubZipfileRelease Objects

```python
class GithubZipfileRelease()
```

<a id="sentier_vocab.utils.GithubZipfileRelease.__init__"></a>

#### \_\_init\_\_

```python
def __init__(repo_url: str, data_dir: Path = DEFAULT_DATA_DIR) -> None
```

<a id="sentier_vocab.utils.GithubZipfileRelease.get_zipball_url"></a>

#### get\_zipball\_url

```python
def get_zipball_url(repo_url: str) -> str
```

<a id="sentier_vocab.utils.GithubZipfileRelease.get_latest_version"></a>

#### get\_latest\_version

```python
def get_latest_version(data_dir: Path, catalogue_filepath: Path,
                       zipball_url: str) -> Path
```

<a id="sentier_vocab.utils.GithubZipfileRelease.get_zipfile_prefix"></a>

#### get\_zipfile\_prefix

```python
def get_zipfile_prefix() -> str
```

<a id="sentier_vocab.utils.GithubZipfileRelease.get_file_in_archive"></a>

#### get\_file\_in\_archive

```python
def get_file_in_archive(path: str) -> TextIO
```

<a id="sentier_vocab.utils.get_file_in_downloadable_zip_archive"></a>

#### get\_file\_in\_downloadable\_zip\_archive

```python
def get_file_in_downloadable_zip_archive(url: str,
                                         path: str,
                                         data_dir: Path = DEFAULT_DATA_DIR
                                         ) -> TextIO
```
