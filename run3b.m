% Above you have computed the Fourier coefficients a0, an, and bn of h(x)
close all
clear all
N=2^6
x = linspace(0,2*pi,5000);
z= mydft(h(x))
[a0,a,b] =myfouriercoeff(z);
t = linspace(0,2*pi,5000);
M= [3 5 10];% the number of terms M must be less than N/2 where N = 2m points
y=a0;
for k = 1:length(M)
    y=a0;
    for j=1:M(k) % The partial sum of the Fourier series with M+1 terms
        y = y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
    end
    p(k,:)=y(1,:)
end
clear j k
for k = 1:length(M)
    for j = 1:M(k)
        s= s + a(j)*cos(j*x)+b(j)*sin(j*x)
    end
    r(k,:)=s(1,:)
end


figure()
plot(t,h(t),t,p(1,:),t,p(2,:),t,p(3,:))
axis([0 2*pi -1.5 1.5])
xlabel('')
hold off

% plot h together with several of the partial sums of the Fourier series
