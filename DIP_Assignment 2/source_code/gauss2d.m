function [filter] = gauss2d(sigma, n)
% ----------------
% Parameters List:
% n - the size of mask
% sigma - the value of sigma in gauss function

A = gauss(sigma, n);
% foster the computation by using convolution instead of for-loop
filter = A*A';
end

