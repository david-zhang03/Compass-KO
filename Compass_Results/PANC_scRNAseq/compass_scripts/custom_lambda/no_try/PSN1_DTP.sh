#!/bin/bash
#SBATCH --job-name=PSN1_DTP_custom_lambda_notry_compass_job
#SBATCH --output=PSN1_DTP_custom_lambda_notry_compass_job.out
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
conda activate compass

compass --data-mtx /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/PSN1/DTP/PSN1_matrix.mtx                     /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/PSN1/DTP/PSN1_genes.tsv                     /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/PSN1/DTP/PSN1_barcodes.tsv                     --model HumanGEM --num-processes 15                     --custom /home/dzhang/Compass_Integration/model_xml/0_1_models/PSN1_DTP_0_75.xml                     --latent-space /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/PSN1/DTP/PSN1_umap.tsv                     --species homo_sapiens --lambda 0.25 --calc-metabolites                     --output-dir /home/dzhang/Compass_Results/PANC_scRNAseq/compass_results/custom_lambda/no_try/PSN1/DTP/                     --temp-dir /home/dzhang/Compass_Results/PANC_scRNAseq/compass_results/custom_lambda/no_try/PSN1/DTP/tmpPSN1
