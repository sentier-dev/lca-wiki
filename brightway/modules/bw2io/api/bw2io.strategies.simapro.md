**Generated API reference** · package `bw2io` 0.9.17 · module `bw2io.strategies.simapro` · generated 2026-09-22 with pydoc-markdown 4.8.2.

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
  -I "$SP" -m bw2io.strategies.simapro cfg.yml > bw2io.strategies.simapro.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2io.strategies.simapro"></a>

# bw2io.strategies.simapro

<a id="bw2io.strategies.simapro.detoxify_pattern"></a>

#### detoxify\_pattern

<a id="bw2io.strategies.simapro.functional"></a>

#### functional

```python
def functional(exc: dict) -> bool
```

Determine if an exchange is functional by looking at `type` and `functional` attributes.

<a id="bw2io.strategies.simapro.sp_allocate_functional_products"></a>

#### sp\_allocate\_functional\_products

```python
def sp_allocate_functional_products(data: List[dict]) -> List[dict]
```

Allocate products in a SimaPro dataset by creating a separate dataset for each product.

For raw SimaPro datasets, creates a separate dataset for each product,
taking into account the allocation factor if provided. Also handles
waste treatment datasets with a single product.

Parameters
----------
db : list
    A list of dataset dictionaries

Returns
-------
db : list
    A list of dictionaries, including all of the original `db`, but also a separate process
    dataset for each product from multifunctional SimaPro datasets.

Examples
--------
>>> db = [
...     {
...         "name": "Dataset 1",
...         "type": "multifunctional",
...         "exchanges": [
...             {"type": "production", "name": "Product A", "unit": "kg", "amount": 10, "allocation": 80},
...             {"type": "production", "name": "Product B", "unit": "kg", "amount": 20, "allocation": 20},
...             {"type": "biosphere", "name": "Burden", "unit": "kg", "amount": 100},
...         ],
...     }
... ]
>>> sp_allocate_products(db)
[
    {
        "name": "Dataset 1",
        "type": "multifunctional",
        "exchanges": [
            {"type": "production", "name": "Product A", "unit": "kg", "amount": 10, "allocation": 80},
            {"type": "production", "name": "Product B", "unit": "kg", "amount": 20, "allocation": 20},
        ],
    },
    {
        "name": "Product A",
        "reference product": "Product A",
        "unit": "kg",
        "production amount": 10,
        "exchanges": [
            {"type": "production", "name": "Product A", "unit": "kg", "amount": 10},
            {"type": "biosphere", "name": "Burden", "unit": "kg", "amount": 80},
        ],
    },
    {
        "name": "Product B",
        "reference product": "Product B",
        "unit": "kg",
        "production amount": 5,
        "exchanges": [
            {"type": "production", "name": "Product B", "unit": "kg", "amount": 5},
            {"type": "biosphere", "name": "Burden", "unit": "kg", "amount": 20},
        ],
    },
]

<a id="bw2io.strategies.simapro.sp_allocate_products"></a>

#### sp\_allocate\_products

```python
def sp_allocate_products(data: List[dict]) -> List[dict]
```

Allocate products in a SimaPro dataset by creating a separate dataset for each product.

For raw SimaPro datasets, creates a separate dataset for each product,
taking into account the allocation factor if provided. Also handles
waste treatment datasets with a single product.

Parameters
----------
db : list
    A list of dictionaries representing raw SimaPro datasets.

Returns
-------
new_db : list
    A list of dictionaries representing the allocated datasets with separate
    entries for each product.

Examples
--------
>>> db = [
...     {
...         "name": "Dataset 1",
...         "exchanges": [
...             {"type": "production", "name": "Product A", "unit": "kg", "amount": 10, "allocation": 80},
...             {"type": "production", "name": "Product B", "unit": "kg", "amount": 20, "allocation": 20},
...         ],
...     }
... ]
>>> sp_allocate_products(db)
[
    {
        "name": "Product A",
        "reference product": "Product A",
        "unit": "kg",
        "production amount": 10,
        "exchanges": [
            {"type": "production", "name": "Product A", "unit": "kg", "amount": 10, "allocation": 80},
            {"type": "production", "name": "Product B", "unit": "kg", "amount": 5, "allocation": 20},
        ],
    },
    {
        "name": "Product B",
        "reference product": "Product B",
        "unit": "kg",
        "production amount": 5,
        "exchanges": [
            {"type": "production", "name": "Product A", "unit": "kg", "amount": 2.5, "allocation": 80},
            {"type": "production", "name": "Product B", "unit": "kg", "amount": 5, "allocation": 20},
        ],
    },
]

