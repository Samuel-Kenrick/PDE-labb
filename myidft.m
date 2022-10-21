function y = myidft(z)

%determining the length and calculating omega
N = length(z);
omega = exp (2*pi*i/N);

%finding z's inverse values
for n = 1:N
    y(n) = 0;
    for j = 1:N
        y(n) = y(n) + z(j)*omega^((n-1)*(j-1));
    end   
end
end