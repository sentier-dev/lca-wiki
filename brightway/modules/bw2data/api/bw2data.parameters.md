**Generated API reference** · package `bw2data` 4.7 · module `bw2data.parameters` · generated 2026-09-22 with pydoc-markdown 4.8.2.

Command that produced this file:

```bash
cd "$(mktemp -d)" && export BRIGHTWAY2_DIR="$(mktemp -d)"
uv venv --python 3.11 pkg
VIRTUAL_ENV=pkg uv pip install --no-deps 'bw2data==4.7'
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
  -I "$SP" -m bw2data.parameters cfg.yml > bw2data.parameters.md
```

Generated file: do not edit by hand; regenerate with the command above.
The output of that command is then passed through one mechanical pass: links
the wiki cannot resolve are flattened to their text, absolute file paths become
`<path>`, and names of private repositories become `<private>`.

---

<a id="bw2data.parameters"></a>

# bw2data.parameters

<a id="bw2data.parameters.clean"></a>

#### clean

<a id="bw2data.parameters.nonempty"></a>

#### nonempty

Autoupdate `updated` field in Group when parameters change

<a id="bw2data.parameters.AUTOUPDATE_TRIGGER"></a>

#### AUTOUPDATE\_TRIGGER

Activity parameter groups can't cross databases

<a id="bw2data.parameters.CROSSDATASE_INSERT_TRIGGER"></a>

#### CROSSDATASE\_INSERT\_TRIGGER

<a id="bw2data.parameters.CROSSDATASE_UPDATE_TRIGGER"></a>

#### CROSSDATASE\_UPDATE\_TRIGGER

Activities can't be in multiple activity parameter groups

<a id="bw2data.parameters.CROSSGROUP_INSERT_TRIGGER"></a>

#### CROSSGROUP\_INSERT\_TRIGGER

<a id="bw2data.parameters.CROSSGROUP_UPDATE_TRIGGER"></a>

#### CROSSGROUP\_UPDATE\_TRIGGER

No circular dependences in activity parameter group dependencies

<a id="bw2data.parameters.GD_INSERT_TRIGGER"></a>

#### GD\_INSERT\_TRIGGER

<a id="bw2data.parameters.GD_UPDATE_TRIGGER"></a>

#### GD\_UPDATE\_TRIGGER

Parameterized exchange groups must be in activityparameters table

<a id="bw2data.parameters.PE_INSERT_TRIGGER"></a>

#### PE\_INSERT\_TRIGGER

<a id="bw2data.parameters.PE_UPDATE_TRIGGER"></a>

#### PE\_UPDATE\_TRIGGER

<a id="bw2data.parameters.ParameterBase"></a>

## ParameterBase Objects

```python
class ParameterBase(SnowflakeIDBaseClass)
```

<a id="bw2data.parameters.ParameterBase.__repr__"></a>

#### \_\_repr\_\_

<a id="bw2data.parameters.ParameterBase.__lt__"></a>

#### \_\_lt\_\_

```python
def __lt__(other)
```

<a id="bw2data.parameters.ParameterBase.create_table"></a>

#### create\_table

```python
@classmethod
def create_table(cls)
```

<a id="bw2data.parameters.ParameterBase.expire_downstream"></a>

#### expire\_downstream

```python
@staticmethod
def expire_downstream(group)
```

Expire any activity parameters that depend on this group

<a id="bw2data.parameters.ProjectParameter"></a>

## ProjectParameter Objects

```python
class ProjectParameter(ParameterBase)
```

Parameter set for a project. Group name is 'project'.

Columns:
    - name: str, unique
    - formula: str, optional
    - amount: float, optional
    - data: object, optional. Used for any other metadata.

Note that there is no magic for reading and writing to ``data`` (unlike ``Activity`` objects) - it must be used directly.

<a id="bw2data.parameters.ProjectParameter.name"></a>

#### name

<a id="bw2data.parameters.ProjectParameter.formula"></a>

#### formula

<a id="bw2data.parameters.ProjectParameter.amount"></a>

#### amount

<a id="bw2data.parameters.ProjectParameter.data"></a>

#### data

<a id="bw2data.parameters.ProjectParameter.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.parameters.ProjectParameter.save"></a>

#### save

```python
def save(*args, **kwargs)
```

<a id="bw2data.parameters.ProjectParameter.load"></a>

#### load

```python
@staticmethod
def load(group=None)
```

