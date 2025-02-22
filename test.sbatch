#!/bin/bash
#SBATCH --job-name=test          # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --gpus=1                # number of GPUs
#SBATCH --ntasks=2              # number of tasks
#SBATCH --time=00:10:00          # total run time limit (HH:MM:SS)
#SBATCH --partition=normal      # partition(large/normal/cpu) where you submit
#SBATCH --account=mscbdt2024      # Slurm accounting code
#SBATCH --output=slurm.out      #output file

module purge                     # clear environment modules inherited from submission
module load nvhpc/23.11          # load the module that contains the mpi module

mpicc -g -Wall -std=c99 -o mpi_hello mpi_hello.c

mpiexec -n 2 ./mpi_hello
