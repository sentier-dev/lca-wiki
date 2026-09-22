**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.ecospold2` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.ecospold2 cfg.yml > bw2io.importers.ecospold2.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.ecospold2"></a>

# bw2io.importers.ecospold2

<a id="bw2io.importers.ecospold2.SingleOutputEcospold2Importer"></a>

## SingleOutputEcospold2Importer Objects

```python
class SingleOutputEcospold2Importer(LCIImporter)
```

Class for importing single-output ecospold2 format LCI databases.

Raises
------
MultiprocessingError
    If an error occurs during multiprocessing.

<a id="bw2io.importers.ecospold2.SingleOutputEcospold2Importer.format"></a>

#### format

<a id="bw2io.importers.ecospold2.SingleOutputEcospold2Importer.__init__"></a>

#### \_\_init\_\_

```python
def __init__(dirpath: str,
             db_name: str,
             biosphere_database_name: Optional[str] = None,
             extractor: Any = Ecospold2DataExtractor,
             use_mp: bool = True,
             signal: Any = None,
             reparametrize_lognormals: bool = False,
             add_product_information: bool = True,
             separate_products: bool = False,
             cache: bool = False)
```

Initializes the SingleOutputEcospold2Importer class instance.

Parameters
----------
dirpath : str
    Path to the directory containing the ecospold2 file.
db_name : str
    Name of the LCI database.
biosphere_database_name : str | None
    Name of biosphere database to link to. Uses `config.biosphere` if not provided.
extractor : class
    Class for extracting data from the ecospold2 file, by default Ecospold2DataExtractor.
use_mp : bool
    Flag to indicate whether to use multiprocessing, by default True.
signal : object
    Object to indicate the status of the import process, by default None.
reparametrize_lognormals: bool
    Flag to indicate if lognormal distributions for exchanges should be reparametrized
    such that the mean value of the resulting distribution meets the amount
    defined for the exchange.
add_product_information: bool
    Add the `productInformation` text from `MasterData/IntermediateExchanges.xml` to
    `product_information`.
separate_products: bool
    Import processes and products as separate nodes in the supply chain graph.
cache: bool
    Cache extracted datasets as `.json.gz` files alongside the source `.spold` files
    for faster re-imports. Off by default.