Return dictionary of parameter data with names as keys and ``.dict()`` as values.

<a id="bw2data.parameters.ProjectParameter.static"></a>

#### static

```python
@staticmethod
def static(ignored="project", only=None)
```

Get dictionary of ``{name: amount}`` for all project parameters.

``only`` restricts returned names to ones found in ``only``. ``ignored`` included for API compatibility with other ``recalculate`` methods.

<a id="bw2data.parameters.ProjectParameter.expired"></a>

#### expired

```python
@staticmethod
def expired()
```

Return boolean - is this group expired?

<a id="bw2data.parameters.ProjectParameter.recalculate"></a>

#### recalculate

```python
@staticmethod
def recalculate(ignored: Optional[bool] = None, signal: bool = True)
```

Recalculate all parameters.

``ignored`` included for API compatibility with other ``recalculate`` methods - it will really be ignored.

<a id="bw2data.parameters.ProjectParameter.dependency_chain"></a>

#### dependency\_chain

```python
@staticmethod
def dependency_chain()
```

Determine if ```ProjectParameter`` parameters have dependencies
within the group.

**Returns**:

  
  .. code-block:: python
  
  [
  {
- `'kind'` - 'project',
- `'group'` - 'project',
- `'names'` - set of variables names
  }
  ]

<a id="bw2data.parameters.ProjectParameter.is_dependency_within_group"></a>

#### is\_dependency\_within\_group

```python
@staticmethod
def is_dependency_within_group(name)
```

<a id="bw2data.parameters.ProjectParameter.is_deletable"></a>

#### is\_deletable

```python
def is_deletable()
```

Perform a test to see if the current parameter can be deleted.

<a id="bw2data.parameters.ProjectParameter.update_formula_parameter_name"></a>

#### update\_formula\_parameter\_name

```python
@classmethod
def update_formula_parameter_name(cls,
                                  old: str,
                                  new: str,
                                  signal: bool = True)
```

Performs an update of the formula of relevant parameters.

NOTE: Make sure to wrap this in an .atomic() statement!

<a id="bw2data.parameters.ProjectParameter.dict"></a>

#### dict

```python
@property
def dict()
```

Parameter data as a standardized dictionary

<a id="bw2data.parameters.DatabaseParameter"></a>

## DatabaseParameter Objects

```python
class DatabaseParameter(ParameterBase)
```

Parameter set for a database. Group name is the name of the database.

Columns:

    * database: str
    * name: str, unique within a database
    * formula: str, optional
    * amount: float, optional
    * data: object, optional. Used for any other metadata.

Note that there is no magic for reading and writing to ``data`` (unlike ``Activity`` objects) - it must be used directly.

<a id="bw2data.parameters.DatabaseParameter.database"></a>

#### database

<a id="bw2data.parameters.DatabaseParameter.name"></a>

#### name

<a id="bw2data.parameters.DatabaseParameter.formula"></a>

#### formula

<a id="bw2data.parameters.DatabaseParameter.amount"></a>

#### amount

<a id="bw2data.parameters.DatabaseParameter.data"></a>

#### data

<a id="bw2data.parameters.DatabaseParameter.Meta"></a>

## Meta Objects

```python
class Meta()
```

<a id="bw2data.parameters.DatabaseParameter.Meta.indexes"></a>

#### indexes

<a id="bw2data.parameters.DatabaseParameter.Meta.constraints"></a>

#### constraints

<a id="bw2data.parameters.DatabaseParameter.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.parameters.DatabaseParameter.load"></a>

#### load

```python
@staticmethod
def load(database)
```

Return dictionary of parameter data with names as keys and ``.dict()`` as values.

<a id="bw2data.parameters.DatabaseParameter.expired"></a>

#### expired

```python
@staticmethod
def expired(database)
```

Return boolean - is this group expired?

<a id="bw2data.parameters.DatabaseParameter.static"></a>

#### static

```python
@staticmethod
def static(database, only=None)
```

Return dictionary of {name: amount} for database group.

<a id="bw2data.parameters.DatabaseParameter.recalculate"></a>

#### recalculate

```python
@staticmethod
def recalculate(database: str, signal: bool = True)
```

Recalculate all database parameters for ``database``, if expired.

<a id="bw2data.parameters.DatabaseParameter.dependency_chain"></a>

#### dependency\_chain

```python
@staticmethod
def dependency_chain(group, include_self=False)
```

Find where each missing variable is defined in dependency chain.

If ``include_self`` is True will include parameters within the group as possible dependencies

**Returns**:

  
  .. code-block:: python
  
  [
  {
- `'kind'` - one of 'project', 'database', 'activity',
- `'group'` - group name,
- `'names'` - set of variables names
  }
  ]

<a id="bw2data.parameters.DatabaseParameter.is_dependency_within_group"></a>

#### is\_dependency\_within\_group

```python
@staticmethod
def is_dependency_within_group(name, database)
```

<a id="bw2data.parameters.DatabaseParameter.save"></a>

#### save

```python
def save(*args, **kwargs)
```

Save this model instance

<a id="bw2data.parameters.DatabaseParameter.is_deletable"></a>

#### is\_deletable

```python
def is_deletable()
```

Perform a test to see if the current parameter can be deleted.

<a id="bw2data.parameters.DatabaseParameter.is_dependent_on"></a>

#### is\_dependent\_on

```python
@staticmethod
def is_dependent_on(name)
```

Test if any database parameters are dependent on the given
project parameter name.

<a id="bw2data.parameters.DatabaseParameter.update_formula_project_parameter_name"></a>

#### update\_formula\_project\_parameter\_name

```python
@classmethod
def update_formula_project_parameter_name(cls,
                                          old: str,
                                          new: str,
                                          signal: bool = True)
