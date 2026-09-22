---
title: randonneur commands
type: module-page
summary: randonneur has no command line; everything runs from Python.
audience: [P1]
updated: 2026-09-22
sources: [pypi-randonneur, randonneur-repo]
---

# randonneur commands

randonneur 0.7.2 installs **no console script**. The wheel published on PyPI contains
no `entry_points.txt`, which was checked by reading the wheel's metadata directly
(source: pypi-randonneur). There is therefore nothing to run with `--help`.

| Command | What it does | Key options |
|---|---|---|
| none | randonneur is a library only | not applicable |

## Notebook entry points

These are the calls a practitioner actually uses. The example below is the one in the
repository README, reduced to its shape (source: randonneur-repo).

```python
import randonneur as rn

my_lci = [{"name": "my process", "edges": [{"name": "Xylene {RER}| xylene production | Cut-off, U", "amount": 1.0}]}]

transformed = rn.migrate_edges_with_stored_data(
    my_lci,
    "simapro-ecoinvent-3.9.1-cutoff",
    config=rn.MigrationConfig(fields=["name"]),
)
```

Applying a transformation you loaded yourself:

```python
import json
import randonneur as rn

migrations = json.load(open("my-migration.json"))
result = rn.migrate_edges(my_lci, migrations, config=rn.MigrationConfig(verbs=["update", "replace"]))
```

Listing what is available in the registry, which lives in the companion package:

```python
import randonneur_data as rd

registry = rd.Registry()
sorted(registry)  # Registry is iterable over its keys
registry.get_file("ecoinvent-3.10-cutoff-ecoinvent-3.11-cutoff")
```

Building a transformation file from a spreadsheet:

```python
from pathlib import Path
import randonneur as rn

rn.create_excel_template(data=rows, filepath=Path("matching.xlsx"))
# a domain expert fills in the Matching worksheet
datapackage = rn.read_excel_template(Path("matching.xlsx"))
```

## Related command lines

`flowmapper` does have a command line, and one of its output formats is a randonneur
transformation file. See [../flowmapper/commands.md](../flowmapper/commands.md).
