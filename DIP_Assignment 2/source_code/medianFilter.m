function resImage = medianFilter(image, n)
% ----------------
% Parameters List:
% image - the input image
% n - the size of mask

image = uint8(image);

padSize = floor((n-1)/2);

procImage = zeros(size(image));
paddedImage = padarray(image, [padSize, padSize], 'replicate');

dx = [1:1+padSize]';
dy = [1:1+padSize]';

for i = 1:size(image,1)
    for j = 1:size(image,2)
        % crop the window for statistics
        window = reshape(paddedImage(i+dx-1,j+dy-1),[],1);
        procImage(i,j)=median(window);
    end
end

resImage = uint8(procImage);
end

