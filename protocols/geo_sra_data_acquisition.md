# Acquiring Public Sequencing Data from GEO and SRA

This protocol covers how to find a published RNA-seq dataset and download
its raw sequencing reads, as taught in
`lectures/01_introduction_to_bioinformatics_and_hpc.pdf` (GEO/SRA section)
and used throughout the bulk RNA-seq and scRNA-seq scripts in this repo.

## 1. Find a dataset on GEO

1. Go to the [NCBI Gene Expression Omnibus (GEO)](https://www.ncbi.nlm.nih.gov/geo/).
2. Search for a study by keyword, organism, or accession (GEO series
   accessions start with `GSE`, e.g. `GSE184102`, `GSE270286`, `GSE214967` —
   all used as worked examples in this course).
3. On the GEO series page, note the **SRA/BioProject accession** linked
   under "Relations" — this is what you'll use to pull the raw reads.

## 2. Get run accessions with the SRA Run Selector

1. Open the [SRA Run Selector](https://www.ncbi.nlm.nih.gov/Traces/study/)
   and paste in the BioProject or GEO accession.
2. Select the runs (samples) you want.
3. Download the **Accession List** — a plain-text file with one
   `SRR#######` run accession per line (see `SRR_Acc_List.txt` /
   `GSE270286.txt` style files referenced in the scripts here).

## 3. Download reads with the SRA Toolkit

With [`sratoolkit`](https://github.com/ncbi/sra-tools) available
(`module load sratoolkit` on most clusters), loop over the accession list:

```bash
while read p; do
    prefetch "$p"
    fasterq-dump -e 32 --outdir ./"$p"/ "$p"
    pigz -p 32 ./"$p"/*.fastq
    rm ./"$p"/*.sra
done < SRR_Acc_List.txt
```

- `prefetch` downloads the compressed `.sra` file.
- `fasterq-dump` converts it to `.fastq`.
- `pigz` compresses the FASTQ files in parallel.

See `scripts/bulk_rnaseq/download_files.sbatch` and
`scripts/bulk_rnaseq/sratoolkit_prefetch_dump_batch.sh` for complete,
working SLURM versions of this workflow (single-cell RNA-seq downloads
follow the same pattern in `scripts/scrnaseq/download_files.sbatch`).

## 4. Quality-check the downloaded reads

Before proceeding to alignment, run FastQC/MultiQC on the raw reads:

```bash
module load fastqc multiqc
mkdir fastqc
fastqc "$p"/*.fastq.gz -t 32 -o ./fastqc
cd fastqc && multiqc .
```

## Reference datasets used in this course

| Accession | Used in |
|---|---|
| GSE184102 | `scripts/bulk_rnaseq/` (alignment example) |
| GSE270286 | `scripts/bulk_rnaseq/` (alignment example) |
| GSE214967 | `scripts/scrnaseq/` (single-cell alignment example) |
| GSE144800 | `scripts/bulk_rnaseq/gsea_tutorial/` (GSEA worked example) |

Always cite the original study when reusing public sequencing data, and
check the dataset's GEO page for any additional data-use terms.
