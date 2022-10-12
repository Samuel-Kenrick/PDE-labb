% Above you have computed the Fourier coefficients a0, an, and bn of h(x)
clear all
N=2^6
x = 0:0.01:2*pi;
z= mydft(h(x))
[a0,a,b] =myfouriercoeff(z);
t = linspace(0,2*pi,5000);
M= [3 5 10];% the number of terms M must be less than N/2 where N = 2m points
y=a0;
for j=1:M % The partial sum of the Fourier series with M+1 terms
    y=y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
end

figure()
plot(t,h(t),t,y)% plot h together with several of the partial sums of the Fourier series
