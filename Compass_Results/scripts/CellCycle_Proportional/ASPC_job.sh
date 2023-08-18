#!/bin/bash 

#SBATCH --job-name="ASPC_prop_compass_job"
#SBATCH --output="ASPC_prop_compass_job.out"
#SBATCH --time=2-00:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=16G
#SBATCH --mail-user="dzhang@calicolabs.com"
#SBATCH --mail-type=ALL

__conda_setup="$('/home/dzhang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dzhang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dzhang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dzhang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

conda activate compass

echo "ASPC1"

compass --data-mtx /home/dzhang/Compass_Results/CellCycle_Proportional/compass_files/ASPC1_matrix.mtx /home/dzhang/Compass_Results/CellCycle_Proportional/compass_files/ASPC1_genes.tsv /home/dzhang/Compass_Results/CellCycle_Proportional/compass_files/ASPC1_barcodes.tsv --model RECON2_mat --latent-space /home/dzhang/Compass_Results/CellCycle_Proportional/compass_files/ASPC1_umap.tsv --lambda 0.25 --calc-metabolites --num-processes 10 --species homo_sapiens --output-dir /home/dzhang/Compass_Results/CellCycle_Proportional/results/ASPC1 --temp-dir /home/dzhang/Compass_Results/CellCycle_Proportional/results/tmpASPC1

