---
title: randonneur classes and functions
type: module-page
summary: The public surface of randonneur 0.7.2, in the order a user meets it.
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-randonneur, randonneur-repo]
---

# randonneur classes and functions

Hand-written companion to the generated `api/` folder. Names and signatures were read
by importing randonneur 0.7.2 from PyPI and inspecting `__all__` and the signatures
(source: pypi-randonneur); the behaviour descriptions follow the repository README
(source: randonneur-repo).

| Name | Kind | What it is for | Invoked by |
|---|---|---|---|
| `migrate_edges` | function | Apply a transformation dictionary to every edge of every node in a graph | `rn.migrate_edges(graph, migrations, config=...)` |
| `migrate_nodes` | function | Apply a transformation dictionary to every node in a graph | `rn.migrate_nodes(graph, migrations, config=...)` |
| `migrate_edges_with_stored_data` | function | The same, with the transformation looked up by label in the `randonneur_data` registry | `rn.migrate_edges_with_stored_data(graph, "ecoinvent-3.10-cutoff-ecoinvent-3.11-cutoff")` |
| `migrate_nodes_with_stored_data` | function | The node equivalent of the previous entry | `rn.migrate_nodes_with_stored_data(graph, label)` |
| `MigrationConfig` | class | Every option that changes how a migration matches and what it applies | `rn.MigrationConfig(fields=["name"], verbs=["update"])` |
| `MappingConstants` | class | Ready-made label mappings per serialisation, as class attributes | `rn.MappingConstants.ECOSPOLD2_BIO` |
| `Datapackage` | class | An in-memory transformation file with its metadata, which can add verbs and write JSON | `rn.Datapackage(name=..., description=..., contributors=[...], mapping_source=..., mapping_target=...)` |
| `create_excel_template` | function | Write an Excel workbook a domain expert can fill in with matches | `rn.create_excel_template(data, Path("matching.xlsx"))` |
| `read_excel_template` | function | Read that workbook back and return a `Datapackage` | `rn.read_excel_template(Path("matching.xlsx"))` |
| `errors` | module | The exception types the library raises | `except rn.errors.…` |
| `utils` | module | Matching helpers, including the attributes never copied over | `rn.utils.EXCLUDED_ATTRS` |

## Signatures worth knowing

```python
migrate_edges(graph: list[dict], migrations: dict, config: MigrationConfig | None = None) -> list[dict]

migrate_edges_with_stored_data(
    graph: list[dict],
    label: str,
    data_registry_path: Path | None = None,
    config: MigrationConfig | None = None,
) -> list[dict]
```

`MigrationConfig` takes, as keyword arguments only: `mapping`, `node_filter`,
`edge_filter`, `fields`, `verbose`, `edges_label`, `verbs`, `case_sensitive`,
`add_extra_attributes`, `add_conversion_factor_to_nodes`.

## The five verbs

A transformation file names the changes it makes with a verb. The reference
implementation knows `create`, `replace`, `update`, `delete` and `disaggregate`
(source: randonneur-repo).

- `replace` swaps the object an edge points at. The new object must be fully described;
  quantitative values are not carried over, and a `conversion_factor` rescales the
  amount when units change.
- `update` changes some attributes of the same object. The implementation is identical
  to `replace`; the difference is intent.
- `create` adds a node or an edge, and must therefore give every field including the
  amount. The README recommends going through normal importing instead.
- `delete` removes matched edges.
- `disaggregate` splits one edge into several, using an `allocation` field per target.
  The `allocation` values do not have to sum to one.

Only `replace`, `update` and `disaggregate` run by default. `create` and `delete` have
to be requested explicitly in `MigrationConfig(verbs=[...])`, because they are the
destructive ones (source: randonneur-repo).

## Notes

- `graph` is a plain list of dictionaries. Each node carries its edges under a key
  named by `edges_label`, which defaults to `edges` and can be set to `exchanges` or
  `flows` for other formats.
- Matching compares the `source` block of a transformation against the object. With
  `fields` set, only those keys are compared, and a transformation whose `source` names
  extra keys still matches.
- `mapping` renames labels in the transformation to fit the data, not the other way
  round; it takes `{"source": {...}, "target": {...}}` with `{old: new}` pairs.
- These functions return a new list rather than editing the caller's objects in place
  for every case, so treat the return value as the result and do not assume the input
  is untouched.
