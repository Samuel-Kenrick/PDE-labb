% Above you calculate the discrete Fourier transform z
% and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
clear all
N=2^8
for j = 1:N
    x(j)=2*pi*(j-1)/N
    y(j)=abs(cos(x(j)))
end
z= mydft(y)

a0exact = 2/pi;
for k = 1:(N/2-1)
    aexact(2*k) = (-4./pi)*((-1).^k)/((4*k^2)-1);
end
[a0,a,b] =myfouriercoeff(z);% cosine coefficients calculated from the DFT z
figure()
stem([a0 a],'*')% plot computed Fourier cosine coefficients
hold on
stem([a0exact aexact],'or')% plot exact Fourier cosine coefficients
xlim([1 10])
hold off
xlabel('n'); ylabel('Fourier cosine coefficients an');
title('Exact and computed Fourier coefficients')
legend('Computed','Exact')
