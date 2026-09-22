# Sources

Every external source this wiki cites, once, with the id that pages refer to. A page's
`sources:` frontmatter list and every vocabulary bullet's `source:` marker must name an
id that appears in the table below. An id that resolves nowhere is a claim that was
never checked; register the source first.

## The id convention

Ids are kebab-case and stable: once a page cites an id, it does not get renamed. The
shape says what kind of source it is.

| Shape | Use it for | Example |
|---|---|---|
| `<standard>-<year>` | a standard or guidance document, with the edition year | `ilcd-2010` |
| `<publisher>-<subject>` | a publisher's own documentation page | `ef-pef-glossary`, `ecoinvent-kb-glossary` |
| `<package>-docs` | a software package's documentation site | `bw2data-docs` |
| `pypi-<package>` | a package's registry entry, for versions and release dates | `pypi-bw2calc` |
| `<database>-<release>` | a database release page or its documentation | `bafu-2026-release` |

Rules:

- One row per source, one id per row. If a document has several editions, each edition
  is its own row and its own id.
- `accessed` is the date someone actually opened the URL and checked the claim, not the
  date the page was written.
- `licence` is what the publisher states for reuse. Write "unknown" rather than guessing,
  and do not quote a source whose licence you could not establish.
- Adding a row is part of the change that cites it: register the source first, then write
  the page.

## Registry

