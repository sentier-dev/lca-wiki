**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.ecospold1` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.ecospold1 cfg.yml > bw2io.importers.ecospold1.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.ecospold1"></a>

# bw2io.importers.ecospold1

<a id="bw2io.importers.ecospold1.SingleOutputEcospold1Importer"></a>

## SingleOutputEcospold1Importer Objects

```python
class SingleOutputEcospold1Importer(LCIImporter)
```

Import and process single-output datasets in the ecospold 1 format.

Notes
-----
Applies the following strategies:
1. If only one exchange is a production exchange, that is the reference product.
2. Delete (unreliable) integer codes from extracted data.
3. Drop ``unspecified`` subcategories from biosphere flows.
4. Normalize biosphere flow categories to ecoinvent 3.1 standard.
5. Normalize biosphere flow names to ecoinvent 3.1 standard.
6. Remove locations from biosphere exchanges.
7. Create a ``code`` from the activity hash of the dataset.
8. Link biosphere exchanges to the default biosphere database.
9. Link internal technosphere exchanges.

<a id="bw2io.importers.ecospold1.SingleOutputEcospold1Importer.format"></a>

#### format

<a id="bw2io.importers.ecospold1.SingleOutputEcospold1Importer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(filepath, db_name, use_mp=True, extractor=Ecospold1DataExtractor)
```

Parameters
----------
filepath: str or Path
    File or directory path.
db_name: str
    Name of database to create.
use_mp: bool, optional
    Whether to use multiprocessing. Default is True.
extractor: Type[Ecospold1DataExtractor], optional
    Data extractor to use. Default is Ecospold1DataExtractor.

<a id="bw2io.importers.ecospold1.NoIntegerCodesEcospold1Importer"></a>

## NoIntegerCodesEcospold1Importer Objects

```python
class NoIntegerCodesEcospold1Importer(SingleOutputEcospold1Importer)
```

An importer class that deletes integer codes from ecospold1 datasets.

Parameters
----------
SingleOutputEcospold1Importer : class
    The base importer class.

Attributes
----------
strategies : list
    A list of strategies that the importer applies to process the dataset.

Returns
-------
None

<a id="bw2io.importers.ecospold1.NoIntegerCodesEcospold1Importer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

Initialize NoIntegerCodesEcospold1Importer.

Parameters
----------
*args : tuple
    Variable length argument list.
**kwargs : dict
    Arbitrary keyword arguments.

Returns
-------
None

<a id="bw2io.importers.ecospold1.MultiOutputEcospold1Importer"></a>

## MultiOutputEcospold1Importer Objects

```python
class MultiOutputEcospold1Importer(SingleOutputEcospold1Importer)
```

Import and process multi-output datasets in the ecospold 1 format.

Works the same as the single-output importer, but first allocates multioutput datasets.

Attributes
----------
strategies : list
    A list of strategies that the importer applies to process the dataset.

Returns
-------
None

<a id="bw2io.importers.ecospold1.MultiOutputEcospold1Importer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

Initialize MultiOutputEcospold1Importer.

Parameters
----------
*args : tuple
    Variable length argument list.
**kwargs : dict
    Arbitrary keyword arguments.

Returns
-------
None
