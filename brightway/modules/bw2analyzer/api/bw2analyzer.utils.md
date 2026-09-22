**Generated API reference** · package `bw2analyzer` 0.11.8 · module `bw2analyzer.utils` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2analyzer==0.11.8'
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
  -I "$SP" -m bw2analyzer.utils cfg.yml > bw2analyzer.utils.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2analyzer.utils"></a>

# bw2analyzer.utils

<a id="bw2analyzer.utils.contribution_for_all_datasets_one_method"></a>

#### contribution\_for\_all\_datasets\_one\_method

```python
def contribution_for_all_datasets_one_method(database, method, progress=True)
```

Calculate contribution analysis (for technosphere processes) for all inventory datasets in one database for one LCIA method.

**Arguments**:

- `*database*` _str_ - Name of database
- `*method*` _tuple_ - Method tuple
  

**Returns**:

  NumPy array of relative contributions. Each column sums to one.
  Lookup dictionary, dataset keys to row/column indices

<a id="bw2analyzer.utils.print_recursive_calculation"></a>

#### print\_recursive\_calculation

```python
def print_recursive_calculation(activity,
                                lcia_method,
                                amount=1,
                                max_level=3,
                                cutoff=1e-2,
                                string_length=130,
                                file_obj=None,
                                tab_character="  ",
                                use_matrix_values=False,
                                _lca_obj=None,
                                _total_score=None,
                                __level=0,
                                __first=True)
```

Traverse a supply chain graph, and calculate the LCA scores of each component. Prints the result with the format:

{tab_character * level }{fraction of total score} ({absolute LCA score for this input} | {amount of input}) {input activity}

**Arguments**:

- `activity` - ``Activity``. The starting point of the supply chain graph.
- `lcia_method` - tuple. LCIA method to use when traversing supply chain graph.
- `amount` - int. Amount of ``activity`` to assess.
- `max_level` - int. Maximum depth to traverse.
- `cutoff` - float. Fraction of total score to use as cutoff when deciding whether to traverse deeper.
- `string_length` - int. Maximum length of printed string.
- `file_obj` - File-like object (supports ``.write``), optional. Output will be written to this object if provided.
- `tab_character` - str. Character to use to indicate indentation.
- `use_matrix_values` - bool. Take exchange values from the matrix instead of the exchange instance ``amount``. Useful for Monte Carlo, but can be incorrect if there is more than one exchange from the same pair of nodes.
  
  Normally internal args:
- `_lca_obj` - ``LCA``. Can give an instance of the LCA class (e.g. when doing regionalized or Monte Carlo LCA)
- `_total_score` - float. Needed if specifying ``_lca_obj``.
  
  Internal args (used during recursion, do not touch);
- `__level` - int.
- `__first` - bool.
  

**Returns**:

  Nothing. Prints to ``sys.stdout`` or ``file_obj``

<a id="bw2analyzer.utils.print_recursive_supply_chain"></a>

#### print\_recursive\_supply\_chain

```python
def print_recursive_supply_chain(activity,
                                 amount=1,
                                 max_level=2,
                                 cutoff=0,
                                 string_length=130,
                                 file_obj=None,
                                 tab_character="  ",
                                 __level=0)
```

Traverse a supply chain graph, and prints the inputs of each component.

This function is only for exploration; use ``bw2calc.GraphTraversal`` for a better performing function.

The results displayed here can also be incorrect if

**Arguments**:

- `activity` - ``Activity``. The starting point of the supply chain graph.
- `amount` - int. Supply chain inputs will be scaled to this value.
- `max_level` - int. Max depth to search for.
- `cutoff` - float. Inputs with amounts less than ``amount * cutoff`` will not be printed or traversed further.
- `string_length` - int. Maximum length of each line.
- `file_obj` - File-like object (supports ``.write``), optional. Output will be written to this object if provided.
- `tab_character` - str. Character to use to indicate indentation.
- `__level` - int. Current level of the calculation. Only used internally, do not touch.
  

**Returns**:

  Nothing. Prints to ``stdout`` or ``file_obj``

<a id="bw2analyzer.utils.infinite_alphabet"></a>

#### infinite\_alphabet

```python
def infinite_alphabet()
```

Return generator with values a-z, then aa-az, ba-bz, then aaa-aaz, aba-abz, etc.

<a id="bw2analyzer.utils.recursive_calculation_to_object"></a>

#### recursive\_calculation\_to\_object

```python
def recursive_calculation_to_object(activity,
                                    lcia_method,
                                    amount=1,
                                    max_level=3,
                                    cutoff=1e-2,
                                    as_dataframe=False,
                                    root_label="root",
                                    use_matrix_values=False,
                                    _lca_obj=None,
                                    _total_score=None,
                                    __result_list=None,
                                    __level=0,
                                    __label="",
                                    __parent=None)
```

Traverse a supply chain graph, and calculate the LCA scores of each component. Adds a dictionary to ``result_list`` of the form:

{
'label': Label of this branch. Starts with nothing, then A, AA, AB, AAA, AAB, etc.
'score': Absolute score of this activity
'fraction': Fraction of total score of this activity
'amount': Input amount of the reference product of this activity
'name': Name of this activity
'key': Activity key
'root_label': Starting label of root element for recursion.
}

**Arguments**:

- `activity` - ``Activity``. The starting point of the supply chain graph.
- `lcia_method` - tuple. LCIA method to use when traversing supply chain graph.
- `amount` - int. Amount of ``activity`` to assess.
- `max_level` - int. Maximum depth to traverse.
- `cutoff` - float. Fraction of total score to use as cutoff when deciding whether to traverse deeper.
- `as_dataframe` - Return results as a list (default) or a pandas ``DataFrame``
- `use_matrix_values` - bool. Take exchange values from the matrix instead of the exchange instance ``amount``. Useful for Monte Carlo, but can be incorrect if there is more than one exchange from the same pair of nodes.
  
  Internal args (used during recursion, do not touch):
- `__result_list` - list.
- `__level` - int.
- `__label` - str.
- `__parent` - str.
  

**Returns**:

  List of dicts
