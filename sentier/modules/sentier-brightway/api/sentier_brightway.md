**Generated API reference** · package `sentier-brightway` 0.1.0 · module `sentier_brightway` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m sentier_brightway cfg.yml > sentier_brightway.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="sentier_brightway"></a>

# sentier\_brightway

sentier-brightway: install Sentier data into a Brightway project.

<a id="sentier_brightway.assemble"></a>

#### assemble

```python
def assemble(data_root: Path | str | None = None,
             include_nomenclature: bool = True) -> BuildResult
```

Read the Sentier data (local root or verified download) and build the node dicts.

<a id="sentier_brightway.coverage"></a>

#### coverage

```python
def coverage(data_root: Path | str | None = None,
             include_nomenclature: bool = True) -> Coverage
```

Linking coverage without touching Brightway.

<a id="sentier_brightway.import_bafu_db"></a>

#### import\_bafu\_db

```python
def import_bafu_db(project: str,
                   overwrite: bool = False,
                   data_root: Path | str | None = None,
                   include_nomenclature: bool = True) -> Coverage
```

Install BAFU-2026 + EF 3.1 biosphere + EF 3.1 methods into ``project``.

Run inside the Python environment where Brightway / Activity Browser is installed.
``include_nomenclature=False`` keeps BAFU flows whose EF counterpart has no factor in
the residual database instead of relinking them.

With ``overwrite`` the previous install is removed before the new one is written; if
the write fails part-way, re-running with ``overwrite=True`` (CLI: ``--overwrite``) is
the recovery step.

<a id="sentier_brightway.import_bafu_files"></a>

#### import\_bafu\_files

```python
def import_bafu_files(out_dir: Path | str,
                      data_root: Path | str | None = None,
                      include_nomenclature: bool = True,
                      datapackages: bool = True,
                      overwrite: bool = False) -> Coverage
```

Write BAFU-2026 + EF 3.1 as plain files instead of a bw2data project.

``out_dir`` receives ``registry/`` (parquet tables joined by integer ``bw_id``),
``mappings/`` (every JSON of the bridge folder, copied verbatim; ``manifest.bridge_packages``
lists the packages that were applied and ``include_nomenclature`` says whether the order-4
package was), ``bw_package/``
(bw_processing datapackages for ``bw2calc.LCA`` with no bw2data project; skipped with
``datapackages=False``) and ``manifest.json``. Read them back with
``sentier_brightway.registry.load_registry`` and
``sentier_brightway.datapackage.load_inventory_datapackage`` /
``load_method_datapackage`` / ``score``.

A non-empty ``out_dir`` is refused unless ``overwrite=True``, and even then only a
previous export (a folder with a ``manifest.json``) is replaced; anything else is left
alone.
