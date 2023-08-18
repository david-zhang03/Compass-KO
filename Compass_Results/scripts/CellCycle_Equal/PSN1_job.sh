#!/bin/bash 

#SBATCH --job-name="PSN1_compass_job"
#SBATCH --output="PSN1_compass_job.out"
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

echo -e "PSN1\n"

compass --data-mtx /home/dzhang/Compass_Results/CellCycle_Equal/compass_files/PSN1_matrix.mtx /home/dzhang/Compass_Results/CellCycle_Equal/compass_files/PSN1_genes.tsv /home/dzhang/Compass_Results/CellCycle_Equal/compass_files/PSN1_barcodes.tsv --model RECON2_mat --latent-space /home/dzhang/Compass_Results/CellCycle_Equal/compass_files/PSN1_umap.tsv --lambda 0.25 --calc-metabolites --num-processes 10 --species homo_sapiens --output-dir /home/dzhang/Compass_Results/CellCycle_Equal/results/PSN1 --temp-dir /home/dzhang/Compass_Results/CellCycle_Equal/results/tmpPSN1

