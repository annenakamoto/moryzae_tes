#!/bin/bash
#SBATCH --job-name=GC_content
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=24:00:00
#SBATCH --mail-user=annen@berkeley.edu
#SBATCH --mail-type=ALL

### Analyzing RIP using GC content

cd  /global/scratch/users/annen/RIP_analysis

### GC content for TEs
while read TE; do
    cat /global/scratch/users/annen/Rep_TE_Lib/Align_TEs/REPHITS_${TE}.fasta | tr \: \# | tr \( \{ | tr \) \} > REPHITS_name_${TE}.fasta
    geecee -sequence REPHITS_name_${TE}.fasta -outfile RIP_analysis/name_gc_${TE}.txt
    avg=$(cat RIP_analysis/gc_${TE}.txt | awk 'BEGIN { n=0; s=0; } { n+=1; s+=$2; } END { print s/n }')
    echo "$TE: $avg"
done < TEs_list.txt

### GC content for genomes
while read GENOME; do
    geecee -sequence /global/scratch/users/annen/JC_gist_genomes/${GENOME}.cds.fasta -outfile RIP_analysis/gc_${GENOME}.txt
    avg=$(cat RIP_analysis/gc_${GENOME}.txt | awk 'BEGIN { n=0; s=0; } { n+=1; s+=$2; } END { print s/n }')
    echo "$GENOME: $avg"
done < rep_genomes_list.txt

> GC_data.txt
while read TE; do
    cat RIP_analysis/gc_${TE}.txt | awk -v TE=$TE '{ print TE "\t" $1 "\t" $2 }' >> GC_data.txt
done < TEs_list.txt


