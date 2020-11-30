function resImage = gaussConv(image, sigma, n)
% ----------------
% Parameters List:
% image - the input image
% n - the size of mask
% sigma - the value of sigma in gauss function

A = uint8(image);
kernel = gauss2d(sigma, n);
resImage = uint8(conv2(A, kernel, 'same'));
end

