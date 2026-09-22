**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.ecospold2` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.ecospold2 cfg.yml > bw2io.strategies.ecospold2.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.ecospold2"></a>

# bw2io.strategies.ecospold2

<a id="bw2io.strategies.ecospold2.link_biosphere_by_flow_uuid"></a>

#### link\_biosphere\_by\_flow\_uuid

```python
def link_biosphere_by_flow_uuid(db: list[dict], biosphere: str = "biosphere3")
```

Link the exchanges in the given list of datasets to the specified
biosphere database by flow UUID.

Parameters
----------
db : list
    A list of datasets to be modified.
biosphere : str, optional
    The name of the biosphere database to link to, by default "biosphere3".

Returns
-------
list
    A list of the modified datasets with linked biosphere exchanges.

Examples
--------
>>> from brightway2 import *
>>> projects.set_current("my project")
>>> db = Database("example_db")
>>> ds1 = db.random()
>>> ds1.new_exchange(
...     amount=1,
...     input=(("example_db", "1"),),
...     output=ds1.key,
...     type="biosphere",
... )
>>> ds2 = db.random()
>>> ds2.new_exchange(
...     amount=2,
...     input=(("biosphere3", "2"),),
...     output=ds2.key,
...     type="biosphere",
... )
>>> db.write()
>>> link_biosphere_by_flow_uuid(db)
[{'exchanges': [{'amount': 1,
                 'input': (('example_db', '1'),),
                 'output': '63cc61954d3d9943bb32f7aa9bc33c87',
                 'type': 'production'},
                {'amount': 1,
                 'input': (('biosphere3', '2'),),
                 'output': '63cc61954d3d9943bb32f7aa9bc33c87',
                 'type': 'biosphere'}],
  'id': '63cc61954d3d9943bb32f7aa9bc33c87',
  'type': 'process'},
 {'exchanges': [{'amount': 2,
                 'input': (('biosphere3', '2'),),
                 'output': '6f10b95c02be63e925a6f2ef6b937a6d',
                 'type': 'biosphere'}],
  'id': '6f10b95c02be63e925a6f2ef6b937a6d',
  'type': 'process'}]

<a id="bw2io.strategies.ecospold2.remove_zero_amount_coproducts"></a>

#### remove\_zero\_amount\_coproducts

```python
def remove_zero_amount_coproducts(db)
```

Iterate through datasets in the given database. Filter out coproducts with
zero production amounts from the 'exchanges' list of each dataset. Return
the updated list of datasets.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": "production" or "non-production",
                "amount": float,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with coproducts with zero production
    amounts removed from the 'exchanges' list.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {"type": "production", "amount": 0},
...             {"type": "production", "amount": 5},
...             {"type": "non-production", "amount": 0},
...         ]
...     }
... ]
>>> remove_zero_amount_coproducts(db)
[
    {
        "exchanges": [
            {"type": "production", "amount": 5},
            {"type": "non-production", "amount": 0},
        ]
    }
]

<a id="bw2io.strategies.ecospold2.remove_zero_amount_inputs_with_no_activity"></a>

#### remove\_zero\_amount\_inputs\_with\_no\_activity

```python
def remove_zero_amount_inputs_with_no_activity(db)
```

Filter out technosphere exchanges with zero amounts and no uncertainty from
the 'exchanges' list of each dataset in the given database. These exchanges
are the result of the ecoinvent linking algorithm and can be safely discarded.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "uncertainty type": int,
                "amount": float,
                "type": "technosphere",
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with technosphere exchanges with zero
    amounts and no uncertainty removed from the 'exchanges' list.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {"uncertainty type": UndefinedUncertainty.id, "amount": 0, "type": "technosphere"},
...             {"uncertainty type": UndefinedUncertainty.id, "amount": 5, "type": "technosphere"},
...             {"uncertainty type": 2, "amount": 0, "type": "technosphere"},
...         ]
...     }
... ]
>>> remove_zero_amount_inputs_with_no_activity(db)
[
    {
        "exchanges": [
            {"uncertainty type": UndefinedUncertainty.id, "amount": 5, "type": "technosphere"},
            {"uncertainty type": 2, "amount": 0, "type": "technosphere"},
        ]
    }
]

<a id="bw2io.strategies.ecospold2.remove_unnamed_parameters"></a>

#### remove\_unnamed\_parameters

```python
def remove_unnamed_parameters(db)
```

Iterate through datasets in the given database and remove unnamed parameters
from the 'parameters' dictionary of each dataset. Unnamed parameters can't be
used in formulas or referenced.

Parameters
----------
db : list
    List of datasets, each as a dictionary containing a 'parameters' key with
    a dictionary of parameter name-value pairs. The structure of a dataset is
    as follows:

    {
        "parameters": {
            "parameter_name": {"value": parameter_value, "unnamed": boolean},
            ...
        }
    }

Returns
-------
list
    Updated list of datasets with unnamed parameters removed from the
    'parameters' dictionary.

Examples
--------
>>> db = [
...     {
...         "parameters": {
...             "named_param": {"value": 42},
...             "unnamed_param": {"value": 10, "unnamed": True},
...         }
...     }
... ]
>>> remove_unnamed_parameters(db)
[
    {
        "parameters": {
            "named_param": {"value": 42},
        }
    }
]

<a id="bw2io.strategies.ecospold2.es2_assign_only_product_with_amount_as_reference_product"></a>

#### es2\_assign\_only\_product\_with\_amount\_as\_reference\_product

```python
def es2_assign_only_product_with_amount_as_reference_product(db)
```

If a multioutput process has one product with a non-zero amount, this
function assigns that product as the reference product. This is typically
called after `remove_zero_amount_coproducts`, which will delete the
zero-amount coproducts. However, the zero-amount logic is still kept in
case users want to keep all coproducts.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": "production",
                "amount": float,
                "name": str,
                "flow": str,
                "unit": str,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with the non-zero amount product assigned
    as the reference product for multioutput processes.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {"type": "production", "amount": 0, "name": "A", "flow": "flow_A", "unit": "kg"},
...             {"type": "production", "amount": 5, "name": "B", "flow": "flow_B", "unit": "kg"},
...         ]
...     }
... ]
>>> es2_assign_only_product_with_amount_as_reference_product(db)
[
    {
        "exchanges": [
            {"type": "production", "amount": 0, "name": "A", "flow": "flow_A", "unit": "kg"},
            {"type": "production", "amount": 5, "name": "B", "flow": "flow_B", "unit": "kg"},
        ],
        "reference product": "B",
        "flow": "flow_B",
        "unit": "kg",
        "production amount": 5,
    }
]

<a id="bw2io.strategies.ecospold2.assign_single_product_as_activity"></a>

#### assign\_single\_product\_as\_activity

```python
def assign_single_product_as_activity(db)
```

Assign the activity of a dataset to the 'activity' field of the production
exchange for datasets with only one production exchange.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries and an 'activity'
    key with the activity name. The dataset dictionary has the following
    structure:
    dataset: dict = {
        "activity": "activity_A",
        "exchanges": [
            {"type": "production", "name": "product_A"},
            {"type": "non-production", "name": "input_A"},
        ],
    }

Returns
-------
list
    The updated list of datasets with the activity assigned to the single
    production exchange.

Examples
--------
>>> db = [
...     {
...         "activity": "activity_A",
...         "exchanges": [
...             {"type": "production", "name": "product_A"},
...             {"type": "non-production", "name": "input_A"},
...         ],
...     }
... ]
>>> assign_single_product_as_activity(db)
[
    {
        "activity": "activity_A",
        "exchanges": [
            {"type": "production", "name": "product_A", "activity": "activity_A"},
            {"type": "non-production", "name": "input_A"},
        ],
    }
]

<a id="bw2io.strategies.ecospold2.create_composite_code"></a>

#### create\_composite\_code

```python
def create_composite_code(db)
```

Generate a composite code for each dataset in the given database using the
activity and flow names. Assign the composite code to the 'code' field of
the dataset.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing
    'activity' and 'flow' keys with their respective names. The dataset
    dictionary has the following structure:
    dataset: dict = {
        "activity": "activity_A",
        "flow": "flow_A",
    }

Returns
-------
list
    The updated list of datasets with the composite code assigned to the
    'code' field.

Examples
--------
>>> db = [
...     {
...         "activity": "activity_A",
...         "flow": "flow_A",
...     }
... ]
>>> create_composite_code(db)
[
    {
        "activity": "activity_A",
        "flow": "flow_A",
        "code": es2_activity_hash("activity_A", "flow_A"),
    }
]

<a id="bw2io.strategies.ecospold2.link_internal_technosphere_by_composite_code"></a>

#### link\_internal\_technosphere\_by\_composite\_code

```python
def link_internal_technosphere_by_composite_code(db)
```

Link internal technosphere inputs in the database by their composite code.
Only link to process datasets that are present in the database document.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing a
    'code' key, a 'database' key, and an 'exchanges' key with a list of
    exchange dictionaries. The dataset dictionary has a nested structure
    for the 'exchanges' key, as follows:
    dataset: dict = {
        "database": "db_A",
        "code": es2_activity_hash("activity_A", "flow_A"),
        "exchanges": [
            {
                "type": "technosphere",
                "activity": "activity_A",
                "flow": "flow_A",
            },
            ...
        ],
    }

Returns
-------
list
    The updated list of datasets with internal technosphere inputs linked
    by composite code.

Examples
--------
>>> db = [
...     {
...         "database": "db_A",
...         "code": es2_activity_hash("activity_A", "flow_A"),
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "activity": "activity_A",
...                 "flow": "flow_A",
...             }
...         ],
...     }
... ]
>>> link_internal_technosphere_by_composite_code(db)
[
    {
        "database": "db_A",
        "code": es2_activity_hash("activity_A", "flow_A"),
        "exchanges": [
            {
                "type": "technosphere",
                "activity": "activity_A",
                "flow": "flow_A",
                "input": ("db_A", es2_activity_hash("activity_A", "flow_A")),
            }
        ],
    }
]

<a id="bw2io.strategies.ecospold2.delete_exchanges_missing_activity"></a>

#### delete\_exchanges\_missing\_activity

```python
def delete_exchanges_missing_activity(db)
```

Remove exchanges that are missing the "activityLinkId" attribute and have
flows that are not produced as the reference product of any activity. See
the `known data issues <http://www.ecoinvent.org/database/ecoinvent-version-3/reports-of-changes/known-data-issues/>`__ report.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The dataset
    dictionary has a nested structure for the 'exchanges' key, as follows:
    dataset: dict = {
        "filename": "file_A",
        "exchanges": [
            {
                "type": "technosphere",
                "name": "unlinked_exchange",
            },
            ...
        ],
    }

