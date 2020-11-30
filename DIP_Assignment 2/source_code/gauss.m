function [filter] = gauss(sigma, n)
% ----------------
% Parameters List:
% n - the size of mask
% sigma - the value of sigma in gauss function

A = ones(n,1);
% compute the size of kernel
k = (n-1)./2;

for index = 1:n
    % compute the exponent
    exponent = -power(index-k-1, 2);
    exponent = exponent./(2*power(sigma,2));
    A(index) = exp(exponent);
end

% normalize
filter = A./sum(A(:));
end

