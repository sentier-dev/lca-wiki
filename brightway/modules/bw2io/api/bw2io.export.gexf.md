**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.export.gexf` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.export.gexf cfg.yml > bw2io.export.gexf.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.export.gexf"></a>

# bw2io.export.gexf

<a id="bw2io.export.gexf.DatabaseToGEXF"></a>

## DatabaseToGEXF Objects

```python
class DatabaseToGEXF(object)
```

Export a Gephi graph for a database.

Parameters
----------
database : str
    Database name.
include_descendants : bool, optional
    Include databases which are linked from ``database``. (default False)

Warnings
--------
``include_descendants`` is not yet implemented.

Raises
------
NotImplemented
    If ``include_descendants`` is True, as this option is not yet implemented.

Methods
-------
export()
    Export the Gephi XML file.
get_data(E)
    Get the nodes and edges for the Gephi XML file.

Examples
--------
>>> dtg = DatabaseToGEXF(database='example_db', include_descendants=False)
>>> dtg.export()
'/path/to/example_db.gexf'

>>> dtg = DatabaseToGEXF(database='example_db', include_descendants=True)
>>> dtg.get_data()
(nodes, edges)

<a id="bw2io.export.gexf.DatabaseToGEXF.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database, include_descendants=False)
```

<a id="bw2io.export.gexf.DatabaseToGEXF.export"></a>

#### export

```python
def export()
```

Export the Gephi XML file.

Parameters
----------
None

Returns
-------
str
    Filepath of the created file.

Examples
--------
>>> dtg = DatabaseToGEXF(database='example_db', include_descendants=False)
>>> dtg.export()
'/path/to/example_db.gexf'

<a id="bw2io.export.gexf.DatabaseToGEXF.get_data"></a>

#### get\_data

```python
def get_data(E)
```

Get Gephi nodes and edges.

Parameters
----------
E : lxml.builder.ElementMaker
    ElementMaker object for GEXF XML

Returns
-------
nodes : lxml.etree._Element
    GEXF nodes
edges : lxml.etree._Element
    GEXF edges

Examples
--------
>>> dtg = DatabaseToGEXF(database='example_db', include_descendants=False)
>>> dtg.get_data(E)
(nodes, edges)

<a id="bw2io.export.gexf.DatabaseSelectionToGEXF"></a>

## DatabaseSelectionToGEXF Objects

```python
class DatabaseSelectionToGEXF(DatabaseToGEXF)
```

Export a Gephi graph for a selection of activities from a database.

Also includes all inputs for the filtered activities.

Parameters
----------
database : str
    Database name.
keys : str
    The activity keys to export.

Examples
--------
>>> dstg = DatabaseSelectionToGEXF(database='example_db', keys=['foo', 'bar'])

<a id="bw2io.export.gexf.DatabaseSelectionToGEXF.__init__"></a>

#### \_\_init\_\_

```python
def __init__(database, keys)
```

<a id="bw2io.export.gexf.keyword_to_gephi_graph"></a>

#### keyword\_to\_gephi\_graph

```python
def keyword_to_gephi_graph(database, keyword)
```

Export a Gephi graph for a database for all activities whose names include the string ``keyword``.

Parameters
----------
database : str
    Database name.
keyword : str
    Keyword to search for.

Returns
-------
str
    The filepath of the exported file.

Examples
--------
>>> keyword_to_gephi_graph(database='example_db', keyword='foo')
'/path/to/example_db.gexf'
