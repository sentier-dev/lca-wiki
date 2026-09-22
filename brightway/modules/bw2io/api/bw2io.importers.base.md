**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.importers.base` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.importers.base cfg.yml > bw2io.importers.base.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.importers.base"></a>

# bw2io.importers.base

<a id="bw2io.importers.base.ImportBase"></a>

## ImportBase Objects

```python
class ImportBase(object)
```

Base class for format-specific importers.
Defines workflow for applying strategies.

<a id="bw2io.importers.base.ImportBase.__init__"></a>

#### \_\_init\_\_

```python
def __init__(*args, **kwargs)
```

Initialize the ImportBase object.

Parameters
----------
*args :
    Variable length argument list.
**kwargs :
    Arbitrary keyword arguments.

Raises
------
NotImplemented :
    This class should be subclassed.

<a id="bw2io.importers.base.ImportBase.__iter__"></a>

#### \_\_iter\_\_

```python
def __iter__()
```

Iterate over the data and yield the current data.

Yields
------
ds :
    The current data being iterated over.

<a id="bw2io.importers.base.ImportBase.apply_strategy"></a>

#### apply\_strategy

```python
def apply_strategy(strategy, verbose=True)
```

Apply the specified strategy transform to the importer's data.

This method applies a given strategy to the importer's data and logs the applied strategy's name to
`self.applied_strategies`. If the strategy raises a `StrategyError`, the error message is printed but
not raised.

Parameters
----------
strategy : callable
    The strategy function to apply to the importer's data.
verbose : bool, optional
    If True, print a message indicating which strategy is being applied. Defaults to True.

Returns
-------
None
    Modifies the importer's data in place.

Raises
------
None
    If the strategy raises a `StrategyError`, the error message is printed but not raised.

Notes
-----
Strategies should not partially modify data before raising a `StrategyError`.

<a id="bw2io.importers.base.ImportBase.apply_strategies"></a>

#### apply\_strategies

```python
def apply_strategies(strategies=None, verbose=True)
```

Apply a list of strategies to the importer's data.

This method applies a list of given strategies to the importer's data and logs the applied strategies' names to
`self.applied_strategies`. If no list of strategies is provided, it uses `self.strategies`.

Parameters
----------
strategies : list, optional
    List of strategies to apply. Defaults to `self.strategies`.
verbose : bool, optional
    If True, print a message indicating which strategy is being applied. Defaults to True.

Returns
-------
None
    Modifies the importer's data in place.

Notes
-----
The method `apply_strategy` is called to apply each individual strategy to the importer's data. Strategies
that partially modify data before raising a `StrategyError` should be avoided.

<a id="bw2io.importers.base.ImportBase.unlinked"></a>

#### unlinked

```python
@property
def unlinked()
```

Iterate through unique unlinked exchanges.

Uniqueness is determined by `activity_hash`.

Yields
------
exc :
    The unlinked exchange that is currently being iterated over.

<a id="bw2io.importers.base.ImportBase.write_unlinked"></a>

#### write\_unlinked

```python
def write_unlinked(name)
```

Write all data to an `UnlinkedData` data store.

This method writes all of the importer's data to an `UnlinkedData` data store with the specified `name`. The
`UnlinkedData` object is created with the importer's class name appended to the `name`. The applied strategies
are logged to the `unlinked_data` dictionary.

Parameters
----------
name : str
    The name of the `UnlinkedData` data store to be written.
