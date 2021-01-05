function logCount = computeMandelbrotGPUArrayFun(xlim, numx, ylim, numy, maxIters)
% Compute using GPU arrayfun.

% Copyright 2010-2012 The Mathworks, Inc.

% Create the input arrays
x = gpuArray.linspace(xlim(1),  xlim(2), numx);
y = gpuArray.linspace(ylim(1),  ylim(2), numy);
[x,y] = meshgrid(x, y);

% Calculate
logCount = arrayfun(@mandelbrotViewerProcessElement, x, y, 400, maxIters);

% Gather the result back to the CPU
logCount = gather(logCount);


function logCount = iProcessElement(x0, y0, escapeRadius2, maxIterations)
% Evaluate the Mandelbrot function for a single element


z0 = complex( x0, y0 );
z = z0;
count = 0;
while (count <= maxIterations) && (z*conj(z) <= escapeRadius2)
    z = z*z + z0;
    count = count + 1;
end
magZ2 = max(real(z).^2 + imag(z).^2, escapeRadius2);
logCount = log(count + 1 - log(log( magZ2 ) / 2 ) / log(2));
