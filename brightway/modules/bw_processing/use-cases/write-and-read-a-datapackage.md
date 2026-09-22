---
title: Write and read a datapackage
type: use-case
summary: Build a technosphere datapackage in memory, serialise it to a zip file, load it back and check the arrays survived the round trip.
audience: [P1]
updated: 2026-09-22
sources: [bw-processing-docs, pypi-bw-processing]
verified: yes
verified_on: 2026-09-22
verified_env: uv 0.11.14, Python 3.11, throwaway environment with bw_processing 1.6, Linux x86-64
related: [../commands.md, ../classes.md, ../gotchas.md, ../../matrix_utils/use-cases/build-a-matrix-from-a-datapackage.md]
---

# Write and read a datapackage

**Persona:** P1 practitioner, or a P2 contributor writing a tool that has to hand
matrices to Brightway without going through a project · **GICS sector:** any

## Goal

A datapackage holding one technosphere resource group, first in memory and then as a zip
file on disk, with the arrays verified identical after loading it back. This is the
storage layer everything in Brightway 2.5 calculates from.

## Prerequisites

- `bw_processing` 1.6 and `numpy`. Nothing else: no project, no database, no network.
- The distribution is `bw-processing` on PyPI and the import name is `bw_processing`.

## Steps

1. Describe the matrix as three parallel arrays: where the values go, what they are, and
   which of them are negative once inserted.

   ```python
   import numpy as np
   import bw_processing as bwp

   indices = np.array([(101, 101), (102, 101), (103, 101),
                       (102, 102), (103, 102), (103, 103)], dtype=bwp.INDICES_DTYPE)
   data = np.array([1.0, 0.7, 1.2, 1.0, 0.3, 1.0])
   flip = np.array([False, True, True, False, True, False])
   ```

   The ids are the toy bakery's three processes: 101 bread, 102 flour, 103 heat. Each
   pair is `(row, col)`, so `(102, 101)` is flour consumed by bread.

2. Create an in-memory datapackage and add the group.

   ```python
   dp = bwp.create_datapackage(name="toy-bakery-technosphere")
   dp.add_persistent_vector(
       matrix="technosphere_matrix",
       indices_array=indices,
       data_array=data,
       flip_array=flip,
       name="toy-technosphere",
   )
   ```

3. Look at what you built.

   ```python
   [r["name"] for r in dp.resources]
   dp.get_resource("toy-technosphere.data")[0]
   dp.get_resource("toy-technosphere.indices")[0]
   dp.metadata["name"], dp.metadata["id"]
   ```

4. Write the same package to a zip file. The filesystem is passed in, not the path.

   ```python
   from pathlib import Path
   import tempfile

   out = Path(tempfile.mkdtemp())
   zfs = bwp.generic_zipfile_filesystem(dirpath=out, filename="toy-technosphere.zip", write=True)

   dp2 = bwp.create_datapackage(fs=zfs, name="toy-bakery-technosphere")
   dp2.add_persistent_vector(
       matrix="technosphere_matrix", indices_array=indices,
       data_array=data, flip_array=flip, name="toy-technosphere",
   )
   dp2.finalize_serialization()
   ```

5. Load it back and compare.

   ```python
   loaded = bwp.load_datapackage(
       bwp.generic_zipfile_filesystem(dirpath=out, filename="toy-technosphere.zip", write=False)
   )
   [r["name"] for r in loaded.resources]
   np.array_equal(loaded.get_resource("toy-technosphere.data")[0], data)
   np.array_equal(loaded.get_resource("toy-technosphere.flip")[0], flip)
   ```

6. Hand it to `matrix_utils` when you want the matrix itself; see
   [../../matrix_utils/use-cases/build-a-matrix-from-a-datapackage.md](../../matrix_utils/use-cases/build-a-matrix-from-a-datapackage.md).

## Expected output

- One `add_persistent_vector` call produces **three** resources, not one:
  `toy-technosphere.indices`, `toy-technosphere.data` and `toy-technosphere.flip`.
- `dp.metadata` carries thirteen keys, among them `name`, `id`, `created`, `licenses`,
  `profile`, `resources`, `seed`, `sum_intra_duplicates`, `sum_inter_duplicates`,
  `combinatorial`, `sequential`, `64_bit_indices` and
  `matrix_serialize_format_type`. The `id` is a generated hexadecimal string.
- The data resource comes back as a float64 array of shape `(6,)` holding exactly the
  values you wrote. The indices resource is a structured array printing as
  `[(101, 101) (102, 101) ...]`.
- The zip is about 1.3 kB and holds four members: `datapackage.json` plus one `.npy` per
  resource.
- Both `array_equal` checks are `True`.

## Pitfalls

- **Do not call `Datapackage()` directly.** Use `create_datapackage()` or
  `load_datapackage()`; a bare instance is not initialised. See
  [../gotchas.md](../gotchas.md).
- **`create_datapackage` has no `fp` argument.** It takes `fs`, an `fsspec` filesystem.
  Build one with `generic_zipfile_filesystem` or `generic_directory_filesystem`; both
  take keyword arguments only.
- **Signs live in `flip`, not in the data.** Store amounts positive and let the flip
  vector make them negative on insertion. Writing a negative amount *and* setting the
  flip gives you a positive matrix entry (source: bw-processing-docs).
- **One array is not the matrix.** Two resource groups can write to the same matrix,
  adding to or replacing each other. Counting rows of one array tells you nothing about
  the matrix's size.
- **Integer ids are local to the machine that wrote the package.** Moving a package
  without reindexing gives you a matrix built from the wrong nodes, not an error. Write
  `add_csv_metadata` at write time if the package will travel.
- **`DEFAULT_LICENSES` is a default, not a claim.** A new package records the Open Data
  Commons PDDL; set the metadata yourself if your numbers are licensed.
- **`simple_graph` is deprecated in 1.6;** use `create_datapackage_from_entries`.

## Related vocabulary

- [Datapackage](../../../../vocabulary.md#datapackage)
- [Resource group](../../../../vocabulary.md#resource-group)
- [Processed arrays](../../../../vocabulary.md#processed-arrays)
- [Manifest](../../../../vocabulary.md#manifest)
- [Schema](../../../../vocabulary.md#schema)
- [Technosphere](../../../../vocabulary.md#technosphere)
- [Ordered pair](../../../../vocabulary.md#ordered-pair)
- [Metadata](../../../../vocabulary.md#metadata)

## Verification

Run on 2026-09-22 in a throwaway `uv` environment, `uv 0.11.14`, Python 3.11,
`bw_processing` 1.6 with `numpy`, Linux x86-64. The in-memory package had the three
resources named above and thirteen metadata keys; the zip was 1 342 bytes with the four
members listed; both round-trip comparisons returned `True`. Duration: under 2 seconds,
including installing the environment from a warm `uv` cache.
