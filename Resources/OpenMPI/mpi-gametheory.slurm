#!/bin/bash
#SBATCH --job-name="GameTheory"
#SBATCH --ntasks=2
#SBATCH --time=0-00:10:00
module load OpenMPI/1.10.2-GCC-4.9.2
mpiexec ./mpi-gametheory
