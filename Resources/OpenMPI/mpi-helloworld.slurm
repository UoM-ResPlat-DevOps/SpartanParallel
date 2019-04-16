#!/bin/bash
#SBATCH --partition=physical
#SBATCH --ntasks=16

module load OpenMPI/1.10.2-GCC-4.9.2

mpiexec mpi-helloworld
