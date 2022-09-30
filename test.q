#!/bin/bash
#
#SBATCH -J testjob
#SBATCH -A <project>
#SBATCH -t 00:05:00
#SBATCH -N 1
#SBATCH -n 32
#SBATCH --exclusive
#
export NSC_MODULE_SILENT=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

module load Anaconda/2021.05-nsc1
conda activate /proj/tfya99/software/condaenv

mpprun echo "Hello world!"

echo "job completed"