<a id="bw2io.strategies.simapro.fix_zero_allocation_products"></a>

#### fix\_zero\_allocation\_products

```python
def fix_zero_allocation_products(data: List[dict]) -> List[dict]
```

Fix datasets with a single production exchange and zero allocation factors.

For datasets with a single production exchange and zero allocation factors,
sets the production amount to one and removes all inputs. This prevents the creation of a singular technosphere matrix.

Parameters
----------
db : list
    A list of dictionaries representing datasets with production exchanges.

Returns
-------
db : list
    A list of dictionaries representing modified datasets with fixed zero allocation factors.

Examples
--------
>>> db = [
...     {
...         "name": "Dataset 1",
...         "exchanges": [
...             {"type": "production", "name": "Product A", "unit": "kg", "amount": 0},
...             {"type": "input", "name": "Resource 1", "unit": "kg", "amount": 5},
...         ],
...     }
... ]
>>> fix_zero_allocation_products(db)
[
    {
        "name": "Dataset 1",
        "exchanges": [
            {"type": "production", "name": "Product A", "unit": "kg", "amount": 1, "uncertainty type": 0},
        ],
    },
]

<a id="bw2io.strategies.simapro.link_technosphere_based_on_name_unit_location"></a>

#### link\_technosphere\_based\_on\_name\_unit\_location

```python
def link_technosphere_based_on_name_unit_location(
        data: List[dict],
        external_db_name: Optional[str] = None) -> List[dict]
```

Link technosphere exchanges based on name, unit, and location.

Links technosphere exchanges internally or against an external database
based on their name, unit, and location. It doesn't use categories because categories
cannot be reliably extracted from SimaPro exports.

Parameters
----------
db : list
    A list of dictionaries representing datasets with technosphere exchanges.
external_db_name : str, optional
    The name of the external database to link against, by default None.
    If None, link technosphere exchanges internally within the given database.

Returns
-------
db : list
    A list of dictionaries representing modified datasets with linked technosphere exchanges.

Examples
--------
>>> db = [
...     {
...         "name": "Dataset 1",
...         "exchanges": [
...             {"type": "technosphere", "name": "Product A", "unit": "kg", "location": "GLO"},
...         ],
...     }
... ]
>>> link_technosphere_based_on_name_unit_location(db)
[
    {
        "name": "Dataset 1",
        "exchanges": [
            {"type": "technosphere", "name": "Product A", "unit": "kg", "location": "GLO"},
        ],
    },
]

<a id="bw2io.strategies.simapro.split_simapro_name_geo"></a>

#### split\_simapro\_name\_geo

```python
def split_simapro_name_geo(db, regex_string=detoxify_pattern)
```

Split a name like 'foo/CH U' into name and geo components in a dataset.

Processes datasets and their exchanges by splitting their names
into name and geo components (e.g., 'foo/CH U' into 'foo' and 'CH U'). The original
name is stored in a new field called 'simapro name'.

Parameters
----------
db : list
    A list of dictionaries representing datasets with names to be split.

regex_string : str
    A regex pattern to split names. Defaults to a routine to split ecoinvent names.

Returns
-------
db : list
    A list of dictionaries representing modified datasets with split names and geo components.

Examples
--------
>>> db = [
...     {
...         "name": "foo/CH U",
...         "exchanges": [
...             {"name": "bar/US U", "type": "technosphere"},
...         ],
...     }
... ]
>>> split_simapro_name_geo(db)
[
    {
        "name": "foo",
        "simapro name": "foo/CH U",
        "location": "CH U",
        "exchanges": [
            {"name": "bar", "simapro name": "bar/US U", "location": "US U", "type": "technosphere"},
        ],
    },
]

