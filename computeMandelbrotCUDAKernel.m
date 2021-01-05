function logCount = computeMandelbrotCUDAKernel( xlim, numx, ylim, numy, maxIters )
% Use pre-existing CUDA/C++ code.
persistent kernel
if isempty(kernel)
    % First time round we must load the kernel
    thisDir = fileparts( mfilename( 'fullpath' ) );
    baseName = 'mandelbrotViewerProcessElement';
    cudaFile = fullfile( thisDir, [baseName,'.cu'] );
    ptxName = [baseName,'.',parallel.gpu.ptxext];
    ptxFile = fullfile( thisDir, ptxName );
    if exist( ptxFile, 'file' ) ~= 2
        error( 'mandelbrotViewer:MissingPTX', 'Could not find ''%s''. Please use NVCC to compile it', ptxname );
    end
    kernel = parallel.gpu.CUDAKernel(ptxFile, cudaFile);
end


% Create the input arrays
x = gpuArray.linspace(xlim(1), xlim(2), numx);
y = gpuArray.linspace(ylim(1), ylim(2), numy);
[x, y] = meshgrid(x, y);
radius = 20;

% Make sure we have sufficient blocks to cover the whole array
numElements = numel(x);
kernel.ThreadBlockSize = [kernel.MaxThreadsPerBlock,1,1];
kernel.GridSize = [ceil(numElements/kernel.MaxThreadsPerBlock),1];

% Call the kernel
logCount = gpuArray.zeros(size(x));
logCount = feval(kernel, logCount, x, y, radius, maxIters, numElements);

% Gather the result back to the CPU
logCount = gather(logCount);

