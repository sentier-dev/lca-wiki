**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway.files` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway.files cfg.yml > sentier_brightway.files.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway.files"></a>

# sentier\_brightway.files

Write the file-mode output folder: registry parquet, applied mappings, datapackages,
manifest.

<a id="sentier_brightway.files.LAYOUT_VERSION"></a>

#### LAYOUT\_VERSION

<a id="sentier_brightway.files.MAPPINGS_DIR"></a>

#### MAPPINGS\_DIR

<a id="sentier_brightway.files.ExistingOutputError"></a>

## ExistingOutputError Objects

```python
class ExistingOutputError(RuntimeError)
```

``out_dir`` cannot be (re)used: it is a file or symlink, it is not empty and
``overwrite`` is False, or ``overwrite`` is True but it is not a previous export.

<a id="sentier_brightway.files.write_files"></a>

#### write\_files

```python
def write_files(result: BuildResult,
                data_root: Path,
                out_dir: Path,
                datapackages: bool = True,
                overwrite: bool = False,
                include_nomenclature: bool = True) -> Path
```

Write the output folder. ``include_nomenclature`` must match the value ``result`` was
built with; it is recorded in the manifest together with the packages actually applied.
