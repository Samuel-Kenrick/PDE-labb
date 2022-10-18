% Above you have computed the Fourier coefficients a0, an, and bn of h(x)
%close all
clear all
%N=2^6
x = linspace(0,2*pi,5000);
z= mydft(h(x))
[a0,a,b] =myfouriercoeff(z);
t = linspace(0,2*pi,5000);
M= 10^6/2;% the number of terms M must be less than N/2 where N = 2m points
y=a0;
clear j k

for k = 1:100
    y=a0;
    for j=1:k % The partial sum of the Fourier series with M+1 terms
        y = y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
    end
    r(k,:)=y(1,:);
end
for k = 1:100
    E_M(k,1) = max(r(k,1:round(k/2))-1);
end
clear j k
for k = 1:100
    yExact=y0
    for J=1:k
        yExact=yExact+2/(pi*j)*(1-(-1)^n);
    end
    p(k,:)=yExact(1,:)
end

clear j k
k = linspace(1,100);
subplot(2, 2, [1,2]);
plot(t,h(t),t,r, t, p);

axis([0 2*pi -1.5 1.5]);
xlabel('t');
ylabel('h(t)');
subplot(2, 2, [3,4]);
plot(k,E_M(k,1));
xlabel('M-värde');
ylabel('E(M)');



% plot h together with several of the partial sums of the Fourier series
