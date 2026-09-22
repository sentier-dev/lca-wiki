**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.extractors.ecospold1` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.extractors.ecospold1 cfg.yml > bw2io.extractors.ecospold1.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.extractors.ecospold1"></a>

# bw2io.extractors.ecospold1

<a id="bw2io.extractors.ecospold1.robust_text"></a>

#### robust\_text

```python
def robust_text(root: etree.ElementBase, attribute: str) -> Optional[str]
```

Just because the spec says it must be there doesn't mean it will be.

<a id="bw2io.extractors.ecospold1.robust_nested_attribute"></a>

#### robust\_nested\_attribute

```python
def robust_nested_attribute(root: etree.ElementBase, attr1: str,
                            attr2: str) -> Any
```

Try to get nested attribute, and fail gracefully.

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor"></a>

## Ecospold1DataExtractor Objects

```python
class Ecospold1DataExtractor()
```

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.extract"></a>

#### extract

```python
@classmethod
def extract(cls,
            path: Union[str, Path, StringIO],
            db_name: str,
            use_mp: bool = True)
```

Extract data from ecospold1 files.

Parameters
----------
path : str
    Path to the directory containing the ecospold1 files or path to a single file.
db_name : str
    Name of the database.
use_mp : bool, optional
    If True, uses multiprocessing to parallelize extraction of data from multiple files, by default True.

Returns
-------
list
    List of dictionaries containing data from the ecospold1 files.

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_file"></a>

#### process\_file

```python
@classmethod
def process_file(cls, filepath: Union[str, Path, StringIO], db_name: str)
```

Process a single ecospold1 file.

Parameters
----------
filepath : str
    Path to the ecospold1 file.
db_name : str
    Name of the database.

Returns
-------
list
    List of dictionaries containing data from the ecospold1 file.

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_dataset"></a>

#### process\_dataset

```python
@classmethod
def process_dataset(cls, dataset: pyecospold.model_v1.Dataset,
                    filename: Union[str, Path, StringIO], db_name: str)
```

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_exchanges"></a>

#### process\_exchanges

```python
@classmethod
def process_exchanges(cls, dataset)
```

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_allocation"></a>

#### process\_allocation

```python
@classmethod
def process_allocation(cls, exc, dataset)
```

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_exchange"></a>

#### process\_exchange

```python
@classmethod
def process_exchange(cls, exc, dataset)
```

Process exchange.

Input groups are:

    1. Materials/fuels
    2. Electricity/Heat
    3. Services
    4. FromNature
    5. FromTechnosphere

Output groups are:

    0. Reference product
    1. Include avoided product system
    2. Allocated byproduct
    3. Waste to treatment
    4. ToNature

A single-output process will have one output group 0; A MO process will have multiple output group 2s. Output groups 1 and 3 are not used in ecoinvent.

<a id="bw2io.extractors.ecospold1.Ecospold1DataExtractor.process_uncertainty_fields"></a>

#### process\_uncertainty\_fields

```python
@classmethod
def process_uncertainty_fields(cls, exc, data)
```
