#!/bin/bash
#SBATCH -N 1 #one node
#SBATCH -n 1 #one task
#SBATCH -t 00:5:00 #maximum wall time of 5 minutes
#SBATCH --reservation=bootcamp

#load environment modules that correspond to the build environment
#and puts VTune in path

module load intel intel-vtune intel-advisor

#run command line VTune, with the hotspots analysis on the executable mm.out for a
# 500x500 matrix 

amplxe-cl -collect hotspots -- ./mm.out 500

#run command line Advisor, with survey analysis 

#advixe-cl -c survey -project-dir mm_advisor -- ./mm.out 500



