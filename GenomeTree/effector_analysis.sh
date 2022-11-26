#!/bin/bash
#SBATCH --job-name=effector_analysis
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=24:00:00
#SBATCH --mail-user=annen@berkeley.edu
#SBATCH --mail-type=ALL

### Usage: sbatch effector_analysis.sh <GENOME>

cd /global/scratch/users/annen/Effector_analysis/signalp-5.0b/bin
GENOME=$1

### SignalP
./signalp -fasta /global/scratch/users/annen/Effector_analysis/${GENOME}.faa -prefix signalp_${GENOME} #-t euk -u 0.34 -U 0.34

awk '{if ($2 == "SP(Sec/SPI)") {print $1}}' signalp_${GENOME}_summary.signalp5 > signalp_secrete_points_names_${GENOME}
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' /global/scratch/users/annen/Effector_analysis/${GENOME}.faa > ${GENOME}.singleline.faa

> ${GENOME}_signalp_proteins.faa
while read gene; do
    grep -A1 ${gene} ${GENOME}.singleline.faa >> ${GENOME}_signalp_proteins.faa
done < signalp_secrete_points_names_${GENOME}

cd /global/scratch/users/annen/Effector_analysis

### tmhmm
tmhmm-2.0c/bin/tmhmm signalp-5.0b/bin/${GENOME}_signalp_proteins.faa > tmhmm_output_${GENOME}

grep "Number" tmhmm_output_${GENOME} | awk '{if ($7 == 0){print $2}} ' > ${GENOME}_signalp_notmhmm_protein_names

> ${GENOME}_signalp_notmhmm_proteins.faa
while read gene; do
    grep -A1 ${gene} signalp-5.0b/bin/${GENOME}.singleline.faa >> ${GENOME}_signalp_notmhmm_proteins.faa
done < ${GENOME}_signalp_notmhmm_protein_names

### EffectorP
python EffectorP-3.0-main/EffectorP.py -i ${GENOME}_signalp_notmhmm_proteins.faa -o ${GENOME}_effectorp_output -E ${GENOME}_effectorp.fasta
awk '{ if ($(NF) == "effector") {print $1}}' ${GENOME}_effectorp_output > ${GENOME}_effector_protein_names