```

Performs an update of the formula of relevant parameters.

This method specifically targets project parameters used in database
formulas

<a id="bw2data.parameters.DatabaseParameter.update_formula_database_parameter_name"></a>

#### update\_formula\_database\_parameter\_name

```python
@classmethod
def update_formula_database_parameter_name(cls,
                                           old: str,
                                           new: str,
                                           signal: bool = True)
```

Performs an update of the formula of relevant parameters.

This method specifically targets database parameters used in database
formulas

<a id="bw2data.parameters.DatabaseParameter.dict"></a>

#### dict

```python
@property
def dict()
```

Parameter data as a standardized dictionary

<a id="bw2data.parameters.ActivityParameter"></a>

## ActivityParameter Objects

```python
class ActivityParameter(ParameterBase)
```

Parameter set for a group of activities.

Columns:

    - group: str
    - database: str
    - code: str. Code and database define the linked activity for this parameter.
    - name: str, unique within a group
    - formula: str, optional
    - amount: float, optional
    - data: object, optional. Used for any other metadata.

Activities can only have parameters in one group. Group names cannot be 'project' or the name of any existing database.

Activity parameter groups can depend on other activity parameter groups, so that a formula in group "a" can depend on a variable in group "b". This dependency information is stored in ``Group.order`` - in our small example, we could define the following:

.. code-block:: python

    a = Group.get(name="a")
    a.order = ["b", "c"]
    a.save()

In this case, a variable not found in "a" would be searched for in "b" and then "c", in that order. Database and then project parameters are also implicitly included at the end of ``Group.order``.

Note that there is no magic for reading and writing to ``data`` (unlike ``Activity`` objects) - it must be used directly.

<a id="bw2data.parameters.ActivityParameter.group"></a>

#### group

<a id="bw2data.parameters.ActivityParameter.database"></a>

#### database

<a id="bw2data.parameters.ActivityParameter.code"></a>

#### code

<a id="bw2data.parameters.ActivityParameter.name"></a>

#### name

<a id="bw2data.parameters.ActivityParameter.formula"></a>

#### formula

<a id="bw2data.parameters.ActivityParameter.amount"></a>

#### amount

<a id="bw2data.parameters.ActivityParameter.data"></a>

#### data

<a id="bw2data.parameters.ActivityParameter.Meta"></a>

## Meta Objects

```python
class Meta()
```

<a id="bw2data.parameters.ActivityParameter.Meta.indexes"></a>

#### indexes

<a id="bw2data.parameters.ActivityParameter.Meta.constraints"></a>

#### constraints

<a id="bw2data.parameters.ActivityParameter.__str__"></a>

#### \_\_str\_\_

```python
def __str__()
```

<a id="bw2data.parameters.ActivityParameter.load"></a>

#### load

```python
@staticmethod
def load(group)
```

Return dictionary of parameter data with names as keys and ``.dict()`` as values.

<a id="bw2data.parameters.ActivityParameter.static"></a>

#### static

```python
@staticmethod
def static(group, only=None, full=False)
```

Get dictionary of ``{name: amount}`` for parameters defined in ``group``.

``only`` restricts returned names to ones found in ``only``. ``full`` returns all names, including those found in the dependency chain.

<a id="bw2data.parameters.ActivityParameter.insert_dummy"></a>

#### insert\_dummy

```python
@staticmethod
def insert_dummy(group: str, activity: tuple, signal: bool = True)
```

<a id="bw2data.parameters.ActivityParameter.expired"></a>

#### expired

```python
@staticmethod
def expired(group)
```

Return boolean - is this group expired?

<a id="bw2data.parameters.ActivityParameter.dependency_chain"></a>

#### dependency\_chain

```python
@staticmethod
def dependency_chain(group, include_self=False)
```

Find where each missing variable is defined in dependency chain.

Will also load in all parameters needed to resolve the ``ParameterizedExchanges`` for this group.

If ``include_self`` is True will include parameters within the group as possible dependencies

**Returns**:

  
  .. code-block:: python
  
  [
  {
- `'kind'` - one of 'project', 'database', 'activity',
- `'group'` - group name,
- `'names'` - set of variables names
  }
  ]

<a id="bw2data.parameters.ActivityParameter.is_dependency_within_group"></a>

#### is\_dependency\_within\_group

```python
@staticmethod
def is_dependency_within_group(name, group, include_order=False)
```

Determine if the given parameter `name` is a dependency within
the given activity `group`.

The optional ``include_order`` parameter will include dependencies
from groups found in the the ``Group``.`order` field.

<a id="bw2data.parameters.ActivityParameter.recalculate"></a>

#### recalculate

```python
@staticmethod
def recalculate(group: str, signal: bool = True)
```

Recalculate all values for activity parameters in this group, and update their underlying `Activity` and `Exchange` values.

<a id="bw2data.parameters.ActivityParameter.recalculate_exchanges"></a>

#### recalculate\_exchanges

```python
@staticmethod
def recalculate_exchanges(group: str, signal: bool = True)
```

Recalculate formulas for all parameterized exchanges in group ``group``.

<a id="bw2data.parameters.ActivityParameter.save"></a>

#### save

```python
def save(*args, **kwargs)
```

Save this model instance

<a id="bw2data.parameters.ActivityParameter.is_deletable"></a>

#### is\_deletable

```python
def is_deletable()
```

Perform a test to see if the current parameter can be deleted.

<a id="bw2data.parameters.ActivityParameter.is_dependent_on"></a>

#### is\_dependent\_on

```python
@staticmethod
def is_dependent_on(name, group)
```

Test if any activity parameters are dependent on the given
parameter name from the given group.

<a id="bw2data.parameters.ActivityParameter.update_formula_project_parameter_name"></a>

#### update\_formula\_project\_parameter\_name

```python
@classmethod
def update_formula_project_parameter_name(cls,
                                          old: str,
                                          new: str,
                                          signal: bool = True)
