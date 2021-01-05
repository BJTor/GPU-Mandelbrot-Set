function logCount = computeMandelbrotCPU(xlim, numx, ylim, numy, maxIters)
% Create a view of the Mandelbrot set using only the CPU.

% Create the input arrays
escapeRadius2 = 400; % Square of escape radius
x = linspace(xlim(1), xlim(2), numx);
y = linspace(ylim(1), ylim(2), numy);
[x0,y0] = meshgrid(x, y);
count = zeros(size(x0));
z0 = complex(x0, y0);
z = z0;

% Calculate
for n = 0:maxIters
    inside = ((real(z).^2 + imag(z).^2) <= escapeRadius2);
    count = count + inside;
    z = inside.*(z.*z + z0) + (1-inside).*z;
end
magZ2 = real(z).^2 + imag(z).^2;
logCount = log(count+1 - log(log(max(magZ2,escapeRadius2))/2)/log(2));
