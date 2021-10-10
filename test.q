#!/bin/bash
#
#SBATCH -J testjob
#SBATCH -A <project>
#SBATCH -t 00:05:00
#SBATCH -N 1
#SBATCH --exclusive
#
export NSC_MODULE_SILENT=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

module load impi/.2018.1.163-eb
module load Anaconda/2020.07-nsc1
conda activate /proj/tfya99/software/condaenv

time mpirun python3 test_mpi.py

echo "job completed"
