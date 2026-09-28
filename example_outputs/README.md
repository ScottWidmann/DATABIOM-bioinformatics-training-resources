# Example Outputs

This folder documents what to expect when running the pipelines in
`scripts/`. There is no compute environment attached to this repository, so
rather than fabricate results, this README distinguishes between outputs
that are genuinely included here (because they are small, reproducible, and
came directly from running the referenced script) and outputs that are only
described, with the source of any stated numbers named explicitly.

## Included, reproducible outputs

- **`mydf.csv`** and **`mymatrix.txt`** — the exact, literal output of
  running `scripts/r_intro/intro_script.R` end-to-end (that script both
  writes and reads these two files as part of the R basics exercise).
- **`scripts/bulk_rnaseq/gsea_tutorial/GSE144800.html`** — a rendered
  R Markdown report from actually running the GSEA tutorial
  (`GSE144800.Rmd`) on public data (GEO accession GSE144800), included
  as delivered with that tutorial.

## Documented (not included) expected outputs

### Bulk RNA-seq differential expression (`scripts/bulk_rnaseq/analysis.R`)

Running the DESeq2 workflow on the aligned counts produces:

- A gene-by-sample count matrix (`txi$counts`) with one row per Ensembl
  gene ID.
- A `DESeqDataSet` that, per the instructor's own run — noted directly in
  the script's comments, not independently re-verified here — starts at
  **78,932 genes** before low-count filtering and **21,782 genes**
  afterward, with **1,015 genes** meeting `padj < 0.05` and
  `|log2FoldChange| > 1`, and the top hit by adjusted p-value being
  **WT1-AS**.
- `DEG_results.csv`: differential expression results (gene symbol,
  log2FoldChange, p-value, adjusted p-value) sorted by significance.
- Heatmap, PCA, and volcano plot figures (rendered interactively; not
  saved to file by the script as written).

### Single-cell RNA-seq (`scripts/scrnaseq/analysis.R`)

Running the Seurat + CellChat workflow on aligned Cell Ranger output
produces:

- A filtered, clustered `Seurat` object (`control_seurat.rds` /
  `treatment_seurat.rds`) with UMAP coordinates and per-cluster marker
  genes (`FindAllMarkers`).
- A `CellChat` object per condition (`cellchat_control.rds` /
  `cellchat_treatment.rds`) with inferred cell-cell communication networks.
- The exact number of principal components and cluster resolution are
  chosen interactively from each dataset's elbow plot (the script uses 17
  and 18 PCs as a worked example) — these will vary with your own data and
  are not fixed, verified constants.

If you run these pipelines yourself, consider contributing your own real
output files back into this folder via a pull request.
