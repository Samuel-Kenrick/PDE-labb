% Above you have computed the Fourier coefficients a0, an, and bn of h(x)
close all
clear all
N=2^10;
x = zeros(N,1);

for j = 0:N-1
    x(j+1)=2*pi*j/N;
end

t = linspace(0,2*pi,5000);
z= mydft(h(x));

[a0,a,b] = myfouriercoeff(z);

M = [3, 5, 10];% the number of terms M must be less than N/2 where N = 2m points

y=a0;
for j=1:M(1) % The partial sum of the Fourier series with M+1 terms
    y = y + a(j)*cos(j*t) + b(j)*sin(j*t);% add a term of the Fourier series
end
first_y = y

clear y
y=a0;
for j=1:M(2) % The partial sum of the Fourier series with M+1 terms
    y = y + a(j)*cos(j*t) + b(j)*sin(j*t);% add a term of the Fourier series
end
second_y = y

clear y
y=a0;
for j=1:M(3) % The partial sum of the Fourier series with M+1 terms
    y = y + a(j)*cos(j*t) + b(j)*sin(j*t);% add a term of the Fourier series
end
third_y = y 

figure(1)
plot(t,h(t),t,first_y, t, second_y, t, third_y);
axis([0 2*pi -1.5 1.5]);
xlabel('t');
ylabel('y(t)');

%%

M = 1:100;
yFourier = zeros(length(M),length(t));
yExact = yFourier;

yFourier(1,:) = a(1)*cos(1*t)+b(1)*sin(1*t);
yExact(1,:) = (2./(pi*1))*(1-(-1)^1)*sin(t*1);

for j = 2:length(M)
    yFourier(j,:) = yFourier(j-1,:) + a(j)*cos(j*t) + b(j)*sin(j*t);
    yExact(j,:) = yExact(j-1,:) +  2/(pi*j)*(1-(-1)^j)*sin(j*t);
end

yFourier = yFourier + a0;
E_M = max(yFourier'-1);
E_M2 = max(yExact'-1);

% plot h together with several of the partial sums of the Fourier series

figure(2)
plot(M,E_M, M, E_M2);
xlabel('M-värde');
ylabel('E(M)');


function [p] = h(x)% you could define h(x) at the end of the script
n=length(x);% defining h so that h accepts a vector of x-values could simplify calling h
for i=1:n
    if (x(i)==0 || x(i)==pi || x(i)==2*pi)
        p(i) = 0;
    elseif (x(i)>0 && x(i)<pi)
        p(i) = 1;
    else
        p(i) = -1;
    end
end
end