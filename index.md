# Index

Every page of the wiki, one line each, grouped by branch and then by folder.
When you add, rename or remove a page, edit this file.

## Start here, by reader

- **Practitioner (P1):** [core/use-cases/](#coreuse-cases) for the method walk-throughs, [core/sectors/](#coresectors) for your GICS sector, then the module `use-cases/` folders under [sentier/](#sentier) and [brightway/](#brightway) for verified commands, and [bafu/](#bafu) or [ecoinvent/](#ecoinvent) for the database you use.
- **Contributor (P2):** [CONTRIBUTING.md](CONTRIBUTING.md), then each branch's `roadmap.md` (listed under its branch heading) for what is open.
- **Wiki developer (P3):** [CLAUDE.md](CLAUDE.md), then the templates the index does not list: `templates/community/` for a new branch and `templates/pages/` for page types.

## Root

- [README.md](README.md) — Human landing page: what this wiki is, who it is for, how to read it.
- [CLAUDE.md](CLAUDE.md) — Schema for agents: page types, frontmatter, link rules, workflows, constraints.
- [AGENTS.md](AGENTS.md) — Tool-neutral mirror of CLAUDE.md.
- [CONTRIBUTING.md](CONTRIBUTING.md) — How to add a source, a page, a module or a community branch.
- [SPECS.md](SPECS.md) — The specification the wiki is built against: scope, layout, phases, decisions.
- [sources.md](sources.md) — Registry of every external source the wiki cites, with URL, access date and licence.
- [vocabulary.md](vocabulary.md) — The controlled vocabulary: one heading per term, one bullet per source and context.
- [log.md](log.md) — Append-only log of ingest, query, review and task runs.

## bafu/

- [bafu](bafu/README.md) — The BAFU LCA database as an external data source: what it is, how to get it, what it covers.
- [bafu roadmap](bafu/roadmap.md) — What is missing in the BAFU branch and where a contributor can help.

### bafu/data/

- [bafu/data](bafu/data/README.md) — How to obtain the BAFU data: access notes and fetch scripts where a route exists.
- [Fetching a BAFU release](bafu/data/fetch.md) — Where the files are, why the download cannot be fully automated, and how to verify and unpack them.

### bafu/knowledge/

- [bafu/knowledge](bafu/knowledge/README.md) — What the BAFU database is: methodology, format, versions, licence, coverage, schemas.
- [BAFU access and licence](bafu/knowledge/access-and-licence.md) — The download route, the terms of use, what they permit and what must never be redistributed.
- [BAFU data formats](bafu/knowledge/format.md) — The three components of a BAFU release: the openLCA package, the ecoSpold v1 archive and the LCIA results workbook.
- [BAFU methodology](bafu/knowledge/methodology.md) — How the BAFU database is modelled: unit processes, one linked set, data quality requirements and critical review.
- [BAFU impact assessment methods](bafu/knowledge/methods.md) — The three methods published with a BAFU release: IPCC 2021, Ecological Scarcity 2021 (UBP) and EF 3.1.
- [BAFU schemas and nomenclature](bafu/knowledge/schemas-and-nomenclature.md) — Flow lists, compartments and sub-compartments, units and flow properties, and the identifiers that hold them together.
- [BAFU sector coverage](bafu/knowledge/sector-coverage.md) — What BAFU:2026 v1 covers, counted in the database's own categories and read in GICS terms.
- [BAFU versions and provenance](bafu/knowledge/versions-and-provenance.md) — How BAFU releases are named and numbered, what changed in BAFU:2026 v1, and where the inventory data comes from.
- [BAFU vocabulary](bafu/knowledge/vocabulary.md) — The words a BAFU release uses for its own parts, and where each one is defined in this wiki.

### bafu/use-cases/

- [bafu/use-cases](bafu/use-cases/README.md) — End-to-end things a practitioner does with the BAFU database.
- [Download and verify a BAFU release](bafu/use-cases/download-and-verify-the-release.md) — Get the release components from the Nexus page, record your own checksums because the publisher does not, and unpack what you took.
- [Inspect the LCIA results workbook structure](bafu/use-cases/inspect-the-lcia-results-workbook-structure.md) — Read the shape of the release's results workbook with openpyxl: two sheets, a two-row header, three method families and 47 indicator columns.
- [Where to install BAFU-2026 into Brightway (pointer)](bafu/use-cases/install-into-brightway.md) — A pointer page: the supported route from a BAFU release into Brightway is the Sentier loader, not a hand-written importer, and the commands live on the loader's own pages.
- [Open the release in openLCA](bafu/use-cases/open-the-release-in-openlca.md) — Load the release's openLCA package as a new database, which is a restore rather than an import, and know what that implies.

## brightway/

- [brightway](brightway/README.md) — The Brightway branch: the open-source LCA framework and its ecosystem packages.
- [Brightway commands](brightway/commands.md) — Every runnable command and one-line Python entry point across the Brightway packages, with how each one was checked.
- [Brightway packages](brightway/packages.md) — The landscape table of the 15 Brightway packages this wiki documents, with versions, what each one does and what it exposes.
- [brightway roadmap](brightway/roadmap.md) — What is missing in the Brightway branch and where a contributor can help.

### brightway/modules/

- [brightway/modules](brightway/modules/README.md) — One folder per Brightway package, each following the codebase template.

### brightway/modules/activity-browser/

- [activity-browser](brightway/modules/activity-browser/README.md) — The desktop graphical interface for Brightway projects.
- [activity-browser classes and functions](brightway/modules/activity-browser/classes.md) — The small public surface of Activity Browser, and the structures behind the windows.
- [activity-browser commands](brightway/modules/activity-browser/commands.md) — The activity-browser launcher, and the conda commands around it.
- [activity-browser datasets](brightway/modules/activity-browser/datasets.md) — Activity Browser bundles interface assets, not inventory data.
- [activity-browser gotchas](brightway/modules/activity-browser/gotchas.md) — What surprises people about Activity Browser: two lines, conda, and shared projects.
- [activity-browser layout](brightway/modules/activity-browser/layout.md) — How the activity_browser package is organised, layer by layer.
- [activity-browser status](brightway/modules/activity-browser/status.md) — Where Activity Browser stands on 2026-09-21: stable 2.11.2, open beta 3.0.

### brightway/modules/activity-browser/api/

- [activity-browser API reference](brightway/modules/activity-browser/api/README.md) — Generated API reference for activity-browser, one file per submodule, stamped with version and date.

### brightway/modules/activity-browser/use-cases/

- [activity-browser use cases](brightway/modules/activity-browser/use-cases/README.md) — End-to-end things a practitioner does with Activity Browser.
- [Install Activity Browser and open a project](brightway/modules/activity-browser/use-cases/install-and-open-a-project.md) — Install the graphical interface from conda-forge, start it, and open a Brightway project a Python session created.
- [Run a scenario difference file](brightway/modules/activity-browser/use-cases/run-a-scenario-difference-file.md) — Sweep a set of scenarios through Activity Browser's superstructure layer by handing it a spreadsheet of changed exchange values.

### brightway/modules/bw2analyzer/

- [bw2analyzer](brightway/modules/bw2analyzer/README.md) — Contribution and hotspot analysis over a finished calculation.
- [bw2analyzer classes and functions](brightway/modules/bw2analyzer/classes.md) — The analysis classes and print helpers of bw2analyzer 0.11.8.
- [bw2analyzer commands](brightway/modules/bw2analyzer/commands.md) — The calls that explain a finished LCA result.
- [bw2analyzer datasets](brightway/modules/bw2analyzer/datasets.md) — bw2analyzer ships no data; it reads a solved calculation and the active project.
- [bw2analyzer gotchas](brightway/modules/bw2analyzer/gotchas.md) — What surprises people about bw2analyzer 0.11.8, starting with its age.
- [bw2analyzer layout](brightway/modules/bw2analyzer/layout.md) — How the bw2analyzer package is organised, module by module.
- [bw2analyzer status](brightway/modules/bw2analyzer/status.md) — Where bw2analyzer stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw2analyzer/api/

- [bw2analyzer API reference](brightway/modules/bw2analyzer/api/README.md) — Generated API reference for bw2analyzer, one file per submodule, stamped with version and date.

### brightway/modules/bw2analyzer/use-cases/

- [bw2analyzer use cases](brightway/modules/bw2analyzer/use-cases/README.md) — End-to-end things a practitioner does with bw2analyzer.
- [Run a contribution analysis](brightway/modules/bw2analyzer/use-cases/run-a-contribution-analysis.md) — Find out where a score comes from: the processes and elementary flows that dominate it, and the supply chain printed with each branch's share.

### brightway/modules/bw2calc/

- [bw2calc](brightway/modules/bw2calc/README.md) — Brightway's calculation engine: builds the matrices and solves the system.
- [bw2calc classes and functions](brightway/modules/bw2calc/classes.md) — The LCA classes of bw2calc 2.5.0 and what each one is for.
- [bw2calc commands](brightway/modules/bw2calc/commands.md) — The calls that run a calculation, all of them from Python.
- [bw2calc datasets](brightway/modules/bw2calc/datasets.md) — bw2calc ships no data; everything it reads arrives as datapackages.
- [bw2calc gotchas](brightway/modules/bw2calc/gotchas.md) — What surprises people about bw2calc 2.5.0, and what to do instead.
- [bw2calc layout](brightway/modules/bw2calc/layout.md) — How the bw2calc package is organised, module by module.
- [bw2calc status](brightway/modules/bw2calc/status.md) — Where bw2calc stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw2calc/api/

- [bw2calc API reference](brightway/modules/bw2calc/api/README.md) — Generated API reference for bw2calc, one file per submodule, stamped with version and date.

### brightway/modules/bw2calc/use-cases/

- [bw2calc use cases](brightway/modules/bw2calc/use-cases/README.md) — End-to-end things a practitioner does with bw2calc.
- [Run a MultiLCA over several demands](brightway/modules/bw2calc/use-cases/run-a-multilca-over-several-demands.md) — Score two functional units against two impact categories in one pass, and read the results out of the scores dictionary.
- [Run an LCA and read the score](brightway/modules/bw2calc/use-cases/run-an-lca-and-read-the-score.md) — Solve a single functional unit against one impact category on a toy database, and read the score, the supply array and the characterised inventory.

### brightway/modules/bw2data/

- [bw2data](brightway/modules/bw2data/README.md) — Brightway's data layer: projects, databases, nodes, edges and their metadata.
- [bw2data classes and functions](brightway/modules/bw2data/classes.md) — The public surface of bw2data 4.7, in the order a user meets it.
- [bw2data commands](brightway/modules/bw2data/commands.md) — What you can run from bw2data, all of it from Python.
- [bw2data datasets](brightway/modules/bw2data/datasets.md) — What bw2data writes to disk, and why it ships no data of its own.
- [bw2data gotchas](brightway/modules/bw2data/gotchas.md) — What surprises people about bw2data 4.x, and what to do instead.
- [bw2data layout](brightway/modules/bw2data/layout.md) — How the bw2data package is organised, module by module.
- [bw2data status](brightway/modules/bw2data/status.md) — Where bw2data stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw2data/api/

- [bw2data API reference](brightway/modules/bw2data/api/README.md) — Generated API reference for bw2data, one file per submodule, stamped with version and date.

### brightway/modules/bw2data/use-cases/

- [bw2data use cases](brightway/modules/bw2data/use-cases/README.md) — End-to-end things a practitioner does with bw2data.
- [Create a project and a database](brightway/modules/bw2data/use-cases/create-a-project-and-a-database.md) — Build a Brightway 2.5 project from nothing, write a biosphere and a three-process inventory, then read its nodes, edges and search index.
- [Migrate a Brightway 2 project to the 2.5 line](brightway/modules/bw2data/use-cases/migrate-a-brightway-2-4-project.md) — Move a project written by bw2data 3.x onto bw2data 4.x, with a backup first and a reprocessing pass that rewrites every datapackage.

### brightway/modules/bw2io/

- [bw2io](brightway/modules/bw2io/README.md) — Importers, exporters and the strategies that link external data into Brightway.
- [bw2io classes and functions](brightway/modules/bw2io/classes.md) — The importers, setup functions, exporters and strategy families of bw2io 0.9.17.
- [bw2io commands](brightway/modules/bw2io/commands.md) — The calls that set up a project and run an import, in the order you make them.
- [bw2io datasets](brightway/modules/bw2io/datasets.md) — What bw2io ships in its data directory and what it downloads from the Brightway file server.
- [bw2io gotchas](brightway/modules/bw2io/gotchas.md) — What surprises people about bw2io 0.9.17, and what to do instead.
- [bw2io layout](brightway/modules/bw2io/layout.md) — How the bw2io package is organised: extractors, strategies, importers, exporters and data.
- [bw2io status](brightway/modules/bw2io/status.md) — Where bw2io stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw2io/api/

- [bw2io API reference](brightway/modules/bw2io/api/README.md) — Generated API reference for bw2io, one file per submodule, stamped with version and date.

### brightway/modules/bw2io/use-cases/

- [bw2io use cases](brightway/modules/bw2io/use-cases/README.md) — End-to-end things a practitioner does with bw2io.
- [Export a database to Excel](brightway/modules/bw2io/use-cases/export-a-database-to-excel.md) — Write a Brightway database out as an Excel workbook you can read, diff or hand to someone without Python.
- [Import a SimaPro CSV export](brightway/modules/bw2io/use-cases/import-a-simapro-csv.md) — Read a SimaPro CSV export into Brightway, apply the default strategies, and read the linking statistics before writing anything into a project.
- [Import an ecospold2 release](brightway/modules/bw2io/use-cases/import-ecospold2.md) — Read an extracted ecospold2 directory into a Brightway project, either file by file with SingleOutputEcospold2Importer or in one call with import_ecoinvent_release.
- [Install a remote example project](brightway/modules/bw2io/use-cases/install-a-remote-example-project.md) — Download one of the public Brightway example projects with bw2io.remote and run a first calculation on it, without any licence or credential.

### brightway/modules/bw2parameters/

- [bw2parameters](brightway/modules/bw2parameters/README.md) — Parameterised exchanges, formulas and parameter groups.
- [bw2parameters classes and functions](brightway/modules/bw2parameters/classes.md) — ParameterSet, the interpreters and the formula helpers of bw2parameters 1.1.0.
- [bw2parameters commands](brightway/modules/bw2parameters/commands.md) — Evaluating a parameter set, both standalone and through bw2data.
- [bw2parameters datasets](brightway/modules/bw2parameters/datasets.md) — bw2parameters ships no data; the parameters live in the project that uses it.
- [bw2parameters gotchas](brightway/modules/bw2parameters/gotchas.md) — What surprises people about bw2parameters 1.1.0, and what to do instead.
- [bw2parameters layout](brightway/modules/bw2parameters/layout.md) — How the bw2parameters package is organised, module by module.
- [bw2parameters status](brightway/modules/bw2parameters/status.md) — Where bw2parameters stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw2parameters/api/

- [bw2parameters API reference](brightway/modules/bw2parameters/api/README.md) — Generated API reference for bw2parameters, one file per submodule, stamped with version and date.

### brightway/modules/bw2parameters/use-cases/

- [bw2parameters use cases](brightway/modules/bw2parameters/use-cases/README.md) — End-to-end things a practitioner does with bw2parameters.
- [Define and evaluate parameters](brightway/modules/bw2parameters/use-cases/define-and-evaluate-parameters.md) — Put a small parameterised model into a ParameterSet, get the evaluation order and the resolved amounts, and see what a circular or missing reference does.

### brightway/modules/bw_graph_tools/

- [bw_graph_tools](brightway/modules/bw_graph_tools/README.md) — Graph traversal and supply-chain exploration on a solved system.
- [bw_graph_tools classes and functions](brightway/modules/bw_graph_tools/classes.md) — The public surface of bw_graph_tools 0.10, from traversal classes to path helpers.
- [bw_graph_tools commands](brightway/modules/bw_graph_tools/commands.md) — bw_graph_tools has no command line; traversal runs from Python.
- [bw_graph_tools datasets](brightway/modules/bw_graph_tools/datasets.md) — bw_graph_tools ships no data; it reads matrices and returns records.
- [bw_graph_tools gotchas](brightway/modules/bw_graph_tools/gotchas.md) — What surprises people about bw_graph_tools: repeated nodes, cutoffs and caps.
- [bw_graph_tools layout](brightway/modules/bw_graph_tools/layout.md) — How the bw_graph_tools package is organised, module by module.
- [bw_graph_tools status](brightway/modules/bw_graph_tools/status.md) — Where bw_graph_tools stands on 2026-09-21: stable, actively released, library only.

### brightway/modules/bw_graph_tools/api/

- [bw_graph_tools API reference](brightway/modules/bw_graph_tools/api/README.md) — Generated API reference for bw_graph_tools, one file per submodule, stamped with version and date.

### brightway/modules/bw_graph_tools/use-cases/

- [bw_graph_tools use cases](brightway/modules/bw_graph_tools/use-cases/README.md) — End-to-end things a practitioner does with bw_graph_tools.
- [Traverse a supply chain graph](brightway/modules/bw_graph_tools/use-cases/traverse-a-supply-chain-graph.md) — Walk the supply chain of a solved LCA with NewNodeEachVisitGraphTraversal, and read the nodes, edges and flows it records for each visit.

### brightway/modules/bw_processing/

- [bw_processing](brightway/modules/bw_processing/README.md) — The on-disk datapackage format Brightway calculations read.
- [bw_processing classes and functions](brightway/modules/bw_processing/classes.md) — The datapackage API of bw_processing 1.6.
- [bw_processing commands](brightway/modules/bw_processing/commands.md) — Building, reading and inspecting a datapackage from Python.
- [bw_processing datasets](brightway/modules/bw_processing/datasets.md) — The three example datapackages bw_processing ships, and what a datapackage contains.
- [bw_processing gotchas](brightway/modules/bw_processing/gotchas.md) — What surprises people about bw_processing 1.6, and what to do instead.
- [bw_processing layout](brightway/modules/bw_processing/layout.md) — How the bw_processing package is organised, module by module.
- [bw_processing status](brightway/modules/bw_processing/status.md) — Where bw_processing stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/bw_processing/api/

- [bw_processing API reference](brightway/modules/bw_processing/api/README.md) — Generated API reference for bw_processing, one file per submodule, stamped with version and date.

### brightway/modules/bw_processing/use-cases/

- [bw_processing use cases](brightway/modules/bw_processing/use-cases/README.md) — End-to-end things a practitioner does with bw_processing.
- [Write and read a datapackage](brightway/modules/bw_processing/use-cases/write-and-read-a-datapackage.md) — Build a technosphere datapackage in memory, serialise it to a zip file, load it back and check the arrays survived the round trip.

### brightway/modules/bw_temporalis/

- [bw_temporalis](brightway/modules/bw_temporalis/README.md) — Temporal distributions of emissions and dynamic characterisation.
- [bw_temporalis classes and functions](brightway/modules/bw_temporalis/classes.md) — The public surface of bw_temporalis 1.2.0, from a distribution to a timeline.
- [bw_temporalis commands](brightway/modules/bw_temporalis/commands.md) — bw_temporalis has no command line; it is used from a notebook.
- [bw_temporalis datasets](brightway/modules/bw_temporalis/datasets.md) — bw_temporalis ships no data files, only two characterisation functions.
- [bw_temporalis gotchas](brightway/modules/bw_temporalis/gotchas.md) — What surprises people about bw_temporalis: net amounts, resolution and sums.
- [bw_temporalis layout](brightway/modules/bw_temporalis/layout.md) — How the bw_temporalis package is organised, module by module.
- [bw_temporalis status](brightway/modules/bw_temporalis/status.md) — Where bw_temporalis stands on 2026-09-21: stable, small, quiet.

### brightway/modules/bw_temporalis/api/

- [bw_temporalis API reference](brightway/modules/bw_temporalis/api/README.md) — Generated API reference for bw_temporalis, one file per submodule, stamped with version and date.

### brightway/modules/bw_temporalis/use-cases/

- [bw_temporalis use cases](brightway/modules/bw_temporalis/use-cases/README.md) — End-to-end things a practitioner does with bw_temporalis.
- [Run a temporal LCA on a toy system](brightway/modules/bw_temporalis/use-cases/run-a-temporal-lca-on-a-toy-system.md) — Attach temporal distributions to the edges of a two-process system, traverse it with TemporalisLCA, and read the emissions timeline year by year.

### brightway/modules/bw_timex/

- [bw_timex](brightway/modules/bw_timex/README.md) — Time-explicit LCA across databases with different temporal validity.
- [bw_timex classes and functions](brightway/modules/bw_timex/classes.md) — The public surface of bw_timex 1.4.0, from settings to a dynamic score.
- [bw_timex commands](brightway/modules/bw_timex/commands.md) — bw_timex has no command line; a time-explicit LCA runs from a notebook.
- [bw_timex datasets](brightway/modules/bw_timex/datasets.md) — One reference data file for dynamic characterisation, plus a built example system.
- [bw_timex gotchas](brightway/modules/bw_timex/gotchas.md) — What surprises people about bw_timex: environments, dated databases and caches.
- [bw_timex layout](brightway/modules/bw_timex/layout.md) — How the bw_timex package is organised, module by module.
- [bw_timex status](brightway/modules/bw_timex/status.md) — Where bw_timex stands on 2026-09-21: stable, actively developed, well documented.

### brightway/modules/bw_timex/api/

- [bw_timex API reference](brightway/modules/bw_timex/api/README.md) — Generated API reference for bw_timex, one file per submodule, stamped with version and date.

### brightway/modules/bw_timex/use-cases/

- [bw_timex use cases](brightway/modules/bw_timex/use-cases/README.md) — End-to-end things a practitioner does with bw_timex.
- [Run the electric vehicle example](brightway/modules/bw_timex/use-cases/run-the-electric-vehicle-example.md) — Build bw_timex's bundled electric vehicle product system, date its databases and compare a static score with a time-explicit one.

### brightway/modules/ecoinvent_interface/

- [ecoinvent_interface](brightway/modules/ecoinvent_interface/README.md) — Authenticated access to ecoinvent releases and reports for licensed users.
- [ecoinvent_interface classes and functions](brightway/modules/ecoinvent_interface/classes.md) — The public surface of ecoinvent_interface 3.1, from settings to downloads.
- [ecoinvent_interface commands](brightway/modules/ecoinvent_interface/commands.md) — ecoinvent_interface has no command line; everything runs from Python.
- [ecoinvent_interface datasets](brightway/modules/ecoinvent_interface/datasets.md) — The index mappings the package ships and the release types it can fetch.
- [ecoinvent_interface gotchas](brightway/modules/ecoinvent_interface/gotchas.md) — What surprises people about ecoinvent_interface: licences, precedence and caches.
- [ecoinvent_interface layout](brightway/modules/ecoinvent_interface/layout.md) — How the ecoinvent_interface package is organised, module by module.
- [ecoinvent_interface status](brightway/modules/ecoinvent_interface/status.md) — Where ecoinvent_interface stands on 2026-09-21: stable, low level, unofficial.

### brightway/modules/ecoinvent_interface/api/

- [ecoinvent_interface API reference](brightway/modules/ecoinvent_interface/api/README.md) — Generated API reference for ecoinvent_interface, one file per submodule, stamped with version and date.

### brightway/modules/ecoinvent_interface/use-cases/

- [ecoinvent_interface use cases](brightway/modules/ecoinvent_interface/use-cases/README.md) — End-to-end things a licensed user does with ecoinvent_interface.
- [List releases and download one](brightway/modules/ecoinvent_interface/use-cases/list-releases-and-download.md) — Authenticate against the ecoinvent API, list the versions and system models your licence covers, and download a release or a single process.
- [Read the bundled mapping index](brightway/modules/ecoinvent_interface/use-cases/read-the-bundled-mapping-index.md) — Open the mappings archive shipped inside ecoinvent_interface, without credentials, to see which releases and system models it indexes and what a record holds.

### brightway/modules/flowmapper/

- [flowmapper](brightway/modules/flowmapper/README.md) — Matching and harmonising elementary flow lists between nomenclatures.
- [flowmapper classes and functions](brightway/modules/flowmapper/classes.md) — The public surface of flowmapper 0.4, from flow objects to mapping output.
- [flowmapper commands](brightway/modules/flowmapper/commands.md) — The flowmapper console script and its three subcommands.
- [flowmapper datasets](brightway/modules/flowmapper/datasets.md) — The reference data flowmapper bundles and the mapping files it writes.
- [flowmapper gotchas](brightway/modules/flowmapper/gotchas.md) — What surprises people about flowmapper: input shape, rule order and partial matches.
- [flowmapper layout](brightway/modules/flowmapper/layout.md) — How the flowmapper package is organised, module by module.
- [flowmapper status](brightway/modules/flowmapper/status.md) — Where flowmapper stands on 2026-09-21: released, small, README-documented.

### brightway/modules/flowmapper/api/

- [flowmapper API reference](brightway/modules/flowmapper/api/README.md) — Generated API reference for flowmapper, one file per submodule, stamped with version and date.

### brightway/modules/flowmapper/use-cases/

- [flowmapper use cases](brightway/modules/flowmapper/use-cases/README.md) — End-to-end things a practitioner does with flowmapper.
- [Map two flow lists](brightway/modules/flowmapper/use-cases/map-two-flow-lists.md) — Match one elementary flow list against another with flowmapper, read the statistics and the unmatched flows, and write the result as a randonneur transformation.

### brightway/modules/matrix_utils/

- [matrix_utils](brightway/modules/matrix_utils/README.md) — Builds and rebuilds sparse matrices from datapackages.
- [matrix_utils classes and functions](brightway/modules/matrix_utils/classes.md) — MappedMatrix, the mappers and the indexers of matrix_utils 0.9.
- [matrix_utils commands](brightway/modules/matrix_utils/commands.md) — Building a matrix from datapackages, from Python.
- [matrix_utils datasets](brightway/modules/matrix_utils/datasets.md) — matrix_utils ships no data; it reads datapackages handed to it.
- [matrix_utils gotchas](brightway/modules/matrix_utils/gotchas.md) — What surprises people about matrix_utils 0.9, and what to do instead.
- [matrix_utils layout](brightway/modules/matrix_utils/layout.md) — How the matrix_utils package is organised, module by module.
- [matrix_utils status](brightway/modules/matrix_utils/status.md) — Where matrix_utils stands on 2026-09-21: release cadence, maintainers, open work.

### brightway/modules/matrix_utils/api/

- [matrix_utils API reference](brightway/modules/matrix_utils/api/README.md) — Generated API reference for matrix_utils, one file per submodule, stamped with version and date.

### brightway/modules/matrix_utils/use-cases/

- [matrix_utils use cases](brightway/modules/matrix_utils/use-cases/README.md) — End-to-end things a practitioner does with matrix_utils.
- [Build a matrix from a datapackage](brightway/modules/matrix_utils/use-cases/build-a-matrix-from-a-datapackage.md) — Turn a bw_processing datapackage into a SciPy sparse matrix with MappedMatrix, read the id-to-index mappers, and solve the system by hand.

### brightway/modules/pypardiso/

- [pypardiso](brightway/modules/pypardiso/README.md) — The PARDISO sparse solver binding Brightway uses for speed.
- [pypardiso classes and functions](brightway/modules/pypardiso/classes.md) — Four public names: spsolve, factorized, PyPardisoSolver and the shared instance.
- [pypardiso commands](brightway/modules/pypardiso/commands.md) — pypardiso has no command line; it is imported, and often not called directly.
- [pypardiso datasets](brightway/modules/pypardiso/datasets.md) — pypardiso ships no data; it ships three Python modules and a dependency on MKL.
- [pypardiso gotchas](brightway/modules/pypardiso/gotchas.md) — What surprises people about pypardiso: platforms, MKL, and a shared solver.
- [pypardiso layout](brightway/modules/pypardiso/layout.md) — How the pypardiso package is organised; it is three files.
- [pypardiso status](brightway/modules/pypardiso/status.md) — Where pypardiso stands on 2026-09-21: stable, small, maintained slowly.

### brightway/modules/pypardiso/api/

- [pypardiso API reference](brightway/modules/pypardiso/api/README.md) — Generated API reference for pypardiso, one file per submodule, stamped with version and date.

### brightway/modules/pypardiso/use-cases/

- [pypardiso use cases](brightway/modules/pypardiso/use-cases/README.md) — End-to-end things a practitioner does with pypardiso.
- [Solve with PARDISO in bw2calc](brightway/modules/pypardiso/use-cases/solve-with-pardiso-in-bw2calc.md) — Install pypardiso so bw2calc picks the MKL PARDISO solver, and verify it did, on a calculation whose score you already know.

### brightway/modules/randonneur/

- [randonneur](brightway/modules/randonneur/README.md) — Declarative, reusable data-migration packages for inventory data.
- [randonneur classes and functions](brightway/modules/randonneur/classes.md) — The public surface of randonneur 0.7.2, in the order a user meets it.
- [randonneur commands](brightway/modules/randonneur/commands.md) — randonneur has no command line; everything runs from Python.
- [randonneur datasets](brightway/modules/randonneur/datasets.md) — randonneur ships label mappings only; the migration packages live in randonneur_data.
- [randonneur gotchas](brightway/modules/randonneur/gotchas.md) — What surprises people about randonneur: defaults, matching and overwriting.
- [randonneur layout](brightway/modules/randonneur/layout.md) — How the randonneur package is organised, module by module.
- [randonneur status](brightway/modules/randonneur/status.md) — Where randonneur stands on 2026-09-21: released, maintained, library only.

### brightway/modules/randonneur/api/

- [randonneur API reference](brightway/modules/randonneur/api/README.md) — Generated API reference for randonneur, one file per submodule, stamped with version and date.

### brightway/modules/randonneur/use-cases/

- [randonneur use cases](brightway/modules/randonneur/use-cases/README.md) — End-to-end things a practitioner does with randonneur.
- [Apply a migration to inventory data](brightway/modules/randonneur/use-cases/apply-a-migration-to-inventory-data.md) — Rewrite the edge names of an inventory with a randonneur transformation, and find the published transformation for your database pair in the registry.

## core/

- [core](core/README.md) — The domain-neutral LCA wiki: concepts, standards, GICS sectors and tool-agnostic use cases.
- [core roadmap](core/roadmap.md) — What is missing in the domain-neutral branch and where a contributor can help.

### core/concepts/

- [core/concepts](core/concepts/README.md) — One page per LCA concept, defined from the standards rather than from any tool.
- [Allocation and multifunctionality](core/concepts/allocation-and-multifunctionality.md) — What to do when one process delivers more than one function: subdivision, system expansion, substitution, then partitioning.
- [Attributional and consequential modelling](core/concepts/attributional-vs-consequential.md) — The two LCI modelling principles, what each one models, and which decision context calls for which.
- [Characterisation, normalisation and weighting](core/concepts/characterization-normalisation-weighting.md) — The mandatory and optional LCIA steps, what each one adds, and what ISO forbids publishing.
- [Cut-off criteria](core/concepts/cut-off-criteria.md) — The quantitative side of the system boundary: how much impact may be left out, and how that is declared.
- [Data quality](core/concepts/data-quality.md) — The six ILCD data quality indicators, what each measures, and how a data set is rated against them.
- [Elementary and intermediate flows](core/concepts/elementary-and-intermediate-flows.md) — The flow types an inventory contains: elementary flows across the ecosphere boundary, product and waste flows inside the technosphere.
- [Foreground and background system](core/concepts/foreground-and-background.md) — Two different splits of a product system: by data specificity and by managerial control.
- [Functional unit](core/concepts/functional-unit.md) — The quantified function an LCA is anchored in, and the reference flow that realises it.
- [Goal and scope definition](core/concepts/goal-and-scope.md) — The first phase of an LCA: why the study is done, for whom, and what exactly is modelled and how.
- [Life cycle interpretation](core/concepts/interpretation.md) — Identifying the significant issues, checking completeness, sensitivity and consistency, and drawing conclusions.
- [Life cycle impact assessment](core/concepts/life-cycle-impact-assessment.md) — Turning an inventory of elementary flows into indicator results per impact category.
- [Life cycle inventory analysis](core/concepts/life-cycle-inventory.md) — The LCA phase that collects flow data, builds the process model and calculates the inventory result.
- [System boundary](core/concepts/system-boundary.md) — Which processes and flows belong to the analysed system, qualitatively and quantitatively.
- [Uncertainty](core/concepts/uncertainty.md) — Stochastic, choice-related and ignorance uncertainty in LCA, and how each is handled.

### core/sectors/

- [core/sectors](core/sectors/README.md) — The 11 GICS sector pages and the crosswalk to the other sector taxonomies in use.
- [Communication Services](core/sectors/communication-services.md) — Telecommunication networks, media and interactive services: what an LCA of the GICS Communication Services sector needs and which data sources cover it.
- [Consumer Discretionary](core/sectors/consumer-discretionary.md) — Vehicles, durables, apparel and consumer services: what an LCA of the GICS Consumer Discretionary sector needs and which data sources cover it.
- [Consumer Staples](core/sectors/consumer-staples.md) — Food, beverages, tobacco and household products: what an LCA of the GICS Consumer Staples sector needs and which data sources cover it.
- [Sector crosswalk](core/sectors/crosswalk.md) — Maps each GICS sector onto the Sentier inventory sector folders, the BAFU:2026 process categories and the ISIC Rev.4 sections.
- [Energy](core/sectors/energy.md) — Fuel chains from extraction to combustion: what an LCA of the GICS Energy sector needs and which of this wiki's data sources cover it.
- [Financials](core/sectors/financials.md) — Banks, financial services and insurance: why a product LCA rarely fits the GICS Financials sector, and what this wiki does and does not cover.
- [Health Care](core/sectors/health-care.md) — Pharmaceuticals, devices and care delivery: what an LCA of the GICS Health Care sector needs and which data sources cover it.
- [Industrials](core/sectors/industrials.md) — Capital goods, commercial services and transport: what an LCA of the GICS Industrials sector needs and which data sources cover it.
- [Information Technology](core/sectors/information-technology.md) — Semiconductors, hardware and software services: what an LCA of the GICS Information Technology sector needs and which data sources cover it.
- [Materials](core/sectors/materials.md) — Bulk materials from ore and feedstock to the factory gate: what an LCA of the GICS Materials sector needs and which data sources cover it.
- [Real Estate](core/sectors/real-estate.md) — Buildings and property over a reference study period: what an LCA of the GICS Real Estate sector needs and which data sources cover it.
- [Utilities](core/sectors/utilities.md) — Electricity, gas, water and heat supply: what an LCA of the GICS Utilities sector needs and which data sources cover it.

### core/standards/

- [core/standards](core/standards/README.md) — One page per LCA standard, guidance document or data format, with what it requires.
- [EF, PEF and OEF (Recommendation (EU) 2021/2279)](core/standards/ef-pef.md) — The Environmental Footprint methods, their category rules, the 16 impact categories and what makes a data set EF compliant.
- [EN 15804 (2012+A2:2019)](core/standards/en-15804.md) — The core EPD rules for construction products, and the A1 to D information module structure.
- [GLAD and flow nomenclatures](core/standards/glad-and-nomenclatures.md) — The Global LCA Data Access network and the flow and activity nomenclatures data sets are written against.
- [ILCD data format 1.1 and eILCD](core/standards/ilcd-format.md) — The seven ILCD 1.1 data set types, what each carries, and the eILCD life cycle model extension.
- [ILCD Handbook (2010)](core/standards/ilcd-handbook.md) — The European reference guidance for LCA: what the General guide adds to ISO, and how the series is organised.
- [ISO 14040 and ISO 14044 (2006, amended 2020)](core/standards/iso-14040-14044.md) — The two ISO standards that define the LCA framework and its requirements, with their 2020 amendments.

### core/use-cases/

- [core/use-cases](core/use-cases/README.md) — Tool-agnostic use cases: what a study needs, whichever software carries it out.
- [Assess a building product in Real Estate](core/use-cases/assess-a-building-product-in-real-estate.md) — Take a construction product from bill of materials to a declaration and then into a building study: modules A1 to D, the take-off, and the operational energy that competes with it.
- [Assess a material in Materials](core/use-cases/assess-a-material-in-materials.md) — Produce a cradle-to-gate result for a bulk material: the electricity mix that decides the ranking, the scrap and recycled-content rules, and the declaration that follows.
- [Assess a transport service in Industrials](core/use-cases/assess-a-transport-service-in-industrials.md) — Model a tonne-kilometre or a passenger-kilometre: load factor, empty running, the split between vehicle and infrastructure, and the allocation on a mixed service.
- [Assess an agricultural product in Consumer Staples](core/use-cases/assess-an-agricultural-product-in-consumer-staples.md) — Model a food or beverage product where primary production decides the answer: field emissions, the crop and residue allocation, the milk and meat split, and the PEFCR that governs it.
- [Assess an electricity mix in Utilities](core/use-cases/assess-an-electricity-mix-in-utilities.md) — Model a delivered kilowatt-hour: voltage level, grid boundary, imports, generation technologies and the temporal resolution a yearly average hides.
- [Assess an energy carrier in Energy](core/use-cases/assess-an-energy-carrier-in-energy.md) — Model a fuel chain to a named point: the energy basis, the refinery allocation, fugitive and vented methane, and whether combustion is inside the boundary.
- [Choose a background database](core/use-cases/choose-a-background-database.md) — Pick the background for a study on licence, coverage, system model and format: BAFU, ecoinvent or EF-compliant data sets, and how the tooling in this wiki reaches each.
- [Document data quality and uncertainty](core/use-cases/document-data-quality-and-uncertainty.md) — Turn a study's data into a defensible quality statement: the six ILCD indicators, the three kinds of uncertainty, and what each one is reported as.
- [Map flows between nomenclatures](core/use-cases/map-flows-between-nomenclatures.md) — Why two LCA data sets rarely combine as they are, what a bridge is, and how to build, review and apply one without renaming anything.
- [Prepare an EPD under EN 15804](core/use-cases/prepare-an-epd.md) — Produce a construction product declaration: declared unit, modules A1 to D, programme PCR, third-party verification and publication.
- [Run a comparative LCA](core/use-cases/run-a-comparative-lca.md) — Compare two or more systems on one function, up to and including a comparative assertion disclosed to the public, with the critical review ISO requires.
- [Run a PEF study](core/use-cases/run-a-pef-study.md) — Carry out a Product Environmental Footprint study under Recommendation (EU) 2021/2279: PEFCR or transitional guidance, EF 3.1, all 16 categories and a single overall score.
- [Run a screening LCA](core/use-cases/run-a-screening-lca.md) — A first, deliberately incomplete pass over a product system that finds the hot spots and tells you where the next unit of effort belongs.

## ecoinvent/

- [ecoinvent](ecoinvent/README.md) — The ecoinvent database as an external data source, documented structure only, with no amounts.
- [ecoinvent roadmap](ecoinvent/roadmap.md) — What is missing in the ecoinvent branch and where a contributor can help.

### ecoinvent/data/

- [ecoinvent/data](ecoinvent/data/README.md) — How a licensed user obtains ecoinvent data; pointer files only, no open route.
- [Reaching ecoinvent data as a licensed user](ecoinvent/data/access.md) — The access routes a licence opens, how ecoinvent_interface expects credentials, and why nothing is committed here.

### ecoinvent/knowledge/

- [ecoinvent/knowledge](ecoinvent/knowledge/README.md) — What the ecoinvent database is: methodology, system models, format, versions, licence.
- [ecoinvent access and licence](ecoinvent/knowledge/access-and-licence.md) — How a licensed user reaches ecoinvent, what the licence types are, and what may never leave the licensee's hands.
- [ecoinvent data formats](ecoinvent/knowledge/format.md) — ecoSpold2 and what came before it: the format a release ships in, its supporting files, and the release types a licensed user can download.
- [ecoinvent methodology](ecoinvent/knowledge/methodology.md) — How ecoinvent models the world: activities and products, exchanges, the three levels of data, and how datasets get linked.
- [ecoinvent impact assessment methods](ecoinvent/knowledge/methods.md) — The LCIA methods implemented in ecoinvent, by name, and where the implementation report and the flow mappings are published.
- [ecoinvent schemas and nomenclature](ecoinvent/knowledge/schemas-and-nomenclature.md) — Flow kinds, classifications, properties, identifiers and naming conventions, and where the published elementary flow list lives.
- [ecoinvent sector coverage](ecoinvent/knowledge/sector-coverage.md) — What ecoinvent covers, in its own fifteen sectors, in ISIC and CPC terms, and read against the eleven GICS sectors.
- [ecoinvent system models](ecoinvent/knowledge/system-models.md) — The four system models ecoinvent publishes, what each one does with waste and by-products, and how to choose.
- [ecoinvent versions and provenance](ecoinvent/knowledge/versions-and-provenance.md) — The release line from version 1 to 3.12, what a yearly update changes, and where ecoinvent says its data comes from.
- [ecoinvent vocabulary](ecoinvent/knowledge/vocabulary.md) — The ecoinvent Knowledge Base glossary as a source, what it covers, and where each term is defined in this wiki.

### ecoinvent/use-cases/

- [ecoinvent/use-cases](ecoinvent/use-cases/README.md) — End-to-end things a licensed practitioner does with the ecoinvent database.
- [Download a release with ecoinvent_interface](ecoinvent/use-cases/download-a-release-with-ecoinvent-interface.md) — The authenticated Python route to a release: list versions and system models, pick a release type, and get the extracted directory from the cache.
- [Get access and credentials](ecoinvent/use-cases/get-access-and-credentials.md) — Work out which ecoinvent licence you need, where the credentials then live, and what you may do with the data once you have them.
- [Import ecoSpold2 into Brightway with bw2io](ecoinvent/use-cases/import-ecospold2-into-brightway-with-bw2io.md) — Take an extracted ecoSpold2 release into a Brightway project: set the project up, run the importer, link it, and check nothing is left unlinked.
- [Map ecoinvent flows to EF 3.1](ecoinvent/use-cases/map-ecoinvent-flows-to-ef-3-1.md) — Build a flow bridge from an ecoinvent elementary flow list onto the EF 3.1 nomenclature with flowmapper, and publish it as a codes-only mapping package.

## sentier/

- [sentier](sentier/README.md) — The Sentier platform branch: what it is, its modules, and how its data reaches Brightway.
- [Sentier commands](sentier/commands.md) — One table of every runnable command across the Sentier packages, with how each row was checked.
- [The Sentier platform architecture](sentier/platform.md) — How the Sentier platform is arranged in two layers, which parts exist today and which are still a design hypothesis.
- [sentier roadmap](sentier/roadmap.md) — What is missing in the Sentier branch and where a contributor can help.

### sentier/modules/

- [sentier/modules](sentier/modules/README.md) — One folder per Sentier package or data repository, each following the codebase template.

### sentier/modules/sentier-agribalyse/

- [sentier-agribalyse](sentier/modules/sentier-agribalyse/README.md) — The public, EULA-clean adapter that links Agribalyse 3.2 to a background database and scores it against the published reference results.
- [sentier-agribalyse classes and functions](sentier/modules/sentier-agribalyse/classes.md) — The public surface by subpackage: the tier ladder, the mapping registry, the matchers, the transforms, the scoring path and the exports.
- [sentier-agribalyse commands](sentier/modules/sentier-agribalyse/commands.md) — All 24 console scripts, with the flags their own help prints, grouped by the order you run them in.
- [sentier-agribalyse datasets](sentier/modules/sentier-agribalyse/datasets.md) — The public Agribalyse 3.2 inputs the adapter expects, the licensed files a user regenerates locally, and the artifacts a run writes.
- [sentier-agribalyse gotchas](sentier/modules/sentier-agribalyse/gotchas.md) — What surprises people: the singular matrix, the licence guard, the two factor sources, and the caches that make a rerun lie.
- [sentier-agribalyse layout](sentier/modules/sentier-agribalyse/layout.md) — The tracked repository tree: the flat source package, the public inputs, the dashboard, and the folders that stay local.
- [sentier-agribalyse status](sentier/modules/sentier-agribalyse/status.md) — Where the adapter stands: a complete public pipeline, a licensed bootstrap, and a backtest that has to be run to be believed.

### sentier/modules/sentier-agribalyse/api/

- [sentier-agribalyse API reference](sentier/modules/sentier-agribalyse/api/README.md) — Generated API reference for sentier-agribalyse, one file per submodule, stamped with version and date.

### sentier/modules/sentier-agribalyse/use-cases/

- [sentier-agribalyse use cases](sentier/modules/sentier-agribalyse/use-cases/README.md) — End-to-end things a practitioner does with the Agribalyse adapter.
- [List the console scripts](sentier/modules/sentier-agribalyse/use-cases/list-the-console-scripts.md) — See every command the adapter installs and read one command's own help, the two things you can do in a clone with no licensed inputs.
- [Understand the public twin workflow](sentier/modules/sentier-agribalyse/use-cases/understand-the-public-twin-workflow.md) — What a licensed user actually does with the adapter, end to end, and what stays public: the mapping packages, the reviews and the stripped skeleton.

### sentier/modules/sentier-brightway/

- [sentier-brightway](sentier/modules/sentier-brightway/README.md) — The loader that installs Sentier data into a Brightway project or a folder of plain files.
- [sentier-brightway classes and functions](sentier/modules/sentier-brightway/classes.md) — The public surface of sentier-brightway, in the order a user meets it.
- [sentier-brightway commands](sentier/modules/sentier-brightway/commands.md) — The four command line subcommands and the Python entry points, checked against their own --help.
- [sentier-brightway datasets](sentier/modules/sentier-brightway/datasets.md) — The four pinned datasets sentier-brightway fetches, and the two shapes it writes them in.
- [sentier-brightway gotchas](sentier/modules/sentier-brightway/gotchas.md) — What surprises people about sentier-brightway, and what to do about it.
- [sentier-brightway layout](sentier/modules/sentier-brightway/layout.md) — How the sentier-brightway repository is organised, file by file.
- [sentier-brightway status](sentier/modules/sentier-brightway/status.md) — Where sentier-brightway stands at version 0.1.0.

### sentier/modules/sentier-brightway/api/

- [sentier-brightway API reference](sentier/modules/sentier-brightway/api/README.md) — Generated API reference for sentier-brightway, one file per submodule, stamped with version and date.

### sentier/modules/sentier-brightway/use-cases/

- [sentier-brightway use cases](sentier/modules/sentier-brightway/use-cases/README.md) — End-to-end things a practitioner does with sentier-brightway.
- [Check bridge coverage before installing](sentier/modules/sentier-brightway/use-cases/check-bridge-coverage.md) — Read the coverage report to see how much of the BAFU-2026 flow list reaches EF 3.1, and what stays in the residual database, before writing anything.
- [Export BAFU-2026 as file-mode datapackages](sentier/modules/sentier-brightway/use-cases/export-bafu-2026-as-file-mode-datapackages.md) — Write the BAFU-2026 build as a parquet registry plus bw_processing datapackages, then score a process with stock bw2calc and no bw2data.
- [Install BAFU-2026 into a Brightway project](sentier/modules/sentier-brightway/use-cases/install-bafu-2026-into-a-brightway-project.md) — Install the BAFU-2026 inventory, an EF 3.1 biosphere and the 25 EF 3.1 methods into a Brightway project with one command, then score an activity.
- [Run the backtest against the published BAFU results](sentier/modules/sentier-brightway/use-cases/run-the-backtest-against-bafu-results.md) — Score every BAFU-2026 process for all 25 EF 3.1 categories, compare it with the published results workbook, and read the dashboard the run writes.

### sentier/modules/sentier-importers/

- [sentier-importers](sentier/modules/sentier-importers/README.md) — The pipelines that turn external LCA databases into the Sentier data format.
- [sentier-importers classes and functions](sentier/modules/sentier-importers/classes.md) — The plugin contract, the pipeline driver and the shared services a source relies on.
- [sentier-importers commands](sentier/modules/sentier-importers/commands.md) — The three command line subcommands of sentier-importers, checked against their own --help.
- [sentier-importers datasets](sentier/modules/sentier-importers/datasets.md) — What the registered sources read, what they write, and into which target repository.
- [sentier-importers gotchas](sentier/modules/sentier-importers/gotchas.md) — What surprises people about sentier-importers, and what to do about it.
- [sentier-importers layout](sentier/modules/sentier-importers/layout.md) — How the sentier-importers repository is organised, file by file.
- [sentier-importers status](sentier/modules/sentier-importers/status.md) — Where sentier-importers stands at version 0.0.1.

### sentier/modules/sentier-importers/api/

- [sentier-importers API reference](sentier/modules/sentier-importers/api/README.md) — Generated API reference for sentier-importers, one file per submodule, stamped with version and date.

### sentier/modules/sentier-importers/use-cases/

- [sentier-importers use cases](sentier/modules/sentier-importers/use-cases/README.md) — End-to-end things a practitioner does with sentier-importers.
- [Add a new source plugin](sentier/modules/sentier-importers/use-cases/add-a-new-source-plugin.md) — Add an external data source to the import framework: a Source subclass with a transform, a registry block, and offline tests.
- [Run an importer end to end](sentier/modules/sentier-importers/use-cases/run-an-importer-end-to-end.md) — Run the reference plugin through the full staged pipeline offline, inspect the staged output, and see where a delivery would go.

### sentier/modules/sentier-inventory/

- [sentier-inventory](sentier/modules/sentier-inventory/README.md) — The platform's life cycle inventory: processes and exchanges as parquet, one folder per sector, with a schema contract and a CI validator.
- [sentier-inventory schema contracts and validator](sentier/modules/sentier-inventory/classes.md) — The public surface of a data-only repository: three table contracts, one metadata schema, one validation script.
- [sentier-inventory commands](sentier/modules/sentier-inventory/commands.md) — The validator, the inspection one-liner, and what continuous integration runs.
- [sentier-inventory datasets](sentier/modules/sentier-inventory/datasets.md) — The BAFU-2026 inventory as the platform ships it: eleven sector folders, two tables per folder, flow identifiers that carry their unit.
- [sentier-inventory gotchas](sentier/modules/sentier-inventory/gotchas.md) — What surprises people: the obsolete folder, per-folder guarantees, absent optional columns and flow identifiers that match nothing else.
- [sentier-inventory layout](sentier/modules/sentier-inventory/layout.md) — The repository tree: eleven sector folders, four schema files, one validator.
- [sentier-inventory status](sentier/modules/sentier-inventory/status.md) — Where the inventory repository stands: one source database, eleven sectors, unit processes only.

### sentier/modules/sentier-inventory/use-cases/

- [sentier-inventory use cases](sentier/modules/sentier-inventory/use-cases/README.md) — End-to-end things a practitioner does with the Sentier inventory data.
- [Read a sector folder with pandas](sentier/modules/sentier-inventory/use-cases/read-a-sector-folder-with-pandas.md) — Open one sector's processes and exchanges parquet in a dataframe, check them against the folder's declared row counts, and see the contracted columns.
- [Validate the inventory schema](sentier/modules/sentier-inventory/use-cases/validate-the-inventory-schema.md) — Run the repository's own validator over every sector folder, the same command continuous integration runs on every pull request.

### sentier/modules/sentier-mappings/

- [sentier-mappings](sentier/modules/sentier-mappings/README.md) — Cross-source bridges as randonneur packages: one folder per source and target pair, ordered packages, no proprietary data.
- [sentier-mappings package profile and validator](sentier/modules/sentier-mappings/classes.md) — The public surface of a data-only repository: the randonneur package profile, the pair metadata schema, and the eleven checks the validator enforces.
- [sentier-mappings commands](sentier/modules/sentier-mappings/commands.md) — The validator, its test suite, and what continuous integration runs.
- [sentier-mappings datasets](sentier/modules/sentier-mappings/datasets.md) — The five bridge pairs, what each one spans, how many packages it holds, and why a licensed target carries no proprietary data.
- [sentier-mappings gotchas](sentier/modules/sentier-mappings/gotchas.md) — What surprises people: ordered packages, a zero-impact nomenclature package, a provisional datasource, and targets that are deliberately opaque.
- [sentier-mappings layout](sentier/modules/sentier-mappings/layout.md) — The repository tree: five pair folders, two JSON Schemas, one validator with its own test suite.
- [sentier-mappings status](sentier/modules/sentier-mappings/status.md) — Where the mapping repository stands: four populated pairs, one reserved, biosphere bridges only.

### sentier/modules/sentier-mappings/use-cases/

- [sentier-mappings use cases](sentier/modules/sentier-mappings/use-cases/README.md) — End-to-end things a practitioner does with the Sentier mapping packages.
- [Apply a mapping package with randonneur](sentier/modules/sentier-mappings/use-cases/apply-a-mapping-package-with-randonneur.md) — Relink a small set of exchanges onto EF 3.1 flows by applying one package of a pair with randonneur, and see what an unmapped flow does.
- [Validate a mapping package](sentier/modules/sentier-mappings/use-cases/validate-a-mapping-package.md) — Run the mappings repository's validator over every pair folder and its own test suite, the two commands continuous integration runs.

### sentier/modules/sentier-methods/

- [sentier-methods](sentier/modules/sentier-methods/README.md) — The impact assessment side of the platform: method tables and characterisation factors as parquet, one folder per datasource.
- [sentier-methods schema contracts and validator](sentier/modules/sentier-methods/classes.md) — The public surface of a data-only repository: the method table, the factor table, the optional normalisation table and what the validator guarantees.
- [sentier-methods commands](sentier/modules/sentier-methods/commands.md) — The validator, the read one-liner, and what continuous integration runs.
- [sentier-methods datasets](sentier/modules/sentier-methods/datasets.md) — EF 3.1 as the platform ships it, plus the IPCC 2021 and ReCiPe 2016 scaffolds, described without a single factor value.
- [sentier-methods gotchas](sentier/modules/sentier-methods/gotchas.md) — What surprises people: overlapping sub-indicators, flow keys that match no inventory, scaffolds that validate empty, and unchecked row counts.
- [sentier-methods layout](sentier/modules/sentier-methods/layout.md) — The repository tree: three datasource folders, five schema files, one validator.
- [sentier-methods status](sentier/modules/sentier-methods/status.md) — Where the methods repository stands: one full datasource, two reserved scaffolds, no normalisation sets.

### sentier/modules/sentier-methods/use-cases/

- [sentier-methods use cases](sentier/modules/sentier-methods/use-cases/README.md) — End-to-end things a practitioner does with the Sentier method data.
- [Read the EF 3.1 categories and their units](sentier/modules/sentier-methods/use-cases/read-ef-3-1-categories-and-units.md) — List the 25 EF 3.1 impact categories with their method ids and reporting units, straight from the delivered methods table, without touching the factors.
- [Validate the methods schema](sentier/modules/sentier-methods/use-cases/validate-the-methods-schema.md) — Run the methods repository's own validator over every datasource folder, the same command continuous integration runs.

### sentier/modules/sentier-vocab/

- [sentier-vocab](sentier/modules/sentier-vocab/README.md) — The controlled vocabulary of the Sentier platform, curated as data and published as TTL under vocab.sentier.dev.
- [sentier-vocab classes and functions](sentier/modules/sentier-vocab/classes.md) — The public surface of the vocabulary package: the IRI registry, the loaders, the validator, the RDF mapping and the generator.
- [sentier-vocab commands](sentier/modules/sentier-vocab/commands.md) — The generate and coverage subcommands, the importer script, and the checks a contributor runs before a pull request.
- [sentier-vocab datasets](sentier/modules/sentier-vocab/datasets.md) — The thirteen curated term categories, the IRI scheme they publish under, and the Turtle the generator writes.
- [sentier-vocab gotchas](sentier/modules/sentier-vocab/gotchas.md) — What surprises people about the vocabulary repository: the two repository spellings, the primary stems, the size guard and the regeneration rule.
- [sentier-vocab layout](sentier/modules/sentier-vocab/layout.md) — How the vocabulary repository is organised: the package, the schemas, the curated data and the generated Turtle.
- [sentier-vocab status](sentier/modules/sentier-vocab/status.md) — Where the vocabulary stands: thirteen term types with schemas, two still transitional, no release.

### sentier/modules/sentier-vocab/api/

- [sentier-vocab API reference](sentier/modules/sentier-vocab/api/README.md) — Generated API reference for sentier-vocab, one file per submodule, stamped with version and date.

### sentier/modules/sentier-vocab/use-cases/

- [sentier-vocab use cases](sentier/modules/sentier-vocab/use-cases/README.md) — End-to-end things a practitioner does with the Sentier vocabulary.
- [Look up a term IRI](sentier/modules/sentier-vocab/use-cases/look-up-a-term-iri.md) — Find the canonical Sentier IRI of an elementary flow by its label, read straight from the curated parquet shards.
- [Regenerate the vocabulary TTL](sentier/modules/sentier-vocab/use-cases/regenerate-the-vocabulary-ttl.md) — Run the generator over every curated category and get one SKOS Turtle file per source file, which is what continuous integration checks.

## raw/

- [raw/README.md](raw/README.md) — The immutable raw layer: source documents, never rewritten by an agent.

### raw/ilcd/

- [raw/ilcd/README.md](raw/ilcd/README.md) — The ILCD Handbook (EUR 24708 EN): its citation, its licence, its checksum and the rules for using it.

## scripts/

- [scripts/README.md](scripts/README.md) — The one script: the ILCD glossary extractor, and why nothing else is here.