| id | title | URL | accessed | licence |
|---|---|---|---|---|
| ilcd-2010 | ILCD Handbook: General guide for Life Cycle Assessment, Detailed guidance, first edition, EUR 24708 EN | https://eplca.jrc.ec.europa.eu/uploads/ILCD-Handbook-General-guide-for-LCA-DETAILED-GUIDANCE-12March2010-ISBN-fin-v1.0-EN.pdf | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ef-transitional-guidance-2026 | Transitional guidance on the limited availability of EF-compliant datasets | https://green-forum.ec.europa.eu/news/transitional-guidance-limited-availability-ef-compliant-datasets-2026-07-14_en | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| iso-14040-2006 | ISO 14040:2006, Environmental management, Life cycle assessment, Principles and framework | https://www.iso.org/standard/37456.html | 2026-09-21 | standard, paywalled; cite only |
| iso-14044-2006 | ISO 14044:2006, Environmental management, Life cycle assessment, Requirements and guidelines | https://www.iso.org/standard/38498.html | 2026-09-21 | standard, paywalled; cite only |
| en-15804-2019 | EN 15804:2012+A2:2019, Sustainability of construction works, Environmental product declarations, Core rules for the product category of construction products | https://standards.cencenelec.eu/dyn/www/f?p=205:110:0::::FSP_PROJECT:64866 | 2026-09-21 | standard, paywalled; cite only |
| python-docs | The Python Tutorial: Modules | https://docs.python.org/3/tutorial/modules.html | 2026-09-21 | PSF licence, attribution |
| ecoinvent-kb-glossary | ecoinvent Knowledge Base: Glossary | https://support.ecoinvent.org/glossary | 2026-09-21 | open access, attribution |
| lca-wiki-editorial | This wiki's own editorial definitions, as described in CONTRIBUTING.md | ./CONTRIBUTING.md | 2026-09-21 | CC-BY 4.0 |
| sentier-brightway-repo | sentier-brightway repository: README, pyproject.toml, CHANGELOG and source tree | https://github.com/sentier-dev/sentier-brightway | 2026-09-21 | MIT for the code; installed data keeps the licences of the Sentier data repositories |
| sentier-importers-repo | sentier-importers repository: README, CONTRIBUTING, registry.yaml and source tree | https://github.com/sentier-dev/sentier-importers | 2026-09-21 | BSD 3-Clause |
| sentier-dev-repo | sentier.dev planning repository: README, product documents and the sequence diagrams | https://github.com/sentier-dev/sentier.dev | 2026-09-21 | MIT for source code, CC-BY for other content |
| sentier-dev-adr-1 | ADR 1: on the infamous monorepo vs multi-repo (sentier.dev) | https://github.com/sentier-dev/sentier.dev/blob/main/Engineering/ADRs/ADR_1_MultiRepo.md | 2026-09-21 | CC-BY |
| gics-2023 | Global Industry Classification Standard (GICS) Methodology, March 2023 | https://www.msci.com/documents/1296102/11185224/GICS+Methodology+2023.pdf | 2026-09-21 | proprietary classification; names cited |
| sentier-inventory-readme | sentier-inventory: standardized life cycle inventory data for the Sentier platform | https://github.com/sentier-dev/sentier-inventory | 2026-09-21 | MIT |
| bafu-2026-release | Swiss Federal Administration LCI Database (BAFU:2026) release and download page | https://nexus.openlca.org/database/BAFU | 2026-09-21 | free of charge; no resale; source citation required |
| unsd-isic-rev4 | ISIC: International Standard Industrial Classification of All Economic Activities (UNSD) | https://unstats.un.org/unsd/classifications/Econ/isic | 2026-09-21 | free; United Nations Terms of Use |
| ef-pef-method | Product Environmental Footprint (PEF) method and the PEFCR list (European Commission) | https://green-forum.ec.europa.eu/green-business/environmental-footprint-methods/pef-method_en | 2026-09-21 | unknown |
| epd-international-pcr-library | PCR Library of the International EPD System | https://www.environdec.com/pcr-library | 2026-09-21 | unknown |
| brightway-docs | Brightway LCA Software Framework: documentation home | https://docs.brightway.dev/ | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-glossary | Brightway documentation: Glossary | https://docs.brightway.dev/en/latest/content/overview/glossary.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-cheatsheet | Brightway documentation: Cheat Sheet (projects, databases, inventory, impact assessment, LCA, importing) | https://docs.brightway.dev/en/latest/content/cheatsheet/index.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-ecosystem | Brightway documentation: Brightway Software Ecosystem | https://docs.brightway.dev/en/latest/content/overview/ecosystem.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-installation | Brightway documentation: Installation | https://docs.brightway.dev/en/latest/content/installation/index.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-upgrading | Brightway documentation: Updating and Upgrading | https://docs.brightway.dev/en/latest/content/installation/upgrading.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-faq-versions | Brightway documentation FAQ: Brightway versions and compatibility | https://docs.brightway.dev/en/latest/content/faq/brightway.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-faq-data | Brightway documentation FAQ: Data Management | https://docs.brightway.dev/en/latest/content/faq/data_management.html | 2026-09-21 | BSD 3-Clause (brightway-documentation repository) |
| brightway-lca-org | brightway-lca GitHub organisation: repository list, licences and issue trackers | https://github.com/orgs/brightway-lca/repositories | 2026-09-21 | unknown for the listing page; each repository states its own licence |
| pypi-bw2data | bw2data on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw2data/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw2calc | bw2calc on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw2calc/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw2io | bw2io on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw2io/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw-processing | bw-processing on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw-processing/ | 2026-09-21 | BSD 3-Clause |
| pypi-matrix-utils | matrix-utils on PyPI: releases, metadata and dependencies | https://pypi.org/project/matrix-utils/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw2parameters | bw2parameters on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw2parameters/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw2analyzer | bw2analyzer on PyPI: releases, metadata and dependencies | https://pypi.org/project/bw2analyzer/ | 2026-09-21 | BSD 3-Clause |
| bw2data-docs | bw2data repository README and source tree (brightway2-data) | https://github.com/brightway-lca/brightway2-data | 2026-09-21 | BSD 3-Clause |
| bw2calc-docs | bw2calc repository README and source tree (brightway2-calc) | https://github.com/brightway-lca/brightway2-calc | 2026-09-21 | BSD 3-Clause |
| bw2io-docs | bw2io repository README and source tree (brightway2-io) | https://github.com/brightway-lca/brightway2-io | 2026-09-21 | BSD 3-Clause |
| bw-processing-docs | bw_processing documentation and repository README | https://docs.brightway.dev/projects/bw-processing/en/latest/ | 2026-09-21 | BSD 3-Clause |
| matrix-utils-docs | matrix_utils repository README and source tree | https://github.com/brightway-lca/matrix_utils | 2026-09-21 | BSD 3-Clause |
| bw2parameters-docs | bw2parameters repository README and source tree (brightway2-parameters) | https://github.com/brightway-lca/brightway2-parameters | 2026-09-21 | BSD 3-Clause |
| bw2analyzer-docs | bw2analyzer repository README and source tree (brightway2-analyzer) | https://github.com/brightway-lca/brightway2-analyzer | 2026-09-21 | BSD 3-Clause |
| pypi-randonneur | randonneur on PyPI: releases and metadata | https://pypi.org/project/randonneur/ | 2026-09-21 | MIT (repository LICENSE) |
| pypi-flowmapper | flowmapper on PyPI: releases and metadata | https://pypi.org/project/flowmapper/ | 2026-09-21 | unknown; the distribution states none |
| pypi-ecoinvent-interface | ecoinvent_interface on PyPI: releases and metadata | https://pypi.org/project/ecoinvent-interface/ | 2026-09-21 | MIT (repository LICENSE) |
| pypi-bw-graph-tools | bw_graph_tools on PyPI: releases and metadata | https://pypi.org/project/bw-graph-tools/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw-timex | bw_timex on PyPI: releases and metadata | https://pypi.org/project/bw-timex/ | 2026-09-21 | BSD 3-Clause |
| pypi-bw-temporalis | bw_temporalis on PyPI: releases and metadata | https://pypi.org/project/bw-temporalis/ | 2026-09-21 | BSD 3-Clause |
| pypi-activity-browser | activity-browser on PyPI: releases and metadata | https://pypi.org/project/activity-browser/ | 2026-09-21 | LGPL-3.0-or-later |
| pypi-pypardiso | pypardiso on PyPI: releases and metadata | https://pypi.org/project/pypardiso/ | 2026-09-21 | BSD 3-Clause |
| eu-recommendation-2021-2279 | Commission Recommendation (EU) 2021/2279 of 15 December 2021 on the use of the Environmental Footprint methods to measure and communicate the life cycle environmental performance of products and organisations | https://eur-lex.europa.eu/eli/reco/2021/2279/oj | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| eplca-developer-ef | LCDN developer tools and the EF reference packages (European Platform on LCA) | https://eplca.jrc.ec.europa.eu/LCDN/developerEF.html | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ef-compliant-data-guide-2.0 | Guide for EF compliant data sets, Version 2.0, EUR 30175 EN (Fazio, Zampori, De Schryver, Kusche, Thellier, Diaconu, 2020) | https://eplca.jrc.ec.europa.eu/permalink/Guide_EF_DATA.pdf | 2026-09-21 | CC BY 4.0 |
| ef-data-guide-3.1-addendum | Updates on "Guide for EF compliant data sets (Version 2.0)" to reflect the changes in the Environmental Footprint 3.1 reference package (Valente, Kusche, Ardente, 2022) | https://eplca.jrc.ec.europa.eu/permalink/EF_Data_Guide_EF3.1_addendum.pdf | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ef-methods-lca | Life Cycle Assessment and the EF methods, with the list of EF impact categories (European Commission, Green Forum) | https://green-forum.ec.europa.eu/environmental-footprint-methods/life-cycle-assessment-ef-methods_en | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ilcd-format-1.1-docs | ILCD Format 1.1 documentation: the Flow, Flow property, Unit group, Source, Contact and LCIA method data set reference pages | https://eplca.jrc.ec.europa.eu/LCDN/downloads/ILCD_Format_1.1_Documentation/ | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ilcd-format-1.1-process | ILCD Format 1.1 documentation: Process data set | https://eplca.jrc.ec.europa.eu/LCDN/downloads/ILCD_Format_1.1_Documentation/ILCD_ProcessDataSet.html | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| ilcd-format-1.1-lifecyclemodel | ILCD Format 1.1 documentation: Life cycle model data set (eILCD) | https://eplca.jrc.ec.europa.eu/LCDN/downloads/ILCD_Format_1.1_Documentation/ILCD_LifeCycleModelDataSet.html | 2026-09-21 | EU reuse policy (Decision 2011/833/EU), attribution |
| glad-network | Global LCA Data Access network (GLAD) | https://www.globallcadataaccess.org/ | 2026-09-21 | unknown |
| iso-14040-2006-amd1-2020 | ISO 14040:2006/Amd 1:2020, Environmental management, Life cycle assessment, Principles and framework, Amendment 1 | https://genorma.com/en/standards/iso-14040-2006-amd-1-2020 | 2026-09-21 | standard, paywalled; cite only |
| iso-14044-2006-amd2-2020 | ISO 14044:2006/Amd 2:2020, Environmental management, Life cycle assessment, Requirements and guidelines, Amendment 2 | https://genorma.com/en/standards/iso-14044-2006-amd-2-2020 | 2026-09-21 | standard, paywalled; cite only |
| epd-pcr-2019-14 | PCR 2019:14 Construction products, version 2.0.1, The International EPD System, 2024-04-30 | https://api.environdec.com/api/v1/EPDLibrary/Files/fe17e14b-3ff4-4ab3-07a6-08dc685f3598/Data | 2026-09-21 | unknown |
| randonneur-repo | randonneur repository and README (brightway-lca/randonneur) | https://github.com/brightway-lca/randonneur | 2026-09-21 | MIT (repository LICENSE) |
| pypi-randonneur-data | randonneur_data on PyPI: releases and metadata | https://pypi.org/project/randonneur_data/ | 2026-09-21 | MIT (repository LICENSE) |
| randonneur-data-repo | randonneur_data repository and README (brightway-lca/randonneur_data) | https://github.com/brightway-lca/randonneur_data | 2026-09-21 | MIT (repository LICENSE) |
| flowmapper-repo | flowmapper repository and README (cauldron/flowmapper) | https://github.com/cauldron/flowmapper | 2026-09-21 | MIT (repository LICENSE) |
| ecoinvent-interface-repo | ecoinvent_interface repository and README (brightway-lca/ecoinvent_interface) | https://github.com/brightway-lca/ecoinvent_interface | 2026-09-21 | MIT (repository LICENSE) |
| bw-graph-tools-repo | bw_graph_tools repository and README (brightway-lca/bw_graph_tools) | https://github.com/brightway-lca/bw_graph_tools | 2026-09-21 | BSD 3-Clause (repository LICENSE) |
| bw-graph-tools-docs | Brightway Graph Tools documentation | https://docs.brightway.dev/projects/graphtools/en/latest/ | 2026-09-21 | BSD 3-Clause (repository LICENSE) |
| bw-timex-repo | bw_timex repository (brightway-lca/bw_timex) | https://github.com/brightway-lca/bw_timex | 2026-09-21 | BSD 3-Clause (repository LICENSE) |
| bw-timex-docs | bw_timex documentation: user guide, theory, examples and API reference | https://docs.brightway.dev/projects/bw-timex/en/latest/ | 2026-09-21 | BSD 3-Clause (repository LICENSE) |
| bw-temporalis-repo | bw_temporalis repository and README (brightway-lca/bw_temporalis) | https://github.com/brightway-lca/bw_temporalis | 2026-09-21 | BSD 3-Clause (repository LICENSE) |
| activity-browser-repo | Activity Browser repository, README and bundled wiki pages | https://github.com/LCA-ActivityBrowser/activity-browser | 2026-09-21 | LGPL-3.0-or-later (repository LICENSE.txt) |
| activity-browser-docs | Activity Browser 3 documentation site | https://lca-activitybrowser.github.io/activity-browser/ | 2026-09-21 | LGPL-3.0-or-later (repository LICENSE.txt) |
| activity-browser-conda-forge | activity-browser on conda-forge: stable releases and metadata | https://anaconda.org/conda-forge/activity-browser | 2026-09-21 | LGPL-3.0-or-later |
| pypardiso-repo | PyPardiso repository and README (haasad/PyPardiso) | https://github.com/haasad/PyPardiso | 2026-09-21 | BSD 3-Clause (repository LICENSE.txt) |
| sentier-vocab-repo | sentier-vocab repository: README, LinkML schemas, data folders, generator and docs/COVERAGE.md | https://github.com/sentier-dev/sentier_vocab | 2026-09-21 | MIT (repository LICENSE); imported terms keep their ontology's licence |
| sentier-inventory-repo | sentier-inventory repository: README, schema contracts, sector folders and the CI validator | https://github.com/sentier-dev/sentier-inventory | 2026-09-21 | MIT (repository LICENSE) |
| sentier-methods-repo | sentier-methods repository: README, schema contracts, datasource folders and the CI validator | https://github.com/sentier-dev/sentier-methods | 2026-09-21 | MIT (repository LICENSE) |
| sentier-mappings-repo | sentier-mappings repository: README, package profile and metadata schemas, pair folders and the CI validator | https://github.com/sentier-dev/sentier-mappings | 2026-09-21 | MIT (repository LICENSE) |
| sentier-agribalyse-repo | sentier-agribalyse repository: README, BOOTSTRAP.md, pyproject.toml, command help and source tree | https://github.com/sentier-dev/sentier-agribalyse | 2026-09-21 | MIT for the code (pyproject.toml); ecoinvent-derived files are never distributed |
| bafu-terms-of-use-2025 | Terms of Use, Life Cycle Inventory (LCI) database of the Swiss Federal Administration BAFU:2025 | https://nexus.openlca.org/ws/files/39051 | 2026-09-21 | the document itself: free use of the data, no resale, mandatory citation, documented modifications and share-alike |
| openlca-bafu-2026-notes | BAFU:2026 version 1 is now available on Nexus (openLCA blog, 23 June 2026) | https://www.openlca.org/bafu2026-version-1-is-now-available-on-nexus/ | 2026-09-21 | unknown |
| esu-bafu-database | BAFU LCI database, description and background by ESU-services | https://esu-services.ch/data/bafu25/ | 2026-09-21 | unknown |
| bafu-lca-methodology-2021 | Swiss Eco-Factors 2021 according to the Ecological Scarcity Method: methodological fundamentals and their application in Switzerland (FOEN, 2021) | https://www.bafu.admin.ch/bafu/en/home/topics/economy-consumption/economy-and-consumption-publications/publications-economy-and-consumption/eco-factors-switzerland.html | 2026-09-21 | unknown |
| ecoinvent-website | ecoinvent database overview on ecoinvent.org | https://ecoinvent.org/database/ | 2026-09-21 | all rights reserved; database access requires an ecoinvent licence |
| ecoinvent-licences | ecoinvent licence types: Single-User, Enterprise, Developer, Educational | https://ecoinvent.org/licenses/ | 2026-09-21 | all rights reserved |
| ecoinvent-eula | ecoinvent legal documents: End User Licence Agreement and privacy annexes | https://ecoinvent.org/gdpr-eula/ | 2026-09-21 | licence agreement; cite only |
| ecoinvent-kb | ecoinvent Knowledge Base | https://support.ecoinvent.org/ | 2026-09-21 | open access, attribution |
| ecospold2-format | ecoinvent Knowledge Base: the ecoSpold2 data format and its supporting files | https://support.ecoinvent.org/ecospold2 | 2026-09-21 | open access, attribution |
| ecoinvent-kb-system-models | ecoinvent Knowledge Base: System Models | https://support.ecoinvent.org/system-models | 2026-09-21 | open access, attribution |
| ecoinvent-kb-activities-products | ecoinvent Knowledge Base: Activities and Products | https://support.ecoinvent.org/activities-products | 2026-09-21 | open access, attribution |
| ecoinvent-kb-releases | ecoinvent Knowledge Base: Releases Overview | https://support.ecoinvent.org/releases-overview | 2026-09-21 | open access, attribution |
| ecoinvent-v3.12-release-notes | ecoinvent Knowledge Base: ecoinvent Version 3.12 | https://support.ecoinvent.org/ecoinvent-version-3.12 | 2026-09-21 | open access, attribution |
| ecoinvent-kb-impact-assessment | ecoinvent Knowledge Base: Impact Assessment | https://support.ecoinvent.org/impact-assessment | 2026-09-21 | open access, attribution |
| ecoinvent-kb-sectors | ecoinvent Knowledge Base: Sector Overview | https://support.ecoinvent.org/sector-overview | 2026-09-21 | open access, attribution |
| ecoinvent-kb-sources-citation | ecoinvent Knowledge Base: About Sources, Citation, and Confidential Datasets | https://support.ecoinvent.org/sources-citation | 2026-09-21 | open access, attribution |
| brightway-files-server | files.brightway.dev: the public archive server `bw2io.remote` reads, with `projects-config.json` and the example project tarballs | https://files.brightway.dev/ | 2026-09-22 | unknown |
| useeio-epa | US Environmentally-Extended Input-Output (USEEIO) models, US Environmental Protection Agency | https://www.epa.gov/land-research/us-environmentally-extended-input-output-useeio-models | 2026-09-22 | US Government work, public domain unless otherwise noted |
| openlca-manual-2 | openLCA 2 manual: databases, creating a new database by loading it from file | https://greendelta.github.io/openLCA2-manual/ | 2026-09-22 | unknown |