Returns
-------
list
    The updated list of datasets with unlinked exchanges removed.

Examples
--------
>>> db = [
...     {
...         "filename": "file_A",
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "unlinked_exchange",
...             },
...             {
...                 "type": "technosphere",
...                 "name": "linked_exchange",
...                 "input": ("db_A", "code_A"),
...             },
...         ],
...     }
... ]
>>> delete_exchanges_missing_activity(db)
[
    {
        "filename": "file_A",
        "exchanges": [
            {
                "type": "technosphere",
                "name": "linked_exchange",
                "input": ("db_A", "code_A"),
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.delete_ghost_exchanges"></a>

#### delete\_ghost\_exchanges

```python
def delete_ghost_exchanges(db)
```

Remove ghost exchanges from the given database. A ghost exchange is one
that links to a combination of activity and flow which aren't provided
in the database.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The dataset
    dictionary has a nested structure for the 'exchanges' key, as follows:
    dataset: dict = {
        "filename": "file_A",
        "exchanges": [
            {
                "type": "technosphere",
                "name": "ghost_exchange",
            },
            ...
        ],
    }

Returns
-------
list
    The updated list of datasets with ghost exchanges removed.

Examples
--------
>>> db = [
...     {
...         "filename": "file_A",
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "ghost_exchange",
...             },
...             {
...                 "type": "technosphere",
...                 "name": "linked_exchange",
...                 "input": ("db_A", "code_A"),
...             },
...         ],
...     }
... ]
>>> delete_ghost_exchanges(db)
[
    {
        "filename": "file_A",
        "exchanges": [
            {
                "type": "technosphere",
                "name": "linked_exchange",
                "input": ("db_A", "code_A"),
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.remove_uncertainty_from_negative_loss_exchanges"></a>

#### remove\_uncertainty\_from\_negative\_loss\_exchanges

```python
def remove_uncertainty_from_negative_loss_exchanges(db)
```

Address cases where basic uncertainty and pedigree matrix are applied blindly,
producing strange net production values. Assume these loss factors are static
and only apply to exchanges that decrease net production.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": str,
                "name": str,
                "amount": float,
                "uncertainty type": int,
                "loc": float,
                "scale": float,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with uncertainty removed from negative
    lognormal exchanges.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "production",
...                 "name": "product_A",
...                 "amount": 10,
...             },
...             {
...                 "type": "technosphere",
...                 "name": "product_A",
...                 "amount": -2,
...                 "uncertainty type": 2,
...                 "loc": -2,
...                 "scale": 0.1,
...             },
...         ],
...     }
... ]
>>> remove_uncertainty_from_negative_loss_exchanges(db)
[
    {
        "exchanges": [
            {
                "type": "production",
                "name": "product_A",
                "amount": 10,
            },
            {
                "type": "technosphere",
                "name": "product_A",
                "amount": -2,
                "uncertainty type": 0,
                "loc": -2,
            },
        ],
    }
]
Notes
--------
There are 15699 of these in ecoinvent 3.3 cutoff.

<a id="bw2io.strategies.ecospold2.set_lognormal_loc_value"></a>

#### set\_lognormal\_loc\_value

```python
def set_lognormal_loc_value(db)
```

Ensure loc value is correct for lognormal uncertainty distributions.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": str,
                "name": str,
                "amount": float,
                "uncertainty type": int,
                "loc": float,
                "scale": float,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with correct lognormal uncertainty
    distribution loc values.

Examples
--------
>>> import math
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "input_A",
...                 "amount": 5,
...                 "uncertainty type": 2,
...                 "loc": 1,
...                 "scale": 0.5,
...             },
...         ],
...     }
... ]
>>> set_lognormal_loc_value(db)
[
    {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
                "uncertainty type": 2,
                "loc": math.log(5),
                "scale": 0.5,
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.reparametrize_lognormal_to_agree_with_static_amount"></a>

#### reparametrize\_lognormal\_to\_agree\_with\_static\_amount

```python
def reparametrize_lognormal_to_agree_with_static_amount(db)
```

For lognormal distributions, choose the mean of the underlying normal distribution
(loc) such that the expected value (mean) of the resulting distribution is
equal to the (static) amount defined for the exchange.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": str,
                "name": str,
                "amount": float,
                "uncertainty type": int,
                "loc": float,
                "scale": float,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with adjusted lognormal uncertainty
    distribution loc values.

Examples
--------
>>> import math
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "input_A",
...                 "amount": 5,
...                 "uncertainty type": 2,
...                 "loc": 1,
...                 "scale": 0.5,
...             },
...         ],
...     }
... ]
>>> reparametrize_lognormals_to_agree_with_static_amount(db)
[
    {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
                "uncertainty type": 2,
                "loc": math.log(5) - 0.5**2 / 2,
                "scale": 0.5,
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.fix_unreasonably_high_lognormal_uncertainties"></a>

#### fix\_unreasonably\_high\_lognormal\_uncertainties

```python
def fix_unreasonably_high_lognormal_uncertainties(db,
                                                  cutoff=2.5,
                                                  replacement=0.25)
```

Replace unreasonably high lognormal uncertainties in the given database
with a specified replacement value. With the default cutoff value of 2.5
and a median of 1, the 95% confidence interval has a high to low ratio of 20.000.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The dataset
    dictionary has a nested structure for the 'exchanges' key, as follows:
    dataset: dict = {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
                "uncertainty type": 2,
                "loc": 5,
                "scale": 3,
            },
            ...
        ],
    }
