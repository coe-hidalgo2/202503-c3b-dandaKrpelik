#!/bin/bash
#SBATCH --job-name=apptainer
#SBATCH --output=apptainer.out
#SBATCH --error=apptainer.err
#SBATCH --time=00:10:00
#SBATCH --partition=qcpu
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --account=dd-24-88

SIF=${1:-c3b-template.sif}

# Declare the following variables to be used by apptainer to avoid warnings
export APPTAINER_BINDPATH=$SINGULARITY_BINDPATH
export APPTAINERENV_LD_PRELOAD=$SINGULARITYENV_LD_PRELOAD

module load Boost/1.83.0-GCC-13.2.0 Ninja/1.12.1-GCCcore-13.3.0 OpenMPI/4.1.6-GCC-13.2.0

srun apptainer exec --sharens $SIF myapp