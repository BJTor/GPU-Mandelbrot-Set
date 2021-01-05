function logCount = processMandelbrotElement(count, x, y, maxIterations)

escapeRadius2 = 400; % Square of escape radius

z = x + 1i*y;
z0 = z;
for n = 1:maxIterations
    inside = ((real(z).^2 + imag(z).^2) <= escapeRadius2);
    count = count + inside;
    z = inside.*(z.*z + z0) + (1-inside).*z;
end

% Normalise
magZ2 = real(z).^2 + imag(z).^2;
logCount = log(count+1 - log(log(max(magZ2,escapeRadius2))/2) / log(2));