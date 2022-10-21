close all
clear all
%2a

%choosing an initial N value
N=2^8;
f = @(x) 3-2*cos(15*x)+4*sin(20*x)

%calculating the initial x and y values
for j = 1:N
    x(j)=2*pi*(j-1)/N;
    y(j)=f(x(j));
end

%finding z and the coefficients for our series
z= mydft(y);
[a0,a,b] =myfouriercoeff(z)

%nr of coefficients - N 5 -> 15
%nr of coefficients - N 8 -> 127

%%
%2b

%choosing an initial N
N=2^9;

%finding x and y for the new initial N
for j = 1:N
    x(j)=2*pi*(j-1)/N;
    y(j)=abs(cos(x(j)));
end

%finding z and the coefficients
z= mydft(y);
[a0,a,b] =myfouriercoeff(z)

%determining the exact coefficients
a0exact = 2/pi;
for k = 1:(N/2-1)
    a_exact(2*k) = (-4./pi)*((-1).^k)/((4*k^2)-1);
end

figure()
stem([a0 a],'*')% plot computed Fourier cosine coefficients
hold on
stem([a0exact a_exact],'or')% plot exact Fourier cosine coefficients
xlim([1 10])
hold off
xlabel('n');
ylabel('Fourier cosine coefficients a_n');

title('Exact and computed Fourier coefficients')
legend('Computed','Exact')