```

Performs an update of the formula of relevant parameters.

This method specifically targets project parameters used in activity
formulas

<a id="bw2data.parameters.ActivityParameter.update_formula_database_parameter_name"></a>

#### update\_formula\_database\_parameter\_name

```python
@classmethod
def update_formula_database_parameter_name(cls,
                                           old: str,
                                           new: str,
                                           signal: bool = True)
```

Performs an update of the formula of relevant parameters.

This method specifically targets database parameters used in activity
formulas

<a id="bw2data.parameters.ActivityParameter.update_formula_activity_parameter_name"></a>

#### update\_formula\_activity\_parameter\_name

```python
@classmethod
def update_formula_activity_parameter_name(cls,
                                           old: str,
                                           new: str,
                                           include_order: bool = False,
                                           signal: bool = True)
```

Performs an update of the formula of relevant parameters.

This method specifically targets activity parameters used in activity
formulas

<a id="bw2data.parameters.ActivityParameter.create_table"></a>

#### create\_table

```python
@classmethod
def create_table(cls)
```

<a id="bw2data.parameters.ActivityParameter.dict"></a>

#### dict

```python
@property
def dict()
```

Parameter data as a standardized dictionary

<a id="bw2data.parameters.ParameterizedExchange"></a>

## ParameterizedExchange Objects

```python
class ParameterizedExchange(SnowflakeIDBaseClass)
```

<a id="bw2data.parameters.ParameterizedExchange.group"></a>

#### group

<a id="bw2data.parameters.ParameterizedExchange.exchange"></a>

#### exchange

<a id="bw2data.parameters.ParameterizedExchange.formula"></a>

#### formula

<a id="bw2data.parameters.ParameterizedExchange.create_table"></a>

#### create\_table

```python
@classmethod
def create_table(cls)
```

<a id="bw2data.parameters.ParameterizedExchange.save"></a>

#### save

```python
def save(*args, **kwargs)
```

<a id="bw2data.parameters.ParameterizedExchange.load"></a>

#### load

```python
@staticmethod
def load(group)
```

Return dictionary of parameter data with names as keys and ``.dict()`` as values.

<a id="bw2data.parameters.ParameterizedExchange.recalculate"></a>

#### recalculate

```python
@staticmethod
def recalculate(group)
```

Shortcut for ``ActivityParameter.recalculate_exchanges``.

<a id="bw2data.parameters.Group"></a>

## Group Objects

```python
class Group(SnowflakeIDBaseClass)
```

<a id="bw2data.parameters.Group.name"></a>

#### name

<a id="bw2data.parameters.Group.fresh"></a>

#### fresh

<a id="bw2data.parameters.Group.updated"></a>

#### updated

<a id="bw2data.parameters.Group.order"></a>

#### order

<a id="bw2data.parameters.Group.expire"></a>

#### expire

```python
def expire()
```

Set ``fresh`` to ``False``

<a id="bw2data.parameters.Group.freshen"></a>

#### freshen

```python
def freshen()
```

Set ``fresh`` to ``True``

<a id="bw2data.parameters.Group.save"></a>

#### save

```python
def save(*args, **kwargs)
```

Save this model instance. Will remove 'project' and database names from ``order``.

<a id="bw2data.parameters.Group.purge_order"></a>

#### purge\_order

```python
def purge_order()
```

<a id="bw2data.parameters.Group.Meta"></a>

## Meta Objects

```python
class Meta()
```

<a id="bw2data.parameters.Group.Meta.table_name"></a>

#### table\_name

<a id="bw2data.parameters.GroupDependency"></a>

## GroupDependency Objects

```python
class GroupDependency(Model)
```

<a id="bw2data.parameters.GroupDependency.group"></a>

#### group

<a id="bw2data.parameters.GroupDependency.depends"></a>

#### depends

<a id="bw2data.parameters.GroupDependency.Meta"></a>

## Meta Objects

```python
class Meta()
```

<a id="bw2data.parameters.GroupDependency.Meta.indexes"></a>

#### indexes

<a id="bw2data.parameters.GroupDependency.Meta.constraints"></a>

#### constraints

<a id="bw2data.parameters.GroupDependency.save"></a>

#### save

```python
def save(*args, **kwargs)
```

<a id="bw2data.parameters.GroupDependency.create_table"></a>

#### create\_table

```python
@classmethod
def create_table(cls)
```

<a id="bw2data.parameters.ParameterManager"></a>

## ParameterManager Objects

```python
class ParameterManager()
```

<a id="bw2data.parameters.ParameterManager.__init__"></a>

#### \_\_init\_\_

```python
def __init__()
```

<a id="bw2data.parameters.ParameterManager.add_to_group"></a>

#### add\_to\_group

```python
def add_to_group(group, activity)
```

Add `activity` to group.

Creates ``group`` if needed.

Will delete any existing ``ActivityParameter`` for this activity.

Deletes `parameters` key from `Activity`.

<a id="bw2data.parameters.ParameterManager.remove_from_group"></a>

#### remove\_from\_group

```python
def remove_from_group(group, activity, restore_amounts=True)
```

Remove `activity` from `group`.

Will delete any existing ``ActivityParameter`` and ``ParameterizedExchange`` for this activity.

Restores `parameters` key to this `Activity`.
By default, restores `amount` value of each parameterized exchange
of the `Activity` to the original value. This can be avoided by using
the ``restore_amounts`` parameter.

<a id="bw2data.parameters.ParameterManager.add_exchanges_to_group"></a>

#### add\_exchanges\_to\_group

```python
def add_exchanges_to_group(group, activity)
```

Add exchanges with formulas from ``activity`` to ``group``.

Every exchange with a formula field will have its original `amount`
value stored as `original_amount`. This original value can be
restored when parameterization is removed from the activity with
`remove_from_group`.

<a id="bw2data.parameters.ParameterManager.remove_exchanges_from_group"></a>

#### remove\_exchanges\_from\_group

```python
def remove_exchanges_from_group(group, activity, restore_original=True)
```

Takes a group and activity and removes all ``ParameterizedExchange``
objects from the group.

The ``restore_original`` parameter determines if the original amount
values will be restored to those exchanges where a formula was used
to alter the amount.

<a id="bw2data.parameters.ParameterManager.new_project_parameters"></a>

#### new\_project\_parameters

```python
def new_project_parameters(data, overwrite=True)
```

Correctly enter multiple parameters.

Will overwrite existing project parameters with the same name, unless ``overwrite`` is false, in which case a ``ValueError`` is raised.

``data`` should be a list of dictionaries:

.. code-block:: python

    [{
        'name': name of variable (unique),
        'amount': numeric value of variable (optional),
        'formula': formula in Python as string (optional),
        optional keys like uncertainty, etc. (no limitations)
    }]

<a id="bw2data.parameters.ParameterManager.new_database_parameters"></a>

#### new\_database\_parameters

```python
def new_database_parameters(data, database, overwrite=True)
```

Correctly enter multiple parameters. Deletes **all** existing database parameters for this database.

Will overwrite existing database parameters with the same name, unless ``overwrite`` is false, in which case a ``ValueError`` is raised.

``database`` should be an existing database. ``data`` should be a list of dictionaries:

.. code-block:: python

    [{
        'name': name of variable (unique),
        'amount': numeric value of variable (optional),
        'formula': formula in Python as string (optional),
        optional keys like uncertainty, etc. (no limitations)
    }]

<a id="bw2data.parameters.ParameterManager.new_activity_parameters"></a>

#### new\_activity\_parameters

```python
def new_activity_parameters(data, group, overwrite=True)
```

Correctly enter multiple parameters. Deletes **all** existing activity parameters for this group.

Will overwrite existing parameters in the same group with the same name, unless ``overwrite`` is false, in which case a ``ValueError`` is raised.

Input parameters must refer to a single, existing database.

``group`` is the group name; will be autocreated if necessary. ``data`` should be a list of dictionaries:

.. code-block:: python

    [{
        'name': name of variable (unique),
        'database': activity database,
        'code': activity code,
        'amount': numeric value of variable (optional),
        'formula': formula in Python as string (optional),
        optional keys like uncertainty, etc. (no limitations)
    }]

<a id="bw2data.parameters.ParameterManager.rename_project_parameter"></a>

#### rename\_project\_parameter

```python
def rename_project_parameter(parameter, new_name, update_dependencies=False)
```

Given a parameter and a new name, safely update the parameter.

Will raise a TypeError if the given parameter is of the incorrect type.
Will raise a ValueError if other parameters depend on the given one
and ``update_dependencies`` is False.

<a id="bw2data.parameters.ParameterManager.rename_database_parameter"></a>

#### rename\_database\_parameter

```python
def rename_database_parameter(parameter, new_name, update_dependencies=False)
```

Given a parameter and a new name, safely update the parameter.

Will raise a TypeError if the given parameter is of the incorrect type.
Will raise a ValueError if other parameters depend on the given one
and ``update_dependencies`` is False.

<a id="bw2data.parameters.ParameterManager.rename_activity_parameter"></a>

#### rename\_activity\_parameter

```python
def rename_activity_parameter(parameter, new_name, update_dependencies=False)
```

Given a parameter and a new name, safely update the parameter.

Will raise a TypeError if the given parameter is of the incorrect type.
Will raise a ValueError if other parameters depend on the given one
and ``update_dependencies`` is False.

<a id="bw2data.parameters.ParameterManager.recalculate"></a>

#### recalculate

```python
def recalculate()
```

Recalculate all expired project, database, and activity parameters, as well as exchanges.

<a id="bw2data.parameters.ParameterManager.__len__"></a>

#### \_\_len\_\_

```python
def __len__()
```

<a id="bw2data.parameters.ParameterManager.__repr__"></a>

#### \_\_repr\_\_

```python
def __repr__()
```

<a id="bw2data.parameters.parameters"></a>

#### parameters

<a id="bw2data.parameters.get_new_symbols"></a>

#### get\_new\_symbols

```python
def get_new_symbols(data, context=None)
```

<a id="bw2data.parameters.alter_parameter_formula"></a>

#### alter\_parameter\_formula

```python
def alter_parameter_formula(parameter, old, new)
```

Replace the `old` part with `new` in the formula field and return
the parameter itself.