cutoff : float, optional
    The cutoff value above which an uncertainty value is considered
    unreasonably high (default is 2.5).
replacement : float, optional
    The replacement value for unreasonably high uncertainties (default is 0.25).

Returns
-------
list
    The updated list of datasets with unreasonably high uncertainties fixed.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "input_A",
...                 "amount": 5,
...                 "uncertainty type": 2,
...                 "loc": 5,
...                 "scale": 3,
...             },
...         ],
...     }
... ]
>>> fix_unreasonably_high_lognormal_uncertainties(db)
[
    {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
                "uncertainty type": 2,
                "loc": 5,
                "scale": 0.25,
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.fix_ecoinvent_flows_pre35"></a>

#### fix\_ecoinvent\_flows\_pre35

```python
def fix_ecoinvent_flows_pre35(db)
```

Apply the 'fix-ecoinvent-flows-pre-35' migration to the given database if
available; otherwise, raise a warning and return the unmodified database.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The dataset
    dictionary has a nested structure for the 'exchanges' key, as follows:
    dataset: dict = {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
            },
            ...
        ],
    }

Returns
-------
list
    The updated list of datasets with ecoinvent flows fixed, or the
    original list of datasets if the migration is not available.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "technosphere",
...                 "name": "input_A",
...                 "amount": 5,
...             },
...         ],
...     }
... ]
>>> fix_ecoinvent_flows_pre35(db)
[
    {
        "exchanges": [
            {
                "type": "technosphere",
                "name": "input_A",
                "amount": 5,
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.drop_temporary_outdated_biosphere_flows"></a>

#### drop\_temporary\_outdated\_biosphere\_flows

```python
def drop_temporary_outdated_biosphere_flows(db)
```

Removes exchanges with specific temporary biosphere flow names from the
given database. Drop biosphere exchanges which aren't used and are outdated.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries. The structure of a
    dataset is as follows:

    {
        "exchanges": [
            {
                "type": str,
                "name": str,
                "amount": float,
            },
            ...
        ]
    }

Returns
-------
list
    The updated list of datasets with outdated temporary biosphere exchanges removed.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "biosphere",
...                 "name": "Fluorene_temp",
...                 "amount": 5,
...             },
...             {
...                 "type": "biosphere",
...                 "name": "valid_biosphere_flow",
...                 "amount": 10,
...             },
...         ],
...     }
... ]
>>> drop_temporary_outdated_biosphere_flows(db)
[
    {
        "exchanges": [
            {
                "type": "biosphere",
                "name": "valid_biosphere_flow",
                "amount": 10,
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.add_cpc_classification_from_single_reference_product"></a>

#### add\_cpc\_classification\_from\_single\_reference\_product

```python
def add_cpc_classification_from_single_reference_product(db)
```

Add CPC classification to a dataset's classifications if it has only one
reference product with a CPC classification.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an
    'exchanges' key with a list of exchange dictionaries and a
    'classifications' key with a list of classification tuples. The dataset
    dictionary has a nested structure for the 'exchanges' key, as follows:
    dataset: dict = {
        "exchanges": [
            {
                "type": "production",
                "classifications": {"CPC": ["code"]},
            },
            ...
        ],
        "classifications": [],
    }

    The classifications dictionnary may have as values lists or single strings.

Returns
-------
list
    The updated list of datasets with CPC classification added to datasets
    from their single reference product.

Examples
--------
>>> db = [
...     {
...         "classifications": [],
...         "exchanges": [
...             {
...                 "type": "production",
...                 "classifications": {"CPC": ["code"]},
...             },
...         ],
...     }
... ]
>>> add_cpc_classification_from_single_reference_product(db)
[
    {
        "classifications": [("CPC", "code")],
        "exchanges": [
            {
                "type": "production",
                "classifications": {"CPC": ["code"]},
            },
        ],
    }
]

<a id="bw2io.strategies.ecospold2.delete_none_synonyms"></a>

#### delete\_none\_synonyms

```python
def delete_none_synonyms(db)
```

Remove `None` values from the 'synonyms' list of each dataset.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing a
    'synonyms' key with a list of synonyms. The dataset dictionary has a nested
    structure for the 'parameters' key, as follows:
    dataset: dict = {
        "parameters": {
            "parameter1": {"synonyms": ["synonym1", None, "synonym2"]},
            "parameter2": {"synonyms": ["synonym3", "synonym4"]},
            ...
        }
    }

Returns
-------
list
    The updated list of datasets with None values removed from the
    'synonyms' list.

Examples
--------
>>> db = [
...     {
...         "parameters": {
...             "parameter1": {"synonyms": ["synonym1", None, "synonym2"]},
...             "parameter2": {"synonyms": ["synonym3", "synonym4"]},
...         }
...     },
... ]
>>> delete_none_synonyms(db)
[
    {
        "parameters": {
            "parameter1": {"synonyms": ["synonym1", "synonym2"]},
            "parameter2": {"synonyms": ["synonym3", "synonym4"]},
        }
    },
]

<a id="bw2io.strategies.ecospold2.update_social_flows_in_older_consequential"></a>

#### update\_social\_flows\_in\_older\_consequential

```python
def update_social_flows_in_older_consequential(db, biosphere_db)
```

Update the UUIDs of specific biosphere flows with the category 'social' in older consequential datasets.
These flows are not used, and their UUIDs change with each release. The ecoinvent centre recommends dropping them,
but this function replaces their UUIDs instead.

Parameters
----------
db : list
    A list of datasets, where each dataset is a dictionary containing an 'exchanges' key with a list
    of exchange dictionaries. These datasets represent the main data to be updated.
biosphere_db : list
    A list of biosphere datasets, where each dataset is a dictionary containing flow information.
    These datasets provide the updated UUIDs for the specific social flows.

Returns
-------
list
    The updated list of datasets with the UUIDs of the specified social flows replaced.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "name": "residual wood, dry",
...                 "input": "old_uuid",
...             },
...         ],
...     },
... ]
>>> biosphere_db = [
...     {
...         "name": "residual wood, dry",
...         "key": "new_uuid",
...     },
... ]
>>> update_social_flows_in_older_consequential(db, biosphere_db)
[
    {
        "exchanges": [
            {
                "name": "residual wood, dry",
                "input": "new_uuid",
            },
        ],
    },
]
