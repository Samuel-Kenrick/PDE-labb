function z = mydft(y)

%determining the length and calculating omega
N = length(y);
omega = exp(2*pi*i/N);

%finding the z values
for n = 1:N
    z(n) = 0;
    for j = 0:N-1
        z(n) = z(n) + (1/N)*y(j+1)*(omega^(-(n-1)*j));
    end
end
end