# GPU Mandelbrot Set
_Explore the Mandelbrot Set using MATLAB and an NVIDIA GPU._

[![View A GPU Mandelbrot Set on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/30988-a-gpu-mandelbrot-set)

This application allows you to explore the wonders of the Mandelbrot Set in MATLAB with the help of a capable GPU.  It is primarily intended as a demonstration of the different ways in which a MATLAB algorithm can be converted to run on the GPU, however it also has some fun features:

* Use the normal MATLAB zoom and pan to browse the Mandelbrot Set
* Sit back and watch the app pan and zoom between pre-stored locations in the set
* Add your own locations to the animation list

Three different ways of speeding up the algorithm using GPU hardware are provided along with a normal CPU-only version.  Have a look at the code for these to get a feeling for how MATLAB's GPU support works.


## Requirements
------------
This demo app requires:

* MATLAB R2016b or better (v9.1 or higher)
* Parallel Computing Toolbox
* A GPU with CUDA Compute Capability 3.0 or higher


## Running it
From MATLAB, type "mandelbrotViewer" to launch the application.


## Help
From MATLAB, type "help mandelbrotViewer" to view the help for the application.

