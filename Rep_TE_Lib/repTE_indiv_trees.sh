#!/bin/bash
#SBATCH --job-name=classify_lib
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=72:00:00
#SBATCH --mail-user=annen@berkeley.edu
#SBATCH --mail-type=ALL

###     Produce tree for an individual TE using all RepeatMasker hits
###     following method in Phase1/tree_def.sh

TE=$1   # RepBase element (ex. MAGGY)
bootstraps=100 # number of RAxML bootstraps to perform (normal 100)

cd /global/scratch/users/annen/Rep_TE_Lib

> Align_local/REPHITS_${TE}.fasta
while read genome; do
    cat RMask_out/${genome}.RM.fasta | python py_helpers/filt_te_hits.py RMask_out/${genome}.RM.uniq.txt > RMask_out/${genome}.RM.filt.fasta
    cat RMask_out/${genome}.RM.filt.fasta | python py_helpers/spec_te_hits.py $TE $genome >> Align_local/REPHITS_${TE}.fasta
done < rep_genome_list.txt 
echo "created RepeatMasker hits library for ${TE}"

mafft --localpair Align_local/REPHITS_${TE}.fasta > Align_local/aligned_${TE}.afa
echo "completed MSA for ${TE}"

cat Align_local/aligned_${TE}.afa | tr \: \# | tr \( \{ | tr \) \} > Align_local/Aligned_${TE}.afa

cd Align_local
raxml -T 24 -n Raxml_${TE}.out -f a -x 12345 -p 12345 -# $bootstraps -m GTRCAT -s Aligned_${TE}.afa
echo "ran RAXML for ${TE}"