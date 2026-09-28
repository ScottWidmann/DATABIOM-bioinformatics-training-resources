# Exclusions Log

Everything left out of this curated release, and why. This is provided per
the project's own rule: nothing gets published without this list being
reviewed first.

## Files excluded entirely

| Item | Reason |
|---|---|
| `RCMI-DATABIOM_Flyer.pdf` | Program recruitment flyer (application deadline, eligibility, stipend info), not training content. A cropped, edited derivative — QR code and registration-form hyperlink removed, and the CBMHR logo updated to the organization's current version — is used as a README banner image (`assets/program_overview.png`), but the flyer PDF itself is not included. |
| `breast_cancer.txt` | Real clinical mutation-annotation (MAF) data with tumor/normal sample identifiers consistent with an MSK-IMPACT-style cohort (e.g., cBioPortal). Third-party clinical research data; redistribution rights were not established. Already removed from the source `databiom` repository (see its `DATA_ACCESS.md`); not carried into this release. Equivalent data can be obtained directly from cBioPortal — see `resources.md`. |
| `processed.cleveland.data.csv` | Third-party dataset (UCI Heart Disease / Cleveland database). Per this project's data policy, it is not redistributed here. `scripts/r_intro/intro_script.R` now downloads it directly from the UCI Machine Learning Repository instead of reading a bundled copy. |

## Content redacted (not fully excluded)

The five lecture PDFs in `lectures/` are the **already-redacted** versions
from the source `databiom` repository. The following were removed from
those slides before this release (full detail in that repo's git history):

- The cluster's disclosed default-password scheme (`firstname.lastname` /
  `firstname.lastname.changeme`)
- The institution-only cluster login URL
- An internal IP address and a VPN gateway name, both captured incidentally
  in terminal screenshots
- Real usernames of other course participants/staff, incidentally captured
  in `squeue` job-queue screenshots

None of this is reconstructable from what's published here.

## Confirmed absent

- **All of Us Research Program data or materials**: none were found
  anywhere in the source materials during the original audit of the
  `databiom`, `RNAseq`, and `datasets` repositories. This is stated as a
  verified absence, not an assumption.
- **Student names, photos, or identifiable personal work**: none found in
  the source lecture slides or scripts beyond the incidentally-captured
  usernames noted above (already redacted).

## Known gap (not filled with fabricated content)

- **Python materials**: the original project brief listed "R and Python
  materials" as a priority, but the actual DATABIOM course materials
  contain no Python-specific lecture or scripts — only R. Rather than
  invent Python content that was never part of the delivered course, this
  gap is noted here. If Python materials exist elsewhere, they can be added
  in a future update.
- **Single-cell RNA-seq slide deck**: the course's scRNA-seq content exists
  only as scripts (`scripts/scrnaseq/`), with no accompanying lecture PDF
  in the source repository. The scripts are heavily commented and used
  as the tutorial material for this module.

## External repositories drawn on

From the companion public `RNAseq` repository (also owned by Scott
Widmann, MIT-licensed):

- **Included**: the STAR/RSEM and HISAT2/StringTie Nextflow pipelines
  (`scripts/bulk_rnaseq/nextflow_pipelines/`), and the GSEA R Markdown
  tutorial (`scripts/bulk_rnaseq/gsea_tutorial/`), as supplementary
  material for the bulk RNA-seq module.
- **Not included**: the `datasets` repository's general-purpose teaching
  datasets (`gapminder_NAs.csv`, `titanic.csv`, `heart_disease.csv`) were
  not pulled into this release — they were not part of the original
  DATABIOM curriculum, and including them would be scope creep beyond a
  bioinformatics-specific training release.

## Example outputs

No fabricated pipeline result files (count matrices, DE tables, plots) are
included. `example_outputs/` includes only outputs that are exactly
reproducible from the scripts in this repo (see `example_outputs/README.md`
for what's included versus documented-only).
