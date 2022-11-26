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

### TE annotation pipeline and phylogeny
1. [repTE_make_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_make_lib.sh) - use only the representative genome de novo elements + RepBase to make TE library, cluster and scan library for domains
2. [repTE_group_by_dom.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_group_by_dom.sh) - group TEs by the domains they contain, align the domains and produce phylogenies
3. Manually curate the phylogeny results and calssify individual TEs by clade
4. [repTE_classi_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_classi_lib.sh) - use manual classifications to classify each individual TE of interest in the library
5. [repTE_RMask.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_RMask.sh) - run RepeatMasker on the genomes using classified library, scan for domains, get TE copy number data
6. [repTE_indiv_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_indiv_trees.sh) - produce a tree for each individual TE of interest using all RepeatMasker hits
7. [domseq_TE_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/domseq_TE_trees.sh) - generate domain based ML phylogenies for each individual TE of interest

### Solo LTR annotation

### Divergence analyses

#### GC content

#### LTR divergence

#### Jukes-Cantor distance

### POT2 transfer analysis

### Region of recombination analysis

## Contact
Anne Nakamoto - annen@berkeley.edu
