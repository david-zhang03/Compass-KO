#!/bin/bash
#SBATCH --job-name=MIA_DTP_full_compass_job
#SBATCH --output=MIA_DTP_full_compass_job.out
#SBATCH --time=10-00:00:00
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=16G
#SBATCH --mail-user=dzhang@calicolabs.com
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

conda activate compass_test

compass --data-mtx /home/dzhang/PANC_scRNAseq/compass_files/MIA/DTP/MIA_matrix.mtx                     /home/dzhang/PANC_scRNAseq/compass_files/MIA/DTP/MIA_genes.tsv                     /home/dzhang/PANC_scRNAseq/compass_files/MIA/DTP/MIA_barcodes.tsv                     --model HumanGEM --num-processes 15                     --latent-space /home/dzhang/PANC_scRNAseq/compass_files/MIA/DTP/MIA_umap.tsv                     --species homo_sapiens --lambda 0.25 --calc-metabolites                     --output-dir /home/dzhang/PANC_scRNAseq/compass_results/MIA/DTP/                     --temp-dir /home/dzhang/PANC_scRNAseq/compass_results/MIA/DTP/tmpMIA
