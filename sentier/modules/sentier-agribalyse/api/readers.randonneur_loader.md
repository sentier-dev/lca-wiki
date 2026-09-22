**Generated API reference** · package `sentier-agribalyse` 0.3.0 · module `readers.randonneur_loader` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
git clone https://github.com/sentier-dev/sentier-agribalyse repo && git -C repo checkout 3d0df56
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
  -I "$SP" -m readers.randonneur_loader cfg.yml > readers.randonneur_loader.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="readers.randonneur_loader"></a>

# readers.randonneur\_loader

Read randonneur datapackages directly from the installed ``randonneur_data``.

Bundled packages are not vendored into ``source/``; they ship with the
``randonneur_data`` Python package and are read in place via its
``Registry.get_file(label)`` API — which handles case-mapping,
compression (.gz/.lzma) and filename resolution.

<a id="readers.randonneur_loader.RandonneurDataLoader"></a>

## RandonneurDataLoader Objects

```python
@dataclass(frozen=True)
class RandonneurDataLoader()
```

Load bundled randonneur datapackages by registry label.

<a id="readers.randonneur_loader.RandonneurDataLoader.data_dir"></a>

#### data\_dir

```python
@cached_property
def data_dir() -> Path
```

<a id="readers.randonneur_loader.RandonneurDataLoader.labels"></a>

#### labels

```python
def labels() -> list[str]
```

All registered package labels (capitalisation as authored).

<a id="readers.randonneur_loader.RandonneurDataLoader.metadata"></a>

#### metadata

```python
def metadata(label: str) -> dict[str, Any]
```

Just the registry entry (name, filename, compression, mapping, …).

<a id="readers.randonneur_loader.RandonneurDataLoader.load"></a>

#### load

```python
def load(label: str) -> dict[str, Any]
```

Return the fully-decoded datapackage dict for ``label``.

<a id="readers.randonneur_loader.RandonneurDataLoader.has"></a>

#### has

```python
def has(label: str) -> bool
```
