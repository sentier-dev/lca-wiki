# Vocabulary

The controlled vocabulary of this wiki: every term the pages link to, defined once per
context. This file is hand-maintained. Add a term, or add a context to a term, by editing
this file directly; keep the `### Term` headings in alphabetical order and keep the table
of contents below in step with them.

**Contexts in use.** Each bullet opens with the context it speaks for:

- **ILCD (2010)** — the ILCD Handbook, General guide for LCA, Detailed guidance
- **ISO 14044 (2006)** — the ISO standard
- **EF/PEF (European Commission)** — the Environmental Footprint guidance
- **EN 15804 (2019)** — the construction-products EPD standard
- **EPD System** — the International EPD System programme, its instructions and its PCRs
- **ecoinvent (Knowledge Base)** — the ecoinvent documentation and glossary
- **BAFU (2026)** — the Swiss federal LCA database release
- **Sentier** — the sentier-* platform and its repositories
- **Brightway (bw2data >=4)** — the Brightway 2.5 data model and glossary
- **Python (docs)** — the Python language and standard-library documentation
- **Wiki (generic)** — a generic sense no standard defines, written for this wiki
- **Wiki (this repository)** — a term that only means something inside this repository

**Entry format.** One `### Term` heading per term, then one bullet per context:

```
### Term

- **Context** — the definition, in one sentence — source: <id> p.<n>
- Disambiguation: what this term is not, and which neighbouring term to read instead.
```

Every bullet names the `source:` id it comes from; ids resolve in
[sources.md](sources.md). A page number is added where the source is paginated.

**Precedence.** Where the ILCD Handbook defines a term, its bullet comes first; ISO,
EF/PEF, the databases and the tools follow beside it. Definitions that diverge stay side
by side and are never merged into one. A bullet written for this wiki because no source
defines the term yet carries `provenance: first-use · review: needed` and waits for a
reviewer to confirm or replace it.

## Terms

