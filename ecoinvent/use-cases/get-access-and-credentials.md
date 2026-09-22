---
title: Get access and credentials
type: use-case
summary: "Work out which ecoinvent licence you need, where the credentials then live, and what you may do with the data once you have them."
audience: [P1, P2]
updated: 2026-09-22
sources: [ecoinvent-licences, ecoinvent-eula, ecoinvent-website, ecoinvent-interface-repo]
verified: no
---

# Get access and credentials

**Persona:** P1 practitioner, or a P2 contributor who has to explain to a colleague why a
step in this wiki cannot be run · **GICS sector:** any

## Goal

A decision about which licence type fits, an account whose credentials the tooling can
find, and a clear line in your head about what may leave your machine afterwards.

## Prerequisites

- A budget and an organisation, because there is no free tier. Access to the database is
  acquired through a licence, and every route into the data, web interface or programmatic,
  authenticates against it (source: ecoinvent-website).
- For the programmatic route, a licence type that permits it.

## Steps

1. Decide what you need before you order. Four licence types are offered
   (source: ecoinvent-licences): Single-User for one named user, Enterprise for a company
   with several users and central licence management, Developer for software integration,
   which is the one type carrying a sub-licensing contract, and Educational for teaching.
   The details and the constraints are on
   [../knowledge/access-and-licence.md](../knowledge/access-and-licence.md).

2. See what you can look at without a licence first, so you know what you are buying. The
   web interface lets a guest register and view the
   [metadata](../../vocabulary.md#metadata) and description of every dataset: names,
   geographies, time periods, classifications and documentation. The
   [exchanges](../../vocabulary.md#exchange) and the undefined unit processes are for
   licensees.

3. Acquire the licence through the publisher and receive an account.

4. Put the credentials where the tooling looks for them, and nowhere else. The Python
   client resolves them from directly passed values first, then environment variables,
   then a secrets directory it writes with a helper:

   ```python
   from ecoinvent_interface import permanent_setting

   permanent_setting("username", "<your username>")
   permanent_setting("password", "<your password>")
   ```

5. Confirm the credentials work by listing the releases your account can see, which is
   the first call that authenticates:

   ```bash
   uv run --with ecoinvent_interface python -c "from ecoinvent_interface import EcoinventRelease, Settings; print(EcoinventRelease(Settings()).list_versions())"
   ```

## Expected output

Step 5 returns the list of versions your licence gives you. Without credentials it does
not fail at the network: the client refuses before any request, with a `ValueError` saying
the username is missing and pointing at the configuration documentation. That is the
whole no-credentials experience of this package, and it is why every ecoinvent use case in
this wiki that needs data is marked unverified.

## Pitfalls

- **Never put credentials in a notebook, a script or a repository.** Use the secrets
  directory or environment variables. Nothing in this wiki holds a credential, by rule.
- **The licence, not the file, decides what you may share.** Names, units, versions and
  classifications are describable; inventory amounts and characterisation factors are
  not, and a table of them amounts to redistribution.
- **Sub-licensing is a Developer-licence question.** Only that type carries a
  sub-licensing contract, and what it permits a tool's users is limited. Do not assume a
  Single-User licence lets you ship results to clients without reading the agreement.
- **A guest account is not a licence.** It shows you the shape of the database, which is
  enough to plan with and not enough to calculate with.
- **Credentials expire and rotate.** A run that worked last month failing at the first
  authenticated call is usually an expired subscription, not a bug.

## Related vocabulary

[LCA database](../../vocabulary.md#lca-database),
[system model](../../vocabulary.md#system-model),
[metadata](../../vocabulary.md#metadata),
[exchange](../../vocabulary.md#exchange),
[unit process, single operation](../../vocabulary.md#unit-process-single-operation),
[activity](../../vocabulary.md#activity),
[disclosed to the public](../../vocabulary.md#disclosed-to-the-public).

## Verification

`verified: no`. No ecoinvent licence or credentials were available in this environment, so
steps 3 to 5 could not be completed. What was checked on 2026-09-22, with `uv` 0.11.14 and
Python 3.11.15 on Ubuntu 22.04 and a clean home directory, is the no-credentials
behaviour described under Expected output: `ecoinvent_interface` 3.1 constructs its
settings object and its release object with no credentials and raises `ValueError:
Missing username; see configurations docs` on the first authenticated call. Steps 1 and 2
are read from the publisher's own licence and knowledge-base pages. A verifier with a
licence would run step 5 and record only that a version list came back, never its
contents beyond version labels.
