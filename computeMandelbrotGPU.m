function logCount = computeMandelbrotGPUBuiltins(xlim, numx, ylim, numy, maxIters)
% Create a view of the Mandelbrot set using only the CPU.
% This is the base-line version of the algorithm that is adapted to
% run on the GPU in different ways in the functions below.

% Create the input arrays
x = linspace(xlim(1),  xlim(2), numx);
y = linspace(ylim(1),  ylim(2), numy);
[x,y] = meshgrid(x, y);
count = zeros(size(x));

% Call the element-by-element calculation
logCount = processMandelbrotElement(count, x, y, maxIters);

