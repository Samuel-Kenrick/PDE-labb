function [a0,a,b] = myfouriercoeff(z)

N = length(z);% Compute the length of vector z
c= z(2:N);% remove first element z(1) from z-vector

a0 = z(1);
%going from the outside inwards to calculate the coefficients
for n = 1:((N/2)-1)
    a(n)=real(c(n)+c(N-n));
    b(n)= real(i*(c(n)-c(N-n)));
end
end