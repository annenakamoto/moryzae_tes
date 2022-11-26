# Transposable elements in *Magnaporthe oryzae*
  This repository contains code used for the analysis of transposable elements (TEs) in *Magnaporthe oryzae*.
  It is organized following the order of the manuscript, by analysis.
  The manuscript is preprinted here: (DOI TBD) and additional data files are available on Zenodo: (DOI TBD)

## Contents
* Gene annotation and genome phylogeny
* TE annotation pipeline and phylogeny
* Divergence analyses
  * GC content
  * LTR divergence
  * Jukes-Cantor distance
* Solo LTR analysis
* POT2 transfer analysis
* Region of recombination analysis

## Details

### Gene annotation and genome phylogeny
* [fungap_run.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/GenomeTree/fungap_run.sh) - gene prediction using FunGap for each genome
* [makeTree.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/GenomeTree/makeTree.sh) - runs OrthoFinder to find SCOs, uses them to build a genome tree
* [effector_analysis.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/GenomeTree/effector_analysis.sh) - predicting effectors in the proteome of each genome

### TE annotation pipeline and phylogeny
1. [robustTE_denovo.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/robustTE_denovo.sh) - run on each representative genome to produce *de novo* repeat annotations
2. [repTE_make_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_make_lib.sh) - use only the representative genome de novo elements + RepBase to make TE library, cluster and scan library for domains
3. [repTE_group_by_dom.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_group_by_dom.sh) - group TEs by the domains they contain, align the domains and produce phylogenies
4. Manually curate the phylogeny results and calssify individual TEs by clade
5. [repTE_classi_lib.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_classi_lib.sh) - use manual classifications to classify each individual TE of interest in the library
6. [repTE_RMask.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_RMask.sh) - run RepeatMasker on the genomes using classified library, scan for domains, get TE copy number data
7. [repTE_indiv_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/repTE_indiv_trees.sh) - produce a tree for each individual TE of interest using all RepeatMasker hits
8. [domseq_TE_trees.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/Rep_TE_Lib/domseq_TE_trees.sh) - generate domain based ML phylogenies for each individual TE of interest

### Divergence analyses

#### GC content
* [GC_content.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/RIP_analysis/GC_content.sh) - determining GC content of TE copies to assess RIP

#### LTR divergence
1. [preprocess_for_LTR.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/LTR_divergence/preprocess_for_LTR.sh) - filter all annotations of each LTR-retrotransposon of interest for those included in the domain-based ML TE phylogenies
2. [blast_LTR.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/LTR_divergence/blast_LTR.sh) - determine the LTR sequence for each LTR-retrotransposon of interest
3. [align_LTRs.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/LTR_divergence/align_LTRs.sh) - align and generate consensus sequences for each LTR
4. [rmask_LTRs.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/LTR_divergence/rmask_LTRs.sh) - run RepeatMasker on representative genomes using a library of the LTR consensus sequences
5. [flank_LTR.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/LTR_divergence/flank_LTR.sh) - identify flanking LTRs for each LTR-retrotransposon of interest and find the divergence between them

#### Jukes-Cantor distance

### Solo LTR analysis
* [soloLTR_analysys.sh](https://github.com/annenakamoto/moryzae_tes/blob/main/soloLTR_analysis/soloLTR_analysys.sh) - use previous LTR annotations and locations of all full elements to identify solo LTRs

### POT2 transfer analysis

### Region of recombination analysis

## Contact
Anne Nakamoto - annen@berkeley.edu
