# Princeton Research Computing Bootcamp 2018
# Get Started With Performance Optimization And Tuning

Sample Matrix-Matrix multiplication code for Bootcamp 2018

This is intended to use as a example to profile with performance tuning tools such as VTune.  The code does not do anything useful and is for illustrative/educational use only.  It is not meant to be exhaustive or demostrating optimal matrix-matrix multiplication techniques.

## Instructions for Running on Adroit

1. Log into Adroit with X11 forwarding enabled  
`ssh -Y -C <username>@adroit.princeton.edu`
1. Load environment modules  
`module load intel`  
`module load intel-vtune`
1. Build the example code and call executable "mm.out"  
  (What happens if you forget the `-g`?)  
  e.g. `icpc -g -mkl -O3 -xhost matmul_test.cpp -o mm.out`   
  Short test on head node: `./mm.out 250` (250x250 matrix)   
1. Run the provided script to submit a VTune wrapped job to the scheduler  
  `./submit_to_scheduler`  
  This will, by default, run a 500x500 matrix example on a compute node using the VTune "Hotspots" analysis.  When it finishes it will create a directory with the results named something like r000hs, where 000 is incremented by 1 for each new analysis.
1. Open the resulting directory with VTune GUI  
  e.g. `amplxe-gui r000hs`
1. Explore "Bottom-up" and "Top-down Tree" and double click on hotspots to look at line-by-line performance
1. Edit the file "submit.slurm" to increase the matrix size (originally 500) and rerun the analysis. WARNING: don't go over 1500!
1. Challenge: using the knowledge gained from VTune, improve the speed of the code by changing the functions that are called.  This is done by changing threshold values set in command line arguments to mm.out in submit.slurm (see more info in comments at top of matmul_test.cpp for setting thresholds).
  
<br><br><br>

## Contact
Ian A. Cosden  
Princeton University  
icosden@princeton.edu
