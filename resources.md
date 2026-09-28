# Resources: Databases, Tools, and Citations

Databases and public data portals, software tools, and key citations used
throughout this course, organized by topic.

## Public data portals

| Resource | Use in this course |
|---|---|
| [NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/) | Finding published RNA-seq/scRNA-seq datasets |
| [NCBI SRA / SRA Run Selector](https://www.ncbi.nlm.nih.gov/Traces/study/) | Getting run accessions for raw sequencing reads |
| [SRA Toolkit](https://github.com/ncbi/sra-tools) | Downloading reads (`prefetch`, `fasterq-dump`) |
| [GENCODE](https://www.gencodegenes.org/human/) | Human reference genome sequence and gene annotation (GTF) |
| [UCI Machine Learning Repository](https://archive.ics.uci.edu/) | Heart Disease (Cleveland) dataset used in the R intro exercise |
| [cBioPortal](https://www.cbioportal.org) | Source for clinical mutation (MAF) data in place of the removed `breast_cancer.txt` — see `DATA_ACCESS.md` in the original `databiom` repo |

## Compute environment

| Resource | Use |
|---|---|
| [SLURM](https://slurm.schedmd.com/) | HPC job scheduler used for all batch scripts |
| [Open OnDemand](https://openondemand.org/) | Web portal pattern for accessing an HPC cluster |
| [Environment Modules](https://modules.readthedocs.io/) | `module load`/`module avail` software management |

## Bulk RNA-seq

| Tool | Use | Citation |
|---|---|---|
| [STAR](https://github.com/alexdobin/STAR) | Read alignment | Dobin et al., *Bioinformatics*, 2013 |
| [RSEM](https://github.com/deweylab/RSEM) | Transcript quantification | Li & Dewey, *BMC Bioinformatics*, 2011 |
| [HISAT2](http://daehwankimlab.github.io/hisat2/) + [StringTie](https://ccb.jhu.edu/software/stringtie/) | Alternative alignment/quantification pipeline | Kim et al., *Nat. Biotechnol.*, 2019; Pertea et al., *Nat. Biotechnol.*, 2015 |
| [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) / [MultiQC](https://multiqc.info/) | Sequencing quality control | Ewels et al., *Bioinformatics*, 2016 (MultiQC) |
| [DESeq2](https://bioconductor.org/packages/DESeq2/) | Differential expression analysis | Love, Huber & Anders, *Genome Biology*, 2014 |
| [tximport](https://bioconductor.org/packages/tximport/) | Importing transcript-level abundances | Soneson, Love & Robinson, *F1000Research*, 2015 |
| [pheatmap](https://cran.r-project.org/package=pheatmap) / [ComplexHeatmap](https://bioconductor.org/packages/ComplexHeatmap/) | Heatmap visualization | Gu et al., *Bioinformatics*, 2016 (ComplexHeatmap) |
| [EnhancedVolcano](https://bioconductor.org/packages/EnhancedVolcano/) | Volcano plots | — |
| [STRINGdb](https://string-db.org/) | Protein-protein interaction networks | Szklarczyk et al., *Nucleic Acids Research*, 2023 |
| [Cytoscape](https://cytoscape.org/) | Network visualization | Shannon et al., *Genome Research*, 2003 |
| [clusterProfiler](https://bioconductor.org/packages/clusterProfiler/) | GO / pathway over-representation analysis | Wu et al., *The Innovation*, 2021 |
| [Enrichr](https://maayanlab.cloud/Enrichr/) | Gene set enrichment web tool | Chen et al., *BMC Bioinformatics*, 2013 |
| [fgsea](https://bioconductor.org/packages/fgsea/) / [msigdbr](https://cran.r-project.org/package=msigdbr) | Fast gene set enrichment analysis | Korotkevich et al., *bioRxiv*, 2021 |
| [GSEA (Broad Institute)](https://www.gsea-msigdb.org/gsea/index.jsp) | Gene set enrichment analysis (desktop/CLI) | Subramanian et al., *PNAS*, 2005 |

## Single-cell RNA-seq

| Tool | Use | Citation |
|---|---|---|
| [Cell Ranger](https://www.10xgenomics.com/support/software/cell-ranger) | 10x Genomics read alignment and counting | — |
| [Seurat](https://satijalab.org/seurat/) | Single-cell QC, clustering, and analysis | Hao et al., *Cell*, 2021 |
| [CellChat](https://github.com/jinworks/CellChat) | Cell-cell communication inference | Jin et al., *Nature Communications*, 2021 |
| [sc-type](https://github.com/IanevskiAleksandr/sc-type) | Automatic cell-type annotation | Ianevski et al., *Nature Communications*, 2022 |

## R / statistics

| Tool | Use |
|---|---|
| [R](https://www.r-project.org/) / [RStudio](https://posit.co/products/open-source/rstudio/) | Statistical computing environment |
| [tidyverse](https://www.tidyverse.org/) (incl. dplyr) | Data wrangling |
| [Bioconductor](https://www.bioconductor.org/) | Bioinformatics package ecosystem |

## Datasets referenced (public, not redistributed)

| Accession / Source | Description |
|---|---|
| GSE184102, GSE270286, GSE214967, GSE144800 | GEO series used as worked examples — download via SRA (see `protocols/geo_sra_data_acquisition.md`) |
| UCI Heart Disease (Cleveland) | Janosi, Steinbrunn, Pfisterer & Detrano (1988), UCI Machine Learning Repository — downloaded directly by `scripts/r_intro/intro_script.R` |
