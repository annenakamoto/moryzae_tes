# Transposable elements in *Magnaporthe oryzae*
  This repository contains code used for the analysis of transposable elements (TEs) in *Magnaporthe oryzae*.
  It is organized following the order of the manuscript, by analysis.
  The manuscript is preprinted here: (DOI TBD)

## Contents
* Gene annotation and genome phylogeny
* TE annotation pipeline and phylogeny
* Solo LTR annotation
* Divergence analyses
  * GC content
  * LTR divergence
  * Jukes-Cantor distance
* POT2 transfer analysis
* Region of recombination analysis

## Details

### Gene annotation and genome phylogeny
[makeTree.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/GenomeTree/makeTree.sh) - runs OrthoFinder to find SCOs, uses them to build a genome tree

### TE annotation pipeline and phylogeny
1. [robustTE_denovo.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/robustTE_denovo.sh) - run on each representative genome to produce *de novo* repeat annotations
2. [repTE_make_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_make_lib.sh) - use only the representative genome de novo elements + RepBase to make TE library, cluster and scan library for domains
3. [repTE_group_by_dom.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_group_by_dom.sh) - group TEs by the domains they contain, align the domains and produce phylogenies
4. Manually curate the phylogeny results and calssify individual TEs by clade
5. [repTE_classi_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_classi_lib.sh) - use manual classifications to classify each individual TE of interest in the library
6. [repTE_RMask.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_RMask.sh) - run RepeatMasker on the genomes using classified library, scan for domains, get TE copy number data
7. [repTE_indiv_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_indiv_trees.sh) - produce a tree for each individual TE of interest using all RepeatMasker hits
8. [domseq_TE_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/domseq_TE_trees.sh) - generate domain based ML phylogenies for each individual TE of interest

### Solo LTR annotation

### Divergence analyses

#### GC content

#### LTR divergence

#### Jukes-Cantor distance

### POT2 transfer analysis

### Region of recombination analysis

## Contact
Anne Nakamoto - annen@berkeley.edu
