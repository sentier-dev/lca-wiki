**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.fetch` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-brightway repo && git -C repo checkout a9dba75
SP=repo/src
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
  -I "$SP" -m sentier_brightway.fetch cfg.yml > sentier_brightway.fetch.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.fetch"></a>

# sentier\_brightway.fetch

Resolve where Sentier data is read from: a local checkout or a verified download cache.

<a id="sentier_brightway.fetch.ENV_VAR"></a>

#### ENV\_VAR

<a id="sentier_brightway.fetch.RAW"></a>

#### RAW

<a id="sentier_brightway.fetch.FetchError"></a>

## FetchError Objects

```python
class FetchError(RuntimeError)
```

A pinned file could not be downloaded to, or written into, the local cache.

<a id="sentier_brightway.fetch.IntegrityError"></a>

## IntegrityError Objects

```python
class IntegrityError(FetchError)
```

A downloaded file does not match the sha256 pinned in sources.toml.

<a id="sentier_brightway.fetch.Source"></a>

## Source Objects

```python
@dataclass(frozen=True)
class Source()
```

<a id="sentier_brightway.fetch.Source.name"></a>

#### name

folder name under the data root, e.g. sentier-inventory

<a id="sentier_brightway.fetch.Source.repo"></a>

#### repo

GitHub owner/name

<a id="sentier_brightway.fetch.Source.ref"></a>

#### ref

commit sha

<a id="sentier_brightway.fetch.Source.files"></a>

#### files

repo-relative path -> sha256

<a id="sentier_brightway.fetch.Source.url"></a>

#### url

```python
def url(path: str) -> str
```

<a id="sentier_brightway.fetch.parse_manifest"></a>

#### parse\_manifest

```python
def parse_manifest(text: str) -> tuple[Source, ...]
```

<a id="sentier_brightway.fetch.load_packaged_manifest"></a>

#### load\_packaged\_manifest

```python
def load_packaged_manifest() -> tuple[Source, ...]
```

<a id="sentier_brightway.fetch.manifest_key"></a>

#### manifest\_key

```python
def manifest_key(manifest: tuple[Source, ...]) -> str
```

Stable cache-directory name covering every source's name, repo, ref and file digests.

Changing any single ref, or any single file's pinned sha256, changes this key, so a stale
cache is never mistaken for a fresh one. Nothing prunes old key directories yet (each is
roughly the size of the manifest's payload, ~36 MB for the current one).

<a id="sentier_brightway.fetch.materialize"></a>

#### materialize

```python
def materialize(manifest: tuple[Source, ...], cache_dir: Path) -> Path
```

Ensure every pinned file exists in ``cache_dir`` with the right hash; return the root.

<a id="sentier_brightway.fetch.default_cache_dir"></a>

#### default\_cache\_dir

```python
def default_cache_dir() -> Path
```

<a id="sentier_brightway.fetch.resolve_data_root"></a>

#### resolve\_data\_root

```python
def resolve_data_root(data_root: Path | str | None) -> Path
```

Explicit argument, then ``$SENTIER_DATA_ROOT``, then the verified download cache.

The argument and the env var are both ``expanduser()``-ed and must already exist as a
directory (a ``<workspace>``-shaped local checkout); only the download-cache path is created on
demand, since it is the one path this package is allowed to write to.