<a id="bw2io.strategies.simapro.split_simapro_name_geo_curly_brackets"></a>

#### split\_simapro\_name\_geo\_curly\_brackets

```python
def split_simapro_name_geo_curly_brackets(db: List[dict],
                                          suffix: str = "") -> List[dict]
```

Split a name like 'Wheat straw, at farm {NL} Energy, U' into name and geo components in a dataset.

The original name is stored in a new field called 'simapro name' if that field is not yet present.

White space around the suffix and process name are stripped.

Parameters
----------
db : list
    A list of dictionaries representing datasets with names to be split.
suffix : str
    Suffix expected to be added to the end of process names, like "foo" in "Energy {CO} foo".

Returns
-------
db : list
    A list of dictionaries representing modified datasets with split names and geo components.

Examples
--------
>>> db = [
...     {
...         "name": "Wheat straw, at farm {NL} Energy, U",
...         "exchanges": [
...             {"name": "Dairy cows ration, at farm {ES} Energy, U"},
...         ],
...     }
... ]
>>> split_simapro_name_geo_curly_brackets(db, "Energy, U")
[
    {
        "name": "Wheat straw, at farm",
        "simapro name": "Wheat straw, at farm {NL} Energy, U",
        "location": "NL",
        "exchanges": [
            {
                "name": "Dairy cows ration, at farm",
                "simapro name": "Dairy cows ration, at farm {ES} Energy, U",
                "location": "ES",
            },
        ],
    },
]

<a id="bw2io.strategies.simapro.remove_biosphere_location_prefix_if_flow_in_same_location"></a>

#### remove\_biosphere\_location\_prefix\_if\_flow\_in\_same\_location

```python
def remove_biosphere_location_prefix_if_flow_in_same_location(
        db: List[dict]) -> List[dict]
```

If a biosphere flow is SimaPro-regionalized, like 'Ammonia, AR', and the process location is
'AR", then remove that suffix.

<a id="bw2io.strategies.simapro.normalize_simapro_biosphere_categories"></a>

#### normalize\_simapro\_biosphere\_categories

```python
def normalize_simapro_biosphere_categories(data: List[dict]) -> List[dict]
```

Normalize biosphere categories in a dataset to the ecoinvent standard.

Processes datasets and their exchanges by normalizing biosphere
categories and subcategories to match the ecoinvent standard. It uses predefined
mappings for SimaPro and ecoinvent categories.

Parameters
----------
db : list
    A list of dictionaries representing datasets with biosphere exchanges.

Returns
-------
db : list
    A list of dictionaries representing modified datasets with normalized biosphere categories.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "biosphere",
...                 "categories": ["emission", "air"],
...             },
...         ],
...     }
... ]
>>> normalize_simapro_biosphere_categories(db)
[
    {
        "exchanges": [
            {
                "type": "biosphere",
                "categories": ("Emissions", "Air"),
            },
        ],
    },
]

<a id="bw2io.strategies.simapro.normalize_simapro_biosphere_names"></a>

#### normalize\_simapro\_biosphere\_names

```python
def normalize_simapro_biosphere_names(data: List[dict]) -> List[dict]
```

Normalize biosphere flow names in a dataset to the ecoinvent standard.

Processes datasets and their exchanges by normalizing biosphere
flow names to match the ecoinvent standard. It uses a predefined mapping for
SimaPro and ecoinvent flow names.

Parameters
----------
db : list
    A list of dictionaries representing datasets with biosphere exchanges.

Returns
-------
db : list
    A list of dictionaries representing modified datasets with normalized biosphere flow names.

Examples
--------
>>> db = [
...     {
...         "exchanges": [
...             {
...                 "type": "biosphere",
...                 "categories": ["Emissions", "Air"],
...                 "name": "Example emission",
...             },
...         ],
...     }
... ]
>>> normalize_simapro_biosphere_names(db)
[
    {
        "exchanges": [
            {
                "type": "biosphere",
                "categories": ["Emissions", "Air"],
                "name": "Normalized emission",
            },
        ],
    },
]

<a id="bw2io.strategies.simapro.iff_exp"></a>

