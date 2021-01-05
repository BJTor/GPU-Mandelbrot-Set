function logCount = computeMandelbrotGPUBuiltins(xlim, numx, ylim, numy, maxIters)
% Use the built-in GPU support with the original CPU code.

% Setup the input grid on the GPU
escapeRadius2 = 400; % Square of escape radius
x = gpuArray.linspace(xlim(1),  xlim(2), numx);
y = gpuArray.linspace(ylim(1),  ylim(2), numy);
count = gpuArray.zeros( numy, numx );
[x0,y0] = meshgrid(x, y);
z0 = complex(x0, y0);

% Calculate
z = z0;
for n = 0:maxIters
    inside = ((real(z).^2 + imag(z).^2) <= escapeRadius2);
    count = count + inside;
    z = inside.*(z.*z + z0) + (1-inside).*z;
end
magZ2 = real(z).^2 + imag(z).^2;
logCount = log(count+1 - log(log(max(magZ2,escapeRadius2))/2)/log(2));

% Gather the result back to the CPU
logCount = gather(logCount);