---
title: ecoinvent_interface gotchas
type: module-page
summary: "What surprises people about ecoinvent_interface: licences, precedence and caches."
audience: [P1, P3]
updated: 2026-09-21
sources: [pypi-ecoinvent-interface, ecoinvent-interface-repo]
---

# ecoinvent_interface gotchas

- **It is unofficial and unsupported.** The README says so in its first line. ecoinvent
  does not support this client, and the API it consumes is described by the maintainers
  as unpublished and under development (source: ecoinvent-interface-repo).
- **A licence is not enough; you must also accept the agreements.** The ecoinvent
  licence and the personal identifying information agreement have to be accepted on the
  ecoinvent website for the account before the library can use it. Nothing in the
  library can do this for you (source: ecoinvent-interface-repo).
- **Versions below 3.0 stopped working in February 2025.** An old pin fails at
  authentication, not at import, which makes it look like a credential problem
  (source: ecoinvent-interface-repo).
- **Three credential sources, with a fixed precedence.** Values passed to `Settings`
  win over the `EI_USERNAME` and `EI_PASSWORD` environment variables, which win over
  the secrets directory. A stale secrets file is therefore invisible until you remove
  the variable that was masking it (source: ecoinvent-interface-repo).
- **Never commit credentials.** Secrets belong in the secrets directory on a private
  machine, or in environment variables on a server or container. This wiki records
  variable names only, never values.
- **The cache location is operating-system dependent.** It comes from platformdirs, so
  the same code puts files in different places on Linux, macOS and Windows. Set
  `Settings(output_path=...)` when a pipeline needs a predictable path
  (source: ecoinvent-interface-repo).
- **Archives are extracted by default.** Budget disk space for both the archive and its
  contents (source: ecoinvent-interface-repo).
- **Release types are not interchangeable.** `lci` and `lcia` are results, not
  inventories. If you want a database to calculate with, that is `ecospold`, or
  `matrix` if you work at matrix level (source: ecoinvent-interface-repo).
- **System model names come in two forms.** `list_system_models` returns short names by
  default and long official names with `translate=False`; both are accepted elsewhere,
  which means two spellings of the same thing circulate in user code
  (source: ecoinvent-interface-repo).
- **Attribute-based process selection can be ambiguous.** `select_process` raises when
  the attributes do not identify exactly one dataset, and fuzzy string comparison means
  a near miss may match something you did not intend. Check `get_basic_info` before
  downloading (source: ecoinvent-interface-repo).
- **The bundled index stops at the versions it knows.** A release newer than the
  bundled mappings needs `ProcessMapping.create_remote_mapping` before filename or
  attribute selection works (source: pypi-ecoinvent-interface).
- **`get_file` will not guess a directory.** The single-process download requires an
  explicit `directory` argument (source: ecoinvent-interface-repo).
- **Do not expect Brightway integration here.** By policy, Brightway-specific code and
  helpers that fetch LCI or LCIA values for a process are out of scope for this library
  (source: ecoinvent-interface-repo).