#### iff\_exp

<a id="bw2io.strategies.simapro.fix_iff_formula"></a>

#### fix\_iff\_formula

```python
def fix_iff_formula(string: str) -> str
```

Replace SimaPro 'iff' formula with a Python equivalent 'if-else' expression.

Processes a given string containing SimaPro 'iff' formulae and
replaces them with Python equivalent 'if-else' expressions. The conversion
is done using regular expressions.

Parameters
----------
string : str
    A string containing SimaPro 'iff' formulae.

Returns
-------
string : str
    A string with SimaPro 'iff' formulae replaced by Python 'if-else' expressions.

Examples
--------
>>> string = "iff(A > 0, A, 0)"
>>> fix_iff_formula(string)
"((A) if (A > 0) else (0))"

<a id="bw2io.strategies.simapro.normalize_simapro_formulae"></a>

#### normalize\_simapro\_formulae

```python
def normalize_simapro_formulae(formula: str, settings: dict) -> str
```

Convert SimaPro formulae to Python expressions.

Processes a given formula string containing SimaPro formulae
and converts them to Python expressions. The conversion is done using
string manipulation and by calling the `fix_iff_formula` function.

Parameters
----------
formula : str
    A string containing SimaPro formulae.
settings : dict
    A dictionary containing settings that affect the formula conversion,
    e.g., decimal separator.

Returns
-------
str
    A string with SimaPro formulae replaced by equivalent Python expressions.

Examples
--------
>>> formula = "A^2"
>>> settings = {"Decimal separator": ","}
>>> normalize_simapro_formulae(formula, settings)
"A**2"

<a id="bw2io.strategies.simapro.change_electricity_unit_mj_to_kwh"></a>

#### change\_electricity\_unit\_mj\_to\_kwh

```python
def change_electricity_unit_mj_to_kwh(data: List[dict]) -> List[dict]
```

Change datasets with the string "electricity" in their name from units of MJ to kilowatt hour.

Iterates through a given database (list of datasets) and modifies the unit of exchanges
containing the string "electricity" or "market for electricity" in their name from "megajoule" (MJ) to
"kilowatt hour" (kWh). It also rescales the exchange accordingly.

Parameters
----------
db : list
    A list of datasets containing exchanges with the unit "megajoule" (MJ).

Returns
-------
list
    A modified list of datasets with exchanges containing the string "electricity" or
    "market for electricity" in their name updated to have the unit "kilowatt hour" (kWh).

Examples
--------
>>> db = [
        {
            "exchanges": [
                {"name": "Electricity", "unit": "megajoule", "amount": 3.6}
            ]
        }
    ]
>>> change_electricity_unit_mj_to_kwh(db)
[{'exchanges': [{'name': 'Electricity', 'unit': 'kilowatt hour', 'amount': 1.0}]}]

<a id="bw2io.strategies.simapro.fix_localized_water_flows"></a>

#### fix\_localized\_water\_flows

```python
def fix_localized_water_flows(data: List[dict]) -> List[dict]
```

Change water flows with location information to generic water flows.

Biosphere flows cannot have locations; locations are defined by the activity dataset.
Iterates through a given database (list of datasets) and modifies the name of
exchanges containing water flows with location information by removing the location details.

Parameters
----------
db : list
    A list of datasets containing exchanges with water flows including location information.

Returns
-------
list
    A modified list of datasets with exchanges containing water flows updated to have generic names,
    without location information.

Examples
--------
>>> db = [
        {
            "exchanges": [
                {"name": "Water, river, BR", "type": "biosphere"}
            ]
        }
    ]
>>> fix_localized_water_flows(db)
[{'exchanges': [{'name': 'Water, river', 'type': 'biosphere', 'simapro location': 'BR'}]}]

<a id="bw2io.strategies.simapro.set_lognormal_loc_value_uncertainty_safe"></a>

#### set\_lognormal\_loc\_value\_uncertainty\_safe

```python
def set_lognormal_loc_value_uncertainty_safe(data: List[dict]) -> List[dict]
```

Ensure the 'loc' value is correct for lognormal uncertainty distributions in the given database.

