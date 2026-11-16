# DEDBSR manuscript

Current manuscript snapshot, synchronized on 2026-11-16.

## Overleaf

Import or synchronize this repository in Overleaf. The source files are at the repository root.

- Main document: `main.tex`
- Compiler: **pdfLaTeX**
- TeX Live version used for local verification: **2024**
- Supplementary document: `supplementary.tex`

The supplied `latexmkrc` builds the main document's reference data when compiling the supplementary document from a clean project. It follows the [Overleaf guidance on cross-document references](https://www.overleaf.com/learn/how-to/Cross_referencing_with_the_xr_package_in_Overleaf).

After changing files included by the main paper, compile `main.tex` first or use **Recompile from scratch** before checking the supplementary references.

## Files

- `main.tex`: main paper (8 body pages plus 2 reference pages in the supplied PDF).
- `supplementary.tex`: supplementary material (7 pages in the supplied PDF).
- `figures/` and `tables/`: all figures and table sources used by either document.
- `references.bib`, `IEEEtran.cls`, `IEEEtran.bst`: bibliography and document style.
- `preamble.tex`, `layout_spacing.tex`, `authors.tex`, `main_counters.tex`: shared settings.
- `DEDBSR_main_latest.pdf` and `DEDBSR_supplementary_latest.pdf`: PDFs of this synchronized version.

## Local compilation

With TeX Live installed, run from this directory:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error supplementary.tex
```

The two `DEDBSR_*_latest.pdf` files are snapshots; compiling produces `main.pdf` and `supplementary.pdf` without replacing those snapshots.
