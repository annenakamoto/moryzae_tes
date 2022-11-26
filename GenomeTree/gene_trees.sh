#!/bin/bash
#SBATCH --job-name=orthofinder_genetrees
#SBATCH --partition=savio2
#SBATCH --qos=savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --time=72:00:00
#SBATCH --mail-user=annen@berkeley.edu
#SBATCH --mail-type=ALL

### Run to resume OrthoFinder run from Orthogroups directory and produce gene trees for orthogroups

cd /global/scratch/users/annen/GENOME_TREE


echo "*****START*****"
source activate /global/scratch/users/annen/anaconda3/envs/OrthoFinder

orthofinder -fg OrthoFinder_out/Results_Nov22 -t 24 -a 5 -S diamond_ultra_sens

conda deactivate
echo "*****DONE*****"
