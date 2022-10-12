function [a0,a,b] = myfouriercoeff(z)
% -In data -
% z: complex Fourier transform
% - Out data -
% a0: the coefficient a0
% a: vector with the Fourier coefficients an
% b: vector with the Fourier coefficients bn
N = length(z);% Compute the length of vector z
c= z(2:N);% remove first element z(1) from z-vector
a0 = z(1);
for n = 1:((N/2)-1)
    a(n)=real(c(n)+c(N-n))
    b(n)= real(i*(c(n)-c(N-n)))
end
end