Iterates through a given database (list of datasets) and updates the 'loc' value
of exchanges with lognormal uncertainty distributions, setting it to the natural logarithm of
the absolute value of the exchange amount.

Parameters
----------
db : list
    A list of datasets containing exchanges with lognormal uncertainty distributions.

Returns
-------
list
    A modified list of datasets with the 'loc' value updated for exchanges with lognormal
    uncertainty distributions.

Examples
--------
>>> db = [
        {
            "exchanges": [
                {
                    "amount": 10,
                    "uncertainty type": LognormalUncertainty.id,
                    "loc": 0
                }
            ]
        }
    ]
>>> set_lognormal_loc_value_uncertainty_safe(db)
[{'exchanges': [{'amount': 10, 'uncertainty type': 2, 'loc': 2.302585092994046}]}]

<a id="bw2io.strategies.simapro.flip_sign_on_waste"></a>

#### flip\_sign\_on\_waste

```python
def flip_sign_on_waste(data: List[dict], other: str) -> List[dict]
```

Flip the sign on waste exchanges in the imported database based on the waste convention.

Adjusts the sign of waste exchanges in the imported database
to match the waste exchange convention in SimaPro.

Parameters
----------
data : list
    A list of datasets containing waste exchanges to be adjusted.
other : str
    The name of the external database (e.g., ecoinvent) that is linked to
    the imported database.

Returns
-------
list
    A modified list of datasets with the sign of waste exchanges updated.

Notes
-----
This strategy needs to be run *after* matching with ecoinvent.
The strategy should be run as follows:
sp_imported.apply_strategy(functools.partial(flip_sign_on_waste, other="name_of_other"))

Examples
--------
>>> db = [
        {
            "exchanges": [
                {
                    "amount": -10,
                    "input": ("key",),
                    "uncertainty type": 0,
                    "loc": -10
                }
            ]
        }
    ]
>>> other_db_name = "name_of_other"
>>> flip_sign_on_waste(db, other_db_name)
[{'exchanges': [{'amount': 10, 'input': ('key',), 'uncertainty type': 0, 'loc': 10}]}]

<a id="bw2io.strategies.simapro.set_metadata_using_single_functional_exchange"></a>

#### set\_metadata\_using\_single\_functional\_exchange

```python
def set_metadata_using_single_functional_exchange(
        db: List[dict], missing_value: str = "(unknown)") -> List[dict]
```

Set `name`, `unit`, `production amount`, and `reference product` from the functional exchange.

Does not do anything unless these conditions are met:

* There is only one functional exchange
* None of `name`... are present, or are set to `missing_value`

Parameters
----------
db : list
    An list of dataset dictionaries.

Returns
-------

The modified database list of dataset dictionaries.

<a id="bw2io.strategies.simapro.override_process_name_using_single_functional_exchange"></a>

#### override\_process\_name\_using\_single\_functional\_exchange

```python
def override_process_name_using_single_functional_exchange(
        db: List[dict], missing_value: str = "(unknown)") -> List[dict]
```

Set process dataset `name` from the single functional exchange.

SimaPro exports *can* include process names, but as the manual states:

"Under the Documentation tab, you can enter the process name. Please note that this is only for
your own reference and this name is not used anywhere. Processes are identified by the name
defined under the Input/Output tab in the product section. Therefore, if you want to search for a
certain process, you should use the product name defined in the Input/Output as the keyword."

We therefore need to set the name to the same term being used as inputs elsewhere.

Parameters
----------
db : list
    An list of dataset dictionaries.

Returns
-------

The modified database list of dataset dictionaries.

<a id="bw2io.strategies.simapro.normalize_simapro_labels_to_brightway_standard"></a>

#### normalize\_simapro\_labels\_to\_brightway\_standard

```python
def normalize_simapro_labels_to_brightway_standard(
        db: List[dict]) -> List[dict]
```

Normalize *unlinked* exchange context and identifier labels to Brightway standards.

* `context` -> `categories`
* `identifier` -> `code`

Changes data in-place.

Needed because some randonneur transformations use more standard (i.e. not Brightway-specific)
labels.
