close all
clear all
N=2^5;
for j = 1:N
    x(j)=2*pi*(j-1)/N;
    y(j)=abs(cos(x(j)));
end
z= mydft(y);


%koefficienter - N 5 -> 15
%koefficienter - N 8 -> 127

%%

N=2^5;
a0exact = 2/pi;
for k = 1:(N/2-1)
    a_exact(2*k) = (-4./pi)*((-1).^k)/((4*k^2)-1);
end
[a0,a,b] =myfouriercoeff(z);% cosine coefficients calculated from the DFT z
figure()
stem([a0 a],'*')% plot computed Fourier cosine coefficients
hold on
stem([a0exact a_exact],'or')% plot exact Fourier cosine coefficients
xlim([1 10])
hold off
xlabel('n');
ylabel('Fourier cosine coefficients an');

title('Exact and computed Fourier coefficients')
legend('Computed','Exact')

