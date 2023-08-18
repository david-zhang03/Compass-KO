#!/bin/bash
#SBATCH --job-name=ASPC1_Parental_custom_compass_job
#SBATCH --output=ASPC1_Parental_custom_compass_job.out
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

compass --data-mtx /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/ASPC1/PAR/ASPC1_matrix.mtx                     /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/ASPC1/PAR/ASPC1_genes.tsv                     /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/ASPC1/PAR/ASPC1_barcodes.tsv                     --model HumanGEM --num-processes 15                     --custom /home/dzhang/Compass_Integration/model_xml/0_1_models/ASPC1_PAR_0_75.xml                     --latent-space /home/dzhang/Compass_Results/PANC_scRNAseq/compass_files/ASPC1/PAR/ASPC1_umap.tsv                     --species homo_sapiens --lambda 0.25 --calc-metabolites                     --output-dir /home/dzhang/Compass_Results/PANC_scRNAseq/compass_results/custom_lambda/try/ASPC1/PAR/                     --temp-dir /home/dzhang/Compass_Results/PANC_scRNAseq/compass_results/custom_lambda/try/ASPC1/PAR/tmpASPC1