[Activity](#activity) · [Activity class](#activity-class) · [Activity data](#activity-data) · [Activity link](#activity-link) · [Allocation](#allocation) · [Analysed decision](#analysed-decision) · [APOS](#apos) · [Assumption scenario](#assumption-scenario) · [Attributional modelling](#attributional-modelling) · [Backend](#backend) · [Background](#background) · [Backtest](#backtest) · [Benchmark](#benchmark) · [Best attainable consensus](#best-attainable-consensus) · [Biosphere](#biosphere) · [Bridge](#bridge) · [bw2setup](#bw2setup) · [By-product / waste](#by-product--waste) · [Category](#category) · [Characterisation factor table](#characterisation-factor-table) · [Characterisation function](#characterisation-function) · [Characterization factors](#characterization-factors) · [Circular Footprint Formula](#circular-footprint-formula) · [Co-function](#co-function) · [Co-product](#co-product) · [Common database release identifier](#common-database-release-identifier) · [Comparative assertion](#comparative-assertion) · [Comparative life cycle assessment](#comparative-life-cycle-assessment) · [Compartment](#compartment) · [Concept scheme](#concept-scheme) · [Conditional exchange](#conditional-exchange) · [Consequential modelling](#consequential-modelling) · [Constrained market](#constrained-market) · [Contribution analysis](#contribution-analysis) · [Core flow ontology](#core-flow-ontology) · [Coverage](#coverage) · [Coverage sidecar](#coverage-sidecar) · [Critical review](#critical-review) · [Crosswalk](#crosswalk) · [Cut-off](#cut-off) · [Data format](#data-format) · [Data quality](#data-quality) · [Data root](#data-root) · [Database](#database) · [Database dating](#database-dating) · [Database service layer](#database-service-layer) · [Datapackage](#datapackage) · [Dataset](#dataset) · [Dataset index](#dataset-index) · [Datasource](#datasource) · [Decision situation](#decision-situation) · [Declared unit](#declared-unit) · [Delivery](#delivery) · [Demand](#demand) · [Direct emissions](#direct-emissions) · [Disaggregate](#disaggregate) · [Disclosed to the public](#disclosed-to-the-public) · [Dry run](#dry-run) · [Dynamic biosphere matrix](#dynamic-biosphere-matrix) · [Dynamic score](#dynamic-score) · [Eco-point (UBP)](#eco-point-ubp) · [ecoSpold format](#ecospold-format) · [Edge](#edge) · [EF 3.1](#ef-31) · [EF-compliant dataset](#ef-compliant-dataset) · [eILCD](#eilcd) · [Elementary flow](#elementary-flow) · [Elementary flows](#elementary-flows) · [End-of-life product](#end-of-life-product) · [Environmental impact](#environmental-impact) · [Environmental Product Declaration (EPD)](#environmental-product-declaration-epd) · [Exchange](#exchange) · [Exchanges](#exchanges) · [Field](#field) · [File format](#file-format) · [File mode](#file-mode) · [Flow](#flow) · [Flow code](#flow-code) · [Flow mapper](#flow-mapper) · [Flows](#flows) · [Foreground](#foreground) · [Functional flow](#functional-flow) · [Functional unit](#functional-unit) · [Geography](#geography) · [Graph traversal](#graph-traversal) · [Guest access](#guest-access) · [ILCD-EL](#ilcd-el) · [ILCD format](#ilcd-format) · [Impact category](#impact-category) · [Importer](#importer) · [Information module](#information-module) · [Intermediate flows](#intermediate-flows) · [Inventory](#inventory) · [IRI namespace](#iri-namespace) · [LCA data](#lca-data) · [LCA database](#lca-database) · [LCA software](#lca-software) · [LCDN](#lcdn) · [LCI](#lci) · [LCI data](#lci-data) · [LCIA calculator](#lcia-calculator) · [LCIA method](#lcia-method) · [LCIA methods](#lcia-methods) · [LCIA results](#lcia-results) · [Life cycle inventory analysis results (LCI results)](#life-cycle-inventory-analysis-results-lci-results) · [Life cycle inventory (LCI) data set](#life-cycle-inventory-lci-data-set) · [Life cycle inventory (LCI) study](#life-cycle-inventory-lci-study) · [Linking](#linking) · [Manifest](#manifest) · [Mapping package](#mapping-package) · [Market activity](#market-activity) · [Matching rule](#matching-rule) · [Material for treatment (mft)](#material-for-treatment-mft) · [Materiality principle](#materiality-principle) · [Metadata](#metadata) · [Method](#method) · [Method id](#method-id) · [Migration](#migration) · [Modelling principles](#modelling-principles) · [Models](#models) · [Module](#module) · [Monofunctional process](#monofunctional-process) · [Multifunctional process](#multifunctional-process) · [New node each visit](#new-node-each-visit) · [Node](#node) · [Nomenclature](#nomenclature) · [Nomenclature-only mapping](#nomenclature-only-mapping) · [Non-functional flow](#non-functional-flow) · [Normalisation](#normalisation) · [Normalisation and weighting set](#normalisation-and-weighting-set) · [Obsolete category](#obsolete-category) · [Ordered pair](#ordered-pair) · [Overall environmental impact](#overall-environmental-impact) · [Pair](#pair) · [PARDISO](#pardiso) · [PCR](#pcr) · [PEF and OEF](#pef-and-oef) · [PEFCR](#pefcr) · [PEFCR / OEFSR](#pefcr--oefsr) · [Plugin](#plugin) · [Primary stem](#primary-stem) · [Process](#process) · [Processed arrays](#processed-arrays) · [Processes](#processes) · [Product](#product) · [Product flow](#product-flow) · [Production exchange guessing](#production-exchange-guessing) · [Production volume](#production-volume) · [Project](#project) · [Project directory](#project-directory) · [Project mode](#project-mode) · [Property](#property) · [Proprietary target](#proprietary-target) · [Randonneur package](#randonneur-package) · [Recycling, reuse, recovery](#recycling-reuse-recovery) · [Reference flow](#reference-flow) · [Reference function](#reference-function) · [Reference package](#reference-package) · [Reference product](#reference-product) · [Release component](#release-component) · [Release type](#release-type) · [Relevant](#relevant) · [Relink](#relink) · [Residual database](#residual-database) · [Resource group](#resource-group) · [Rest of the World (RoW)](#rest-of-the-world-row) · [Scenario difference file](#scenario-difference-file) · [Schema](#schema) · [Scoring package](#scoring-package) · [Screening LCA](#screening-lca) · [Secondary good](#secondary-good) · [Sector folder](#sector-folder) · [Sidecar](#sidecar) · [Single overall score](#single-overall-score) · [Skeleton](#skeleton) · [Software](#software) · [Solver](#solver) · [Strategy](#strategy) · [Sub-category](#sub-category) · [Sub-compartment](#sub-compartment) · [Sub-indicator](#sub-indicator) · [Substance](#substance) · [Substitution](#substitution) · [Substitution flow](#substitution-flow) · [Supply array](#supply-array) · [System](#system) · [System boundary](#system-boundary) · [System expansion](#system-expansion) · [System model](#system-model) · [System perspective](#system-perspective) · [Technosphere](#technosphere) · [Temporal distribution](#temporal-distribution) · [Temporal grouping](#temporal-grouping) · [Tier](#tier) · [Time-explicit LCA](#time-explicit-lca) · [Timeline](#timeline) · [Transformation verb](#transformation-verb) · [Transforming activity](#transforming-activity) · [Treatment activity](#treatment-activity) · [Uncertainty](#uncertainty) · [Unit normalisation](#unit-normalisation) · [Unit process, black box](#unit-process-black-box) · [Unit process, single operation](#unit-process-single-operation) · [Unit processes](#unit-processes) · [Unlinked edge](#unlinked-edge) · [Vintage](#vintage) · [Waste flow](#waste-flow) · [Weighting](#weighting)

### Activity

- **ecoinvent (Knowledge Base)** — an ecoinvent activity dataset represents a unit process of a human activity and its exchanges with the environment and with other human activities; version 3 has several activity types, among them transforming, treatment, market, and import and export activities — source: ecoinvent-kb-glossary
- **Wiki (generic)** — a named unit of doing in a technosphere model: one node that consumes and produces flows, and the database counterpart of a unit process — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: not activity data, which is a measured quantity feeding an inventory; see Activity data. For the relation to Processes and Unit processes see the disambiguation under Processes.
- **Brightway (bw2data >=4)** — the name used for both processes and elementary flows; where ISO says unit process or elementary flow, Brightway says activity. In the 2.5 data model an activity is a node of the graph, and the glossary now prefers "process" for the process kind of node. — source: brightway-glossary
- Disambiguation: not "activity data" in the EF/PEF sense; and a Brightway `Activity` object is a row of the SQLite node table, not a modelling assumption.
- **Sentier** — a row of an inventory sector's processes table, identified by a process id and carrying a reference product, a reference unit, a reference amount and a location. The platform's data layer prefers the word process; activity appears where the target tool uses it. — source: sentier-brightway-repo

### Activity class

- **ecoinvent (Knowledge Base)** — a group of activities classified together under a heading in a statistical classification of activities, such as ISIC, the International Standard Industrial Classification — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Activity data

- **EF/PEF (European Commission)** — "Quantitative measurements of processes or activities (e.g. kWh of electricity consumed, kg of material used) used to determine inputs and outputs in a life-cycle inventory and calculate associated environmental impacts" — source: ef-transitional-guidance-2026
- Disambiguation: not an Activity, which is the modelled process itself; see Activity.

### Activity link

- **ecoinvent (Knowledge Base)** — also called a direct link: a link for a specific exchange to a specific supplying dataset, given by the dataset author rather than added by the database service layer during linking, used where a supply chain is tightly enough coupled that the supplier's production volume follows the customer's demand — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Allocation

- **ILCD (2010)** — or partitioning: partitioning the input or output flows of a process or a product system between the product system under study and one or more other product systems — source: ilcd-2010 p.21
- **ecoinvent (Knowledge Base)** — the method applied in the attributional approach to convert multi-product activities into single-product activities, relevant for the cut-off and APOS system models; an allocation key sets the share of each input and emission assigned to the reference product and to the by-products that have economic value — source: ecoinvent-kb-system-models

### Analysed decision

- **ILCD (2010)** — decision that is subject to an LCA study; comparative LCA studies with a direct decision context analyse a decision rather than a single process or system, for example a choice of material, a purchase or a policy option — source: ilcd-2010 p.21

### APOS

- **ecoinvent (Knowledge Base)** — allocation at the point of substitution: an attributional system model in which responsibility for waste burdens is shared between producers and the later users who benefit from the treatment, using system expansion to avoid allocating inside treatment chains; it was called "Allocation, ecoinvent default" until the name changed with version 3.2 — source: ecoinvent-kb-system-models · provenance: first-use · review: needed

### Assumption scenario

- **ILCD (2010)** — scenario for the analysed process or system that varies data and method assumptions in order to evaluate the robustness of the study results and conclusions; each compared alternative has its own assumption scenarios — source: ilcd-2010 p.21

### Attributional modelling

- **ILCD (2010)** — or descriptive, book-keeping: LCI modelling frame that inventories the inputs and output flows of all processes of a system as they occur; modelling a process along an existing supply chain is of this type — source: ilcd-2010 p.21

### Backend

- **Brightway (bw2data >=4)** — the storage engine and modelling paradigm behind one database, recorded in its metadata under the key `backend`. A normal installation offers `sqlite` (the default, SQLite used as a graph store), `iotable` (nodes in SQLite, edges only in datapackages, one value per edge, for large input-output data) and, with the `multifunctional` package installed, `multifunctional` (multifunctional processes allocated when datapackages are created). — source: brightway-cheatsheet · provenance: first-use · review: needed

### Background

- **ILCD (2010)** — background system, in the specificity perspective: those processes where, due to the averaging effect across the suppliers, a homogeneous market with average or equivalent generic data can be assumed to represent the process appropriately — source: ilcd-2010 p.97
- **EF/PEF (European Commission)** — background process: "Process outside the organisation's direct control (e.g. electricity grid, upstream supply chain) for which secondary data from databases is typically used" — source: ef-transitional-guidance-2026

### Backtest

- **Sentier (sentier-brightway 0.1.0)** — scoring every process of a build for all impact categories and comparing the scores with the reference results the source database publishes, so the linking is checked against a known answer and not only against a schema. — source: sentier-brightway-repo · provenance: first-use · review: needed
- **Sentier (sentier-agribalyse)** — the same check inside the Agribalyse adapter, run by `dds-backtest`, which writes per-product differences against the published reference values. — source: sentier-agribalyse-repo · provenance: first-use · review: needed

### Benchmark

- **EF/PEF (European Commission)** — the Environmental Footprint profile of the average production on the market, of the representative product or of the representative organisation, against which a study's result is positioned; a PEFCR fixes the benchmark for its product category. — source: eu-recommendation-2021-2279
- Disambiguation: a benchmark describes the current average, not a target to reach, and it is not a measurement of software speed.

### Best attainable consensus

- **ILCD (2010)** — partial or full agreement of the involved parties, steered by a chair or coordinator towards the broadest possible agreement on the issue at stake, where a solution fitting preset requirements is to be found and the zero option is not an option — source: ilcd-2010 p.21

### Biosphere

- **Brightway (bw2data >=4)** — the part of the graph holding elementary flows and the edges to them. A biosphere edge connects a process to an elementary flow node, and the biosphere matrix has those flows as rows and processes as columns. Brightway ships no single fixed biosphere: a project gets one by installing a starter project or importing a release. — source: brightway-glossary

### Bridge

- **Sentier (sentier-mappings, sentier-brightway 0.1.0)** — the set of ordered mapping packages that relinks the flows of one source nomenclature onto another, stored as data in its own repository and applied at load time rather than baked into a loader. — source: sentier-brightway-repo · provenance: first-use · review: needed

### bw2setup

- **Brightway (bw2io >=0.9)** — the legacy one-shot project setup call: it created the `biosphere3` database, wrote the default impact categories from the bundled `lcia_39_ecoinvent.zip`, and created the core migrations. The documentation marks it deprecated in favour of `bi.remote.install_project`, which downloads a prepared project archive instead. — source: brightway-cheatsheet · provenance: first-use · review: needed

### By-product / waste

- **ecoinvent (Knowledge Base)** — any activity output that is neither a reference product nor an exchange to the environment; within the category, waste has no economic value while a by-product does — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Category

- **BAFU (2026)** — the first level of the database's own two-level subject grouping, carried on every process and on every exchange and mirrored as a category tree in the openLCA package; BAFU:2026 v1 has 60 distinct top-level categories over its 11,947 processes, four of them legacy groups whose name ends in obsolete — source: bafu-2026-release · provenance: first-use · review: needed
- Disambiguation: a BAFU category is a subject group, not a sector and not an impact category; the reading onto GICS sectors is editorial and lives in the core crosswalk.

### Characterisation factor table

- **Sentier (sentier-methods)** — the parquet table holding one row per characterisation factor, keyed by method id and elementary flow, with the factor's unit and an optional location. A row without a location is the global factor, and the loader uses the global rows only. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Characterisation function

- **Brightway (bw_temporalis >=1.2)** — a function of time applied in place of a fixed characterisation factor, so that a dated emission is characterised by when it happens; the package ships radiative forcing functions for carbon dioxide and methane. — source: bw-temporalis-repo · provenance: first-use · review: needed
- **Brightway (bw_timex >=1.4)** — what `dynamic_lcia` needs instead of characterisation factors: a default set is registered by the package, and `add_flows_to_characterization_functions` adds more for named flows. — source: bw-timex-docs · provenance: first-use · review: needed
- Disambiguation: a characterisation function takes a date, a characterisation factor is a single number; see Characterization factors.

### Characterization factors

- **ISO 14044 (2006)** — a factor taken from a characterisation model and applied to convert an assigned inventory result into the common unit of the category indicator — source: iso-14044-2006
- **Wiki (generic)** — as a data structure, the mapping an LCIA method carries from an elementary flow to the factor applied to it; this wiki documents the structure and never publishes factor values — source: lca-wiki-editorial · provenance: first-use · review: needed
- **Brightway (bw2data >=4)** — a biosphere exchange characterised, meaning scaled, to a unit; stored as the second element of a tuple under a `Method`, either as a number or as a dictionary carrying uncertainty, optionally with a third element giving a location. — source: brightway-glossary

### Circular Footprint Formula

- **EF/PEF (European Commission)** — the formula the Environmental Footprint method prescribes for the materials of a product, their waste treatment and its packaging; an EF-compliant dataset must implement it for the products in scope and declare its parameters, among them the recycled content R1. — source: ef-compliant-data-guide-2.0

### Co-function

- **ILCD (2010)** — any of two or more functions provided by the same unit process or system — source: ilcd-2010 p.21

### Co-product

- **ILCD (2010)** — any of two or more products coming from the same unit process or system — source: ilcd-2010 p.21

### Common database release identifier

- **Brightway (randonneur_data >=0.7)** — the naming convention for a database release agreed at Brightcon 2022, `<database name>-<version>-<optional modifier>`, as in `ecoinvent-3.10-cutoff` or `simapro-9-biosphere`; a migration file that moves between two releases names both, source first. — source: randonneur-repo · provenance: first-use · review: needed

### Comparative assertion

- **ILCD (2010)** — environmental claim regarding the superiority or equivalence of one product versus a competing product that performs the same function — source: ilcd-2010 p.21

### Comparative life cycle assessment

- **ILCD (2010)** — comparison of LCA results for different products, systems or services that usually perform the same or similar function — source: ilcd-2010 p.21

### Compartment

- **ILCD (2010)** — the environmental medium an emission goes to; the default compartments are given in the separate document Nomenclature and other conventions and are implemented in the ILCD reference elementary flows — source: ilcd-2010 p.130
- **Wiki (generic)** — the environmental medium an elementary flow is exchanged with, such as air, water, soil or natural resource; it is part of the flow's identity, not of the amount — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: a compartment is the medium itself; a sub-compartment is a finer division inside it, such as a type of water body. See Sub-compartment.
- **BAFU (2026)** — the first level below the Elementary flows root of the flow category tree; the release has seven of them, Emission to air, Emission to water, Emission to soil, Resource, Waste, Economic and Immaterial emission, the last three existing because the Ecological Scarcity method scores quantities that are not substance emissions — source: bafu-2026-release
- Disambiguation: flowmapper's `context` is the compartment together with its sub-compartment, given as one hierarchical list rather than as two fields. See Core flow ontology.

### Concept scheme

- **Sentier (sentier-vocab)** — the SKOS scheme a vocabulary source file declares itself to belong to, one per term category; a source whose scheme is not registered fails generation outright rather than minting an unmanaged IRI. — source: sentier-vocab-repo · provenance: first-use · review: needed
- Disambiguation: the scheme is the grouping of terms; the URL prefix its IRIs are minted under is the IRI namespace. See IRI namespace.

### Conditional exchange

- **ecoinvent (Knowledge Base)** — an exchange that is activated only for a specified system model; constrained market datasets carry one, with a direct activity link to the consumption activity affected by a change in demand — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Consequential modelling

- **ILCD (2010)** — LCI modelling principle that identifies and models all processes in the background system of a system in consequence of decisions made in the foreground system — source: ilcd-2010 p.21
- **ecoinvent (Knowledge Base)** — in the "Substitution, consequential, long-term" system model: assessing the consequences of a change in an existing system, resolving multi-functionality by substitution rather than allocation and using only marginal, unconstrained suppliers, where a supplier counts as unconstrained only if it can meet a rise in demand and is at an up-to-date technology level — source: ecoinvent-kb-system-models

### Constrained market

- **ecoinvent (Knowledge Base)** — a market where all or part of a change in demand is not reflected in a corresponding change in supply but in a change in consumption elsewhere; under the cut-off, EN15804 and APOS system models its conditional exchange stays inactive and it behaves like any other market — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Contribution analysis

- **ILCD (2010)** — also called gravity analysis or weak point analysis: quantifying how much each contributor, life cycle stage, process or elementary flow adds to the total, which is how the significant issues of a study are identified; carried out against the normalised and weighted overall result it is called dominance analysis instead. — source: ilcd-2010 p.286
- **Brightway (bw2analyzer >=0.11)** — what `ContributionAnalysis` computes from a solved `LCA`: the top processes and the top elementary flows behind a score, annotated with names. — source: bw2analyzer-docs · provenance: first-use · review: needed

### Core flow ontology

- **Brightway (flowmapper 0.4)** — the small shape flowmapper assumes behind every elementary flow list, whatever its serialisation: a canonical name, an identifier, a context, a unit, sector labels such as a CAS number, and a list of synonyms. Source and target lists must already be in that shape. — source: flowmapper-repo · provenance: first-use · review: needed

### Coverage

- **Sentier (sentier-brightway 0.1.0)** — how much of a source nomenclature a bridge relinks, reported as two numbers that are read together: the share of distinct flows linked, and the share of biosphere exchange rows linked, which weights a flow by how often it is actually used. — source: sentier-brightway-repo · provenance: first-use · review: needed
- Disambiguation: coverage is not accuracy. A linked flow found a plausible counterpart; whether that counterpart is the right one is a mapping review question.

### Coverage sidecar

- **Sentier (sentier-mappings)** — the pair-level, non-normative file shipped beside the mapping packages with one row per source flow, saying which package covers that flow or why none does. It is a report, never read as a mapping. — source: sentier-mappings-repo · provenance: first-use · review: needed
- Disambiguation: this is the coverage one of a pair's sidecars; for the general kind, and for the package-level review files, see Sidecar.

### Critical review

- **ISO 14044 (2006)** — the review of a study, whose type and reviewers are fixed in the scope; a comparative assertion intended to be disclosed to the public requires a critical review by interested parties. — source: iso-14044-2006
- **ILCD (2010)** — the handbook carries the reporting and review requirements in its chapters 10 and 11; the review is part of the study rather than a stamp applied to a finished one, so its findings can still move the functional unit, the allocation choice or the data quality rating. — source: ilcd-2010

### Crosswalk

- **Brightway (flowmapper 0.4)** — the computed correspondence from a source flow list to a target flow list, held by the `Flowmap` class together with its statistics, and written out in GLAD format, randonneur format or both. — source: flowmapper-repo · provenance: first-use · review: needed
- **Wiki (this repository)** — a page that reads one classification against another, such as the sector crosswalk that reads the GICS sectors against the database subject groupings. — source: lca-wiki-editorial · provenance: first-use · review: needed

### Cut-off

- **ecoinvent (Knowledge Base)** — two senses. As a system model, "allocation, cut-off by classification": recycled content modelling in which wastes are the producer's responsibility and recyclable materials are available burden-free to their next user. As a point, the place in a supply chain where the primary system ends and the secondary one begins, which the EN15804 system model moves to the end-of-waste state defined by that standard — source: ecoinvent-kb-system-models · provenance: first-use · review: needed

### Data format

- **Wiki (generic)** — the agreed structure a dataset is exchanged in: which fields exist, what they mean and how they nest; the ILCD format and EcoSpold are data formats — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: a data format says which fields exist, a schema says which values are valid, and a file format says how the bytes are packaged. See Schema and File format.

### Data quality

- **ILCD (2010)** — addressed by two complementary approaches: data quality in the stricter sense, carried by six indicators (technological, geographical and time-related representativeness, completeness, precision or uncertainty, and methodological appropriateness and consistency), and the complementary items documentation, review and nomenclature — source: ilcd-2010 p.323
- **ISO 14044 (2006)** — the characteristics of data that decide whether they can satisfy the requirements stated for them — source: iso-14044-2006

### Data root

- **Sentier (sentier-brightway 0.1.0)** — the folder the loader reads the platform data from: either local clones of the data repositories, one subfolder per repository, or the verified download cache it fills from the pinned manifest. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Database

- **Brightway (bw2data >=4)** — a container for inventory nodes inside one project, primarily an organisation tool whose boundaries the practitioner chooses. A node belongs to exactly one database; edges cross freely between databases. Brightway draws no foreground and background distinction. — source: brightway-glossary
- Disambiguation: not the LCA database entry, which is a published data product such as ecoinvent or BAFU; such a product becomes one or more Brightway databases once imported. Not a database server either.

### Database dating

- **Brightway (bw_timex >=1.4)** — saying which point in time each background database represents, through the `database_dates` argument or once through `set_database_metadata`, so that a project carries its own dating; a database the traversal reaches that is not dated raises `UnmappedDatabaseError`. — source: bw-timex-docs · provenance: first-use · review: needed

### Database service layer

- **ecoinvent (Knowledge Base)** — the group of mathematical formulas, commands and validation rules, specific to a chosen system model, that links the unlinked single or multi-output unit process datasets into product systems — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Datapackage

- **Brightway (bw_processing >=1)** — the numerical data of a database, impact category, normalisation or weighting written out as numpy arrays and record arrays, with a metadata file following the Open Knowledge Foundation data package standard, so author, licence and version travel with the numbers. A datapackage holds everything a matrix calculation needs, and can express uncertainty and scenarios. — source: brightway-glossary · provenance: first-use · review: needed
- **Sentier (sentier-brightway 0.1.0)** — a `bw_processing` datapackage written by the loader in file mode: one for the inventory and one per impact category, with matrix indices equal to the integer ids of the parquet registry, so a stock calculation reads an export with no translation. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Dataset

- **Sentier** — a published artifact in a data repository, at a pinned commit: a parquet table, a mapping package or a vocabulary shard, never a unit process document. What a Sentier build consumes is a set of datasets in that sense. — source: sentier-brightway-repo

### Dataset index

- **Brightway (ecoinvent_interface >=3.1)** — the integer by which the ecoinvent API identifies one dataset; the bundled mapping files translate a filename or a set of attributes into it, one file per version and system model combination, and the index values are the same across system models and versions. — source: ecoinvent-interface-repo · provenance: first-use · review: needed

### Datasource

- **Sentier (sentier-methods)** — one numbered folder of the methods repository standing for one impact assessment publication: its methods table, its characterisation factor table and its metadata. The numeric prefix orders the datasources and sets precedence when records collide. — source: sentier-methods-repo · provenance: first-use · review: needed

### Decision situation

- **ILCD (2010)** — the classification of a study's decision context that the handbook adds to the ISO goal definition: Situation A, micro-level decision support, for decisions with limited and no structural consequences outside the decision context; Situation B, meso and macro-level decision support, for decisions assumed to change available production capacity; Situation C, accounting, purely descriptive documentation of a system's life cycle. — source: ilcd-2010

### Declared unit

- **EN 15804 (2019)** — the reference quantity of a construction product declaration, used because a construction product often has no single function until it is placed in a building; an EPD based on the construction products PCR alone uses one, while a cradle to grave and module D EPD uses a functional unit and needs a complementary PCR. — source: epd-pcr-2019-14
- Disambiguation: a declared unit is not a functional unit, and comparing two EPDs across that difference is the classic construction EPD error. See Functional unit.

### Delivery

- **Sentier (sentier-importers 0.0.1)** — putting an importer's staged output into a data repository, always as a pull request and never as a push, and only when `--deliver` or `--deliver-local` is given. — source: sentier-importers-repo · provenance: first-use · review: needed
- Disambiguation: every run without one of those flags is a dry run; see Dry run.

### Demand

- **Brightway (bw2calc >=2)** — what the calculation is asked for, given as a dictionary of product nodes to amounts and passed as the `demand` argument. The glossary maps it onto the ISO functional unit. — source: brightway-glossary

### Direct emissions

- **EF/PEF (European Commission)** — "Emissions released directly by a process under study (foreground system), such as CO2 and NOx from on-site combustion" — source: ef-transitional-guidance-2026

### Disaggregate

- **Brightway (randonneur >=0.7)** — the transformation verb that splits one edge into several targets, each carrying an `allocation` field whose values need not sum to one; it runs by default, beside `replace` and `update`. — source: randonneur-repo · provenance: first-use · review: needed
- Disambiguation: not the eILCD sense of a disaggregated dataset, which is a life cycle model published with its constituent processes. See eILCD.

### Disclosed to the public

- **ILCD (2010)** — the audience is not specifically limited and hence includes non-technical and external audience, for example consumers — source: ilcd-2010 p.21

### Dry run

- **Sentier (sentier-importers 0.0.1)** — the default mode of an importer run: everything is fetched, transformed and staged into an output folder, and nothing is committed, pushed or proposed. — source: sentier-importers-repo · provenance: first-use · review: needed

### Dynamic biosphere matrix

- **Brightway (bw_timex >=1.4)** — the biosphere matrix indexed by elementary flow and by date rather than by flow alone, built by `DynamicBiosphereBuilder` during the inventory step, so that every emission carries when it happens. — source: bw-timex-docs · provenance: first-use · review: needed

### Dynamic score

- **Brightway (bw_timex >=1.4)** — the result of applying characterisation functions over a time horizon to the time-explicit inventory, read from `dynamic_score`. It is a different quantity from the static score and the two are not comparable directly. — source: bw-timex-docs · provenance: first-use · review: needed

### Eco-point (UBP)

- **BAFU (2026)** — the unit of the Ecological Scarcity method, written UBP in the results workbook, in which twenty impact categories and their weighted total are expressed; the current edition of the method is Swiss Eco-Factors 2021, a distance to target method weighting emissions and resource use against Swiss environmental policy targets — source: bafu-lca-methodology-2021

### ecoSpold format

- **ecoinvent (Knowledge Base)** — the format ecoinvent uses to create life cycle inventories, setting which fields are mandatory and which optional; ecoSpold 1 serves database versions 1 and 2, ecoSpold2 serves version 3 and adds fields such as mathematical relations, variable names and exchange properties — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Edge

- **Brightway (bw2data >=4)** — the verbs of the graph. Every edge is directed, from a source to a target; inventory and impact assessment edges must be numeric, other edges need not be. A functional edge is one that expresses the function of the process it hangs off, and can be an input or an output. — source: brightway-glossary · provenance: first-use · review: needed

### EF 3.1

- **Sentier (sentier-methods, sentier-brightway 0.1.0)** — the Environmental Footprint 3.1 release as the platform ships it: an elementary flow list in the vocabulary and 25 impact categories with global characterisation factors in the methods repository. Regionalised factors are not covered. — source: sentier-brightway-repo

### EF-compliant dataset

- **EF/PEF (European Commission)** — "Dataset developed in compliance with the EF requirements: follows the International Life Cycle Data (ILCD) format, covers all EF impact categories, uses standardised nomenclature for emissions and resources, has been reviewed by qualified professionals" — source: ef-transitional-guidance-2026

### eILCD

- **EF/PEF (European Commission)** — "Extended ILCD (eILCD) format that expands the ILCD format to support entire life-cycle models (i.e. disaggregated datasets)" — source: ef-transitional-guidance-2026

### Elementary flow

- Disambiguation: see [Elementary flows](#elementary-flows); same term, kept for the links that point here.

### Elementary flows

- **ILCD (2010)** — single substance or energy entering the system being studied that has been drawn from the ecosphere without previous human transformation, or single substance or energy leaving the system being studied that is released into the ecosphere without subsequent human transformation — source: ilcd-2010 p.94
- **ISO 14044 (2006)** — material or energy that enters the studied system straight from the environment, or leaves it straight into the environment, with no human transformation before or after — source: iso-14044-2006
- **ecoinvent (Knowledge Base)** — elementary exchange: exchange with the natural, social or economic environment; examples are unprocessed inputs from nature, emissions to air, water and soil, physical impacts, and working hours under specified conditions — source: ecoinvent-kb-glossary
- Disambiguation: the ILCD wording narrows the ISO one to single substances and to the ecosphere, so that tailings or landfilled products are modelled through to the substances that actually reach the environment.
- **BAFU (2026)** — one of three flow kinds in the openLCA package, beside product flows and waste flows; BAFU:2026 v1 carries 2,460 of them, and the list was restricted in this release to the flows actually used inside the database rather than a full reference list — source: bafu-2026-release
- **Brightway (bw2data >=4)** — a biosphere node: an exchange with the environment, stored as its own node in the graph rather than as a property of a process. The glossary notes that ISO treats this more as a flow than as a process, which is why Brightway's older word "activity" covers both. — source: brightway-glossary
- **Sentier** — a term in the vocabulary, identified by an IRI and carrying a preferred label, the upstream source it came from, a compartment, a sub-compartment and a CAS number where one exists. The same flow list serves as the biosphere of a build. — source: sentier-brightway-repo

### End-of-life product

- **ILCD (2010)** — product at the end of its useful life that will potentially undergo reuse, recycling or recovery — source: ilcd-2010 p.22

### Environmental impact

- **ILCD (2010)** — potential impact on the natural environment, human health or the depletion of natural resources, caused by the interventions between the technosphere and the ecosphere as covered by LCA, for example emissions, resource extraction and land use — source: ilcd-2010 p.22

### Environmental Product Declaration (EPD)

- **EPD System** — a voluntary document in which a company or organisation presents transparent information about the life cycle environmental impact of its goods or services, published as a type III environmental declaration under a programme operating to ISO 14025. — source: epd-pcr-2019-14

### Exchange

- Disambiguation: see [Exchanges](#exchanges); same term, kept for the links that point here.

### Exchanges

- **ecoinvent (Knowledge Base)** — exchange: two basic types of exchanges exist, elementary exchanges and intermediate exchanges — source: ecoinvent-kb-glossary
- **Wiki (generic)** — one line of a process inventory: a flow, an amount, a unit and a direction, connecting the process to another process or to the environment — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: a flow is the vocabulary item that several processes share; an exchange is that flow with an amount inside one process. See Flows.
- **Brightway (bw2data >=4)** — the older word for an edge, and still the class name; a production exchange is what the activity supplies, a technosphere exchange runs between two technosphere activities, a biosphere exchange runs to an elementary flow. — source: brightway-glossary
- **Sentier** — a row of an inventory sector's exchanges table, joining a process to an input, an output or an elementary flow, with a direction, a type and an amount. Technosphere and biosphere edges live in the same table and are told apart by their type, never by inference. — source: sentier-brightway-repo

### Field

- **Wiki (generic)** — one named slot a data format defines and a dataset fills, with a type, a cardinality and a meaning fixed by the format rather than by the tool reading it — source: lca-wiki-editorial · provenance: first-use · review: needed

### File format

- **Wiki (generic)** — how the bytes of a dataset are packaged on disk, such as XML, ZIP, JSON or Parquet, as distinct from the data format carried inside them — source: lca-wiki-editorial · provenance: first-use · review: needed

### File mode

- **Sentier (sentier-brightway 0.1.0)** — the output shape that needs no `bw2data`: a folder holding the parquet registry, the mapping packages as applied, the datapackages and a manifest. The counterpart of project mode. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Flow

- Disambiguation: see [Flows](#flows); same term, kept for the links that point here.

### Flow code

- **Sentier (sentier-brightway 0.1.0)** — the identifier of an elementary flow inside a build: the flow's IRI with the vocabulary's flow prefix stripped off. Characterisation factors, mappings and biosphere exchanges all key on it. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Flow mapper

- **Wiki (generic)** — a module that translates flow names between nomenclatures, so that an inventory written with one database's flow list can be characterised with another's LCIA method — source: lca-wiki-editorial · provenance: first-use · review: needed

### Flows

- **ILCD (2010)** — the inventory phase collects elementary flows such as resources, emissions and land use, product flows that link the analysed process with other processes, and waste flows that need to be linked with waste management processes — source: ilcd-2010 p.153
- **Wiki (generic)** — the named things that move into and out of a process, each one an entry in a shared nomenclature with a unit and, for elementary flows, a compartment — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: a flow is the named item; an exchange is the flow with an amount. See Exchanges.
- **Sentier** — a vocabulary term referred to by IRI, not a string. Matching flows by name is the problem the platform exists to remove, so the IRI is the only identity a Sentier dataset carries. — source: sentier-dev-repo

### Foreground

- **ILCD (2010)** — foreground system, in the specificity perspective: those processes of the system that are specific to it, so that data for the specific technology or supplier is most appropriate; in the management perspective, those processes directly affected by the decisions analysed — source: ilcd-2010 p.97
- **EF/PEF (European Commission)** — foreground process: "Process within the direct control or knowledge of the organisation performing the study, for which primary data should be collected" — source: ef-transitional-guidance-2026

### Functional flow

- **ILCD (2010)** — one of the co-product flows in the inventory of a process or system that fulfils the process' or system's function; see also Non-functional flow — source: ilcd-2010 p.22

### Functional unit

- **ILCD (2010)** — names and quantifies the qualitative and quantitative aspects of the function along the questions what, how much, how well and for how long, so that the compared objects are comparable — source: ilcd-2010 p.60
- **ISO 14044 (2006)** — the quantified performance of a product system, used as the reference unit of the study — source: iso-14044-2006
- **Brightway (bw2calc >=2)** — the demand of goods and services used in one calculation, made of products rather than processes, and allowed to contain more than one product. In `MultiLCA` each functional unit carries a label and its keys are integer node ids. — source: brightway-glossary

### Geography

- **ecoinvent (Knowledge Base)** — the geographic region an activity is valid for, which may be the whole world (GLO), a region of several countries such as Europe (RER), one country, or a smaller area; every activity has one, and it is part of what identifies the activity — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Graph traversal

- **Brightway (bw_graph_tools >=0.10)** — walking a solved system node by node along the paths that carry the most impact, recording the impact of arriving at each node by that path. A matrix solution answers all the equations at once and therefore cannot tell two paths to the same object apart, nor carry per-path information such as a date. — source: bw-graph-tools-repo · provenance: first-use · review: needed

### Guest access

- **ecoinvent (Knowledge Base)** — registration in the web interface without a licence, which shows the metadata and description of every dataset, its name, geography, time period and classification, but not its exchanges; enough to plan a study with and not enough to calculate one. — source: ecoinvent-kb-activities-products · provenance: first-use · review: needed

### ILCD-EL

- **EF/PEF (European Commission)** — ILCD Entry Level: "a subset of ILCD conformance requirements that meet a defined minimum set of criteria, including use of the ILCD format, and may be used as secondary data when EF-compliant datasets are not available, subject to specific conditions" — source: ef-transitional-guidance-2026

### ILCD format

- **EF/PEF (European Commission)** — "International Life Cycle Data system that provides the standard data format specifications for life-cycle inventory datasets used in the EF framework" — source: ef-transitional-guidance-2026

### Impact category

- **ILCD (2010)** — the impact topics differentiated at midpoint level, around ten of them checked per default: climate change, stratospheric ozone depletion, human toxicity, respiratory inorganics, ionizing radiation, photochemical ozone formation, acidification, eutrophication, ecotoxicity, land use and resource depletion; above them sit the three areas of protection used at endpoint level — source: ilcd-2010 p.109
- **ISO 14044 (2006)** — a class standing for an environmental issue of concern, to which inventory results may be assigned — source: iso-14044-2006

### Importer

- **Wiki (generic)** — a module that reads an external dataset in its own data format and writes it into the tool's inventory representation, mapping flows, units and metadata on the way — source: lca-wiki-editorial · provenance: first-use · review: needed

### Information module

- **EN 15804 (2019)** — one of the labelled parts a construction product's life cycle is divided into for declaration: A1 to A3 for the product stage, A4 and A5 for the construction process stage, B1 to B7 for the use stage, C1 to C4 for the end of life stage, and D for benefits and loads beyond the system boundary. — source: epd-pcr-2019-14
- Disambiguation: this is the life cycle stage sense of the word module; see Module for the other two senses.

### Intermediate flows

- **ISO 14044 (2006)** — a flow of product, material or energy that occurs between unit processes of the studied product system — source: iso-14044-2006
- **ecoinvent (Knowledge Base)** — intermediate exchange: an exchange between two activities that stays within the technosphere and is not emitted to or taken from the environment — source: ecoinvent-kb-glossary

### Inventory

- **Wiki (generic)** — the set of exchanges belonging to one process or to one system, with their amounts and units; the data an LCIA calculator reads — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: LCI is the phase of the assessment, LCI data is what that phase produces, and an inventory is one concrete set of exchanges. See LCI and LCI data.

### IRI namespace

- **Sentier (sentier-vocab)** — the URL prefix under `https://vocab.sentier.dev/` that one term category's IRIs are minted under, registered once in the repository's IRI registry; a published namespace does not change without a vocabulary migration. — source: sentier-vocab-repo · provenance: first-use · review: needed

### LCA data

- **Wiki (generic)** — the umbrella for everything an LCA calculation reads: LCI data, LCIA methods and the metadata that makes both interpretable — source: lca-wiki-editorial · provenance: first-use · review: needed

### LCA database

- **Wiki (generic)** — a published, versioned collection of LCI datasets sharing one nomenclature, one set of system models and one release process, distributed under its own licence — source: lca-wiki-editorial · provenance: first-use · review: needed

### LCA software

- **EF/PEF (European Commission)** — "Specialised software for Life Cycle Assessment calculations that typically includes EF-compliant databases and impact assessment methods in integrated libraries, accessible directly within the software environment" — source: ef-transitional-guidance-2026

### LCDN

- **EF/PEF (European Commission)** — Life Cycle Data Network: "network of nodes holding EF-compliant and ILCD datasets, managed through the European Platform on Life Cycle Assessment" — source: ef-transitional-guidance-2026

### LCI

- **ISO 14044 (2006)** — life cycle inventory analysis: the phase of an LCA that compiles and quantifies a product's inputs and outputs over its whole life cycle — source: iso-14044-2006
- **ecoinvent (Knowledge Base)** — Life Cycle Inventory (LCI): "the phase of life cycle assessment involving the compilation and quantification of inputs and outputs for a product throughout its life cycle", quoted there from ISO 14040:2006 — source: ecoinvent-kb-glossary
- Disambiguation: LCI names the phase; the numbers it produces are LCI data, and one process' set of exchanges is an inventory. See LCI data and Inventory.

### LCI data

- **Wiki (generic)** — the inventory numbers themselves: the exchanges of unit processes or of aggregated system datasets, with their units, their uncertainty and their metadata — source: lca-wiki-editorial · provenance: first-use · review: needed

### LCIA calculator

- **Wiki (generic)** — a module that multiplies an inventory by an LCIA method's characterisation factors and returns one score per impact category — source: lca-wiki-editorial · provenance: first-use · review: needed

### LCIA method

- Disambiguation: see [LCIA methods](#lcia-methods); same term, kept for the links that point here.

### LCIA methods

- **Wiki (generic)** — a named, versioned set of impact categories with their characterisation factors and, where defined, their normalisation and weighting sets — source: lca-wiki-editorial · provenance: first-use · review: needed
- **Brightway (bw2data >=4)** — a set of characterisation factors with its metadata, held by the `Method` class and keyed by a tuple such as `('ILCD 2.0', 'climate change', 'GWP 100a')`. The documentation says the class name is not technically correct, does not follow ISO, and that the preferred term is impact category. — source: brightway-glossary
- **Sentier** — a row of a method data source's methods table: one impact category with its unit, keyed by a method id, whose characterisation factors live in a separate table joined on that id. A method family such as an Environmental Footprint release is a folder of the methods repository, not a single object. — source: sentier-brightway-repo

### LCIA results

- **ecoinvent (Knowledge Base)** — LCIA score: one LCIA indicator for one dataset; two indicators for one dataset count as two LCIA scores — source: ecoinvent-kb-glossary
- **Wiki (generic)** — the scores obtained by applying an LCIA method to an inventory, one number per impact category per analysed system — source: lca-wiki-editorial · provenance: first-use · review: needed

### Life cycle inventory analysis results (LCI results)

- **ILCD (2010)** — outcome of a life cycle inventory analysis that catalogues the flows crossing the system boundary and provides the starting point for life cycle impact assessment — source: ilcd-2010 p.22

### Life cycle inventory (LCI) data set

- **ILCD (2010)** — data set with the inventory of a process or system; can be both unit process and LCI results and variants of these — source: ilcd-2010 p.22

### Life cycle inventory (LCI) study

- **ILCD (2010)** — life cycle study that provides the life cycle inventory data of a process or system — source: ilcd-2010 p.22

### Linking

- **ecoinvent (Knowledge Base)** — turning the unlinked unit process datasets of the database into supply chains through the markets, under a chosen system model — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Manifest

- **Sentier (sentier-brightway 0.1.0)** — the generated file that pins the platform data: one commit per data repository and a sha256 per file. It is regenerated by a script, never edited by hand, and an export writes a copy of what it used. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Mapping package

- **Sentier (sentier-mappings)** — one randonneur datapackage inside a pair folder, restricted by the repository's package profile: a name, a version, and the entries under the verbs it uses, of which only `replace` and `update` are delivered today. — source: sentier-mappings-repo · provenance: first-use · review: needed

### Market activity

- **ecoinvent (Knowledge Base)** — a dataset that transfers a product or service from the transforming activities producing it to those consuming it, its suppliers determined by geography and their shares by production volume; it provides the average consumption mix for a region, or the marginal mix under a system model that uses marginal suppliers, and may carry the average transport, its emissions and the losses in transport and storage — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Matching rule

- **Brightway (flowmapper 0.4)** — one predicate tried when matching a source flow against the target list, passed in order as `rules=` and defaulting to `match_rules`; the order matters, because a permissive rule placed early claims pairs a stricter rule would have matched differently. — source: pypi-flowmapper · provenance: first-use · review: needed
- Disambiguation: flowmapper's rules match flows to flows, while bw2io's strategies transform a whole imported dataset. See Strategy.

### Material for treatment (mft)

- **ecoinvent (Knowledge Base)** — one of the two product classes of the APOS system model: a product that requires treatment, either because it is waste or because it must be processed before it becomes valuable; a non-mft is a valuable product needing no further processing — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Materiality principle

- **EF/PEF (European Commission)** — "act where it matters": the principle adopted after the Environmental Footprint pilot phase, under which effort in a study goes to the impact categories, life cycle stages and processes that actually carry the result. — source: eu-recommendation-2021-2279

### Metadata

- **Wiki (generic)** — everything a dataset carries besides its amounts: names, geography, time and technology representativeness, review status, sources and licence — source: lca-wiki-editorial · provenance: first-use · review: needed

### Method

- **Brightway (bw2data >=4)** — the class that registers, writes and processes one impact category's factors; `bd.methods` is the registry of them in a project. Upstream now calls the concept an impact category and keeps `Method` only as the class name. — source: brightway-glossary
- Disambiguation: see the LCIA methods entry for the concept; this entry is about the Brightway class of that name.

### Method id

- **Sentier (sentier-methods, sentier-brightway 0.1.0)** — the identifier of one impact category within one method data source, written `<datasource>:<impact category>`. It is the key a characterisation factor table joins on and the name a file-mode score is asked for. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Migration

- **Brightway (randonneur >=0.7)** — a written-down, reusable change set applied to inventory data instead of a one-off script: a transformation file applied by `migrate_nodes` or `migrate_edges` and configured by `MigrationConfig`. — source: randonneur-repo · provenance: first-use · review: needed
- **Brightway (bw2data >=4)** — separately, the one-way upgrade of a project from the 2.4 line to the 2.5 line, run as `bd.projects.migrate_project_25()`, which reprocesses every database and impact category. — source: brightway-upgrading · provenance: first-use · review: needed

### Modelling principles

- **ILCD (2010)** — the two LCI modelling frames the handbook distinguishes: attributional modelling, which inventories the flows of all processes of a system as they occur, and consequential modelling, which models the processes in the background system in consequence of decisions made in the foreground system — source: ilcd-2010 p.21

### Models

- **Wiki (generic)** — the built representations a tool calculates on: processes linked by exchanges, plus the rules used to link them, such as the system model and the multifunctionality solution — source: lca-wiki-editorial · provenance: first-use · review: needed

### Module

- **Wiki (this repository)** — one installable, readable and connectable thing documented in a module folder: a package, a service or a dataset with its own front page, layout, commands, datasets and gotchas. — source: lca-wiki-editorial · provenance: first-use · review: needed
- **EN 15804 (2019)** — a life cycle stage of a construction product declaration, labelled A1 to A3 for the product stage, A4 and A5 for the construction process stage, B for the use stage, C for the end-of-life stage and D for benefits and loads beyond the system boundary. — source: en-15804-2019
- **Python (docs)** — a file containing Python definitions and statements, whose file name is the module name with the suffix .py appended, and which other modules import. — source: python-docs
- Disambiguation: three unrelated senses live under this word: a folder in this wiki, a life cycle stage in EN 15804, and an importable Python file. Say which one you mean.

### Monofunctional process

- **ILCD (2010)** — process or system that performs only one function — source: ilcd-2010 p.22

### Multifunctional process

- **ILCD (2010)** — process or system that performs more than one function, for example a process with more than one product as output or one treating more than one waste jointly — source: ilcd-2010 p.22

### New node each visit

- **Brightway (bw_graph_tools >=0.10)** — the default traversal behaviour, in which every arrival at an activity produces its own node record, so two paths to the same activity are two records; the stateful alternative records each activity once however often it is reached. — source: bw-graph-tools-repo · provenance: first-use · review: needed

### Node

- **Brightway (bw2data >=4)** — the nouns of the graph. A node has a type, normally process, product, biosphere flow or impact category, and the type decides which fields are required; custom types are allowed, so a project can store data an LCA does not use. — source: brightway-glossary · provenance: first-use · review: needed

### Nomenclature

- **ILCD (2010)** — one of the complementary data quality items: using the same elementary flows, units of measurement and naming conventions so that data stays consistent in practice; the ILCD names and default compartments are set in its separate Nomenclature and other conventions document — source: ilcd-2010 p.323

### Nomenclature-only mapping

- **Sentier (sentier-brightway 0.1.0)** — a mapping package, applied last in a bridge, that lands a source flow on a target flow carrying no characterisation factor: the flow is then correctly named and contributes nothing to a score, which is why its count is reported separately from coverage. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Non-functional flow

- **ILCD (2010)** — any of the inventory items that are not co-product flows, for example all emissions, waste and resources but also input flows of processed goods and of services — source: ilcd-2010 p.22

### Normalisation

- **ILCD (2010)** — an optional step that divides the LCIA results by a normalisation basis, separately for each impact category at midpoint level or each area of protection at endpoint level, so that every impact topic is expressed as the relative share of the analysed system in the total impact of that category per average citizen, per country or globally; it is the first step towards a fully aggregated result — source: ilcd-2010 p.281

### Normalisation and weighting set

- **Sentier (sentier-methods)** — an optional table beside a method data source's factors, joined on the method id, holding the normalisation and weighting values a footprint study applies after characterisation. The loader documented in this branch does not install it. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Obsolete category

- **BAFU (2026)** — a top-level category whose name ends in obsolete, holding superseded datasets kept so that older references still resolve; BAFU:2026 v1 has four of them, energy, material, processing and waste treatment, together holding 772 processes — source: bafu-2026-release · provenance: first-use · review: needed

### Ordered pair

- **Sentier (sentier-mappings)** — one source-and-target folder of the mapping repository, holding the mapping packages for that pair in a declared order, where an earlier package wins on a source key the later ones also name. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Overall environmental impact

- **ILCD (2010)** — total of impacts on human health, natural environment and resource depletion for the considered impact categories, calculated either as normalised and weighted overall LCIA results or assuming an even weighting across impacts — source: ilcd-2010 p.22

### Pair

- **Sentier (sentier-mappings)** — one source-and-target folder of the mapping repository, named `source__target`, holding that bridge's ordered mapping packages, its metadata file and its sidecars. — source: sentier-mappings-repo · provenance: first-use · review: needed
- Disambiguation: the ordering rule and the precedence it records are described under Ordered pair.

### PARDISO

- **Brightway (pypardiso >=0.4)** — the shared-memory parallel direct sparse solver of the Intel oneAPI Math Kernel Library, wrapped by `pypardiso` as a substitute for `scipy.sparse.linalg.spsolve`; `bw2calc` warns at import on x64 hardware when it is missing, and it is unavailable on Apple silicon. — source: pypardiso-repo · provenance: first-use · review: needed

### PCR

- **EPD System** — a document that complements a programme's general instructions and the standards with specific rules, requirements and guidelines for developing an EPD for one or more product categories, so that different practitioners assessing the same product category reach consistent results. — source: epd-pcr-2019-14
- Disambiguation: a product category rule is a sector-regulation document; its Environmental Footprint counterpart is defined under PEFCR / OEFSR. Sentier ships no PCR content of its own; what a PCR-driven study finds here is the flow vocabulary, the inventory and the Environmental Footprint method package.

### PEF and OEF

- **EF/PEF (European Commission)** — Product Environmental Footprint and Organisation Environmental Footprint: "EU methods set out in Commission Recommendation (EU) 2021/2279 for assessing the life-cycle environmental performance of products and organisations" — source: ef-transitional-guidance-2026

### PEFCR

- Disambiguation: a product environmental footprint category rule is a sector-regulation document, defined under PEFCR / OEFSR. The Sentier data relevant to one is the Environmental Footprint method package described under EF 3.1, not a rule text.

### PEFCR / OEFSR

- **EF/PEF (European Commission)** — Product Environmental Footprint Category Rules and Organisation Environmental Footprint Sector Rules: "sector-specific guidance documents that build on the EF methods, developed either in cooperation with the European Commission or more autonomously (so-called shadow PEFCR/OEFSR)" — source: ef-transitional-guidance-2026

### Plugin

- **Brightway (Activity Browser 3)** — an installed Python package that subclasses the exported `Plugin` base class and implements its three abstract methods; plugins are managed per project through a wizard in the interface and receive an `infos` dictionary on construction. — source: activity-browser-repo · provenance: first-use · review: needed

### Primary stem

- **Sentier (sentier-vocab)** — a vocabulary source file whose name is `core` or `water`, the only case that writes a committed Turtle file; any other stem writes a gitignored file that is rebuilt at deploy time. — source: sentier-vocab-repo · provenance: first-use · review: needed

### Process

- Disambiguation: see [Processes](#processes); same term, kept for the links that point here.

### Processed arrays

- **Brightway (bw_processing >=1)** — the binary form a database or impact category takes once processed for calculation: numpy arrays with fixed `row` and `col` index fields, an optional boolean `flip` vector for values whose sign must change, an optional `scale` vector, and uncertainty parameters kept in a separate array so they are loaded only when needed. Writing them is what `.process()` does, and what a 2.4 to 2.5 project migration redoes for every object. — source: bw-processing-docs · provenance: first-use · review: needed

### Processes

- **ISO 14044 (2006)** — a set of interrelated or interacting activities that turns inputs into outputs — source: iso-14044-2006
- **ecoinvent (Knowledge Base)** — process: a term used in ecoinvent version 2 which was replaced in version 3 by the more generic term activity — source: ecoinvent-kb-glossary
- Disambiguation: process is the ISO word for the transformation, activity is the ecoinvent word for the same node, and a unit process is the smallest process for which inputs and outputs are quantified. See Activity and Unit processes.
- **BAFU (2026)** — one published dataset, delivered as one ecoSpold v1 XML file named after its UUID and as one row of the LCIA results workbook; BAFU:2026 v1 has 11,947 of them — source: bafu-2026-release
- **Sentier** — the data layer's own word for an inventory record: one row of a sector's processes table, whose exchanges live in the sector's exchanges table. Sectors, not sources, organise the processes; which source supplied which row is logged by the importers. — source: sentier-brightway-repo

### Product

- **ILCD (2010)** — any good or service; see System — source: ilcd-2010 p.22
- **ecoinvent (Knowledge Base)** — good or service output of a human activity with a positive market or non-market value; in version 3 the product name is independent of the activity name — source: ecoinvent-kb-glossary
- **Sentier** — a vocabulary term in its own concept scheme, referred to by IRI, and separately the reference product named by an inventory process. The vocabulary sense is the one the platform treats as canonical. — source: sentier-dev-repo

### Product flow

- **ILCD (2010)** — goods and services, both as the "product" of a process and as input or consumables, that link the analysed process with other processes; one of the three kinds of flow collected in the inventory beside elementary flows and waste flows — source: ilcd-2010 p.153
- Disambiguation: a product flow is one kind of intermediate flow, the other being the waste flow; see Intermediate flows and Waste flow.

### Production exchange guessing

- **Brightway (bw_graph_tools >=0.10)** — `guess_production_exchanges` applying heuristics to a mapped technosphere matrix to work out which edges are the production edges, for datapackages that do not label them. — source: bw-graph-tools-repo · provenance: first-use · review: needed

### Production volume

- **ecoinvent (Knowledge Base)** — the annual amount of a product generated within the system boundaries of an activity, in the product's own unit; for a treatment activity it is the amount of waste treated, volumes of several activities making the same product in the same geography are additive, and the volumes determine the composition of the markets — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Project

- **Brightway (bw2data >=4)** — an isolated set of data sufficient to do LCA calculations: its own databases, impact categories, parameters and assumptions, independent of every other project, and implemented in the core libraries as a subdirectory holding a SQLite database and a directory of datapackages. — source: brightway-glossary · provenance: first-use · review: needed

### Project directory

- **Brightway (bw2data >=4)** — the folder on disk that holds one project, under the Brightway data directory chosen per platform by `platformdirs`, and reported by `bd.projects.dir`; the logs directory is `bd.projects.logs_dir`. The data directory can be moved by setting the `BRIGHTWAY2_DIR` environment variable, which the documentation does not recommend for beginners. — source: brightway-faq-data · provenance: first-use · review: needed

### Project mode

- **Sentier (sentier-brightway 0.1.0)** — the output shape that writes through `bw2data` into a named Brightway project: the inventory database, the biosphere database, the residual database and one method per impact category. The counterpart of file mode. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Property

- **ecoinvent (Knowledge Base)** — a named characteristic carried by an exchange with a mass; every product in the database carries at least wet mass, dry mass, water in wet mass, water content, and fossil and non-fossil carbon content — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Proprietary target

- **Sentier (sentier-mappings)** — the `target_proprietary` flag a pair's metadata must carry, saying whether its target nomenclature is licensed. When it is true the validator requires every target to carry only a database name and a code, so that no licensed nomenclature can reach a public repository. — source: sentier-mappings-repo · provenance: first-use · review: needed

### Randonneur package

- **Sentier (sentier-mappings, sentier-brightway 0.1.0)** — a JSON data-migration package in the randonneur format, carrying verbs such as replace and update. Only `replace` entries relink a flow to a different target; an `update` entry edits fields on the same flow and names no new target, so the loader ignores it when building a bridge. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Recycling, reuse, recovery

- **ILCD (2010)** — in lack of a common parent term, these three terms are used in the handbook to identify these and similar activities such as refurbishing and further use; case-wise the term recycling alone is used and meant to cover the entirety of these activities — source: ilcd-2010 p.22

### Reference flow

- **ILCD (2010)** — the flow, or flows in the case of multifunctional processes, to which all other input and output flows quantitatively relate; it realises the functional unit and can be expressed either in direct relation to it or in a more product-oriented way — source: ilcd-2010 p.60
- **ISO 14044 (2006)** — the measure of process outputs in a given product system needed to fulfil the function the functional unit expresses — source: iso-14044-2006

### Reference function

- **BAFU (2026)** — the ecoSpold v1 element that carries a process's reference amount, unit, name, local German name, category and sub-category, and its infrastructure flag; in this release it also repeats the dataset UUID in its general comment — source: bafu-2026-release · provenance: first-use · review: needed

### Reference package

- **EF/PEF (European Commission)** — the archive the Commission publishes for one Environmental Footprint version, holding the EF elementary flow list, the characterisation factors and the normalisation and weighting sets; under a PEFCR or OEFSR the method, normalisation and weighting are taken from it rather than chosen. — source: ef-compliant-data-guide-2.0

### Reference product

- **ecoinvent (Knowledge Base)** — the driver of an activity, the product whose change in demand changes the activity's production volume, also called the determining product; it may be a good or a service, and whether a given product is the reference product is a property of the activity rather than of the product — source: ecoinvent-kb-activities-products · provenance: first-use · review: needed

### Release component

- **BAFU (2026)** — one of the four downloads that make up a release: the pre-calculated LCIA results, the documentation with the LCI reports and the change log, the ecoSpold v1 files, and the openLCA package; components of one release do not necessarily carry the same version label — source: openlca-bafu-2026-notes · provenance: first-use · review: needed

### Release type

- **Brightway (ecoinvent_interface >=3.1)** — which archive of an ecoinvent release to fetch, one of `ecospold`, `matrix`, `lci`, `lcia`, `cumulative_lci` and `cumulative_lcia`. They are not interchangeable: `lci` and `lcia` hold results, not the unit processes a database is built from. — source: ecoinvent-interface-repo · provenance: first-use · review: needed

### Relevant

- **ILCD (2010)** — for LCI data sets, having a significant influence on or contribution to the overall environmental impact of the analysed process or system, resulting in a different quality level; for LCA studies, resulting in different conclusions or recommendations — source: ilcd-2010 p.22

### Relink

- **Sentier (sentier-brightway 0.1.0)** — to rewrite the biosphere exchanges of an inventory so that they point at the elementary flows of the method nomenclature, using the bridge. What cannot be relinked is kept in the residual database. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Residual database

- **Sentier (sentier-brightway 0.1.0)** — the database holding the source elementary flows that have no counterpart in the method nomenclature. Their exchanges are kept intact and carry no characterisation factor, so the inventory stays complete while those flows contribute nothing to a score. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Resource group

- **Brightway (matrix_utils >=0.9)** — the unit a datapackage is read in: the set of files that together define one contribution to one matrix, namely a data vector or array or interface, its row and column indices, and optionally a flip vector, a rescale vector, uncertainty distributions and parameter labels. One matrix can be built from several resource groups, and they can add to or replace each other's values. — source: matrix-utils-docs · provenance: first-use · review: needed

### Rest of the World (RoW)

- **ecoinvent (Knowledge Base)** — a dynamic geography generated automatically during linking wherever a global dataset and one or more non-global datasets exist for the same activity, time period and macro-economic scenario; since version 3.2 it is an exact copy of the global dataset with adjusted uncertainty, then linked to geographically appropriate suppliers — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Scenario difference file

- **Brightway (Activity Browser 3)** — a spreadsheet whose rows each identify one exchange by both of its ends and state the amount it takes in every scenario, read into a calculation setup. It changes values and not structure, so adding a supplier is not something it can express. — source: activity-browser-repo · provenance: first-use · review: needed

### Schema

- **Wiki (generic)** — the machine-checkable statement of a data format: which fields exist, which are required, and what values they may take, so that a dataset can be validated before it is used — source: lca-wiki-editorial · provenance: first-use · review: needed

### Scoring package

- **Sentier (sentier-agribalyse)** — the built, linked artifact the adapter scores from, holding the inventory it assembled from the licensed source; it is never published, and what may leave the private repository is the skeleton stripped out of it. — source: sentier-agribalyse-repo · provenance: first-use · review: needed

### Screening LCA

- **Wiki (generic)** — a first, complete-in-shape and deliberately imprecise model of a product system, made to find out which stages, processes and impact categories carry the result before money is spent on data; it is the first turn of the iterative loop the ILCD Handbook describes rather than a separate method, and its result is a map rather than a publishable claim. — source: lca-wiki-editorial · provenance: first-use · review: needed

### Secondary good

- **ILCD (2010)** — secondary material, recovered energy, reused part or similar as the product of a reuse, recycling, recovery, refurbishing or similar process — source: ilcd-2010 p.23

### Sector folder

- **Sentier (sentier-inventory)** — one numbered folder of the inventory repository, holding the processes table, the exchanges table and the metadata of one sector. The number ranks the folders and decides which wins when records overlap. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Sidecar

- **Sentier (sentier-mappings)** — a non-normative file listed beside a pair's mapping packages, holding a coverage report or review notes; it is declared in the metadata and must never be read as a mapping. — source: sentier-mappings-repo · provenance: first-use · review: needed
- Disambiguation: the pair-level coverage report is the Coverage sidecar; the others are package-level review notes.

### Single overall score

- **EF/PEF (European Commission)** — "Sum of the weighted EF results of all environmental impact categories, representing the total environmental impact of a product across all impact categories and their relative importance" — source: ef-transitional-guidance-2026

### Skeleton

- **Sentier (sentier-agribalyse)** — the public twin of a scoring package: the same structure with the licensed amounts stripped out, written by `dds-build-skeleton` into a separate public checkout. It is one of the three things the adapter may share, beside the mapping packages and the review artifacts. — source: sentier-agribalyse-repo · provenance: first-use · review: needed

### Software

- **Wiki (generic)** — in this wiki, a program or library a practitioner installs and runs, documented as a module with one folder per package — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: for the EF/PEF sense of a tool carrying EF-compliant libraries, see LCA software.

### Solver

- **Brightway (bw2calc >=2)** — the routine that solves the technosphere system for the supply array. The default is an LU factorisation of the sparse matrix, with dense, least squares, iterative and caching variants for systems it handles badly, and `pypardiso` or `scikit-umfpack` substituted where they are available. — source: bw2calc-docs · provenance: first-use · review: needed

### Strategy

- **Brightway (bw2io >=0.9)** — one function in an importer's ordered list that identifies, cleans or links the extracted data before it is written; 0.9.17 ships 108 named ones, `imp.strategies` is a plain editable list, and the order they run in changes the outcome. — source: bw2io-docs · provenance: first-use · review: needed
- Disambiguation: flowmapper's matching rules are the analogous idea for two flow lists. See Matching rule.

### Sub-category

- **BAFU (2026)** — the second level of the database's own subject grouping; BAFU:2026 v1 has 516 distinct category and sub-category pairs, and each one is also carried in German as a local sub-category — source: bafu-2026-release · provenance: first-use · review: needed

### Sub-compartment

- **ILCD (2010)** — a finer division of an environmental compartment, such as a type of water body; until spatially differentiated models and factors exist, the handbook discourages using spatially differentiated elementary flows directly in data set inventories and asks for the spatial information to be kept separately — source: ilcd-2010 p.131
- Disambiguation: a sub-compartment always sits inside one compartment; see Compartment.
- **BAFU (2026)** — the level below a compartment in the flow category tree, such as high population density under Emission to air or ground water, long-term under Emission to water; the whole elementary flow tree holds 42 category nodes — source: bafu-2026-release

### Sub-indicator

- **EF/PEF (European Commission)** — one of the nine indicator rows an Environmental Footprint 3.1 implementation ships beside the sixteen reportable impact categories: climate change split into fossil, biogenic, and land use and land use change, and human toxicity cancer, human toxicity non-cancer and freshwater ecotoxicity each split into organics and inorganics. The twenty-five rows report sixteen categories, so summing all of them double counts. — source: ef-data-guide-3.1-addendum
- **Sentier** — the methods repository delivers all twenty-five as ordinary rows of the EF 3.1 methods table, headline categories and sub-indicators alike, with nothing in the table marking which is which; choosing the reported set is the caller's job. — source: sentier-methods-repo · provenance: first-use · review: needed

### Substance

- **ILCD (2010)** — LCIA relates to single substances and energy flows, so complex flows such as tailings or landfilled products are to be modelled through to the single substances that enter the natural environment — source: ilcd-2010 p.94
- **Wiki (generic)** — the chemical or physical entity an elementary flow names, independently of the compartment it is exchanged with and of the amount exchanged — source: lca-wiki-editorial · provenance: first-use · review: needed

### Substitution

- **ILCD (2010)** — solving multifunctionality by expanding the system boundaries and substituting the not required function with an alternative way of providing it, so that the inventory of the superseded process is subtracted from that of the analysed system; a special, subtractive case of system expansion — source: ilcd-2010 p.23
- **ecoinvent (Knowledge Base)** — the method applied to convert multi-product activities into single-product activities in the consequential system model: all by-products move to the input side with a negative sign to maintain the mass balance, and by-products that can displace other production give credits to the activity producing them — source: ecoinvent-kb-system-models

### Substitution flow

- **Wiki (generic)** — the flow credited to a system when substitution is used to solve multifunctionality: the output of the superseded process, carried in the inventory with the opposite sign — source: lca-wiki-editorial · provenance: first-use · review: needed
- Disambiguation: substitution is the method, a substitution flow is the entry it puts in the inventory.

### Supply array

- **Brightway (bw2calc >=2)** — the solution of the technosphere system for one demand, saying how much of each process has to run; read from `lca.supply_array`, and the vector the inventory is built from. — source: brightway-cheatsheet · provenance: first-use · review: needed

### System

- **ILCD (2010)** — any good, service, event, basket-of-products, average consumption of a citizen or similar object that is analysed in the context of the LCA study; broader than the ISO term product system, because an LCA study can analyse more than a single product — source: ilcd-2010 p.23

### System boundary

- **ILCD (2010)** — the system boundaries define which parts of the life cycle and which processes belong to the analysed system, that is which are required for providing its function as defined by its functional unit; they separate the analysed system from the rest of the technosphere and at the same time define the boundary between the analysed system and the ecosphere, across which the exchange of elementary flows with nature takes place — source: ilcd-2010 p.93
- **ISO 14044 (2006)** — the set of criteria deciding which unit processes belong to a product system — source: iso-14044-2006

### System expansion

- **ILCD (2010)** — adding specific processes or products and the related life cycle inventories to the analysed system, used to make several multifunctional systems with an only partly equivalent set of functions comparable within LCA — source: ilcd-2010 p.23

### System model

- **ecoinvent (Knowledge Base)** — a model describing how activity datasets are linked to form product systems; it may determine whether allocation or substitution is used to handle multi-functionality and which type, whether average or marginal suppliers are used, and how by-products are treated; the input-output synonym is technology model — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### System perspective

- **ILCD (2010)** — in contrast to a unit process or a part of a life cycle, the system perspective relates to the entire life cycle of an analysed system or process, used mainly when identifying significant issues and quantifying inventory completeness and cut-off — source: ilcd-2010 p.23

### Technosphere

- **Brightway (bw2calc >=2)** — the part of the system made of processes and products and the edges between them; the technosphere matrix has products as rows and processes as columns, and solving against the demand array gives the supply array. — source: brightway-cheatsheet
- **ecoinvent (Knowledge Base)** — all human activities; an exchange is either between an activity and the environment, which makes it elementary, or between two activities, which makes it intermediate — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Temporal distribution

- **Brightway (bw_temporalis >=1.2)** — an array of dates or offsets with an array of amounts, attached to an exchange to say when its amount happens; a `timedelta64` date is relative to the process consuming the exchange, a `datetime64` date is absolute. — source: bw-temporalis-repo · provenance: first-use · review: needed

### Temporal grouping

- **Brightway (bw_timex >=1.4)** — the resolution the dated processes of a timeline are bucketed at, `"year"` by default, so that anything finer than the bucket disappears from the result. — source: bw-timex-docs · provenance: first-use · review: needed

### Tier

- **Sentier (sentier-agribalyse)** — one rung of the priority ladder that resolves the mapping registry, the lower number winning; from a documented tier onward the tiers are fill-only and may only place a link where none exists. Tiers are data, so changing which mapping wins is a data change and not a code change. — source: sentier-agribalyse-repo · provenance: first-use · review: needed

### Time-explicit LCA

- **Brightway (bw_timex >=1.4)** — a calculation in which every process is placed at the point in time it actually happens and relinked to the background database representing that date, interpolating between databases in between, so that each emission is tagged with when it occurs and can be characterised dynamically. — source: bw-timex-docs · provenance: first-use · review: needed

### Timeline

- **Brightway (bw_temporalis >=1.2)** — the dated flows a temporal traversal produced, summed and grouped, returned by `TemporalisLCA.build_timeline()` and ready to characterise or plot. — source: bw-temporalis-repo · provenance: first-use · review: needed
- **Brightway (bw_timex >=1.4)** — the dated processes a traversal produced, built by `TimelineBuilder`, which the matrix modifier then uses to insert the time-explicit processes. — source: bw-timex-docs · provenance: first-use · review: needed

### Transformation verb

- **Brightway (randonneur >=0.7)** — the word a transformation file names each change with. The reference implementation knows `create`, `replace`, `update`, `delete` and `disaggregate`, and only `replace`, `update` and `disaggregate` run unless the destructive two are asked for explicitly. — source: randonneur-repo · provenance: first-use · review: needed

### Transforming activity

- **ecoinvent (Knowledge Base)** — a human activity that transforms inputs into outputs different from the inputs, the most common activity type in the database, such as a hard coal mine turning hard coal in ground into marketable hard coal — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Treatment activity

- **ecoinvent (Knowledge Base)** — a transforming activity whose reference product carries a negative sign, meaning the activity supplies the service of treating or disposing of that product; the name always begins with "treatment of" — source: ecoinvent-kb-glossary · provenance: first-use · review: needed

### Uncertainty

- **ILCD (2010)** — three main sources are addressed in LCA: stochastic uncertainty, choice uncertainty, and lack of knowledge of the studied system; stochastic uncertainty of the results can be assessed analytically or by simulation — source: ilcd-2010 p.377
- **ISO 14044 (2006)** — uncertainty analysis: a systematic procedure that quantifies the uncertainty in inventory results caused by model imprecision, input uncertainty and data variability taken together — source: iso-14044-2006

### Unit normalisation

- **Sentier (sentier-brightway 0.1.0)** — the mapping of the unit spellings found in the source data and in the bridge onto the unit names the target tool uses. A disagreement between the two spellings for one flow is warned about rather than silently resolved. — source: sentier-brightway-repo · provenance: first-use · review: needed

### Unit process, black box

- **ILCD (2010)** — a unit process that includes more than one single-operation unit processes — source: ilcd-2010 p.23

### Unit process, single operation

- **ILCD (2010)** — a unit process that cannot be further sub-divided into included processes — source: ilcd-2010 p.23

### Unit processes

- **ILCD (2010)** — smallest element considered in the life cycle inventory analysis for which input and output data are quantified; in LCA practice both physically inseparable processes and whole production sites are covered by the term — source: ilcd-2010 p.23
- **ecoinvent (Knowledge Base)** — Unit Process (UPR): the smallest element considered in the life cycle inventory analysis for which input and output data are quantified, often also referred to as a gate-to-gate process — source: ecoinvent-kb-glossary
- **BAFU (2026)** — the unit of the database: every published dataset is a unit process with its own reference function, geography, time period and exchange list, and the release ships no aggregated or system-model variant beside it — source: bafu-2026-release

### Unlinked edge

- **Brightway (bw2io >=0.9)** — an imported exchange whose target was not found, counted by `imp.statistics()` and reported by `imp.all_linked`; it is kept in the `unlinked_data` registry for a second pass rather than written into the project. — source: bw2io-docs · provenance: first-use · review: needed

### Vintage

- **Brightway (bw_timex >=1.4)** — the point in time a background database represents, which is what makes several releases or prospective variants of the same database distinguishable to a time-explicit calculation. — source: bw-timex-docs · provenance: first-use · review: needed

### Waste flow

- **BAFU (2026)** — a flow kind of its own in the openLCA package, beside product flows and elementary flows; BAFU:2026 v1 carries 1,112 of them, which matters when mapping the database onto a tool that knows only two flow kinds — source: bafu-2026-release · provenance: first-use · review: needed

### Weighting

- **ILCD (2010)** — an optional step that assigns distinct quantitative weights to all impact categories to express their relative importance and multiplies the typically normalised indicator results by them, so that results may then be summed across impact categories or areas of protection; under ISO 14044:2006 weighting shall not be used in studies leading to comparative assertions intended to be disclosed to the public — source: ilcd-2010 p.282
